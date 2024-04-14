// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_manager_screen_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskManagerScreenViewModel on _TaskManagerScreenViewModelBase, Store {
  late final _$tasksListAtom =
      Atom(name: '_TaskManagerScreenViewModelBase.tasksList', context: context);

  @override
  ObservableList<Task> get tasksList {
    _$tasksListAtom.reportRead();
    return super.tasksList;
  }

  @override
  set tasksList(ObservableList<Task> value) {
    _$tasksListAtom.reportWrite(value, super.tasksList, () {
      super.tasksList = value;
    });
  }

  late final _$getTaskFromNotionAsyncAction = AsyncAction(
      '_TaskManagerScreenViewModelBase.getTaskFromNotion',
      context: context);

  @override
  Future<List<Task>> getTaskFromNotion() {
    return _$getTaskFromNotionAsyncAction.run(() => super.getTaskFromNotion());
  }

  @override
  String toString() {
    return '''
tasksList: ${tasksList}
    ''';
  }
}
