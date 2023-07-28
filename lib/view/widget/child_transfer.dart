// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';
// import 'package:tabcash/view/widget/textfield.dart';
//
// import '../../utilites/theme/app_theme.dart';
//
// class Child_Trans_Dialog extends StatefulWidget {
//   const Child_Trans_Dialog({super.key});
//
//   @override
//   State<Child_Trans_Dialog> createState() => _Child_Trans_DialogState();
// }
//
// class _Child_Trans_DialogState extends State<Child_Trans_Dialog> {
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       // backgroundColor: AppTheme.success100,
//         shape: RoundedRectangleBorder(
//             side: const BorderSide(color: AppTheme.success900),
//             borderRadius: BorderRadius.circular(15.0)),
//         title: Center(
//             child: Column(
//               children: [
//                 Trans_TextField(
//                     controller: accountController,
//                     icon: Icons.account_circle_outlined,
//                     label: 'Account Number',
//                     type: TextInputType.text,
//                     validation: (value) {
//                       if (value.isEmpty) {
//                         return 'Please Enter Your Account Number';
//                       }
//                     }),
//                 SizedBox(
//                   height: 2.h,
//                 ),
//                 Trans_TextField(
//                     controller: amountController,
//                     icon: Icons.account_circle_outlined,
//                     label: 'Amount',
//                     type: TextInputType.text,
//                     validation: (value) {
//                       if (value.isEmpty) {
//                         return 'Please Enter Your Amount';
//                       }
//                     }),
//               ],
//             )),
//         actions: [
//           TextButton(
//               onPressed: () async {
//
//                 await widget.homeCubit.posttransfer(account_number: accountController.text, amount:amountController.text  , context: context);
//                 await widget.homeCubit.getgetalltransactions();
//                 Navigator.pop(context);
//               },
//               style: TextButton.styleFrom(
//                 shape: const RoundedRectangleBorder(
//                     borderRadius: BorderRadius.all(
//                         Radius.circular(15.0))),
//               ),
//               child: const Text(
//                 'Transfer Done',
//                 style: TextStyle(
//                     color: AppTheme.success900,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 15.0),
//               )),
//           TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               style: TextButton.styleFrom(
//                 shape: const RoundedRectangleBorder(
//                     borderRadius: BorderRadius.all(
//                         Radius.circular(15.0))),
//               ),
//               child: const Text(
//                 'cancel',
//                 style: TextStyle(
//                     color: AppTheme.success900,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 15.0),
//               )),
//         ]);
//   }
// }
