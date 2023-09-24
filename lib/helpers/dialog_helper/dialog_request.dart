class DialogRequest {
  final String title;
  final String message;
  final bool autoDismiss;
  final bool dismissable;
  final Duration duration;

  DialogRequest({
    required this.title,
    required this.message,
    this.dismissable = true,
    this.autoDismiss = false,
    this.duration = const Duration(seconds: 3),
  });
}