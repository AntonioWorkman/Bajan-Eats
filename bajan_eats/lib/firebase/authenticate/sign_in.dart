import 'package:bajan_eats/firebase/authenticate/register.dart';
import 'package:bajan_eats/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:bajan_eats/providers/user_provider.dart';
import 'package:bajan_eats/screens/main_screen.dart';
import 'package:bajan_eats/services/functions.dart';
import 'package:bajan_eats/widgets/loading.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {

  
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    
    final user = Provider.of<UserProvider>(context);
    
    return Scaffold(
      key: _key,
      body: user.status == Status.Authenticating? Loading() : Container(
        color: Theme.of(context).backgroundColor,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Image.asset(
                "images/credit.png",
                width: 200,
                height: 200,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: CustomText(
                      msg: "Welcome Back!",
                      size: 36,
                      weight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CustomText(
                    msg: "Please login to your account!",
                    size: 22,
                    weight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  controller: user.email,
                  decoration: InputDecoration(
                      hintText: 'Email Address',
                      hintStyle: TextStyle(fontSize: 20)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Stack(
                  children: <Widget>[
                    TextField(
                      controller: user.password,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(fontSize: 20)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  decoration: BoxDecoration(color: Theme.of(context).accentColor),
                  child: GestureDetector(
                    onTap: () async {
                      if (!await user.signIn()){
                        _key.currentState.showSnackBar(
                            SnackBar(content: Text("Sign in failed")));
                        return;
                      }
                      user.clearController();
                      changeScreenReplacement(context, MainScreen());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 15),
                          child: CustomText(
                            msg: "LOGIN",
                            color: Theme.of(context).primaryColor,
                            size: 24,
                            weight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                      onTap: () {
                        changeScreen(context, Register());
                      },
                      child: CustomText(
                        msg: "REGISTER NOW",
                        size: 20,
                        weight: FontWeight.bold,
                        color: Colors.grey,
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}