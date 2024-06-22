import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '../common/widgets/change_status_task.dart';
import '../common/widgets/summery_card.dart';
import '../common/widgets/task_widget.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          color: Colors.green,
          child: Row(
            children: [
              const SizedBox(
                height: 10,
              ),
              //re use able summery card
              Expanded(
                child: buildSummeryCard(23, "New"),
              ),
              Expanded(
                child: buildSummeryCard(23, "Completed"),
              ),
              Expanded(
                child: buildSummeryCard(23, "Progress"),
              ),
              Expanded(
                child: buildSummeryCard(23, "Cancelled"),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        /*
          Expanded(
              child: const Center(
            child: CircularProgressIndicator(),
          ))*/

        Expanded(
          child: RefreshIndicator(
            onRefresh: () async {},
            child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return TaskWidget(
                    title: "Unknown",
                    description: "Unknown",
                    type: "New",
                    date: "Unknown",
                    onEditTap: () {
                      showModalSheetChangeStatus(context,/*task.sId ??*/ "");
                    },
                    onDeleteTap: () {},
                  );
                }),
          ),
        ),
      ],
    );
  }
}
