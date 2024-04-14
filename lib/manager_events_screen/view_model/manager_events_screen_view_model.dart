import 'package:hr_app/manager_events_screen/model/apis/event_delete_api.dart';
import 'package:mobx/mobx.dart';
part 'manager_events_screen_view_model.g.dart';

class ManagerEventsScreenViewModel = _ManagerEventsScreenViewModelBase with _$ManagerEventsScreenViewModel;

abstract class _ManagerEventsScreenViewModelBase with Store {
  final EventDeleteApi _eventDelete = EventDeleteApi();


  @action
  Future<bool> removeEvent(int eventId) async{
    try{
      await _eventDelete.eventDeleteApi(eventId);
      return true;
    }catch(e){
      return false;
    }
  }
}