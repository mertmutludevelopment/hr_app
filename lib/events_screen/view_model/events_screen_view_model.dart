import 'package:hr_app/events_screen/model/apis/event_api.dart';
import 'package:hr_app/utils/models/events.dart';
import 'package:mobx/mobx.dart';
part 'events_screen_view_model.g.dart';

class EventsScreenViewModel = _EventsScreenViewModelBase with _$EventsScreenViewModel;

abstract class _EventsScreenViewModelBase with Store {
  
  final GetAllEventsApi _eventsApi = GetAllEventsApi();

  @observable
  ObservableList<Events> eventList = ObservableList<Events>();

  @action 
  Future<List<Events>> getAllEvents() async{
    var data = await _eventsApi.getAllEventsApi();
    for(var item in data){

      var event=Events.fromJson(item as Map<String , dynamic>);
      eventList.add(event);
    }
    
    return eventList;

  }



}