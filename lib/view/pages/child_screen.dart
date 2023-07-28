import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../../utilites/asset/app_asset.dart';
import '../../utilites/constant/flutter_toast.dart';
import '../../utilites/theme/app_theme.dart';
import '../../view_controller/cubits/child_cubit/child_cubit.dart';
import '../widget/child_checkbox.dart';
import '../widget/child_textfromfield.dart';

class ChildScreen extends StatefulWidget {
  const ChildScreen({Key? key}) : super(key: key);

  @override
  State<ChildScreen> createState() => _ChildScreenState();
}

class _ChildScreenState extends State<ChildScreen> {
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController confirmpassword = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController nationalId = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController age = TextEditingController();
  final TextEditingController money_limit = TextEditingController();

  final GlobalKey<FormState> childKey = GlobalKey<FormState>();
  String gender = 'None';

  // int currentStep = 0;
  var formdkey = GlobalKey<FormState>();

  // int age = 18;
  // static List<String>purchases_limit=[];

  @override
  Widget build(BuildContext context) {
    ChildCubit childCubit = ChildCubit.get(context);
    return BlocBuilder<ChildCubit, ChildState>(builder: (context, state) {
      return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: AppTheme.success100,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: AppTheme.neutral900,
                  )),
              title: Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Child Account",
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
                // Lottie.asset(AppAssets.childAsset, width: 70, height: 70),
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 2.h),
                  Container(
                    margin: EdgeInsets.only(left: 10.sp, right: 10.sp),
                    child: Form(
                      key: childKey,
                      child: Column(
                        children: [
                          ChildTextField(
                            controller: namecontroller,
                            icon: Icons.drive_file_rename_outline_rounded,
                            label: 'Name',
                            type: TextInputType.emailAddress,
                            validation: (value) {
                              if (value.isEmpty) {
                                return 'Please Enter Your Name';
                              }
                            },
                            childCubitPass: childCubit,
                          ),
                          SizedBox(height: 15.0.sp),
                          ChildTextField(
                              controller: emailcontroller,
                              childCubitPass: childCubit,
                              icon: Icons.email,
                              label: 'E-mail',
                              type: TextInputType.emailAddress,
                              validation: (value) {
                                if (value.isEmpty) {
                                  return 'Please Enter Your Email';
                                } else if (!RegExp(
                                        "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9+_.-]+.[com]")
                                    .hasMatch(value)) {
                                  return 'Please Enter Valid as example@gmail.com';
                                }
                              }),
                          SizedBox(height: 15.0.sp),
                          ChildTextField(
                              controller: passwordcontroller,
                              childCubitPass: childCubit,
                              icon: Icons.lock,
                              label: 'Password',
                              type: TextInputType.text,
                              validation: (value) {
                                if (value.isEmpty) {
                                  return 'Please Enter Your Password';
                                }
                              }),
                          SizedBox(height: 15.0.sp),
                          ChildTextField(
                              controller: confirmpassword,
                              childCubitPass: childCubit,
                              icon: Icons.lock,
                              label: 'Confirm Password',
                              type: TextInputType.text,
                              validation: (value) {
                                if (value.isEmpty) {
                                  return 'Please Enter Your Password';
                                } else if (passwordcontroller.text !=
                                    confirmpassword.text) {
                                  return 'Please Enter Your confirm password again';
                                }
                              }),
                          SizedBox(height: 15.0.sp),
                          ChildTextField(
                              controller: phone,
                              childCubitPass: childCubit,
                              icon: Icons.phone,
                              label: 'Number',
                              type: TextInputType.number,
                              validation: (value) {
                                if (value.isEmpty) {
                                  return 'Please Enter Your Phone Number';
                                } else if (value.length != 11) {
                                  return "Phone Number Must be 11 Number";
                                }
                              }),
                          SizedBox(height: 15.0.sp),
                          ChildTextField(
                              controller: nationalId,
                              childCubitPass: childCubit,
                              icon: Icons.credit_card_sharp,
                              label: 'National ID',
                              type: TextInputType.number,
                              validation: (value) {
                                if (value.isEmpty) {
                                  return 'Please Enter Your National ID';
                                } else if (value.length != 14) {
                                  return "National ID Must be 11 Number";
                                }
                              }),
                          SizedBox(height: 15.0.sp),
                          Center(
                            child: Row(
                              children: [
                                Container(
                                  // height: 150,
                                  width: 165,
                                  child: ChildTextField(
                                    controller: age,
                                    childCubitPass: childCubit,
                                    icon: Icons.cake,
                                    label: 'Age',
                                    type: TextInputType.number,
                                    validation: (value) {
                                      if (value.isEmpty) {
                                        return 'Please Enter Age';
                                      } else {
                                        int? age = int.tryParse(value);
                                        if (age == null) {
                                          return 'Invalid Age';
                                        } else if (age < 18) {
                                          return 'Age Must 18 or Above';
                                        }
                                      }
                                      return null; // Return null if validation passes
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Container(
                                  // height: 150,
                                  width: 165,
                                  child: ChildTextField(
                                      controller: city,
                                      childCubitPass: childCubit,
                                      icon: Icons.location_city,
                                      label: 'City',
                                      type: TextInputType.text,
                                      validation: (value) {
                                        if (value.isEmpty) {
                                          return 'Please Enter City';
                                        }
                                      }),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 15.sp),
                          Container(
                            decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                      color: AppTheme.success900, blurRadius: 1)
                                ],
                                borderRadius: BorderRadius.circular(15.0),
                                color: AppTheme.backgroundOnBoarding),
                            margin:
                                const EdgeInsets.only(top: 5.0, bottom: 10.0),
                            child: ListTile(
                              title: const Text(
                                'Gender',
                                style: TextStyle(
                                    color: AppTheme.success900,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                gender,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              trailing: PopupMenuButton(
                                color: AppTheme.success100,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0)),
                                icon: const Icon(
                                  Icons.arrow_downward,
                                  color: AppTheme.success900,
                                  size: 20.0,
                                ),
                                itemBuilder: (BuildContext context) {
                                  return <PopupMenuEntry<String>>[
                                    const PopupMenuItem(
                                      value: 'male',
                                      child: Text(
                                        'Male',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    const PopupMenuItem(
                                      value: 'female',
                                      child: Text(
                                        'Female',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ];
                                },
                                onSelected: (value) {
                                  gender = value;
                                  childCubit.changeGender(value);
                                  // if (value == 'Male')
                                  //   registerCubit.changeGender('m');
                                  // else
                                  //   registerCubit.changeGender('f');
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 15.0.sp),
                          ChildTextField(
                              controller: money_limit,
                              childCubitPass: childCubit,
                              icon: Icons.monetization_on,
                              label: 'Money Limit',
                              type: TextInputType.number,
                              validation: (value) {
                                if (value.isEmpty) {
                                  return 'Please Enter Your National ID';
                                }
                                return null;
                              }),
                          SizedBox(height: 15.0.sp),
                          ChekBox(childcubit: childCubit),
                          InkWell(
                              child: Container(
                                  decoration: BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(
                                            color: AppTheme.success900,
                                            spreadRadius: 1)
                                      ],
                                      borderRadius: BorderRadius.circular(15.0),
                                      color: AppTheme.success100),
                                  margin: EdgeInsets.only(
                                      top: 15.sp, bottom: 15.sp),
                                  width: 260.sp,
                                  height:
                                      MediaQuery.of(context).size.height / 15,
                                  // color: Colors.deepOrange,
                                  child: const Center(
                                    child: Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text: "Create Child Account",
                                            style: TextStyle(
                                                fontFamily: "Merriweather",
                                                fontWeight: FontWeight.bold,
                                                color: AppTheme.success900,
                                                fontSize: 20),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )),
                              onTap: () {
                                flutterToast(
                                    msg: childCubit.purchases_limit.toString(),
                                    color: Colors.green);
                               String purchases_limit= childCubit.purchases_limit.toString();
                                purchases_limit=purchases_limit.substring(1,purchases_limit.length-1);

                                // flutterToast(msg: purchases_limit, color: Colors.green);

                                if (childKey.currentState!.validate()) {
                                  childCubit.postRegister(
                                      name: namecontroller.text,
                                      email: emailcontroller.text,
                                      password: passwordcontroller.text,
                                      phone: phone.text,
                                      city: city.text,
                                      confirm_password: confirmpassword.text,
                                      money_limit: money_limit.text,
                                      age: age.text,
                                      national_id: nationalId.text,
                                      context: context,
                                      purchases_limit:
                                      purchases_limit,
                                      gender: childCubit.gender == 'male'
                                          ? 'male'
                                          : 'female');
                                }
                              }),
                          SizedBox(height: 1.h),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )),
      );
    });
  }
}
