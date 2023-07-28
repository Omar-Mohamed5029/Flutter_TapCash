import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import 'package:tabcash/view/widget/textfield.dart';
import 'package:tabcash/view_controller/cubits/home_cubit/home_cubit.dart';

import '../../utilites/constant/flutter_toast.dart';
import '../../utilites/route/routes.dart';
import '../../utilites/theme/app_theme.dart';

import '../pages/mychildren.dart';
import 'button_home_widget.dart';

class TransferWidget extends StatefulWidget {
   TransferWidget({Key? key , required  this.homeCubit}) : super(key: key);
  HomeCubit homeCubit;
  @override
  State<TransferWidget> createState() => _TransferWidgetState();
}

class _TransferWidgetState extends State<TransferWidget> {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController accountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ButtonHomeWidget(
            text: 'Transfer',
            icon: Iconsax.convert,
            callback: () {
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
                            Trans_TextField(
                                controller: accountController,
                                icon: Icons.account_circle_outlined,
                                label: 'Account Number',
                                type: TextInputType.text,
                                validation: (value) {
                                  if (value.isEmpty) {
                                    return 'Please Enter Your Account Number';
                                  }
                                }),
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

                               await widget.homeCubit.posttransfer(account_number: accountController.text, amount:amountController.text  , context: context);
                               await widget.homeCubit.getgetalltransactions();
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
          ButtonHomeWidget(
            text: 'Payment',
            icon: Iconsax.export,
            callback: () {
              Navigator.pushNamed(context, AppRoutes.creditCardRoute);
            },
          ),
          ButtonHomeWidget(
            text: 'children',
            icon: Icons.child_care_outlined,
            callback: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyChildren(Token:widget.homeCubit.Token,homeCubit: widget.homeCubit),
                  ));
            },
          ),
          ButtonHomeWidget(
            text: 'add child',
            icon: Iconsax.add,
            callback: () {
              Navigator.pushNamed(context, AppRoutes.childRoute);
            },
          ),
        ],
      ),
    );
  }
}
