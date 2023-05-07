import 'package:flutter/widgets.dart';
import 'package:moniepoint_test/utils/locator.dart';
import 'package:moniepoint_test/utils/progressBarManager/dialog_models.dart';
import 'package:moniepoint_test/utils/progressBarManager/dialog_service.dart';

class BaseModel extends ChangeNotifier {
  //This makes the mode of the application available across all view models
final ProgressService _dialogService = locator<ProgressService>();
  late ProgressResponse hh;

  bool _busy = false;
  bool get busy => _busy;




  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
    if(value == true){
      _dialogService.showDialog(description: '', title: '');
    }else
    {
      _dialogService.dialogComplete();
    }


  }

}
