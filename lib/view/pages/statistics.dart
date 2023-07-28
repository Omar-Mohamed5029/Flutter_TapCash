import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../model/remote data/transactions_model.dart';
import '../../utilites/theme/app_theme.dart';
import '../../view_controller/cubits/home_cubit/home_cubit.dart';
import '../../view_controller/cubits/home_cubit/home_state.dart';

class StatisticsScreen extends StatefulWidget {
  StatisticsScreen({Key? key, required this.homeCubit}) : super(key: key);
  HomeCubit homeCubit;

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
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
                    text: "All Transactions",
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
        body: state is Home_LoadingGetTransactions
            ? Center(child: CircularProgressIndicator())
            : widget.homeCubit.mytransactionsData.length > 0
                ? FutureBuilder(builder: (context, snapshot) {
                    return SafeArea(
                        child: ListView(children: <Widget>[
                      DataTable(
                        horizontalMargin: 10,
                        columnSpacing: 10,
                        showBottomBorder: true,
                        columns: const <DataColumn>[
                          DataColumn(
                            label: Text(
                              'Account_no',
                              style: TextStyle(fontStyle: FontStyle.normal),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Process_type',
                              style: TextStyle(fontStyle: FontStyle.normal),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Receive_account',
                              style: TextStyle(fontStyle: FontStyle.normal),
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
                          widget.homeCubit.mytransactionsData.length,
                          (int index) => DataRow(
                            color: MaterialStateProperty.resolveWith<Color?>(
                                (Set<MaterialState> states) {
                              // Even rows will have a grey color.
                              if (index.isEven) {
                                return Colors.grey.withOpacity(0.3);
                              }
                              return null; // Use default value for other states and odd rows.
                            }),
                            cells: <DataCell>[
                              DataCell(Text(
                                  '${widget.homeCubit.mytransactionsData[index].account_no}')),
                              DataCell(Text(
                                  '${widget.homeCubit.mytransactionsData[index].process_type}')),
                              DataCell(Text(
                                  '${widget.homeCubit.mytransactionsData[index].receive_account}')),
                              // DataCell(Text('${homeCubit.mytransactionsData[index].created_at}'))
                            ],
                          ),
                        ),
                      ),
                    ]));
                  })
                : Center(
                    child: Text(
                      "No Transactions",
                      style: TextStyle(fontSize: 15.sp),
                    ),
                  ),
      );
    });
  }
}
