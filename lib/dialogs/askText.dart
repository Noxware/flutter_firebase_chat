import 'dart:async';

import 'package:flutter/material.dart';

/// Utility copied from an older project.
Future<String> askText({
  @required BuildContext context,
  String title = '',
  String labelText = '',
  String cancelText = 'Cancelar',
  String okText = 'Ok',
}) {
  var completer = Completer<String>();
  var _textFieldController = TextEditingController();

  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: TextField(
            controller: _textFieldController,
            decoration: InputDecoration(labelText: labelText),
            textCapitalization: TextCapitalization.words, // ADDED
            autofocus: true,
          ),
          actions: [
            FlatButton(
              child: Text(cancelText),
              onPressed: () {
                Navigator.of(context).pop();
                completer.complete(null);
              },
            ),
            FlatButton(
              child: Text(okText),
              onPressed: () {
                Navigator.of(context).pop();
                completer.complete(_textFieldController.text);
              },
            ),
          ],
        );
      });

  return completer.future;
}
