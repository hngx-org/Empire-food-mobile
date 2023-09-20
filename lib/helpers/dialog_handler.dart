import 'dart:async';
import 'package:free_lunch_app/core/models/dialog_request.dart';

class DialogHandler {
  late Function(DialogRequest) _showDialogListener;
  late Completer<bool> _dialogCompleter;
  late Function _dismissCurrentDialog;

  bool _isDialogVisible = false;

  Completer<bool> get dialogCompleter => _dialogCompleter;

  ///Regsiters a callback to complete the Completer
  void dialogComplete(bool response) {
    _dialogCompleter.complete(response);
    _dialogCompleter = Completer<bool>();
  }

  ///Dismisses a dialog
  void dismissDialog() {
    _dismissCurrentDialog();
  }

  /// Registers a callback to show a dialog
  void registerShowDialogListener(
      Function(DialogRequest request) showDialogListener) {
    _showDialogListener = showDialogListener;
  }

  ///Registers a callback to dismiss a dialog
  void registerDismissDialogListener(Function dismissCurrentDialog) {
    _dismissCurrentDialog = dismissCurrentDialog;
  }

  ///Dismisses any visible dialog
  void _closeVisibleDialog() {
    if (_isDialogVisible) {
      dismissDialog();
    }
  }

  ///Displays a dialog on the screen
  Future<bool> showDialog({
    String title = '',
    String message = '',
    bool autoDismiss = false,
    bool dismissable = true,
    Duration duration = const Duration(seconds: 3),
  }) {
    _dialogCompleter = Completer<bool>();

    //close any visible dialog before showing a new one
    _closeVisibleDialog();

    _showDialogListener(
      DialogRequest(
        title: title,
        message: message,
        duration: duration,
        autoDismiss: autoDismiss,
        dismissable: dismissable,
      ),
    );

    _isDialogVisible = true;
    return _dialogCompleter.future;
  }
}