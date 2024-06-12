import 'package:flutter/material.dart';

import '../common/widgets/task_widget.dart';

class CompletedTaskScreen extends StatefulWidget {
  const CompletedTaskScreen({super.key});

  @override
  State<CompletedTaskScreen> createState() => _CompletedTaskScreenState();
}

class _CompletedTaskScreenState extends State<CompletedTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /*const Expanded(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),*/
        Expanded(
          child: RefreshIndicator(
            onRefresh: () async {},
            child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return TaskWidget(
                    title: "Unknown",
                    description: "Unknown",
                    type: 'Completed',
                    onEditTap: () {},
                    onDeleteTap: () {},
                    date: "Unknown",
                  );
                }),
          ),
        ),
      ],
    );
  }
}
