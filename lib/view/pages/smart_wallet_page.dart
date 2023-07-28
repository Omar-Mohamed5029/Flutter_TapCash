import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:tabcash/view/widget/smartcart_dialog.dart';
import 'package:tabcash/view_controller/cubits/cart_cubit/smartcart_cubit.dart';
import 'package:tabcash/view_controller/cubits/cart_cubit/smartcart_state.dart';
import '../../utilites/asset/app_asset.dart';
import '../../utilites/theme/app_theme.dart';
import '../widget/list_payment.dart';
import '../widget/textfield.dart';

class SmartWalletPage extends StatefulWidget {
  SmartWalletPage({Key? key}) : super(key: key);

  @override
  State<SmartWalletPage> createState() => _SmartWalletPageState();
}

class _SmartWalletPageState extends State<SmartWalletPage> {
  final TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SmartcartCubit smartcart = SmartcartCubit.get(context);
    smartcart.post_check_smartcart(context: context);

    return BlocBuilder<SmartcartCubit, SmartCart_State>(
        builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppTheme.success100,
          automaticallyImplyLeading: false,
          title: Center(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "Online payments",
                    style: TextStyle(
                        fontFamily: "Merriweather",
                        fontWeight: FontWeight.bold,
                        color: AppTheme.success900,
                        fontSize: 17.sp),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            // Lottie.asset(AppAssets.cartAsset, width: 70, height: 70),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(children: [
            SizedBox(
              height: 1.h,
            ),
            state is SmartCart_LoadingState
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : state is SmartCart_SuccessState
                    ? Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 75.sp,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                                        fontFamily:
                                                            "Merriweather",
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color:
                                                            AppTheme.success100,
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
                                                    text:
                                                        "${smartcart.deposite}",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color:
                                                            AppTheme.success100,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(height: 3.h),
                                          const Align(
                                            alignment: Alignment(0, 0.25),
                                            child: Text.rich(
                                              TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: "Smart Cart",
                                                    style: TextStyle(
                                                        fontFamily:
                                                            "Merriweather",
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color:
                                                            AppTheme.success100,
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
                                                    text:
                                                        "${smartcart.Cart_number}",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color:
                                                            AppTheme.success100,
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
                            height: 2.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                style: ButtonStyle(
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            AppTheme.success900),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                    ))),
                                child: Icon(Icons.add),
                                onPressed: () async{
                                  showDialog(
                                      context: context,
                                      // barrierDismissible: false,
                                      builder: (BuildContext context) {
                                        return SmartCart_Dialog(
                                          smartcart: smartcart,
                                          check: "inc",
                                        );
                                      });
                                },
                              ),
                              // FloatingActionButton(
                              //   backgroundColor: Colors.green,
                              //   child: Icon(Icons.add),
                              //   onPressed: () {},
                              // ),
                              SizedBox(
                                width: 4.w,
                              ),
                              TextButton(
                                style: ButtonStyle(
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            AppTheme.success900),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                    ))),
                                child: Icon(Icons.minimize),
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      // barrierDismissible: false,
                                      builder: (BuildContext context) {
                                        return SmartCart_Dialog(
                                          smartcart: smartcart,
                                          check: "dec",
                                        );
                                      });
                                  setState(() {
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      )
                    : MaterialButton(
                        onPressed: () async {
                          showDialog(
                              context: context,
                              // barrierDismissible: false,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                    // backgroundColor: AppTheme.success100,
                                    shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                            color: AppTheme.success900),
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
                                    title: Center(
                                        child: Column(
                                      children: [
                                        Trans_TextField(
                                          // controller: amountController,
                                          icon: Icons.account_circle_outlined,
                                          label: 'Amount',
                                          type: TextInputType.text,
                                          validation: (value) {
                                            if (value.isEmpty) {
                                              return 'Please Enter Your Amount';
                                            }
                                          },
                                          controller: amountController,
                                        ),
                                      ],
                                    )),
                                    actions: [
                                      TextButton(
                                          onPressed: () async {
                                            await smartcart
                                                .post_Create_smartcart(
                                                    Amount_money:
                                                        amountController.text);

                                            Navigator.pop(context);
                                          },
                                          style: TextButton.styleFrom(
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15.0))),
                                          ),
                                          child: const Text(
                                            'Create',
                                            style: TextStyle(
                                                color: AppTheme.success900,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15.0),
                                          )),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          style: TextButton.styleFrom(
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15.0))),
                                          ),
                                          child: const Text(
                                            'cancel',
                                            style: TextStyle(
                                                color: AppTheme.success900,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15.0),
                                          )),
                                    ]);
                              });

                          // Navigator.pushReplacement(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => Notes(),
                          //   ),
                          // );
                        },
                        color: Colors.green,
                        height: 40.sp,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        child: Text(
                          'Create Smart Cart',
                          style:
                              TextStyle(color: Colors.white, fontSize: 20.sp),
                        )),
            SizedBox(
              height: 2.h,
            ),
             ListOnlinePayment(
              text: 'Vezeeta',
              image: AppAssets.vezeetaAsset,
              smartcart: smartcart,
            ),
             ListOnlinePayment(
              text: 'Amazon',
              image: AppAssets.amazonAsset,
              smartcart: smartcart,
            ),
             ListOnlinePayment(
              text: 'Carrefour',
              image: AppAssets.carrefourAsset,
              smartcart: smartcart,
            ),
             ListOnlinePayment(
              text: 'B.Tech',
              image: AppAssets.btechAsset,
              smartcart: smartcart,
            ),
          ]),
        ),
      );
    });
  }
}
