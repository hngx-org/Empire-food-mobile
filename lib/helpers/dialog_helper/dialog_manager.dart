import 'package:flutter/material.dart';
import 'package:free_lunch_app/helpers/dialog_helper/dialog_request.dart';
import 'package:free_lunch_app/helpers/dialog_helper/dialog_handler.dart';
import 'package:free_lunch_app/helpers/dialog_helper/floating_dialog_card.dart';
import 'package:free_lunch_app/helpers/locator.dart';

class DialogManager extends StatefulWidget {
  const DialogManager({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  _DialogManagerState createState() => _DialogManagerState();
}

class _DialogManagerState extends State<DialogManager> {
  OverlayEntry? _overlayEntry;
  late DialogHandler _dialogHandler;

  @override
  void initState() {
    super.initState();
    _dialogHandler = locator<DialogHandler>();
    _dialogHandler.registerShowDialogListener(_showDialog);
    _dialogHandler.registerDismissDialogListener(_dismissDialog);
  }

  ///Pops a dialog onto the screen
  void _showDialog(DialogRequest request) {
    _overlayEntry = _createOverlayEntry(request);

    Overlay.of(context).insert(_overlayEntry!);

    //dismiss dialog after [request.duration] if [request.autoDismiss] is true
    if (request.autoDismiss) {
      Future.delayed(request.duration).then(
        (value) => _dismissDialog(),
      );
    }
  }

  ///Dismisses a dialog and completes the associated Completer
  void _dismissDialog([bool status = false]) {
    if (_overlayEntry != null) {
      _dialogHandler.dialogComplete(status);
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }

  ///Creates and OverlayEntry which contains the dialog card
  OverlayEntry _createOverlayEntry(DialogRequest request) {
    return OverlayEntry(
        opaque: false,
        builder: (context) => Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.black.withOpacity(0.5),
              child: Positioned(
                width: MediaQuery.of(context).size.width,
                top: MediaQuery.of(context).size.height / 1.5,
                child: FloatingDialogCard(
                  request: request,
                  dismissDialog: _dismissDialog,
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
