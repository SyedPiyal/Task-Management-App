import 'package:flutter/material.dart';

import '../common/widgets/background_image.dart';
import '../common/widgets/custom_app_bar.dart';
import '../common/widgets/reuseable_elevated_button.dart';
import '../common/widgets/text_feild_style.dart';
import '../common/widgets/text_style.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  bool inProgress = false;
  final subjectController = TextEditingController();
  final descriptionController = TextEditingController();
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context),
      body: BackgroundImage(
          child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: SingleChildScrollView(
          child: Form(
            key: _form,
            child: Column(
              children: [
                Text(
                  "Add New Task",
                  style: titleTextStyle,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration: textFeildStyle("Subject"),
                  controller: subjectController,
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return "Enter Subject ";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: descriptionController,
                  maxLines: 5,
                  decoration: textFeildStyle("Description"),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return "Enter Description";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                if (inProgress)
                  const Center(
                    child: CircularProgressIndicator(),
                  )
                else
                  ReuseableElevatedButton(
                    onTap: () async {},
                  )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
