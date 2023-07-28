import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabcash/model/remote%20data/mychildren_model.dart';
import 'package:tabcash/view_controller/cubits/getchildren/getchildren_state.dart';
import '../../../constants/end-points.dart';
import '../../../data/dio_helper.dart';
import '../../../model/remote data/child_transactions_model.dart';
import '../../../utilites/constant/flutter_toast.dart';

class MyChildrenCubit extends Cubit<getchildren_state> {
  MyChildrenCubit() : super(getchildren_InitialState());

  static MyChildrenCubit get(context) => BlocProvider.of(context);
 List<MyChildrenData> myChildrenData =[];
  List<Child_MytransactionsData> child_transactionsData = [];

  Future post_getchildren({required String Token, context}) async {
    emit(getchildren_LoadingState());
    DioHelper.postData(
      url: getmychildrens_endpoint,
      token: Token,
    ).then((value) async {
      if (value.statusCode == 201) {
        // print(value.toString());
        MyChildrenModel myChildrenModel=
        MyChildrenModel.fromJson(json: value.data);
        myChildrenData = myChildrenModel.MyChildrenDataList;

        flutterToast(msg: value.data["message"], color: Colors.green);
        emit(getchildren_SuccessState());
      }
    }).catchError((error) {
      if (kDebugMode) {
        flutterToast(msg: error.toString(), color: Colors.red);
        print(error.toString());
      }
      emit(getchildren_ErrorState());
    });
  }
  Future post_Child_transactions({
    required String account_number,
    required String Token,

  }) async {
    emit(children_trans_LoadingState());
    DioHelper.postData(
        url: child_trans_endpoint,
        data: {
          "account_number": account_number,
        },token: Token)
        .then((value) {
      if (value.data != null) {
        Child_MytransactionsModel  child_mytransactionsModel =
        Child_MytransactionsModel.fromJson(json: value.data);
        child_transactionsData= child_mytransactionsModel.child_transactionsDataList;

        print(value.data);
        flutterToast(msg: 'Transactions exits', color: Colors.green);
        // Navigator.pushNamed(context, AppRoutes.loginRoute);
        emit(getchildren_SuccessState());
      }
      // print(value);
    }).catchError((error) {
      if (kDebugMode) {
        flutterToast(msg: error.toString(), color: Colors.red);
        print(error.toString());
      }
      emit(getchildren_ErrorState());
    });
  }
}
