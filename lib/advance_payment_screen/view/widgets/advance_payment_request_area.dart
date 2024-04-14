import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr_app/advance_payment_screen/view_model/advance_payment_screen_view_model.dart';
import 'package:hr_app/login_screen/view_model/login_screen_view_model.dart';
import 'package:hr_app/utils/locator/locator.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class AdvancePaymentRequestArea extends StatefulWidget {
  const AdvancePaymentRequestArea({super.key});

  @override
  State<AdvancePaymentRequestArea> createState() =>
      _AdvancePaymentRequestAreaState();
}

class _AdvancePaymentRequestAreaState extends State<AdvancePaymentRequestArea> {
  final advancePaymentScreenViewModel =
      locator<AdvancePaymentScreenViewModel>();
  final loginScreenViewModel = locator<LoginScreenViewModel>();

  final advanceAmount = 120000;

  void _showAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text('ERROR'),
          content: Text(
            "Advance payment can only be used once a year. You have already used it this year.",
            style: TextStyle(fontSize: 12.sp),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showConfirmationDialog() async {
    DateTime currentDate = DateTime.now();
    int currentDay = DateTime.now().day.toInt();
    int currentMonth = DateTime.now().month.toInt();
    int currentYear = DateTime.now().year.toInt();

    int nextYear = currentYear + 1;

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Warning',
            textAlign: TextAlign.center,
          ),
          // ignore: avoid_unnecessary_containers
          content: Container(
            height: 25.h,
            child: Column(
              children: [
                // İstediğiniz sayıda Text ekleyebilirsiniz
                Padding(
                  padding: EdgeInsets.all(1.5.h),
                  child: Text(
                    '- You cannot use any other advance payments for 1 year.',
                    style: TextStyle(fontSize: 12.sp),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(1.5.h),
                  child: Text(
                    '- You need to pay within 1 year in 12 monthly installments',
                    style: TextStyle(fontSize: 12.sp),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(1.5.h),
                  child: Text(
                    'Do you Confirm ?',
                    style:
                        TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('Close'),
            ),
            TextButton(
              onPressed: () async {
                await advancePaymentScreenViewModel.createNewAdvancePayment(
                    advanceAmount,
                    currentDay,
                    currentMonth,
                    currentYear,
                    currentDay,
                    currentMonth,
                    nextYear,
                    loginScreenViewModel.user!.id,
                    loginScreenViewModel.user!.fullname);

                // ignore: use_build_context_synchronously
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Your advance request has been forwarded to your manager ',
                    ),
                    duration: Duration(seconds: 5),
                  ),
                );

                Get.back();
              },
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final NumberFormat currencyFormat =
        NumberFormat.currency(locale: 'tr_TR', symbol: '₺');

    return Column(
      children: [
        SizedBox(height: 2.5.h),
        Padding(
          padding:
              EdgeInsets.only(top: 2.h, bottom: 2.h, right: 1.h, left: 1.h),
          child: ElevatedButton(
              onPressed: () async {
                bool isUsedPending = await advancePaymentScreenViewModel
                    .getAdvancePaymentsByUserBool(
                        loginScreenViewModel.user!.id);

                bool isUsedApproved = await advancePaymentScreenViewModel
                    .getApprovedAdvancePaymentsByUserBool(
                        loginScreenViewModel.user!.id);
                if (!isUsedPending && !isUsedApproved) {
                  _showConfirmationDialog();
                } else {
                  _showAlert();
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 24.h),
                backgroundColor: const Color.fromARGB(1000, 241, 0, 77),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 20,
                shadowColor: const Color.fromARGB(1000, 241, 0, 77),
              ),
              child: Column(
                children: [
                  Text(
                    loginScreenViewModel.user!.fullname,
                    style: TextStyle(fontSize: 14.sp),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                      "Advance amount to be used :  ${currencyFormat.format(advanceAmount)}"),
                ],
              )),
        )
      ],
    );
  }
}
