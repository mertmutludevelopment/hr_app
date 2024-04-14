import 'package:hr_app/manager_advance_payment_screen/model/apis/add_new_approved_advance_payment_api.dart';
import 'package:hr_app/manager_advance_payment_screen/model/apis/delete_advance_payment_api.dart';
import 'package:hr_app/manager_advance_payment_screen/model/apis/get_all_advance_payment_request_api.dart';
import 'package:hr_app/utils/models/advancePayments.dart';
import 'package:mobx/mobx.dart';
part 'manager_advance_payment_screen_view_model.g.dart';

class ManagerAdvancePaymentScreenViewModel = _ManagerAdvancePaymentScreenViewModelBase
    with _$ManagerAdvancePaymentScreenViewModel;

abstract class _ManagerAdvancePaymentScreenViewModelBase with Store {
  final GetAllAdvancePaymentsRequestApi _getAllAdvancePaymentRequest =
      GetAllAdvancePaymentsRequestApi();

  final AddNewApprovedAdvancePaymentApi _addNewApprovedAdvancePayment =
      AddNewApprovedAdvancePaymentApi();

  final DeleteAdvancePaymentApi _deleteAdvancePayment =
      DeleteAdvancePaymentApi();

  @observable
  ObservableList<AdvancePayments> allAdvancePaymentList = ObservableList();

  @action
  Future<List<AdvancePayments>> getAllAdvancePaymentsList() async {
    var data =
        await _getAllAdvancePaymentRequest.getAllAdvancePaymentsRequestApi();
    for (var item in data) {
      var allAdvancePayment =
          AdvancePayments.fromJson(item as Map<String, dynamic>);

      allAdvancePaymentList.add(allAdvancePayment);
    }
    return allAdvancePaymentList;
  }

  @action
  Future<bool> createNewApprovedAdvancePayment(
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
      await _addNewApprovedAdvancePayment.addNewApprovedAdvancePaymentApi(
          advanceAmount,
          startDay,
          startMonth,
          startYear,
          endDay,
          endMonth,
          endYear,
          userId,
          fullName);
      return true;
    } catch (e) {
      return false;
    }
  }

  @action
  Future<bool> removeAdvancePayment(int advancePaymentId) async {
    try {
      await _deleteAdvancePayment.deleteAdvancePaymentApi(advancePaymentId);
      return true;
    } catch (e) {
      return false;
    }
  }
}
