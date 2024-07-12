import 'package:flutter/cupertino.dart';

/// to handle failure, success, help and warning `ContentType` class is being used
class SnackBarContentType {
  /// message is `required` parameter
  final String message;

  /// color is optional, if provided null then `DefaultColors` will be used
  final Color? color;

  const SnackBarContentType(this.message, [this.color]);

  static const SnackBarContentType help = SnackBarContentType('help', Color(0xff3282B8));
  static const SnackBarContentType failure =
  SnackBarContentType('failure', Color(0xffc72c41));
  static const SnackBarContentType success =
  SnackBarContentType('success', Color(0xff2D6A4F));
  static const SnackBarContentType warning =
  SnackBarContentType('warning', Color(0xffFCA652));
}