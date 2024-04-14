import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hr_app/advance_payment_screen/view/widgets/generate_dates/generate_month%20_and_year.dart';
import 'package:hr_app/advance_payment_screen/view_model/advance_payment_screen_view_model.dart';
import 'package:hr_app/login_screen/view_model/login_screen_view_model.dart';
import 'package:hr_app/utils/locator/locator.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class AdvancePaymentHistory extends StatefulWidget {
  const AdvancePaymentHistory({super.key});

  @override
  State<AdvancePaymentHistory> createState() => _AdvancePaymentHistoryState();
}

class _AdvancePaymentHistoryState extends State<AdvancePaymentHistory> {
  final advancePaymentScreenViewModel =
      locator<AdvancePaymentScreenViewModel>();
  final loginScreenViewModel = locator<LoginScreenViewModel>();
  final GenerateMonthAndYear _generateMonthAndYear = GenerateMonthAndYear();
  bool _customIcon = false;

  bool isFirstTime = true;

  @override
  void initState() {
    if (advancePaymentScreenViewModel
        .approvedAdvancePaymentsListByUser.isEmpty) {
      advancePaymentScreenViewModel
          .getApprovedAdvancePaymentsByUser(loginScreenViewModel.user!.id);
      isFirstTime = false;
    }

    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (isFirstTime) {
      setState(() {
        advancePaymentScreenViewModel.approvedAdvancePaymentsListByUser.clear();
        advancePaymentScreenViewModel
            .getApprovedAdvancePaymentsByUser(loginScreenViewModel.user!.id);
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final NumberFormat currencyFormat =
        NumberFormat.currency(locale: 'tr_TR', symbol: '₺');

    return Column(
      children: [
        SizedBox(height: 2.5.h),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 1.h, left: 4.5.w, bottom: 5.h),
              child: Text(
                "Advance Payment Transactions",
                style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 50.h,
          child: Observer(builder: (_) {
            if (advancePaymentScreenViewModel
                .approvedAdvancePaymentsListByUser.isEmpty) {
              return Center(
                child: Text('No advance payment has been used before.',
                    style: TextStyle(
                      fontSize: 11.sp,
                    )),
              );
            } else {
              return ListView.builder(
                itemCount: advancePaymentScreenViewModel
                    .approvedAdvancePaymentsListByUser.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: .1.h,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 1.5.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(left: 4.5.w, bottom: 1.5.h),
                            child: Text(
                                "Your total debt : ${currencyFormat.format(advancePaymentScreenViewModel.approvedAdvancePaymentsListByUser[index].advanceAmount)}"),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 4.5.w, bottom: .5.h),
                            child: const Text("Installments : 12 month"),
                          ),
                          ExpansionTile(
                            title: const Text("Payment dates :"),
                            trailing: Icon(
                              _customIcon
                                  ? Icons.arrow_drop_down_circle
                                  : Icons.arrow_drop_down,
                            ),
                            children: List.generate(
                              13,
                              (newIndex) => ListTile(
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        "${advancePaymentScreenViewModel.approvedAdvancePaymentsListByUser[index].startDay}.${_generateMonthAndYear.generateInstallmentMonth(advancePaymentScreenViewModel.approvedAdvancePaymentsListByUser[index].startMonth, newIndex)}.${_generateMonthAndYear.generateInstallmentYear(advancePaymentScreenViewModel.approvedAdvancePaymentsListByUser[index].startYear, advancePaymentScreenViewModel.approvedAdvancePaymentsListByUser[index].startMonth, newIndex)}"),
                                    const Text("->"),
                                    Text(currencyFormat.format(
                                        advancePaymentScreenViewModel
                                                .approvedAdvancePaymentsListByUser[
                                                    index]
                                                .advanceAmount /
                                            12)),
                                  ],
                                ),
                              ),
                            ),
                            onExpansionChanged: (bool expanded) {
                              setState(() {
                                _customIcon = expanded;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          }),
        )
      ],
    );
  }
}
