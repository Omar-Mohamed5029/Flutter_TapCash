import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tabcash/view_controller/cubits/cart_cubit/smartcart_state.dart';

import '../../../constants/end-points.dart';
import '../../../data/dio_helper.dart';
import '../../../utilites/constant/flutter_toast.dart';

class SmartcartCubit extends Cubit<SmartCart_State> {
  SmartcartCubit() : super(SmartCart_InitialState());

  static SmartcartCubit get(context) => BlocProvider.of(context);
  String Tokens = "";
  String Cart_number = "";
  String deposite = "";

  Future post_check_smartcart({context}) async {
    emit(SmartCart_LoadingState());
    SharedPreferences preferences = await SharedPreferences.getInstance();
    Tokens = await preferences.getString('token').toString();
    emit(SmartCart_LoadingState());
    DioHelper.postData(url: check_smartcart_endpoint, token: Tokens)
        .then((value) async {
      if (value != null) {
        // print(value.data.toString());

        flutterToast(msg: value.data['message'], color: Colors.green);
        if (value.data['message'] == 'exist') {
          Cart_number = value.data['data']['Cart_number'].toString();
          deposite = value.data['data']['deposite'].toString();
          emit(SmartCart_SuccessState());
        } else {
          emit(SmartCart_notexist_State());
        }
      }
    }).catchError((error) {
      if (kDebugMode) {
        // flutterToast(msg: Tokens.toString(), color: Colors.green);

        // flutterToast(msg: "omar", color: Colors.red);
        // print("herer");
        print(error.toString());
        flutterToast(msg: error.toString(), color: Colors.red);

        // print(error.toString());
      }
      emit(SmartCart_ErrorState());
    });
  }

  Future post_Create_smartcart({required String Amount_money, context}) async {
    emit(SmartCart_LoadingState());
    DioHelper.postData(
      url: create_smartcart_endpoint,
      token: Tokens,
      data: {"amount_money": Amount_money},
    ).then((value) async {
      if (value != null) {
        // print(value.data.toString());

        flutterToast(msg: value.data['message'], color: Colors.green);
        post_check_smartcart(context: context);
      }
    }).catchError((error) {
      if (kDebugMode) {
        // flutterToast(msg: Tokens.toString(), color: Colors.green);

        // flutterToast(msg: "omar", color: Colors.red);
        // print("herer");
        print(error.toString());
        flutterToast(msg: error.toString(), color: Colors.red);

        // print(error.toString());
      }
      emit(SmartCart_ErrorState());
    });
  }

  Future post_inc_samrtcart({required String inc_money, context}) async {
    emit(SmartCart_inc_loading());
    DioHelper.postData(
            url: inc_money_smartcar_endpoint,
            data: {"inc_money": inc_money},
            token: Tokens)
        .then((value) async {
      if (value.data != null) {
        // print(value.toString());
        // post_check_smartcart(context: context);
        // transferloading = false;
        flutterToast(
            msg: value.data["message"].toString(), color: Colors.green);
        emit(SmartCart_SuccessState());
      }
    }).catchError((error) {
      if (kDebugMode) {
        flutterToast(msg: "omar", color: Colors.red);
        print("herer");
        print(error.toString());
        flutterToast(msg: error.toString(), color: Colors.red);

        // print(error.toString());
      }
      emit(SmartCart_ErrorState());
    });
  }

  Future post_dec_samrtcart({required String dec_money, context}) async {
    emit(SmartCart_dec_loading());
    DioHelper.postData(
            url: dec_money_smartcar_endpoint,
            data: {"dec_money": dec_money},
            token: Tokens)
        .then((value) async {
      if (value.data != null) {
        // print(value.toString());
        // post_check_smartcart(context: context);
        // transferloading = false;
        flutterToast(
            msg: value.data["message"].toString(), color: Colors.green);
        emit(SmartCart_SuccessState());
      }
    }).catchError((error) {
      if (kDebugMode) {
        // flutterToast(msg: "omar", color: Colors.red);
        // print("herer");
        print(error.toString());
        flutterToast(msg: error.toString(), color: Colors.red);

        // print(error.toString());
      }
      emit(SmartCart_ErrorState());
    });
  }

  Future post_purchase_samrtcart({required String amount_money,required String purchase_name, context}) async {
    emit(SmartCart_inc_loading());
    DioHelper.postData(
        url: purchases_endpoint,
        data: {"amount_money": amount_money,
                 "purchase_name":purchase_name},
        token: Tokens)
        .then((value) async {
      if (value.data != null) {
        // print(value.toString());
        // post_check_smartcart(context: context);
        // transferloading = false;
        flutterToast(
            msg: value.data["message"].toString(), color: Colors.green);
        emit(SmartCart_SuccessState());
      }
    }).catchError((error) {
      if (kDebugMode) {
        // flutterToast(msg: "omar", color: Colors.red);
        // print("herer");
        print(error.toString());
        flutterToast(msg: error.toString(), color: Colors.red);

        // print(error.toString());
      }
      emit(SmartCart_ErrorState());
    });
  }
}
