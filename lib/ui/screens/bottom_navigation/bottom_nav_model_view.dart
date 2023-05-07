
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:moniepoint_test/utils/base_model.dart';

class AppStateProvider extends BaseModel {
  static AppStateProvider of(BuildContext context) =>
      Provider.of<AppStateProvider>(context, listen: false);
  int _currentTabIndex = 0; // Defaults to chat tab

  int get currentTabIndex => _currentTabIndex;

  void setCurrentTabTo({required int newTabIndex}) {
    _currentTabIndex = newTabIndex;
    notifyListeners();
  }

}
