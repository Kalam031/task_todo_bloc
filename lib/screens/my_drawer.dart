import 'package:flutter/material.dart';

import '../screens/recycle_bin.dart';
import '../screens/tasks_screen.dart';

import '../blocs/bloc_exports.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              vertical: 14,
              horizontal: 20,
            ),
            color: Colors.grey,
            child: Text(
              'Task Drawer',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          BlocBuilder<TasksBloc, TasksState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () => Navigator.of(context).pushNamed(TasksScreen.id),
                child: ListTile(
                  leading: const Icon(Icons.folder_special),
                  title: const Text('My Tasks'),
                  trailing: Text('${state.allTask.length}'),
                ),
              );
            },
          ),
          const Divider(),
          GestureDetector(
            onTap: () => Navigator.of(context).pushNamed(RecycleBin.id),
            child: const ListTile(
              leading: Icon(Icons.delete),
              title: Text('Bin'),
              trailing: Text('0'),
            ),
          ),
        ],
      ),
    );
  }
}
