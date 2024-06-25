import 'package:flutter/material.dart';
import 'package:taskmanagment/core/view/task/widgets/custom_textfromfield.dart';
import 'package:taskmanagment/utils/extensions/context_ext.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({
    super.key,
  });

  @override
  createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        title: Text(
          "Add Task",
          style: theme.textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Title",
                style: theme.textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormFieldBuilder(
                controller: titleController,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                child: Text(
                  "Description",
                  style: theme.textTheme.bodyLarge,
                ),
              ),
              TextFormFieldBuilder(
                controller: descriptionController,
                maxLines: 15,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: ElevatedButton(
          onPressed: () {
            const snackBar = SnackBar(
              content: Text('SuccessFull'),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            "Save",
            style: theme.textTheme.bodyLarge,
          ),
        ),
      ),
    );
  }
}
