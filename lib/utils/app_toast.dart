import 'package:fluttertoast/fluttertoast.dart';

class AppToast {
  final String _msg;
  final Toast toastLength;
  final ToastGravity gravity;

  AppToast(
    String message, [
    this.toastLength = Toast.LENGTH_SHORT,
    this.gravity = ToastGravity.BOTTOM,
  ]) : _msg = message;

  Future<bool> show() async {
    bool? toast = await Fluttertoast.showToast(
      msg: _msg,
      toastLength: toastLength,
      gravity: gravity,
    );
    return toast ?? false;
  }

  Future<bool> cancel() async {
    bool? cancel = await Fluttertoast.cancel();
    return cancel ?? false;
  }
}
