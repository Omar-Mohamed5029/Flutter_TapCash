import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:tabcash/view/pages/statistics.dart';
import '../../utilites/theme/app_theme.dart';
import '../../view_controller/cubits/home_cubit/home_cubit.dart';
import '../../view_controller/cubits/home_cubit/home_state.dart';
import '../widget/homeWidget.dart';
import '../widget/transfer_widget.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  @override
  final GlobalKey<FormState> homekey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = HomeCubit.get(context);
    homeCubit.getgetalltransactions();

    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                state is HomeLoadingState
                    ? CircularProgressIndicator()
                    : HomeWalletWidget(homeCubit: homeCubit),
                SizedBox(
                  height: 2.h,
                ),
                TransferWidget(
                  homeCubit: homeCubit,
                ),
                SizedBox(
                  height: 2.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      const Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "Last Transiction",
                              style: TextStyle(
                                  fontFamily: "Merriweather",
                                  fontWeight: FontWeight.w600,
                                  color: AppTheme.neutral900,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 25.w,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    StatisticsScreen(homeCubit: homeCubit),
                              ));

                          // Navigator.pushNamed(
                          //     context, AppRoutes.statisticsRoute);
                        },
                        child: const Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "View All",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: AppTheme.success900,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                state is Home_LoadingGetTransactions
                    ? CircularProgressIndicator()
                    : homeCubit.mytransactionsData.length > 0
                        ? FutureBuilder(builder: (context, snapshot) {
                            return SafeArea(
                                child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: DataTable(
                                columnSpacing: 10,

                                showBottomBorder: true,
                                horizontalMargin: 0,
                                // dividerThickness: 10,
                                // headingRowHeight: 10,
                                // showCheckboxColumn: true,
                                // dataRowHeight: 10,

                                columns: const <DataColumn>[
                                  DataColumn(
                                    label: Text(
                                      'Account_no',
                                      style: TextStyle(
                                          fontStyle: FontStyle.normal),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Process_type',
                                      style: TextStyle(
                                          fontStyle: FontStyle.normal),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Receive_account',
                                      style: TextStyle(
                                          fontStyle: FontStyle.normal),
                                    ),
                                  ),
                                  // DataColumn(
                                  //   label: Text(
                                  //       'created_at',
                                  //       style: TextStyle(fontStyle: FontStyle.italic),
                                  //     ),
                                  // ),
                                ],
                                rows: List<DataRow>.generate(
                                  homeCubit.mytransactionsData.length > 6
                                      ? 6
                                      : homeCubit.mytransactionsData.length,
                                  (int index) => DataRow(
                                    color: MaterialStateProperty.resolveWith<
                                        Color?>((Set<MaterialState> states) {
                                      // Even rows will have a grey color.
                                      if (index.isEven) {
                                        return Colors.grey.withOpacity(0.3);
                                      }
                                      return null; // Use default value for other states and odd rows.
                                    }),
                                    cells: <DataCell>[
                                      DataCell(Text(
                                          '${homeCubit.mytransactionsData[index].account_no}')),
                                      DataCell(Text(
                                          '${homeCubit.mytransactionsData[index].process_type}')),
                                      DataCell(Text(
                                          '${homeCubit.mytransactionsData[index].receive_account}')),
                                      // DataCell(Text('${homeCubit.mytransactionsData[index].created_at}'))
                                    ],
                                  ),
                                ),
                              ),
                            ));
                          })
                        : Padding(
                       padding: EdgeInsets.only(top: 40.sp),
                            child: Text(
                              "No Transactions",
                              style: TextStyle(fontSize: 15.sp),
                            ),
                          ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
