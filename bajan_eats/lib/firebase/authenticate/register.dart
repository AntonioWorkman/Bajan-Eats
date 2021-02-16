import 'package:bajan_eats/firebase/authenticate/sign_in.dart';
import 'package:bajan_eats/screens/main_screen.dart';
import 'package:bajan_eats/services/functions.dart';
import 'package:flutter/material.dart';
import 'package:bajan_eats/providers/user_provider.dart';
import 'package:bajan_eats/widgets/custom_text.dart';
import 'package:bajan_eats/widgets/loading.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return Scaffold(
      key: scaffoldKey,
      body: user.status == Status.Authenticating
          ? Loading()
          : Container(
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
                      width: 100,
                      height: 100,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(0),
                          child: CustomText(
                            msg: "Hey There!",
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
                          msg: "Create your new account!",
                          size: 22,
                          weight: FontWeight.w600,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: TextField(
                        controller: user.name,
                        decoration: InputDecoration(
                            hintText: 'Username',
                            hintStyle: TextStyle(fontSize: 20)),
                      ),
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
                      child: TextField(
                        controller: user.phoneNo,
                        decoration: InputDecoration(
                            hintText: 'Phone Number',
                            hintStyle: TextStyle(fontSize: 20)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: TextField(
                        controller: user.address,
                        decoration: InputDecoration(
                            hintText: 'Delivery Address',
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
                            if (!await user.signUp()) {
                              scaffoldKey.currentState.showSnackBar(
                                  SnackBar(content: Text("Sign up failed")));
                              return;
                            }
                            user.clearController();
                            changeScreenReplacement(context, MainScreen());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 15, bottom: 15),
                                child: CustomText(
                                  msg: "REGISTER",
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
                              changeScreen(context, SignIn());
                            },
                            child: CustomText(
                              msg: "Already have an account? Sign in here!",
                              size: 18,
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
