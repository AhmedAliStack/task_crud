import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:task_crud/viewmodels/home_viewmodel.dart';

class Utils{

  static void openScreen(BuildContext context, Widget screen,
      {bool replacment = false}) {
    if (replacment) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => screen));
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
    }
  }

  static void showMsg(String msg, {bool error = false}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: error ? Colors.red : Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static List<ChangeNotifierProvider> getProviders() => [
    ChangeNotifierProvider<HomeViewModel>(
      create: (_) => HomeViewModel(),
    ),
  ];
}