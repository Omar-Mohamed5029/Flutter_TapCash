import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabcash/view_controller/cubits/register_cubit/register_state.dart';
import '../../../constants/end-points.dart';
import '../../../data/dio_helper.dart';
import '../../../utilites/constant/flutter_toast.dart';
import '../../../utilites/route/routes.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  bool visiblePassword = true;
  bool visibleConfirmPassword = true;

  /// function to change password visibility
  void changePasswordVisibility() {
    visiblePassword = !visiblePassword;
    emit(VisiblePasswordState());
  }

  /// function to change password visibility
  void changeConfirmPasswordVisibility() {
    visibleConfirmPassword = !visibleConfirmPassword;
    emit(VisibleConfirmPasswordState());
  }

  String gender = 'male';

  void changeGender(value) {
    gender = value;
    emit(ChangeGenderState());
  }

  Future postRegister(
      {required String name,
      required String email,
      required String password,
      required String confirm_password,
      required String phoneNumber,
      required String gender,
      required String age,
      required String national_id,
      required String city,
      required context}) async {
    emit(RegisterLoadingState());
    DioHelper.postData(url: registerEndPoint, data: {
      "name": name,
      "email": email,
      "password": password,
      "confirm_password": confirm_password,
      "phone": phoneNumber,
      "national_id": national_id,
      "age": age,
      "city": city,
      "gender": gender,
    }).then((value) {
      if (value.data!=null) {
        print(value.data);
        flutterToast(msg: 'Registered Successfully', color: Colors.green);
        Navigator.pushNamed(context, AppRoutes.loginRoute);
        emit(RegisterSuccessState());
      }
      // print(value);
    }).catchError((error) {
      if (kDebugMode) {
        flutterToast(msg: error.toString(), color: Colors.red);
        print(error.toString());
      }
      emit(RegisterErrorState());
    });
  }
}
