import 'package:new_login/enums/view_states.dart';
import 'package:new_login/services/storage_service.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:new_login/service_locator.dart';

class NewProductModel extends Model {
  StorageService storageService = locator<StorageService>();

  ViewState _state;
  ViewState get state => _state;


  void _setState(ViewState newState) {
    _state = newState;
    notifyListeners();
  }
}
