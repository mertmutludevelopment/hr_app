import 'package:flutter/material.dart';
import 'package:hr_app/leave_request_screen/model/apis/add_new_approved_leave_api.dart';
import 'package:hr_app/leave_request_screen/model/apis/add_new_declined_leave_api.dart';
import 'package:hr_app/leave_request_screen/model/apis/add_new_pending_leave_api.dart';
import 'package:hr_app/leave_request_screen/model/apis/delete_pending_leave_api.dart';
import 'package:hr_app/leave_request_screen/model/apis/get_all_approved_leave_api.dart';
import 'package:hr_app/leave_request_screen/model/apis/get_all_declined_leave_api.dart';
import 'package:hr_app/leave_request_screen/model/apis/get_all_pending_leaves_api.dart';
import 'package:hr_app/leave_request_screen/model/apis/get_approved_leave_by_user_api.dart';
import 'package:hr_app/leave_request_screen/model/apis/get_declined_leave_by_user_api.dart';
import 'package:hr_app/leave_request_screen/model/apis/get_pending_leaves_by_users_api.dart';
import 'package:hr_app/leave_request_screen/model/apis/update_users_leave_day_api.dart';
import 'package:hr_app/utils/models/approvedLeaves.dart';
import 'package:hr_app/utils/models/declinedLeaves.dart';
import 'package:hr_app/utils/models/pendingLeaves.dart';
import 'package:mobx/mobx.dart';
part 'leave_request_screen_view_model.g.dart';

class LeaveRequestScreenViewModel = _LeaveRequestScreenViewModelBase
    with _$LeaveRequestScreenViewModel;

abstract class _LeaveRequestScreenViewModelBase with Store {
  final AddNewPendingLeaveApi _addNewPendingLeave = AddNewPendingLeaveApi();
  final UpdateUsersLeaveDayApi _updateUsersLeaveDay = UpdateUsersLeaveDayApi();
  final GetPendingLeavesByUserApi _getPendingLeavesByUser =
      GetPendingLeavesByUserApi();
  final GetAllPendingLeavesApi _getAllPendingLeaves = GetAllPendingLeavesApi();
  final AddNewApprovedLeaveApi _addNewApprovedLeave = AddNewApprovedLeaveApi();
  final DeletePendingLeaveApi _deletePendingLeave = DeletePendingLeaveApi();
  final AddNewDeclinedLeaveApi _addNewDeclinedLeave = AddNewDeclinedLeaveApi();
  final GetAllApprovedLeaveApi _getAllApprovedLeave = GetAllApprovedLeaveApi();
  final GetAllDeclinedLeaveApi _getAllDeclinedLeave = GetAllDeclinedLeaveApi();
  final GetApprovedLeaveByUserApi _getApprovedLeaveByUser =
      GetApprovedLeaveByUserApi();
  final GetDeclinedLeaveByUserApi _getDeclinedLeaveByUser = GetDeclinedLeaveByUserApi();

  @observable
  TextEditingController reasonTextController = TextEditingController();

  @observable
  int? startLeaveDay;

  @observable
  int? startLeaveMonth;

  @observable
  int? startLeaveYear;

  @observable
  int? endLeaveDay;

  @observable
  int? endLeaveMonth;

  @observable
  int? endLeaveYear;

  @observable
  int? numberOfLeaveDay;

  @action
  TextEditingController getReasonController() {
    return reasonTextController;
  }

  @observable
  ObservableList<PendingLeaves> pendingLeavesListByUser = ObservableList();

  @observable
  ObservableList<PendingLeaves> pendingLeavesList = ObservableList();

  @observable
  ObservableList<ApprovedLeaves> allApprovedLeavesList = ObservableList();

  @observable
  ObservableList<DeclinedLeaves> allDeclinedLeavesList = ObservableList();

  @observable
  ObservableList<ApprovedLeaves> approvedLeavesListByUser = ObservableList();

  @observable
  ObservableList<DeclinedLeaves> declinedLeavesListByUser = ObservableList();

