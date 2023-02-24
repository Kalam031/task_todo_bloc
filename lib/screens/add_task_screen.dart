import 'package:flutter/material.dart';
import '../services/guid_gen.dart';
import '../blocs/bloc_exports.dart';
import '../models/task.dart';

// ignore: must_be_immutable
class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();

    return Container(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text('Add Task', style: TextStyle(fontSize: 24)),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
                bottom: 10.0,
              ),
              child: TextField(
                autofocus: true,
                controller: titleController,
                decoration: const InputDecoration(
                    label: Text('title'), border: OutlineInputBorder()),
              ),
            ),
            TextField(
              autofocus: true,
              controller: descriptionController,
              minLines: 3,
              maxLines: 5,
              decoration: const InputDecoration(
                  label: Text('description'), border: OutlineInputBorder()),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    var task = Task(
                      title: titleController.text,
                      description: descriptionController.text,
                      id: GUIDGen.generate(),
                    );
                    context.read<TasksBloc>().add(AddTask(task: task));
                    Navigator.pop(context);
                  },
                  child: const Text('Add'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
