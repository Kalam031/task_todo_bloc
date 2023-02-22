part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  final List<Task> allTask;
  const TasksState({
    this.allTask = const <Task>[],
  });

  @override
  List<Object> get props => [allTask];

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'allTask': allTask.map((x) => x.toMap()).toList()});

    return result;
  }

  factory TasksState.fromMap(Map<String, dynamic> map) {
    return TasksState(
      allTask: List<Task>.from(map['allTask']?.map((x) => Task.fromMap(x))),
    );
  }
}
