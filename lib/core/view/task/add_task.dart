import 'package:flutter/material.dart';
import 'package:taskmanagment/core/view/task/widgets/custom_textfromfield.dart';
import 'package:taskmanagment/utils/extensions/context_ext.dart';

import '../../model/create_task.dart';
import '../../model/task_list.dart';
import '../../service/auth_service.dart';
import '../../service/task_service.dart';

class AddTaskScreen extends StatefulWidget {
  final TaskData? taskData;

  const AddTaskScreen({
    super.key,
    this.taskData,
  });

  @override
  createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  final TaskService _taskService = TaskService();
  final AuthService _authService = AuthService();

  void _showErrorSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void _submitTask() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isLoading = true;
      });

      try {
        String? token = await _authService.getToken();
        if (token != null) {
          CreateTaskModel newTask = CreateTaskModel(
            title: titleController.text,
            description: descriptionController.text,
            status: 'Pending',
          );

          var response = await _taskService.createTask(newTask, token);
          if (response.status == 'success') {
            Navigator.of(context).pop(true); // True for successfully added
          } else {
            _showErrorSnackbar('Failed to create task');
          }
        } else {
          _showErrorSnackbar('No token found');
        }
      } catch (e) {
        _showErrorSnackbar('Error: $e');
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      titleController.text = widget.taskData?.title ?? "";
      descriptionController.text = widget.taskData?.description ?? "";
    });
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text(
          "Add Task",
          style: theme.textTheme.titleLarge?.copyWith(
            color: theme.colorScheme.onPrimary,
          ),
        ),
        centerTitle: true,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: titleController,
                      decoration: const InputDecoration(labelText: 'Title'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a title';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: descriptionController,
                      decoration:
                          const InputDecoration(labelText: 'Description'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a description';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: ElevatedButton(
          onPressed: () {
            _submitTask;
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
