import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// The `title` argument is used to title of alert dialog.
/// The `textOK` argument is used to text for 'OK' Button of alert dialog.
/// The `textCancel` argument is used to text for 'Cancel' Button of alert dialog.
/// The `initialValue` argument is used to initial value of alert dialog.
/// The `hintText` argument will be hintText text field form of alert dialog.
/// The `minLines` argument will be minLines text field form of alert dialog.
/// The `maxLines` argument will be maxLines text field form of alert dialog.
/// The `autoFocus` argument will be autoFocus text field form of alert dialog.
///
/// Returns a [Future<bool>].
Future<String> prompt(
  BuildContext context, {
  Widget title,
  Widget textOK,
  Widget textCancel,
  String initialValue,
  String hintText,
  int minLines = 1,
  int maxLines = 1,
  bool autoFocus: false,
  TextInputType keyboardType,
  List<TextInputFormatter> inputFormatters,
}) {
  String value;
  return showDialog(
    context: context,
    builder: (_) => WillPopScope(
      child: AlertDialog(
        title: title,
        content: TextFormField(
          decoration: InputDecoration(hintText: hintText),
          minLines: minLines,
          maxLines: maxLines,
          autofocus: autoFocus,
          initialValue: initialValue,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          onChanged: (text) => value = text,
        ),
        actions: <Widget>[
          FlatButton(
              child: textCancel != null ? textCancel : Text('Cancel'),
              onPressed: () => Navigator.pop(context, null)),
          FlatButton(
              child: textOK != null ? textOK : Text('OK'),
              onPressed: () => Navigator.pop(context, value)),
        ],
      ),
      onWillPop: () {
        Navigator.pop(context, null);
        return;
      },
    ),
  );
}
