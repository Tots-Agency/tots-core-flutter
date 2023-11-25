import 'package:flutter/material.dart';

class ChangeNotifierWithLoading extends ChangeNotifier {

  bool isLoading = true;

  showLoading() {
    isLoading = true;
    notifyListeners();
  }

  hideLoading() {
    isLoading = false;
    notifyListeners();
  }

}