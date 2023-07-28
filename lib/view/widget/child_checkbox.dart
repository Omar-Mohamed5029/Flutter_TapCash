import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../utilites/constant/flutter_toast.dart';
import '../../utilites/theme/app_theme.dart';
import '../../view_controller/cubits/child_cubit/child_cubit.dart';

class ChekBox extends StatefulWidget {
   ChekBox({super.key ,required this.childcubit });
  ChildCubit childcubit;
  @override
  State<ChekBox> createState() => _ChekBoxState();
}

class _ChekBoxState extends State<ChekBox> {


 // static List<String>purchases_limit=[];


  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;
  @override
  Widget build(BuildContext context) {
    return Column (children: [    Padding(
      padding: const EdgeInsets.only(left: 12),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "Purchase Limitation",
                style: TextStyle(
                    fontFamily: "Merriweather",
                    fontWeight: FontWeight.w700,
                    color: AppTheme.success900,
                    fontSize: 17.sp),
              ),
            ],
          ),
        ),
      ),
    ),
      Row(children: [
        Theme(
          data: Theme.of(context).copyWith(
            unselectedWidgetColor:AppTheme.success900,
          ),
          child: Checkbox(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            value: isChecked1,
            onChanged: (value) {

              setState(() {
                isChecked1 = value!;

                if(widget.childcubit.purchases_limit.contains("food")){
                  widget.childcubit.purchases_limit.remove('food');

                }else{
                  widget.childcubit.purchases_limit.add('food');

                }


              });
              flutterToast(msg:widget.childcubit.purchases_limit.toString() , color: Colors.green);

            },
            activeColor: AppTheme.success900,
            checkColor: AppTheme.success100,
          ),
        ),
        Text("Food",
          style: TextStyle(
              fontFamily: "Merriweather",
              fontWeight: FontWeight.w600,
              color: AppTheme.success900,
              fontSize: 12.sp),),
      ]),
      Row(children: [
        Theme(
          data: Theme.of(context).copyWith(
            unselectedWidgetColor:AppTheme.success900,
          ),
          child: Checkbox(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            value: isChecked2,
            onChanged: (value) {
              setState(() {
                isChecked2 = value!;
                if(widget.childcubit.purchases_limit.contains("electorincs")){
                  widget.childcubit.purchases_limit.remove('electorincs');
                }else{
                  widget.childcubit.purchases_limit.add('electorincs');

                }
                // purchases_limit.add('electorincs');
              });
              flutterToast(msg:widget.childcubit.purchases_limit.toString() , color: Colors.green);

            },
            activeColor: AppTheme.success900,
            checkColor: AppTheme.success100,
          ),
        ),
        Text("Electronics",
          style: TextStyle(
              fontFamily: "Merriweather",
              fontWeight: FontWeight.w600,
              color: AppTheme.success900,
              fontSize: 12.sp),),
      ]),
      Row(children: [
        Theme(
          data: Theme.of(context).copyWith(
            unselectedWidgetColor:AppTheme.success900,
          ),
          child: Checkbox(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            value: isChecked3,
            onChanged: (value) {
              setState(() {
                isChecked3 = value!;

                if(widget.childcubit.purchases_limit.contains("clothes")){
                  widget.childcubit.purchases_limit.remove('clothes');
                }else{
                  widget.childcubit. purchases_limit.add('clothes');

                }
                // purchases_limit.add('clothes');
              });
              flutterToast(msg:widget.childcubit.purchases_limit.toString() , color: Colors.green);

            },
            activeColor: AppTheme.success900,
            checkColor: AppTheme.success100,
          ),
        ),
        Text("Clothes",
          style: TextStyle(
              fontFamily: "Merriweather",
              fontWeight: FontWeight.w600,
              color: AppTheme.success900,
              fontSize: 12.sp),),
      ]),
      Row(children: [
        Theme(
          data: Theme.of(context).copyWith(
            unselectedWidgetColor:AppTheme.success900,
          ),
          child: Checkbox(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            value: isChecked4,
            onChanged: (value) {
              setState(() {
                isChecked4 = value!;
                if(widget.childcubit.purchases_limit.contains("cigarettes")){
                  widget.childcubit.purchases_limit.remove('cigarettes');
                }else{
                  widget.childcubit.purchases_limit.add('cigarettes');

                }

              });
              flutterToast(msg:widget.childcubit.purchases_limit.toString() , color: Colors.green);

            },
            activeColor: AppTheme.success900,
            checkColor: AppTheme.success100,
          ),
        ),
        Text("Cigarettes",
          style: TextStyle(
              fontFamily: "Merriweather",
              fontWeight: FontWeight.w600,
              color: AppTheme.success900,
              fontSize: 12.sp),),
      ]),
    ],);
  }
}
