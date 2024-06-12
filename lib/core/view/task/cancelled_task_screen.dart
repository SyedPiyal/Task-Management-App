import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../common/widgets/task_widget.dart';

class CancelledTaskScreen extends StatefulWidget {
  const CancelledTaskScreen({super.key});

  @override
  State<CancelledTaskScreen> createState() => _CancelledTaskScreenState();
}

class _CancelledTaskScreenState extends State<CancelledTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        /*Expanded(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),*/
        Expanded(
          child: RefreshIndicator(
            onRefresh: () async {

            },
            child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {

                  return TaskWidget(
                    title:  "Unknown",
                    description:  "unknown",
                    type: 'Cancelled',
                    onEditTap: () {

                    },
                    onDeleteTap: () {

                    },
                    date:  "Unknown",
                  );
                }),
          ),
        ),
      ],
    );
  }
}
