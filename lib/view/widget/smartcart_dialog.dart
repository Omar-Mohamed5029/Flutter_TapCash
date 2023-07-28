
import 'package:flutter/material.dart';
import 'package:tabcash/view/widget/textfield.dart';

import '../../utilites/theme/app_theme.dart';
import '../../view_controller/cubits/cart_cubit/smartcart_cubit.dart';
class SmartCart_Dialog extends StatefulWidget {
   SmartCart_Dialog({super.key , required this.smartcart ,required this.check});
   SmartcartCubit smartcart;
   String check;
  @override
  State<SmartCart_Dialog> createState() => _SmartCart_DialogState();
}

class _SmartCart_DialogState extends State<SmartCart_Dialog> {
  final TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {


          return AlertDialog(
            // backgroundColor: AppTheme.success100,
              shape: RoundedRectangleBorder(
                  side: const BorderSide(color: AppTheme.success900),
                  borderRadius: BorderRadius.circular(15.0)),
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
                        }, controller: amountController,),
                    ],
                  )),
              actions: [
                TextButton(
                    onPressed: () async {
                      if(widget.check =="inc"){
                        await widget.smartcart.post_inc_samrtcart(inc_money: amountController.text);
                      }else{
                        await widget.smartcart.post_dec_samrtcart(dec_money: amountController.text);

                      }
                      await widget.smartcart.post_check_smartcart();

                      Navigator.pop(context);
                    },
                    style: TextButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(15.0))),
                    ),
                    child: const Text(
                      'Done',
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
  }
}
