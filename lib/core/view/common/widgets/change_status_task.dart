import 'package:flutter/material.dart';
import 'package:taskmanagment/core/view/common/widgets/text_style.dart';
import 'reuseable_elevated_button.dart';

showModalSheetChangeStatus(context,String taskId) {
  String taskStatus = "Progress";
  bool taskStatusInprogress=false;


  showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, changeState) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  "Change Status Of Task",
                  style: titleTextStyle,
                ),
                const SizedBox(
                  height: 16,
                ),
                RadioListTile(
                    title: const Text("In Progress"),
                    value: "Progress",
                    groupValue: taskStatus,
                    onChanged: (value) {
                      taskStatus = value!;
                      changeState(() {});
                    }),
                RadioListTile(
                    title: const Text("Completed"),
                    value: "Completed",
                    groupValue: taskStatus,
                    onChanged: (value) {
                      taskStatus = value!;
                      changeState(() {});
                    }),
                RadioListTile(
                    title: const Text("Cancelled"),
                    value: "Cancelled",
                    groupValue: taskStatus,
                    onChanged: (value) {
                      taskStatus = value!;
                      changeState(() {});
                    }),
                const SizedBox(
                  height: 10,
                ),
                if(taskStatusInprogress==true)
                  const Center(child: CircularProgressIndicator(),)
                else
                  ReuseableElevatedButton(

                    onTap: () async {
                      /*taskStatusInprogress=true;
                      changeState((){});
                      final response = await networkRequester()
                          .getRequester(Urls.updateTask(taskId, taskStatus));
                      taskStatusInprogress=true;
                      changeState((){});

                      if (response['status'] == 'success') {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Status Change Successfull")));
                        Navigator.pop(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Status Change faild ! Try again")));
                      }*/
                    },
                    text: "Submit",
                  )
              ],
            ),
          );
        });
      });
}
