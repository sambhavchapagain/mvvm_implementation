import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:providers_app/respositories/auth_repository.dart';
import 'package:providers_app/utils/routes/routes_name.dart';
import 'package:providers_app/utils/utils.dart';

class
    AuthViewModel with ChangeNotifier{
  final _myRepo = AuthRepository();
  bool _loading = false;
  bool get loading => _loading;

  setLoaing(bool value){
    _loading = value;
    notifyListeners();
  }
  Future<void> loginApi(dynamic data, BuildContext context) async{
    setLoaing(true);


    _myRepo.loginApi(data).then((value){
      setLoaing(false);
      Utils.flushBarErrorMessage('login sucessfully ', context);
      Navigator.pushNamed(context, RoutesName.home);

      if(kDebugMode){
        print(value.toString());

      }
    }).onError((error, stackTrace){
      setLoaing(false);

      if(kDebugMode){
         Utils.flushBarErrorMessage(error.toString(), context);
        print(error.toString());

      }
    });
  }
}