  @action
  Future createNewPendingLeave(
      String reason,
      int startLeaveDay,
      int startLeaveMonth,
      int startLeaveYear,
      int endLeaveDay,
      int endLeaveMonth,
      int endLeaveYear,
      int numberOfLeaveDay,
      int userId,
      String fullname) async {
    await _addNewPendingLeave
        .addNewPendingLeaveApi(
            reason,
            startLeaveDay,
            startLeaveMonth,
            startLeaveYear,
            endLeaveDay,
            endLeaveMonth,
            endLeaveYear,
            numberOfLeaveDay,
            userId,
            fullname)
        .catchError((err) {
      debugPrint(err.toString());
    });
  }

  @action
  Future changeLeaveDay(int id, int leaveDay) async {
    await _updateUsersLeaveDay
        .updateLeaveDayApi(id, leaveDay)
        .catchError((err) {
      debugPrint(err.toString());
    });
  }

  @action
  Future<List<PendingLeaves>> getPendingListLeavesByUser(int userId) async {
    var data = await _getPendingLeavesByUser.getPendingLeavesByUserApi(userId);
    for (var item in data) {
      var pendings = PendingLeaves.fromJson(item as Map<String, dynamic>);
      //print( "liste :  ${pendings.eventName}");
      pendingLeavesListByUser.add(pendings);
    }

    return pendingLeavesListByUser;
  }

  @action
  Future<List<PendingLeaves>> getAllPendingLeavesList() async {
    var data = await _getAllPendingLeaves.getAllPendingLeavesApi();
    for (var item in data) {
      var allPendings = PendingLeaves.fromJson(item as Map<String, dynamic>);

      pendingLeavesList.add(allPendings);
    }
    return pendingLeavesList;
  }

  @action
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
      String fullname) async {
    try {
      await _addNewApprovedLeave.addNewApprovedLeaveApi(
          reason,
          startLeaveDay,
          startLeaveMonth,
          startLeaveYear,
          endLeaveDay,
          endLeaveMonth,
          endLeaveYear,
          numberOfLeaveDay,
          userId,
          fullname);
      return true;
    } catch (e) {
      return false;
    }
  }

  @action
  Future<bool> removePendingLeave(int pendingLeaveId) async {
    try {
      await _deletePendingLeave.deletePendingLeaveApi(pendingLeaveId);
      return true;
    } catch (e) {
      return false;
    }
  }

  @action
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
      String fullname) async {
    try {
      await _addNewDeclinedLeave.addNewDeclinedLeaveApi(
          reason,
          startLeaveDay,
          startLeaveMonth,
          startLeaveYear,
          endLeaveDay,
          endLeaveMonth,
          endLeaveYear,
          numberOfLeaveDay,
          userId,
          fullname);
      return true;
    } catch (e) {
      return false;
    }
  }

  @action
  Future<List<ApprovedLeaves>> getAllApprovedLeavesList() async {
    var data = await _getAllApprovedLeave.getAllApprovedLeaveApi();
    for (var item in data) {
      var allApproveds = ApprovedLeaves.fromJson(item as Map<String, dynamic>);

      allApprovedLeavesList.add(allApproveds);
    }
    return allApprovedLeavesList;
  }

  @action
  Future<List<DeclinedLeaves>> getAllDeclinedLeavesList() async {
    var data = await _getAllDeclinedLeave.getAllDeclinedLeaveApi();
    for (var item in data) {
      var allDeclineds = DeclinedLeaves.fromJson(item as Map<String, dynamic>);

      allDeclinedLeavesList.add(allDeclineds);
    }
    return allDeclinedLeavesList;
  }

  @action
  Future<List<ApprovedLeaves>> getApprovedListLeavesByUser(int userId) async {
    var data = await _getApprovedLeaveByUser.getApprovedLeaveByUserApi(userId);
    for (var item in data) {
      var approveds = ApprovedLeaves.fromJson(item as Map<String, dynamic>);
      approvedLeavesListByUser.add(approveds);
    }

    return approvedLeavesListByUser;
  }

  @action
  Future<List<DeclinedLeaves>> getDeclinedListLeavesByUser(int userId) async {
    var data = await _getDeclinedLeaveByUser.getDeclinedLeaveByUserApi(userId);
    for (var item in data) {
      var declineds = DeclinedLeaves.fromJson(item as Map<String, dynamic>);
      declinedLeavesListByUser.add(declineds);
    }

    return declinedLeavesListByUser;
  }
}
