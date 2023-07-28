

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:tabcash/utilites/route/router.dart';
import 'package:tabcash/utilites/route/routes.dart';

import 'package:tabcash/view_controller/cubits/cart_cubit/smartcart_cubit.dart';
import 'package:tabcash/view_controller/cubits/child_cubit/child_cubit.dart';
import 'package:tabcash/view_controller/cubits/getchildren/getchildren_cubit.dart';
import 'package:tabcash/view_controller/cubits/home_cubit/home_cubit.dart';
import 'package:tabcash/view_controller/cubits/login_cubit/login_cubit.dart';
import 'package:tabcash/view_controller/cubits/register_cubit/register_cubit.dart';
import 'data/dio_helper.dart';



void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  runApp(const TabCash());
}

class TabCash extends StatelessWidget {
  const TabCash({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientaion, deviceType) {
          return  MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => LogInCubit(),
              ), BlocProvider(
                create: (context) => RegisterCubit(),
              ),
              BlocProvider(
                create: (context) => HomeCubit(),
              ),
              BlocProvider(
                create: (context) => ChildCubit(),
              ),
              BlocProvider(
                create: (context) => MyChildrenCubit(),
              ),
              BlocProvider(
                create: (context) => SmartcartCubit(),
              ),
              // BlocProvider(
              //   create: (context) => Children_Transactions(),
              // ),
            ],
            child: MaterialApp(

              debugShowCheckedModeBanner: false,
              theme: ThemeData(
              ),
              onGenerateRoute: onGenerate,
              initialRoute: AppRoutes.splashPageRoute,
            ),
          );
        });
  }
}
