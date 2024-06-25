import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taskmanagment/utils/extensions/context_ext.dart';

class TextFormFieldBuilder extends StatelessWidget {

  final String title;
  final int? maxLines;
  final bool readOnly;
  final String? hintText;
  final String? errorText;
  final String? labelText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final List<TextInputFormatter> formatter;
  final AutovalidateMode? autoValidateMode;
  final FormFieldValidator<String>? validator;

  const TextFormFieldBuilder({
    super.key,
    this.maxLines,
    this.errorText,
    this.labelText,
    this.hintText,
    this.validator,
    this.onChanged,
    this.title = '',
    this.controller,
    this.keyboardType,
    this.textInputAction,
    this.autoValidateMode,
    this.readOnly = false,
    this.formatter = const [],
  });

  @override
  Widget build(BuildContext context) {
    final theme=context.theme;
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: theme.colorScheme.onPrimary,
        hintText: hintText,
        labelText: labelText,
        errorText: errorText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: theme.colorScheme.tertiary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: theme.colorScheme.tertiary),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide:  BorderSide(color: theme.colorScheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide:  BorderSide(color: theme.colorScheme.tertiary),
        ),
      ),
      readOnly: readOnly,
      maxLines: maxLines,
      validator: validator,
      onChanged: onChanged,
      keyboardType: keyboardType,
      inputFormatters: formatter,

      textInputAction: textInputAction,
      autovalidateMode: autoValidateMode ?? AutovalidateMode.onUserInteraction,
    );
  }
}