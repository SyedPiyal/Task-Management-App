import 'package:flutter/material.dart';
class TaskWidget extends StatelessWidget {
  const TaskWidget({
    super.key,
    required this.title,
    required this.description,
    required this.type,
    required this.onEditTap,
    required this.onDeleteTap,
    required this.date,
  });

  final String title, description, type, date;
  final VoidCallback onEditTap;
  final VoidCallback onDeleteTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: ListTile(
        tileColor: Colors.green.withOpacity(0.2),
        title: Text(title),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 5,
            ),
            Text(description),
            SizedBox(
              height: 5,
            ),
            Text(date),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(
                  label: Text(type),
                  backgroundColor: Colors.green,
                ),
                ButtonBar(
                  children: [
                    IconButton(onPressed: onEditTap, icon: Icon(Icons.edit)),
                    IconButton(onPressed: onDeleteTap, icon: Icon(Icons.delete)),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
