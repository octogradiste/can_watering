import 'package:flutter/material.dart';

class UndoSnackBar extends SnackBar {
  UndoSnackBar({
    Key? key,
    required String message,
    required void Function() onUndo,
  }) : super(
          key: key,
          content: Text(message),
          action: SnackBarAction(label: 'Undo', onPressed: onUndo),
        );
}
