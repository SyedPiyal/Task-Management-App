import 'package:flutter/material.dart';
Card buildSummeryCard(int count,String title) {
  return Card(
    elevation: 4,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [

        Text(count.toString(),style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
        const SizedBox(height: 5,),
        FittedBox(child: Text("$title Task")),
      ],
    ),
  );
}
