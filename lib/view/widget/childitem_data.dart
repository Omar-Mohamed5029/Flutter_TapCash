import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tabcash/view/pages/child_transactions.dart';
import 'package:tabcash/view/widget/textfield.dart';
import 'package:tabcash/view_controller/cubits/home_cubit/home_cubit.dart';

import '../../utilites/theme/app_theme.dart';
import '../../view_controller/cubits/getchildren/getchildren_cubit.dart';
import 'default_text.dart';

class Child_data extends StatelessWidget {
   Child_data(
      {super.key,
      required this.name,
        required this.accountnumber,
      required this.deposite,
      required this.moneyLimit,
      required this.purchases_limit,
      required this.created_at,
        required this.homeCubit,
        required this.myChildrenCubit});

  final String name;
   final String accountnumber;
  final String deposite;
  final String moneyLimit;
  final String purchases_limit;
  final String created_at;
  HomeCubit homeCubit;
   MyChildrenCubit myChildrenCubit;

  @override
  Widget build(BuildContext context) {
    final TextEditingController amountController = TextEditingController();
    return Container(
      // height: 220.sp,
      margin: EdgeInsets.only(top: 20.sp, left: 17.sp, right: 17.sp),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
          mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 5.sp, left: 8.sp),
            child: Row(
              children: [
                DefaultText(
                  text: "name : ",
                  color: Colors.black,
                  size: 20,
                ),
                DefaultText(
                  text: name,
                  color: Colors.black,
                  size: 20,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5.sp, left: 8.sp),
            child: Row(
              children: [
                DefaultText(
                  text: "Depoite : ",
                  color: Colors.black,
                  size: 20,
                ),
                DefaultText(
                  text: deposite,
                  color: Colors.black,
                  size: 20,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5.sp, left: 8.sp),
            child: Row(
              children: [
                DefaultText(
                  text: "Money_Limit : ",
                  color: Colors.black,
                  size: 20,
                ),
                DefaultText(
                  text: moneyLimit,
                  color: Colors.black,
                  size: 20,
                ),
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 5.sp, left: 8.sp),
              child: DefaultText(
                text: "Purchases_limit : ",
                color: Colors.black,
                size: 20,
              )),
          Flexible(
            child: Padding(
              padding: EdgeInsets.only(top: 5.sp, left: 8.sp),
              child: DefaultText(
                text: purchases_limit,
                color: Colors.black,
                size: 20,
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 5.sp, left: 8.sp),
              child: DefaultText(
                text: "Created_at : ",
                color: Colors.black,
                size: 20,
              )),
          DefaultText(
            text: created_at,
            color: Colors.black,
            size: 20,
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
                child: Text("Show Transactions"),
                onPressed: () async{
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Children_Transactions(myChildrenCubit: myChildrenCubit,
                        account_number: accountnumber,
                        Token: homeCubit.Token,),
                      ));
                },
              ),

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
                child: Text("Transfer"),
                onPressed: () {
                  showDialog(
                      context: context,
                      // barrierDismissible: false,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          // backgroundColor: AppTheme.success100,
                            shape: RoundedRectangleBorder(
                                side: const BorderSide(color: AppTheme.success900),
                                borderRadius: BorderRadius.circular(15.0)),
                            title: Center(
                                child: Column(
                                  children: [
                                   Text(accountnumber.toString()),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Trans_TextField(
                                        controller: amountController,
                                        icon: Icons.account_circle_outlined,
                                        label: 'Amount',
                                        type: TextInputType.text,
                                        validation: (value) {
                                          if (value.isEmpty) {
                                            return 'Please Enter Your Amount';
                                          }
                                        }),
                                  ],
                                )),
                            actions: [
                              TextButton(
                                  onPressed: () async {

                                    await homeCubit.posttransfer(account_number: accountnumber.toString(), amount:amountController.text  , context: context);
                                    await homeCubit.getData();
                                    await homeCubit.getgetalltransactions();
                                    await myChildrenCubit.post_getchildren(Token:homeCubit.Token);
                                    Navigator.pop(context);
                                  },
                                  style: TextButton.styleFrom(
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15.0))),
                                  ),
                                  child: const Text(
                                    'Transfer Done',
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
                },
              ),
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
        ],
      ),
    );
  }
}
