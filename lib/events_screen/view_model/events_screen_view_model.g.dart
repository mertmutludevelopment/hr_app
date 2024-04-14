// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events_screen_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EventsScreenViewModel on _EventsScreenViewModelBase, Store {
  late final _$eventListAtom =
      Atom(name: '_EventsScreenViewModelBase.eventList', context: context);

  @override
  ObservableList<Events> get eventList {
    _$eventListAtom.reportRead();
    return super.eventList;
  }

  @override
  set eventList(ObservableList<Events> value) {
    _$eventListAtom.reportWrite(value, super.eventList, () {
      super.eventList = value;
    });
  }

  late final _$getAllEventsAsyncAction =
      AsyncAction('_EventsScreenViewModelBase.getAllEvents', context: context);

  @override
  Future<List<Events>> getAllEvents() {
    return _$getAllEventsAsyncAction.run(() => super.getAllEvents());
  }

  @override
  String toString() {
    return '''
eventList: ${eventList}
    ''';
  }
}
