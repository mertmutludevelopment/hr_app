// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_new_events_screen_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddNewEventsScreenViewModel on _AddNewEventsScreenViewModelBase, Store {
  late final _$eventNameTextControllerAtom = Atom(
      name: '_AddNewEventsScreenViewModelBase.eventNameTextController',
      context: context);

  @override
  TextEditingController get eventNameTextController {
    _$eventNameTextControllerAtom.reportRead();
    return super.eventNameTextController;
  }

  @override
  set eventNameTextController(TextEditingController value) {
    _$eventNameTextControllerAtom
        .reportWrite(value, super.eventNameTextController, () {
      super.eventNameTextController = value;
    });
  }

  late final _$eventDescriptionTextControllerAtom = Atom(
      name: '_AddNewEventsScreenViewModelBase.eventDescriptionTextController',
      context: context);

  @override
  TextEditingController get eventDescriptionTextController {
    _$eventDescriptionTextControllerAtom.reportRead();
    return super.eventDescriptionTextController;
  }

  @override
  set eventDescriptionTextController(TextEditingController value) {
    _$eventDescriptionTextControllerAtom
        .reportWrite(value, super.eventDescriptionTextController, () {
      super.eventDescriptionTextController = value;
    });
  }

  late final _$eventLocationTextControllerAtom = Atom(
      name: '_AddNewEventsScreenViewModelBase.eventLocationTextController',
      context: context);

  @override
  TextEditingController get eventLocationTextController {
    _$eventLocationTextControllerAtom.reportRead();
    return super.eventLocationTextController;
  }

  @override
  set eventLocationTextController(TextEditingController value) {
    _$eventLocationTextControllerAtom
        .reportWrite(value, super.eventLocationTextController, () {
      super.eventLocationTextController = value;
    });
  }

  late final _$eventDayTextControllerAtom = Atom(
      name: '_AddNewEventsScreenViewModelBase.eventDayTextController',
      context: context);

  @override
  TextEditingController get eventDayTextController {
    _$eventDayTextControllerAtom.reportRead();
    return super.eventDayTextController;
  }

  @override
  set eventDayTextController(TextEditingController value) {
    _$eventDayTextControllerAtom
        .reportWrite(value, super.eventDayTextController, () {
      super.eventDayTextController = value;
    });
  }

  late final _$eventTimeTextControllerAtom = Atom(
      name: '_AddNewEventsScreenViewModelBase.eventTimeTextController',
      context: context);

  @override
  TextEditingController get eventTimeTextController {
    _$eventTimeTextControllerAtom.reportRead();
    return super.eventTimeTextController;
  }

  @override
  set eventTimeTextController(TextEditingController value) {
    _$eventTimeTextControllerAtom
        .reportWrite(value, super.eventTimeTextController, () {
      super.eventTimeTextController = value;
    });
  }

  late final _$createNewEventAsyncAction = AsyncAction(
      '_AddNewEventsScreenViewModelBase.createNewEvent',
      context: context);

  @override
  Future<dynamic> createNewEvent(String eventName, String eventLocation,
      String eventDay, String eventTime, String eventDescription) {
    return _$createNewEventAsyncAction.run(() => super.createNewEvent(
        eventName, eventLocation, eventDay, eventTime, eventDescription));
  }

  late final _$_AddNewEventsScreenViewModelBaseActionController =
      ActionController(
          name: '_AddNewEventsScreenViewModelBase', context: context);

  @override
  TextEditingController getEventNameTextController() {
    final _$actionInfo =
        _$_AddNewEventsScreenViewModelBaseActionController.startAction(
            name:
                '_AddNewEventsScreenViewModelBase.getEventNameTextController');
    try {
      return super.getEventNameTextController();
    } finally {
      _$_AddNewEventsScreenViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  TextEditingController getEventDescriptionTextController() {
    final _$actionInfo =
        _$_AddNewEventsScreenViewModelBaseActionController.startAction(
            name:
                '_AddNewEventsScreenViewModelBase.getEventDescriptionTextController');
    try {
      return super.getEventDescriptionTextController();
    } finally {
      _$_AddNewEventsScreenViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  TextEditingController getEventLocationTextController() {
    final _$actionInfo =
        _$_AddNewEventsScreenViewModelBaseActionController.startAction(
            name:
                '_AddNewEventsScreenViewModelBase.getEventLocationTextController');
    try {
      return super.getEventLocationTextController();
    } finally {
      _$_AddNewEventsScreenViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  TextEditingController getEventDayTextController() {
    final _$actionInfo =
        _$_AddNewEventsScreenViewModelBaseActionController.startAction(
            name: '_AddNewEventsScreenViewModelBase.getEventDayTextController');
    try {
      return super.getEventDayTextController();
    } finally {
      _$_AddNewEventsScreenViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  TextEditingController getEventTimeTextController() {
    final _$actionInfo =
        _$_AddNewEventsScreenViewModelBaseActionController.startAction(
            name:
                '_AddNewEventsScreenViewModelBase.getEventTimeTextController');
    try {
      return super.getEventTimeTextController();
    } finally {
      _$_AddNewEventsScreenViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
eventNameTextController: ${eventNameTextController},
eventDescriptionTextController: ${eventDescriptionTextController},
eventLocationTextController: ${eventLocationTextController},
eventDayTextController: ${eventDayTextController},
eventTimeTextController: ${eventTimeTextController}
    ''';
  }
}
