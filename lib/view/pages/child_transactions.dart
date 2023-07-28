import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../utilites/theme/app_theme.dart';
import '../../view_controller/cubits/getchildren/getchildren_cubit.dart';
import '../../view_controller/cubits/getchildren/getchildren_state.dart';

class Children_Transactions extends StatefulWidget {
  Children_Transactions(
      {super.key,
      required this.myChildrenCubit,
      required this.account_number,
      required this.Token});

  MyChildrenCubit myChildrenCubit;
  String account_number;
  String Token;

  @override
  State<Children_Transactions> createState() => _Children_TransactionsState();
}

class _Children_TransactionsState extends State<Children_Transactions> {
  @override
  Widget build(BuildContext context) {
    widget.myChildrenCubit.post_Child_transactions(
        account_number: widget.account_number, Token: widget.Token);
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
                    text: "Child Transactions",
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
        body: state is children_trans_LoadingState
            ? Center(child: CircularProgressIndicator())
            : widget.myChildrenCubit.child_transactionsData.length > 0
                ? FutureBuilder(builder: (context, snapshot) {
                    return SafeArea(
                        child: ListView(
                      children: <Widget>[
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            horizontalMargin: 30.sp,
                            columnSpacing: 15.sp,
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
                              widget.myChildrenCubit.child_transactionsData
                                  .length,
                              (int index) => DataRow(
                                color:
                                    MaterialStateProperty.resolveWith<Color?>(
                                        (Set<MaterialState> states) {
                                  // Even rows will have a grey color.
                                  if (index.isEven) {
                                    return Colors.grey.withOpacity(0.3);
                                  }
                                  return null; // Use default value for other states and odd rows.
                                }),
                                cells: <DataCell>[
                                  DataCell(Text(
                                      '${widget.myChildrenCubit.child_transactionsData[index].account_no}')),
                                  DataCell(Text(
                                      '${widget.myChildrenCubit.child_transactionsData[index].process_type}')),
                                  DataCell(Text(
                                      '${widget.myChildrenCubit.child_transactionsData[index].receive_account}')),
                                  // DataCell(Text('${homeCubit.mytransactionsData[index].created_at}'))
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ));
                  })
                : Center(
                    child: Text(
                      "No Child Transactions",
                      style: TextStyle(fontSize: 15.sp),
                    ),
                  ),
      );
    });
  }
}
