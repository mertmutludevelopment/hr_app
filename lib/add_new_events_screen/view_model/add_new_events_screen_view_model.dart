import 'package:flutter/material.dart';
import 'package:hr_app/add_new_events_screen/model/apis/add_new_event_api.dart';
import 'package:mobx/mobx.dart';
part 'add_new_events_screen_view_model.g.dart';

class AddNewEventsScreenViewModel = _AddNewEventsScreenViewModelBase
    with _$AddNewEventsScreenViewModel;

abstract class _AddNewEventsScreenViewModelBase with Store {
  final AddNewEventApi _addNewEvent = AddNewEventApi();

  @observable
  TextEditingController eventNameTextController = TextEditingController();

  @observable
  TextEditingController eventDescriptionTextController =
      TextEditingController();

  @observable
  TextEditingController eventLocationTextController = TextEditingController();

  @observable
  TextEditingController eventDayTextController = TextEditingController();

  @observable
  TextEditingController eventTimeTextController = TextEditingController();

  @action
  TextEditingController getEventNameTextController() {
    return eventNameTextController;
  }

  @action
  TextEditingController getEventDescriptionTextController() {
    return eventDescriptionTextController;
  }

  @action
  TextEditingController getEventLocationTextController() {
    return eventLocationTextController;
  }

  @action
  TextEditingController getEventDayTextController() {
    return eventDayTextController;
  }

  @action
  TextEditingController getEventTimeTextController() {
    return eventTimeTextController;
  }

  @action
  Future createNewEvent(
    String eventName,
    String eventLocation,
    String eventDay,
    String eventTime,
    String eventDescription) async {
      await _addNewEvent.addNewEventApi(eventName, eventLocation, eventDay, eventTime, eventDescription)
      .catchError((err){
        debugPrint(err.toString());
      });
    }
}
