import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../constants/end-points.dart';
import '../../../data/dio_helper.dart';
import '../../../utilites/constant/flutter_toast.dart';
import '../../../utilites/route/routes.dart';

part 'child_state.dart';

class ChildCubit extends Cubit<ChildState> {
  ChildCubit() : super(ChildInitial());

  static ChildCubit get(context) => BlocProvider.of(context);

  bool childVisiblePassword = true;
  bool childConfirmPassword = true;
  String? Token;
  List<String> purchases_limit = [];

  /// function to change password visibility
  void childChangePasswordVisibility() {
    childVisiblePassword = !childVisiblePassword;
    emit(ChildVisiblePasswordState());
  }

  /// function to change password visibility
  void childChangeConfirmPasswordVisibility() {
    childConfirmPassword = !childConfirmPassword;
    emit(ChildVisibleConfirmPasswordState());
  }

  String gender = 'm';

  void changeGender(value) {
    gender = value;
    emit(ChildChangeGenderState());
  }

  Future postRegister(
      {required String name,
      required String email,
      required String password,
      required String confirm_password,
      required String phone,
      required String gender,
      required String national_id,
      required String city,
      required String age,
      String? purchases_limit,
      required String money_limit,
      required context}) async {
    emit(ChildLoadingState());
    SharedPreferences preferences = await SharedPreferences.getInstance();
    Token = await preferences.getString('token').toString();
    DioHelper.postData(
            url: addChild_endpoint,
            data: {
              "name": name,
              "email": email,
              "password": password,
              "confirm_password": confirm_password,
              "phone": phone,
              "gender": gender,
              "national_id": int.parse(national_id),
              "age": int.parse(age),
              "city": city,
              "purchases_limit": purchases_limit,
              "money_limit": int.parse(money_limit)
            },
            token: Token)
        .then((value) {
      if (value.data != null) {
        print(value.data);
        flutterToast(msg: 'created Successfully', color: Colors.green);
        // Navigator.pushNamed(context, AppRoutes.loginRoute);
        emit(ChildSuccessState());
      }
      // print(value);
    }).catchError((error) {
      if (kDebugMode) {
        flutterToast(msg: error.toString(), color: Colors.red);
        print(error.toString());
      }
      emit(ChildErrorState());
    });
  }


}
