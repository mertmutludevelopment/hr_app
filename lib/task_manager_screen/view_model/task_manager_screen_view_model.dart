import 'package:hr_app/task_manager_screen/model/apis/get_tasks_api.dart';
import 'package:hr_app/utils/models/notionTaskModels.dart';
import 'package:mobx/mobx.dart';
part 'task_manager_screen_view_model.g.dart';

class TaskManagerScreenViewModel = _TaskManagerScreenViewModelBase
    with _$TaskManagerScreenViewModel;

abstract class _TaskManagerScreenViewModelBase with Store {
  final GetTasksApi _getTasks = GetTasksApi();

  @observable
  ObservableList<Task> tasksList = ObservableList();

  @observable
  bool dataFetchError = false;

  @action
  Future<List<Task>> getTaskFromNotion() async {
    try {
      var data = await _getTasks.getTasksApi();
      tasksList.addAll(
          (data['results'] as List).map((e) => Task.fromMap(e)).toList());
      return tasksList;
    } catch (e) {
      dataFetchError = true;
      return [];
    }
  }
}
