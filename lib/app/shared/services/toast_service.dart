import 'package:fluttertoast/fluttertoast.dart';

class ToastService {
  static void show(String message) async {
    await Fluttertoast.showToast(msg: message, toastLength: Toast.LENGTH_SHORT);
  }
}
