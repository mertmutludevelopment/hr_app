// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave_request_screen_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LeaveRequestScreenViewModel on _LeaveRequestScreenViewModelBase, Store {
  late final _$reasonTextControllerAtom = Atom(
      name: '_LeaveRequestScreenViewModelBase.reasonTextController',
      context: context);

  @override
  TextEditingController get reasonTextController {
    _$reasonTextControllerAtom.reportRead();
    return super.reasonTextController;
  }

  @override
  set reasonTextController(TextEditingController value) {
    _$reasonTextControllerAtom.reportWrite(value, super.reasonTextController,
        () {
      super.reasonTextController = value;
    });
  }

  late final _$startLeaveDayAtom = Atom(
      name: '_LeaveRequestScreenViewModelBase.startLeaveDay', context: context);

  @override
  int? get startLeaveDay {
    _$startLeaveDayAtom.reportRead();
    return super.startLeaveDay;
  }

  @override
  set startLeaveDay(int? value) {
    _$startLeaveDayAtom.reportWrite(value, super.startLeaveDay, () {
      super.startLeaveDay = value;
    });
  }

  late final _$startLeaveMonthAtom = Atom(
      name: '_LeaveRequestScreenViewModelBase.startLeaveMonth',
      context: context);

  @override
  int? get startLeaveMonth {
    _$startLeaveMonthAtom.reportRead();
    return super.startLeaveMonth;
  }

  @override
  set startLeaveMonth(int? value) {
    _$startLeaveMonthAtom.reportWrite(value, super.startLeaveMonth, () {
      super.startLeaveMonth = value;
    });
  }

  late final _$startLeaveYearAtom = Atom(
      name: '_LeaveRequestScreenViewModelBase.startLeaveYear',
      context: context);

  @override
  int? get startLeaveYear {
    _$startLeaveYearAtom.reportRead();
    return super.startLeaveYear;
  }

  @override
  set startLeaveYear(int? value) {
    _$startLeaveYearAtom.reportWrite(value, super.startLeaveYear, () {
      super.startLeaveYear = value;
    });
  }

  late final _$endLeaveDayAtom = Atom(
      name: '_LeaveRequestScreenViewModelBase.endLeaveDay', context: context);

  @override
  int? get endLeaveDay {
    _$endLeaveDayAtom.reportRead();
    return super.endLeaveDay;
  }

  @override
  set endLeaveDay(int? value) {
    _$endLeaveDayAtom.reportWrite(value, super.endLeaveDay, () {
      super.endLeaveDay = value;
    });
  }

  late final _$endLeaveMonthAtom = Atom(
      name: '_LeaveRequestScreenViewModelBase.endLeaveMonth', context: context);

  @override
  int? get endLeaveMonth {
    _$endLeaveMonthAtom.reportRead();
    return super.endLeaveMonth;
  }

  @override
  set endLeaveMonth(int? value) {
    _$endLeaveMonthAtom.reportWrite(value, super.endLeaveMonth, () {
      super.endLeaveMonth = value;
    });
  }

  late final _$endLeaveYearAtom = Atom(
      name: '_LeaveRequestScreenViewModelBase.endLeaveYear', context: context);

  @override
  int? get endLeaveYear {
    _$endLeaveYearAtom.reportRead();
    return super.endLeaveYear;
  }

  @override
  set endLeaveYear(int? value) {
    _$endLeaveYearAtom.reportWrite(value, super.endLeaveYear, () {
      super.endLeaveYear = value;
    });
  }

  late final _$numberOfLeaveDayAtom = Atom(
      name: '_LeaveRequestScreenViewModelBase.numberOfLeaveDay',
      context: context);

  @override
  int? get numberOfLeaveDay {
    _$numberOfLeaveDayAtom.reportRead();
    return super.numberOfLeaveDay;
  }

  @override
  set numberOfLeaveDay(int? value) {
    _$numberOfLeaveDayAtom.reportWrite(value, super.numberOfLeaveDay, () {
      super.numberOfLeaveDay = value;
    });
  }

  late final _$pendingLeavesListByUserAtom = Atom(
      name: '_LeaveRequestScreenViewModelBase.pendingLeavesListByUser',
      context: context);

  @override
  ObservableList<PendingLeaves> get pendingLeavesListByUser {
    _$pendingLeavesListByUserAtom.reportRead();
    return super.pendingLeavesListByUser;
  }

  @override
  set pendingLeavesListByUser(ObservableList<PendingLeaves> value) {
    _$pendingLeavesListByUserAtom
        .reportWrite(value, super.pendingLeavesListByUser, () {
      super.pendingLeavesListByUser = value;
    });
  }

  late final _$pendingLeavesListAtom = Atom(
      name: '_LeaveRequestScreenViewModelBase.pendingLeavesList',
      context: context);

  @override
  ObservableList<PendingLeaves> get pendingLeavesList {
    _$pendingLeavesListAtom.reportRead();
    return super.pendingLeavesList;
  }

  @override
  set pendingLeavesList(ObservableList<PendingLeaves> value) {
    _$pendingLeavesListAtom.reportWrite(value, super.pendingLeavesList, () {
      super.pendingLeavesList = value;
    });
  }

  late final _$allApprovedLeavesListAtom = Atom(
      name: '_LeaveRequestScreenViewModelBase.allApprovedLeavesList',
      context: context);

  @override
  ObservableList<ApprovedLeaves> get allApprovedLeavesList {
    _$allApprovedLeavesListAtom.reportRead();
    return super.allApprovedLeavesList;
  }

  @override
  set allApprovedLeavesList(ObservableList<ApprovedLeaves> value) {
    _$allApprovedLeavesListAtom.reportWrite(value, super.allApprovedLeavesList,
        () {
      super.allApprovedLeavesList = value;
    });
  }

  late final _$allDeclinedLeavesListAtom = Atom(
      name: '_LeaveRequestScreenViewModelBase.allDeclinedLeavesList',
      context: context);

  @override
  ObservableList<DeclinedLeaves> get allDeclinedLeavesList {
    _$allDeclinedLeavesListAtom.reportRead();
    return super.allDeclinedLeavesList;
  }

  @override
  set allDeclinedLeavesList(ObservableList<DeclinedLeaves> value) {
    _$allDeclinedLeavesListAtom.reportWrite(value, super.allDeclinedLeavesList,
        () {
      super.allDeclinedLeavesList = value;
    });
  }

  late final _$approvedLeavesListByUserAtom = Atom(
      name: '_LeaveRequestScreenViewModelBase.approvedLeavesListByUser',
      context: context);

  @override
  ObservableList<ApprovedLeaves> get approvedLeavesListByUser {
    _$approvedLeavesListByUserAtom.reportRead();
    return super.approvedLeavesListByUser;
  }

  @override
  set approvedLeavesListByUser(ObservableList<ApprovedLeaves> value) {
    _$approvedLeavesListByUserAtom
        .reportWrite(value, super.approvedLeavesListByUser, () {
      super.approvedLeavesListByUser = value;
    });
  }

  late final _$declinedLeavesListByUserAtom = Atom(
      name: '_LeaveRequestScreenViewModelBase.declinedLeavesListByUser',
      context: context);

  @override
  ObservableList<DeclinedLeaves> get declinedLeavesListByUser {
    _$declinedLeavesListByUserAtom.reportRead();
    return super.declinedLeavesListByUser;
  }

  @override
  set declinedLeavesListByUser(ObservableList<DeclinedLeaves> value) {
    _$declinedLeavesListByUserAtom
        .reportWrite(value, super.declinedLeavesListByUser, () {
      super.declinedLeavesListByUser = value;
    });
  }

  late final _$createNewPendingLeaveAsyncAction = AsyncAction(
      '_LeaveRequestScreenViewModelBase.createNewPendingLeave',
      context: context);

  @override
  Future<dynamic> createNewPendingLeave(
      String reason,
      int startLeaveDay,
      int startLeaveMonth,
      int startLeaveYear,
      int endLeaveDay,
      int endLeaveMonth,
      int endLeaveYear,
      int numberOfLeaveDay,
      int userId,
      String fullname) {
    return _$createNewPendingLeaveAsyncAction.run(() => super
        .createNewPendingLeave(
            reason,
            startLeaveDay,
            startLeaveMonth,
            startLeaveYear,
            endLeaveDay,
            endLeaveMonth,
            endLeaveYear,
            numberOfLeaveDay,
            userId,
            fullname));
  }

  late final _$changeLeaveDayAsyncAction = AsyncAction(
      '_LeaveRequestScreenViewModelBase.changeLeaveDay',
      context: context);

  @override
  Future<dynamic> changeLeaveDay(int id, int leaveDay) {
    return _$changeLeaveDayAsyncAction
        .run(() => super.changeLeaveDay(id, leaveDay));
  }

  late final _$getPendingListLeavesByUserAsyncAction = AsyncAction(
      '_LeaveRequestScreenViewModelBase.getPendingListLeavesByUser',
      context: context);

  @override
  Future<List<PendingLeaves>> getPendingListLeavesByUser(int userId) {
    return _$getPendingListLeavesByUserAsyncAction
        .run(() => super.getPendingListLeavesByUser(userId));
  }

  late final _$getAllPendingLeavesListAsyncAction = AsyncAction(
      '_LeaveRequestScreenViewModelBase.getAllPendingLeavesList',
      context: context);

  @override
  Future<List<PendingLeaves>> getAllPendingLeavesList() {
    return _$getAllPendingLeavesListAsyncAction
        .run(() => super.getAllPendingLeavesList());
  }

  late final _$createNewApprovedLeaveAsyncAction = AsyncAction(
      '_LeaveRequestScreenViewModelBase.createNewApprovedLeave',
      context: context);

  @override
  Future<bool> createNewApprovedLeave(
      String reason,
      int startLeaveDay,
      int startLeaveMonth,
      int startLeaveYear,
      int endLeaveDay,
      int endLeaveMonth,
      int endLeaveYear,
      int numberOfLeaveDay,
      int userId,
      String fullname) {
    return _$createNewApprovedLeaveAsyncAction.run(() => super
        .createNewApprovedLeave(
            reason,
            startLeaveDay,
            startLeaveMonth,
            startLeaveYear,
            endLeaveDay,
            endLeaveMonth,
            endLeaveYear,
            numberOfLeaveDay,
            userId,
            fullname));
  }

  late final _$removePendingLeaveAsyncAction = AsyncAction(
      '_LeaveRequestScreenViewModelBase.removePendingLeave',
      context: context);

  @override
  Future<bool> removePendingLeave(int pendingLeaveId) {
    return _$removePendingLeaveAsyncAction
        .run(() => super.removePendingLeave(pendingLeaveId));
  }

  late final _$createNewDeclinedLeaveAsyncAction = AsyncAction(
      '_LeaveRequestScreenViewModelBase.createNewDeclinedLeave',
      context: context);

  @override
  Future<bool> createNewDeclinedLeave(
      String reason,
      int startLeaveDay,
      int startLeaveMonth,
      int startLeaveYear,
      int endLeaveDay,
      int endLeaveMonth,
      int endLeaveYear,
      int numberOfLeaveDay,
      int userId,
      String fullname) {
    return _$createNewDeclinedLeaveAsyncAction.run(() => super
        .createNewDeclinedLeave(
            reason,
            startLeaveDay,
            startLeaveMonth,
            startLeaveYear,
            endLeaveDay,
            endLeaveMonth,
            endLeaveYear,
            numberOfLeaveDay,
            userId,
            fullname));
  }

  late final _$getAllApprovedLeavesListAsyncAction = AsyncAction(
      '_LeaveRequestScreenViewModelBase.getAllApprovedLeavesList',
      context: context);

  @override
  Future<List<ApprovedLeaves>> getAllApprovedLeavesList() {
    return _$getAllApprovedLeavesListAsyncAction
        .run(() => super.getAllApprovedLeavesList());
  }

  late final _$getAllDeclinedLeavesListAsyncAction = AsyncAction(
      '_LeaveRequestScreenViewModelBase.getAllDeclinedLeavesList',
      context: context);

  @override
  Future<List<DeclinedLeaves>> getAllDeclinedLeavesList() {
    return _$getAllDeclinedLeavesListAsyncAction
        .run(() => super.getAllDeclinedLeavesList());
  }

  late final _$getApprovedListLeavesByUserAsyncAction = AsyncAction(
      '_LeaveRequestScreenViewModelBase.getApprovedListLeavesByUser',
      context: context);

  @override
  Future<List<ApprovedLeaves>> getApprovedListLeavesByUser(int userId) {
    return _$getApprovedListLeavesByUserAsyncAction
        .run(() => super.getApprovedListLeavesByUser(userId));
  }

  late final _$getDeclinedListLeavesByUserAsyncAction = AsyncAction(
      '_LeaveRequestScreenViewModelBase.getDeclinedListLeavesByUser',
      context: context);

  @override
  Future<List<DeclinedLeaves>> getDeclinedListLeavesByUser(int userId) {
    return _$getDeclinedListLeavesByUserAsyncAction
        .run(() => super.getDeclinedListLeavesByUser(userId));
  }

  late final _$_LeaveRequestScreenViewModelBaseActionController =
      ActionController(
          name: '_LeaveRequestScreenViewModelBase', context: context);

  @override
  TextEditingController getReasonController() {
    final _$actionInfo =
        _$_LeaveRequestScreenViewModelBaseActionController.startAction(
            name: '_LeaveRequestScreenViewModelBase.getReasonController');
    try {
      return super.getReasonController();
    } finally {
      _$_LeaveRequestScreenViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
reasonTextController: ${reasonTextController},
startLeaveDay: ${startLeaveDay},
startLeaveMonth: ${startLeaveMonth},
startLeaveYear: ${startLeaveYear},
endLeaveDay: ${endLeaveDay},
endLeaveMonth: ${endLeaveMonth},
endLeaveYear: ${endLeaveYear},
numberOfLeaveDay: ${numberOfLeaveDay},
pendingLeavesListByUser: ${pendingLeavesListByUser},
pendingLeavesList: ${pendingLeavesList},
allApprovedLeavesList: ${allApprovedLeavesList},
allDeclinedLeavesList: ${allDeclinedLeavesList},
approvedLeavesListByUser: ${approvedLeavesListByUser},
declinedLeavesListByUser: ${declinedLeavesListByUser}
    ''';
  }
}
