import 'package:flutter/material.dart';
import '../models/task.dart';
import '../blocs/bloc_exports.dart';
import '../widgets/tasks_list.dart';

// ignore: must_be_immutable
class PendingTaskScreen extends StatefulWidget {
  const PendingTaskScreen({Key? key}) : super(key: key);
  static const id = 'tasks_screen';

  @override
  State<PendingTaskScreen> createState() => _PendingTaskScreenState();
}

class _PendingTaskScreenState extends State<PendingTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasksList = state.allTask;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Chip(
                label: Text(
                  '${state.allTask.length} Tasks',
                ),
              ),
            ),
            TasksList(taskList: tasksList),
          ],
        );
      },
    );
  }
}
