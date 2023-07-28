
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../constants/end-points.dart';
import '../../../data/dio_helper.dart';
import '../../../utilites/constant/flutter_toast.dart';
import '../../../view/layout/navebar.dart';
import 'login_state.dart';


class LogInCubit extends Cubit<LogInState>{
  LogInCubit(): super(LogInInitialState());
  static LogInCubit get(context) => BlocProvider.of(context);
  bool visiblePassword = true;
  void changePasswordVisibility() {
    visiblePassword = !visiblePassword;
    emit(VisiblePasswordState());
  }
  String? token;
  Future postlogin  (
      {
        required String email,
        required String password,
        context}) async {
    emit(LogInLoadingState());
    DioHelper.postData(url: loginEndPoint, data: {
      "email": email,
      "password":password,
    }).then((value)async {
      if (value.data['user']!=null) {
       print(value.data['access_token']);
        SharedPreferences preferences = await SharedPreferences.getInstance();
        token=value.data['access_token'].toString();
        await preferences.setString('token', value.data['access_token'].toString());
       await preferences.setString('account_number', value.data['user']["account_number"].toString());
       await preferences.setString('email', value.data['user']["email"].toString());
       await preferences.setString('name', value.data['user']["name"].toString());
       await preferences.setString('type', value.data['user']["type"].toString());
       await preferences.setString('deposite', value.data['user']["deposite"].toString());
        // flutterToast(msg:value.data['access_token'] , color: Colors.green);

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => NavBar()),
              (Route<dynamic> route) => false,);

        emit(LogInSuccessState());
      }
    }).catchError((error) {
      if (kDebugMode) {
        flutterToast(msg:error.toString() , color: Colors.red);
        print(error.toString());
      }
      emit(LogInErrorState());
    });


  }

  Future postlogout  (
      {context}) async {
    emit(LogOutLoadingState());
    SharedPreferences preferences = await SharedPreferences.getInstance();
    token = await preferences.getString('token').toString();
    // flutterToast(msg:token.toString() , color: Colors.red);
    DioHelper.postData(url: logoutEndPoint,token:token ).then((value)async {
      if (value.data!=null) {
        print(value.data);
        final pref = await SharedPreferences.getInstance();
        await pref.clear();
        flutterToast(msg: "Log out" , color: Colors.red);

        // print(value.data['access_token']);
        emit(LogOutSuccessState());
        exit(0);
      }
    }).catchError((error) {
      if (kDebugMode) {
        flutterToast(msg:error.toString() , color: Colors.red);
        print(error.toString());
      }
      emit(LogOutErrorState());
    });


  }
//
// savetoken() async{
//   SharedPreferences preferences = await SharedPreferences.getInstance();
//   await preferences.setString('token', LoginModel);
// }
}


