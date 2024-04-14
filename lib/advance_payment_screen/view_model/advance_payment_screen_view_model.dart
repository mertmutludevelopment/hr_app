import 'package:flutter/cupertino.dart';
import 'package:hr_app/advance_payment_screen/model/apis/add_new_advance_payment_api.dart';
import 'package:hr_app/advance_payment_screen/model/apis/get_advance_payment_by_user_api.dart';
import 'package:hr_app/advance_payment_screen/model/apis/get_advance_payment_by_user_bool_api.dart';
import 'package:hr_app/advance_payment_screen/model/apis/get_approved_advance_payment_by_user_api.dart';
import 'package:hr_app/advance_payment_screen/model/apis/get_approved_advance_payment_by_user_bool_api.dart';
import 'package:hr_app/utils/models/advancePayments.dart';
import 'package:hr_app/utils/models/approvedAdvancePayments.dart';
import 'package:mobx/mobx.dart';
part 'advance_payment_screen_view_model.g.dart';

class AdvancePaymentScreenViewModel = _AdvancePaymentScreenViewModelBase
    with _$AdvancePaymentScreenViewModel;

abstract class _AdvancePaymentScreenViewModelBase with Store {
  final AddNewAdvancePaymentApi _addNewAdvancePayment =
      AddNewAdvancePaymentApi();
  final GetAdvancePaymentByUserBoolApi _getAdvancePaymentByUserBool =
      GetAdvancePaymentByUserBoolApi();

  final GetAdvancePaymentByUserApi _getAdvancePaymentByUser =
      GetAdvancePaymentByUserApi();

  final GetApprovedAdvancePaymentByUserBoolApi
      _getApprovedAdvancePaymentByUserBool =
      GetApprovedAdvancePaymentByUserBoolApi();

  final GetApprovedAdvancePaymentByUserApi _getApprovedAdvancePaymentByUser =
      GetApprovedAdvancePaymentByUserApi();

  @observable
  ObservableList<AdvancePayments> advancePaymentsListByUser = ObservableList();

  @observable
  ObservableList<ApprovedAdvancePayments> approvedAdvancePaymentsListByUser =
      ObservableList();

  @action
  Future<bool> createNewAdvancePayment(
      int advanceAmount,
      int startDay,
      int startMonth,
      int startYear,
      int endDay,
      int endMonth,
      int endYear,
      int userId,
      String fullName) async {
    try {
      await _addNewAdvancePayment
          .addNewAdvancePaymentApi(advanceAmount, startDay, startMonth,
              startYear, endDay, endMonth, endYear, userId, fullName)
          .catchError((err) {
        debugPrint(err.toString());
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  @action
  Future getAdvancePaymentsByUserBool(int userId) async {
    bool data = await _getAdvancePaymentByUserBool
        .getAdvancePaymentByUserBoolApi(userId);
    if (data) {
      return true;
    } else {
      return false;
    }
  }

  @action
  Future getApprovedAdvancePaymentsByUserBool(int userId) async {
    bool data = await _getApprovedAdvancePaymentByUserBool
        .getApprovedAdvancePaymentByUserBoolApi(userId);
    if (data) {
      return true;
    } else {
      return false;
    }
  }

  @action
  Future<List<AdvancePayments>> getAdvancePaymentsByUser(int userId) async {
    var data =
        await _getAdvancePaymentByUser.getAdvancePaymentByUserApi(userId);
    for (var item in data) {
      var advancePayment =
          AdvancePayments.fromJson(item as Map<String, dynamic>);
      advancePaymentsListByUser.add(advancePayment);
    }

    return advancePaymentsListByUser;
  }

  @action
  Future<List<ApprovedAdvancePayments>> getApprovedAdvancePaymentsByUser(
      int userId) async {
    var data = await _getApprovedAdvancePaymentByUser
        .getApprovedAdvancePaymentByUserApi(userId);
    for (var item in data) {
      var approvedAdvancePayment =
          ApprovedAdvancePayments.fromJson(item as Map<String, dynamic>);
      approvedAdvancePaymentsListByUser.add(approvedAdvancePayment);
    }

    return approvedAdvancePaymentsListByUser;
  }
}
