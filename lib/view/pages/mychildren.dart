import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:tabcash/view/widget/childitem_data.dart';
import 'package:tabcash/view_controller/cubits/getchildren/getchildren_cubit.dart';
import 'package:tabcash/view_controller/cubits/home_cubit/home_cubit.dart';

import '../../utilites/theme/app_theme.dart';
import '../../view_controller/cubits/getchildren/getchildren_state.dart';

class MyChildren extends StatefulWidget {
  MyChildren({super.key, required this.Token,required this.homeCubit});
  HomeCubit homeCubit;
  String Token;

  @override
  State<MyChildren> createState() => _MyChildrenState();
}

class _MyChildrenState extends State<MyChildren> {
  @override
  Widget build(BuildContext context) {
    MyChildrenCubit myChildrenCubit = MyChildrenCubit.get(context);

    myChildrenCubit.post_getchildren(Token: widget.Token);

    return BlocBuilder<MyChildrenCubit, getchildren_state>(
        builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          // backwardsCompatibility: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: AppTheme.success900),
            onPressed: () => Navigator.of(context).pop(),
          ),

          backgroundColor: AppTheme.success100,
          automaticallyImplyLeading: false,
          title: Center(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "All Children",
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
            // Lottie.asset(AppAssets.settingAsset, width: 70, height: 70),
          ],
        ),
        body: state is getchildren_LoadingState
            ? Center(child: CircularProgressIndicator())
            : myChildrenCubit.myChildrenData.length >0?FutureBuilder(builder: (context, snapshot) {
                Future.delayed(Duration(seconds: 2), () {
                  return Center(child: CircularProgressIndicator());
                });
                return SafeArea(
                    child: ListView.builder(
                        itemCount: myChildrenCubit.myChildrenData.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return Child_data(
                            myChildrenCubit: myChildrenCubit,
                            homeCubit: widget.homeCubit,
                            name: myChildrenCubit.myChildrenData[index].name
                                .toString(),
                            accountnumber: myChildrenCubit.myChildrenData[index].account_number
                                .toString(),
                            deposite: myChildrenCubit
                                .myChildrenData[index].deposite
                                .toString(),
                            moneyLimit: myChildrenCubit
                                .myChildrenData[index].moneyLimit
                                .toString(),
                            purchases_limit: myChildrenCubit
                                .myChildrenData[index].purchases_limit
                                .toString(),
                            created_at: myChildrenCubit
                                .myChildrenData[index].created_at
                                .toString(),
                          );
                        }));
              }):Center(child: Text("You Havenot any Children" , style: TextStyle(fontSize: 15.sp),),),
      );
    });
  }
}
