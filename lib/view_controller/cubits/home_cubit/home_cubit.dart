import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tabcash/constants/end-points.dart';
import 'package:tabcash/view_controller/cubits/home_cubit/home_state.dart';
import '../../../data/dio_helper.dart';
import '../../../model/remote data/transactions_model.dart';
import '../../../utilites/constant/flutter_toast.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);
  bool loading = false;

  String Token = "";
  String name = "";
  String email = " ";
  String blance = " ";
  String account_number = " ";
  List<MytransactionsData> mytransactionsData = [];

  getData() async {
    loading = true;
    emit(HomeLoadingState());
    // if (Token.isEmpty) {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      Token = await preferences.getString('token').toString();
      name = await preferences.getString("name").toString();
      email = await preferences.getString("email").toString();
      // blance = await preferences.getString("deposite").toString();
      account_number = await preferences.getString("account_number").toString();
    // }
    DioHelper.postData(url: userData_endpoint, token: Token)
        .then((value) async {
      if (value.data != null) {
        // print(value.data.toString());
        // flutterToast(msg: value.data['data']['message'].toString(), color: Colors.green);
        blance = value.data['data']["deposite"].toString();
        emit(HomeSuccessState());
      }
    }).catchError((error) {
      if (kDebugMode) {
        flutterToast(msg: "omar", color: Colors.red);

        print(error.toString());
        flutterToast(msg: error.toString(), color: Colors.red);

        // print(error.toString());
      }
      emit(HomeInErrorState());
    });

    loading = false;
    emit(HomeSuccessState());
  }

  Future posttransfer(
      {required String account_number, required String amount, context}) async {
    emit(HomeLoadingTransfer());
    DioHelper.postData(url: transfer_EndPoint, token: Token, data: {
      "receive_account": account_number.toString(),
      "process_name": "transfer",
      "process_type": amount.toString(),
    }).then((value) async {
      if (value != null) {
        print(value.toString());
        // flutterToast(msg: value.data['message'], color: Colors.green);

        flutterToast(
            msg: value.data['message'].toString(), color: Colors.green);
        emit(HomeSuccessState());
      }
    }).catchError((error) {
      if (kDebugMode) {
        flutterToast(msg: "omar", color: Colors.red);
        print("herer");
        print(error.toString());
        flutterToast(msg: error.toString(), color: Colors.red);

        // print(error.toString());
      }
      emit(HomeInErrorState());
    });
  }

  Future getgetalltransactions() async {
    emit(Home_LoadingGetTransactions());

    DioHelper.getData(url: mytransacations_endpoint, token: Token)
        .then((value) async {
      if (value.data != null) {
        // print(value.data);

        MytransactionsModel mytransactionsModel =
            MytransactionsModel.fromJson(json: value.data);
        mytransactionsData = mytransactionsModel.MytransactionsDataList;
        // print(mytransactionsData[0].created_at);
        emit(Home_SuccessGetTransactions());
        // flutterToast(msg: value.data[0], color: Colors.green);
      }
    }).catchError((error) {
      if (kDebugMode) {
        // print(Token);
        flutterToast(msg: error.toString(), color: Colors.red);
        print(error.toString());
      }
      emit(HomeInErrorState());
    });
  }
}
