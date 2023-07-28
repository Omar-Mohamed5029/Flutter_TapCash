import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tabcash/view/widget/buying_dialog.dart';
import '../../utilites/theme/app_theme.dart';
import '../../view_controller/cubits/cart_cubit/smartcart_cubit.dart';



class ListOnlinePayment extends StatelessWidget {
   ListOnlinePayment({Key? key, required this.text,required this.smartcart, required this.image}) : super(key: key);
  final String text;
  final String image;
  SmartcartCubit smartcart;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.all( 5.sp,),
        decoration: BoxDecoration(
          border: Border.all(color: AppTheme.success900),
          color:AppTheme.success100,
          borderRadius :BorderRadius.circular(15.0),
        ),

        child: ListTile(
          leading: CircleAvatar(
            radius: 20,
            backgroundColor: AppTheme.backgroundOnBoarding0,
            child: ClipOval(
                child: Image.asset(image,height: 40,width: 60,)),
          ),
          title: Text.rich(TextSpan(
            style: TextStyle(
              fontWeight: FontWeight.w500,
                color: AppTheme.neutral900,
                fontSize: 15.sp
            ),
            text: text,
          ),
          ),
          // onTap: () {
          //   // Navigator.push(context, MaterialPageRoute(builder: (_){return Result('Best Sellers');}) );
          // },
          // trailing:
          // const Icon(Icons.arrow_forward_ios) ,


        ),
      ),
      onTap: (){
        showDialog(
            context: context,
            // barrierDismissible: false,
            builder: (BuildContext context) {
              return Buying_Dialog(smartcart: smartcart);
            });
      },
    );
  }
}
