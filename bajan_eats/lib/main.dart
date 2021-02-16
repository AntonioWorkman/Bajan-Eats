import 'package:bajan_eats/firebase/authenticate/sign_in.dart';
import 'package:bajan_eats/providers/user_provider.dart';
import 'package:bajan_eats/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bajan_eats/utils/const.dart';
import 'package:bajan_eats/screens/main_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider.value(value: UserProvider.initialize()),
    //ChangeNotifierProvider.value(value: ProductsProvider()),
  ] ,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: Constants.appName,
        theme: UserProvider.initialize().theme,
        home: ScreensController(),
      )));
}



class ScreensController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final user = Provider.of<UserProvider>(context);

    switch(user.status){
      case Status.Uninitialized:
        return Loading();
      case Status.Unauthenticated:
      case Status.Authenticating:
        return SignIn();
      case Status.Authenticated:
        return MainScreen();
      default: return SignIn();
    }
  }
}