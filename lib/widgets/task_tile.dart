import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../blocs/bloc_exports.dart';
import '../models/task.dart';
import '../widgets/popup_menu.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;

  void _removeOrDeleteTask(BuildContext ctx, Task task) {
    task.isDeleted!
        ? ctx.read<TasksBloc>().add(DeleteTask(task: task))
        : ctx.read<TasksBloc>().add(Removetask(task: task));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Row(children: [
              task.isFavorite == false
                  ? const Icon(Icons.star_outline)
                  : const Icon(Icons.star),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task.title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 18,
                          decoration:
                              task.isDone! ? TextDecoration.lineThrough : null),
                    ),
                    Text(
                      DateFormat().add_yMMMd().add_Hms().format(
                            DateTime.parse(task.date),
                          ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
        Row(
          children: [
            Checkbox(
              value: task.isDone,
              onChanged: task.isDeleted == false
                  ? (value) {
                      context.read<TasksBloc>().add(UpdateTask(task: task));
                    }
                  : null,
            ),
            PopupMenu(
              cancelOrDeleteCallback: () => _removeOrDeleteTask(context, task),
              likeOrDislikeCallback: () => context
                  .read<TasksBloc>()
                  .add(MarkFavoriteOrUnfavoriteTask(task: task)),
              task: task,
            ),
          ],
        ),
      ],
    );
  }
}

// ListTile(
//       title: ,
//       trailing: Checkbox(
//           value: task.isDone,
//           onChanged: task.isDeleted == false
//               ? (value) {
//                   context.read<TasksBloc>().add(UpdateTask(task: task));
//                 }
//               : null),
//       onLongPress: () => _removeOrDeleteTask(context, task),
//     )