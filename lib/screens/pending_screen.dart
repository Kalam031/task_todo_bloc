import 'package:flutter/material.dart';
import '../models/task.dart';
import '../blocs/bloc_exports.dart';
import '../widgets/tasks_list.dart';

// ignore: must_be_immutable
class PendingTaskScreen extends StatelessWidget {
  const PendingTaskScreen({Key? key}) : super(key: key);
  static const id = 'tasks_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasksList = state.pendingTasks;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Chip(
                label: Text(
                  '${tasksList.length} Pending | ${state.completedTasks.length} Completed',
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
