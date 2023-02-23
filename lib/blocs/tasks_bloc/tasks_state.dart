part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  final List<Task> allTask;
  final List<Task> removedTasks;

  const TasksState({
    this.allTask = const <Task>[],
    this.removedTasks = const <Task>[],
  });

  @override
  List<Object> get props => [allTask, removedTasks];

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({
      'allTask': allTask.map((x) => x.toMap()).toList(),
      'removedTasks': removedTasks.map((x) => x.toMap()).toList(),
    });

    return result;
  }

  factory TasksState.fromMap(Map<String, dynamic> map) {
    return TasksState(
      allTask: List<Task>.from(map['allTask']?.map((x) => Task.fromMap(x))),
      removedTasks:
          List<Task>.from(map['removedTasks']?.map((x) => Task.fromMap(x))),
    );
  }
}
