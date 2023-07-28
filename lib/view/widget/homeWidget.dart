import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../../utilites/asset/app_asset.dart';
import '../../utilites/route/routes.dart';
import '../../utilites/theme/app_theme.dart';
import '../../view_controller/cubits/home_cubit/home_cubit.dart';

class HomeWalletWidget extends StatefulWidget {
   HomeWalletWidget({Key? key ,required  this.homeCubit}) : super(key: key);
   HomeCubit homeCubit;
  @override
  State<HomeWalletWidget> createState() => _HomeWalletWidgetState();
}



class _HomeWalletWidgetState extends State<HomeWalletWidget> {
 //
 //   String name="";
 // String email=" ";
 // String blance = " ";
 // String account_number= " ";
 //   late SharedPreferences preferences;
 //  getdate()async{
 //    preferences = await SharedPreferences.getInstance();
 //     name= await preferences.getString("name").toString();
 //    email=await preferences.getString("email").toString();
 //    blance=await preferences.getString("deposite").toString();
 //    account_number=await preferences.getString("account_number").toString();
 //
 //
 //  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.homeCubit.getData();
  }
  @override
  Widget build(BuildContext context) {

    return  Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(color: AppTheme.success100),
      child: Column(children: [
        SizedBox(
          height: 1.h,
        ),
        Row(
          children: [
             Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text:   "hello : ${widget.homeCubit.name}",
                      style: TextStyle(
                          fontFamily: "Merriweather",
                          fontWeight: FontWeight.w700,
                          color: AppTheme.neutral900,
                          fontSize: 25),
                    ),
                  ],
                ),
              ),
            ),
            // Lottie.asset(AppAssets.handAsset, width: 60, height: 35),
            SizedBox(width: 25.w),
            // FloatingActionButton(
            //     onPressed: () {
            //       Navigator.pushNamed(context, AppRoutes.childRoute);
            //     },
            //     mini: true,
            //     backgroundColor: AppTheme.success900,
            //     child: const Icon(Icons.child_care_outlined)),
          ],
        ),
        SizedBox(
          height: 2.h,
        ),
        Row(),
        SizedBox(
          height: 1.h,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 140,
          decoration: BoxDecoration(
              color: AppTheme.success900,
              borderRadius: BorderRadius.circular(24)),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 3.h),
                    const Align(
                      alignment: Alignment(-0.70, 0.25),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "Balance",
                              style: TextStyle(
                                  fontFamily: "Merriweather",
                                  fontWeight: FontWeight.w700,
                                  color: AppTheme.success100,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                     Align(
                      alignment: Alignment(-0.70, 0.25),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "${widget.homeCubit.blance} \$",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: AppTheme.success100,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
            Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 3.h),
                    const Align(
                      alignment: Alignment(0, 0.25),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "Card Number",
                              style: TextStyle(
                                  fontFamily: "Merriweather",
                                  fontWeight: FontWeight.w700,
                                  color: AppTheme.success100,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                     Align(
                      alignment: Alignment(0, 0.25),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "${widget.homeCubit.account_number}",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: AppTheme.success100,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
          ]),
        ),
        SizedBox(
          height: 1.h,
        ),
         Padding(
          padding: const EdgeInsets.only(left: 9),
          child: Align(
            alignment: Alignment.centerLeft,
            child: InkWell(
              onTap:(){
                Navigator.pushNamed(context, AppRoutes.creditCardRoute);
              } ,
              child: const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Recharge",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: AppTheme.success900,
                          fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

      ]),
    );
  }
}
