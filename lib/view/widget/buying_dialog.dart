import 'package:flutter/material.dart';
import 'package:tabcash/view/widget/textfield.dart';

import '../../utilites/theme/app_theme.dart';
import '../../view_controller/cubits/cart_cubit/smartcart_cubit.dart';

class Buying_Dialog extends StatefulWidget {
   Buying_Dialog({super.key,required this.smartcart });
  SmartcartCubit smartcart;
  @override
  State<Buying_Dialog> createState() => _Buying_DialogState();
}

class _Buying_DialogState extends State<Buying_Dialog> {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController purchase_nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
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
                  label: 'purchase name',
                  type: TextInputType.text,
                  validation: (value) {
                    if (value.isEmpty) {
                      return 'Please Enter Your purchase name';
                    }
                  }, controller: purchase_nameController,),
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

                await widget.smartcart.post_purchase_samrtcart(amount_money: amountController.text, purchase_name: purchase_nameController.text);
                await widget.smartcart.post_check_smartcart();

                Navigator.pop(context);
              },
              style: TextButton.styleFrom(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(15.0))),
              ),
              child: const Text(
                'Buy',
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
        ]);;
  }
}
