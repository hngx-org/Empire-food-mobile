import 'dart:async';

import 'dialog_request.dart';


class DialogHandler {
  late Function(DialogRequest) _showDialogListener;
  late Completer<bool> _dialogCompleter;
  late Function _dismissCurrentDialog;

  bool _isDialogVisible = false;

  Completer<bool> get dialogCompleter => _dialogCompleter;

  void dialogComplete(bool response) {
    _dialogCompleter.complete(response);
    _dialogCompleter = Completer<bool>();
  }

  void dismissDialog() {
    _dismissCurrentDialog();
  }

  void registerShowDialogListener(
      Function(DialogRequest request) showDialogListener) {
    _showDialogListener = showDialogListener;
  }

  void registerDismissDialogListener(Function dismissCurrentDialog) {
    _dismissCurrentDialog = dismissCurrentDialog;
  }

  void _closeVisibleDialog() {
    if (_isDialogVisible) {
      dismissDialog();
    }
  }

  Future<bool> showDialog({
    String title = '',
    String message = '',
    bool autoDismiss = false,
    bool dismissable = true,
    Duration duration = const Duration(seconds: 3),
  }) {
    _dialogCompleter = Completer<bool>();

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
