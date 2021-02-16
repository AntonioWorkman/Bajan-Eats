// import 'package:flutter/material.dart';
// import 'package:bajan_eats/models/user.dart';
// import 'package:bajan_eats/services/response/login_response.dart';

// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => new _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> implements LoginCallBack {
  
//   BuildContext _ctx;
//   bool _isLoading = false;
  
//   final formKey = new GlobalKey<FormState>();
//   final scaffoldKey = new GlobalKey<ScaffoldState>();
  
//   String _username, _password;
  
//   LoginResponse _response;
  
//   _LoginScreenState() {
//     _response = new LoginResponse(this);
//   }
  
//   void _submit() {
//     final form = formKey.currentState;
//     if (form.validate()) {
//       setState(() {
//         _isLoading = true;
//         form.save();
//         _response.doLogin(_username, _password);
//       });
//     }
//   }

//   void _showSnackBar(String text) {
//     scaffoldKey.currentState.showSnackBar(new SnackBar(
//       content: new Text(text),
//     ));
//   }

//   @override
//   Widget build(BuildContext context) {
//     _ctx = context;
//     var loginBtn = new RaisedButton(
//       onPressed: _submit,
//       child: new Text("Login"),
//       color: Colors.green,
//     );
//     var loginForm = new Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: <Widget>[
//         new Form(
//           key: formKey,
//           child: new Column(
//             children: <Widget>[
//               new Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: new TextFormField(
//                   onSaved: (val) => _username = val,
//                   decoration: new InputDecoration(labelText: "Username"),
//                 ),
//               ),
//               new Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: new TextFormField(
//                   onSaved: (val) => _password = val,
//                   decoration: new InputDecoration(labelText: "Password"),
//                 ),
//               )
//             ],
//           ),
//         ),
//         loginBtn
//       ],
//     );
//     return new Scaffold(
//       appBar: new AppBar(
//         title: new Text("Login"),
//       ),
//       key: scaffoldKey,
//       body: new Container(
//         child: new Center(
//           child: loginForm,
//         ),
//       ),
//     );
//   }

//   @override
//   void onLoginError(String error) {
//     // TODO: implement onLoginError
//     _showSnackBar(error);
//     setState(() {
//       _isLoading = false;
//     });
//   }

//   @override
//   void onLoginSuccess(UserModel user) async {
//     if (user != null) {
//       Navigator.of(context).pushNamed("/home");
//     } else {
//       // TODO: implement onLoginSuccess
//       _showSnackBar("Login Gagal, Silahkan Periksa Login Anda");
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }
// }


