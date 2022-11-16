import 'package:data_app/views/components/my_alert_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final myAlertDialogRepository = Provider((ref) {
  return MyAlertDialogRepository();
});

class MyAlertDialogRepository {
  void showAlert(BuildContext context, String msg) {
    showCupertinoDialog(
        context: context, builder: (context) => MyAlertDialog(msg: msg));
  }
}
