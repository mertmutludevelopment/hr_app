// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manager_advance_payment_screen_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ManagerAdvancePaymentScreenViewModel
    on _ManagerAdvancePaymentScreenViewModelBase, Store {
  late final _$allAdvancePaymentListAtom = Atom(
      name: '_ManagerAdvancePaymentScreenViewModelBase.allAdvancePaymentList',
      context: context);

  @override
  ObservableList<AdvancePayments> get allAdvancePaymentList {
    _$allAdvancePaymentListAtom.reportRead();
    return super.allAdvancePaymentList;
  }

  @override
  set allAdvancePaymentList(ObservableList<AdvancePayments> value) {
    _$allAdvancePaymentListAtom.reportWrite(value, super.allAdvancePaymentList,
        () {
      super.allAdvancePaymentList = value;
    });
  }

  late final _$getAllAdvancePaymentsListAsyncAction = AsyncAction(
      '_ManagerAdvancePaymentScreenViewModelBase.getAllAdvancePaymentsList',
      context: context);

  @override
  Future<List<AdvancePayments>> getAllAdvancePaymentsList() {
    return _$getAllAdvancePaymentsListAsyncAction
        .run(() => super.getAllAdvancePaymentsList());
  }

  late final _$createNewApprovedAdvancePaymentAsyncAction = AsyncAction(
      '_ManagerAdvancePaymentScreenViewModelBase.createNewApprovedAdvancePayment',
      context: context);

  @override
  Future<bool> createNewApprovedAdvancePayment(
      int advanceAmount,
      int startDay,
      int startMonth,
      int startYear,
      int endDay,
      int endMonth,
      int endYear,
      int userId,
      String fullName) {
    return _$createNewApprovedAdvancePaymentAsyncAction.run(() => super
        .createNewApprovedAdvancePayment(advanceAmount, startDay, startMonth,
            startYear, endDay, endMonth, endYear, userId, fullName));
  }

  late final _$removeAdvancePaymentAsyncAction = AsyncAction(
      '_ManagerAdvancePaymentScreenViewModelBase.removeAdvancePayment',
      context: context);

  @override
  Future<bool> removeAdvancePayment(int advancePaymentId) {
    return _$removeAdvancePaymentAsyncAction
        .run(() => super.removeAdvancePayment(advancePaymentId));
  }

  @override
  String toString() {
    return '''
allAdvancePaymentList: ${allAdvancePaymentList}
    ''';
  }
}
