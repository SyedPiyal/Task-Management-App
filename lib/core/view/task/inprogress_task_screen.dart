import 'package:flutter/material.dart';

import '../common/widgets/task_widget.dart';

class InprogressTaskScreen extends StatefulWidget {
  const InprogressTaskScreen({super.key});

  @override
  State<InprogressTaskScreen> createState() => _InprogressTaskScreenState();
}

class _InprogressTaskScreenState extends State<InprogressTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
        Expanded(
          child: RefreshIndicator(
            onRefresh: () async {},
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {

                return TaskWidget(
                  title:  "unknown",
                  description:  "unknown",
                  type: 'In progress',
                  onEditTap: () {

                  },
                  onDeleteTap: () {

                  },
                  date:  "unknown",
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
