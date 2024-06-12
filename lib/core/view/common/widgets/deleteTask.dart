/*
//Item delete operation
import 'package:flutter/material.dart';
import 'package:untitled1/main.dart';
import 'package:untitled1/network_services/network_requester.dart';

Future deleteItem(id) async {
  final response = await networkRequester()
      .getRequester("https://task.teamrabbil.com/api/v1/deleteTask/$id");
  if (response['status'] == 'success') {
    ScaffoldMessenger.of(MyApp.navigatorKey.currentState!.context)
        .showSnackBar(SnackBar(content: Text("Delete Item Successfull")));
  }
}*/
