// // import 'package:bajan_eats/models/AccountModel.dart';
// // import 'package:flutter/material.dart';
// // import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// // import 'package:bajan_eats/screens/main_screen.dart';


// // class RegisterScreen extends StatefulWidget {
// //   @override
// //   _RegisterScreenState createState() => _RegisterScreenState();
// // }

// // class _RegisterScreenState extends State<RegisterScreen> {
// //   final TextEditingController _nameControl = new TextEditingController();
// //   final TextEditingController _usernameControl = new TextEditingController();
// //   final TextEditingController _phoneNoControl = new TextEditingController();
// //   final TextEditingController _addressControl = new TextEditingController();
// //   final TextEditingController _dobControl = new TextEditingController();
// //   final TextEditingController _passwordControl = new TextEditingController();

// //   final AccountHelper _acctHelper = AccountHelper();

// //   List<AccountModel> accounts = [];

// //   AccountModel currAcct;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Padding(
// //       padding: EdgeInsets.fromLTRB(20.0, 0, 20, 0),
// //       child: ListView(
// //         shrinkWrap: true,
// //         children: <Widget>[

// //           SizedBox(height: 5.0),

// //           Container(
// //             alignment: Alignment.center,
// //             margin: EdgeInsets.only(
// //               top: 15.0,
// //             ),
// //             child: Text(
// //               "Create Account",
// //               style: TextStyle(
// //                 fontSize: 18.0,
// //                 fontWeight: FontWeight.w700,
// //                 color: Theme.of(context).accentColor,
// //               ),
// //             ),
// //           ),

// //           SizedBox(height: 15.0),
          
// //           Card(
// //             elevation: 3.0,
// //             child: Container(
// //               decoration: BoxDecoration(
// //                 color: Colors.white,
// //                 borderRadius: BorderRadius.all(
// //                   Radius.circular(5.0),
// //                 ),
// //               ),
// //               child: TextField(
// //                 style: TextStyle(
// //                   fontSize: 15.0,
// //                   color: Colors.black,
// //                 ),
// //                 decoration: InputDecoration(
// //                   contentPadding: EdgeInsets.all(10.0),
// //                   border: OutlineInputBorder(
// //                     borderRadius: BorderRadius.circular(5.0),
// //                     borderSide: BorderSide(
// //                       color: Colors.white,
// //                     ),
// //                   ),
// //                   enabledBorder: OutlineInputBorder(
// //                     borderSide: BorderSide(
// //                       color: Colors.white,
// //                     ),
// //                     borderRadius: BorderRadius.circular(5.0),
// //                   ),
// //                   hintText: "Full Name",
// //                   prefixIcon: Icon(
// //                     Icons.perm_identity,
// //                     color: Colors.black,
// //                   ),
// //                   hintStyle: TextStyle(
// //                     fontSize: 15.0,
// //                     color: Colors.black,
// //                   ),
// //                 ),
// //                 maxLines: 1,
// //                 controller: _nameControl,
// //               ),
// //             ),
// //           ),

// //           SizedBox(height: 10.0),

// //           Card(
// //             elevation: 3.0,
// //             child: Container(
// //               decoration: BoxDecoration(
// //                 color: Colors.white,
// //                 borderRadius: BorderRadius.all(
// //                   Radius.circular(5.0),
// //                 ),
// //               ),
// //               child: TextField(
// //                 style: TextStyle(
// //                   fontSize: 15.0,
// //                   color: Colors.black,
// //                 ),
// //                 decoration: InputDecoration(
// //                   contentPadding: EdgeInsets.all(10.0),
// //                   border: OutlineInputBorder(
// //                     borderRadius: BorderRadius.circular(5.0),
// //                     borderSide: BorderSide(
// //                       color: Colors.white,
// //                     ),
// //                   ),
// //                   enabledBorder: OutlineInputBorder(
// //                     borderSide: BorderSide(
// //                       color: Colors.white,
// //                     ),
// //                     borderRadius: BorderRadius.circular(5.0),
// //                   ),
// //                   hintText: "Username",
// //                   prefixIcon: Icon(
// //                     Icons.account_circle,
// //                     color: Colors.black,
// //                   ),
// //                   hintStyle: TextStyle(
// //                     fontSize: 15.0,
// //                     color: Colors.black,
// //                   ),
// //                 ),
// //                 maxLines: 1,
// //                 controller: _usernameControl,
// //               ),
// //             ),
// //           ),
         

// //           SizedBox(height: 10.0),
          
// //           Card(
// //             elevation: 3.0,
// //             child: Container(
// //               decoration: BoxDecoration(
// //                 color: Colors.white,
// //                 borderRadius: BorderRadius.all(
// //                   Radius.circular(5.0),
// //                 ),
// //               ),
// //               child: TextField(
// //                 style: TextStyle(
// //                   fontSize: 15.0,
// //                   color: Colors.black,
// //                 ),
// //                 decoration: InputDecoration(
// //                   contentPadding: EdgeInsets.all(10.0),
// //                   border: OutlineInputBorder(
// //                     borderRadius: BorderRadius.circular(5.0),
// //                     borderSide: BorderSide(
// //                       color: Colors.white,
// //                     ),
// //                   ),
// //                   enabledBorder: OutlineInputBorder(
// //                     borderSide: BorderSide(
// //                       color: Colors.white,
// //                     ),
// //                     borderRadius: BorderRadius.circular(5.0),
// //                   ),
// //                   hintText: "Phone Number",
// //                   prefixIcon: Icon(
// //                     Icons.add_call,
// //                     color: Colors.black,
// //                   ),
// //                   hintStyle: TextStyle(
// //                     fontSize: 15.0,
// //                     color: Colors.black,
// //                   ),
// //                 ),
// //                 maxLines: 1,
// //                 controller: _phoneNoControl,
// //               ),
// //             ),
// //           ),

// //           SizedBox(height: 10.0),
          
// //           Card(
// //             elevation: 3.0,
// //             child: Container(
// //               decoration: BoxDecoration(
// //                 color: Colors.white,
// //                 borderRadius: BorderRadius.all(
// //                   Radius.circular(5.0),
// //                 ),
// //               ),
// //               child: TextField(
// //                 style: TextStyle(
// //                   fontSize: 15.0,
// //                   color: Colors.black,
// //                 ),
// //                 decoration: InputDecoration(
// //                   contentPadding: EdgeInsets.all(10.0),
// //                   border: OutlineInputBorder(
// //                     borderRadius: BorderRadius.circular(5.0),
// //                     borderSide: BorderSide(
// //                       color: Colors.white,
// //                     ),
// //                   ),
// //                   enabledBorder: OutlineInputBorder(
// //                     borderSide: BorderSide(
// //                       color: Colors.white,
// //                     ),
// //                     borderRadius: BorderRadius.circular(5.0),
// //                   ),
// //                   hintText: "Address",
// //                   prefixIcon: Icon(
// //                     Icons.add_location,
// //                     color: Colors.black,
// //                   ),
// //                   hintStyle: TextStyle(
// //                     fontSize: 15.0,
// //                     color: Colors.black,
// //                   ),
// //                 ),
// //                 maxLines: 1,
// //                 controller: _addressControl,
// //               ),
// //             ),
// //           ),

// //           SizedBox(height: 10.0),
          
// //           Card(
// //             elevation: 3.0,
// //             child: Container(
// //               decoration: BoxDecoration(
// //                 color: Colors.white,
// //                 borderRadius: BorderRadius.all(
// //                   Radius.circular(5.0),
// //                 ),
// //               ),
// //               child: TextField(
// //                 style: TextStyle(
// //                   fontSize: 15.0,
// //                   color: Colors.black,
// //                 ),
// //                 decoration: InputDecoration(
// //                   contentPadding: EdgeInsets.all(10.0),
// //                   border: OutlineInputBorder(
// //                     borderRadius: BorderRadius.circular(5.0),
// //                     borderSide: BorderSide(
// //                       color: Colors.white,
// //                     ),
// //                   ),
// //                   enabledBorder: OutlineInputBorder(
// //                     borderSide: BorderSide(
// //                       color: Colors.white,
// //                     ),
// //                     borderRadius: BorderRadius.circular(5.0),
// //                   ),
// //                   hintText: "Date of Birth (mm-dd-yy)",
// //                   prefixIcon: Icon(
// //                     Icons.date_range,
// //                     color: Colors.black,
// //                   ),
// //                   hintStyle: TextStyle(
// //                     fontSize: 15.0,
// //                     color: Colors.black,
// //                   ),
// //                 ),
// //                 maxLines: 1,
// //                 controller: _dobControl,
// //               ),
// //             ),
// //           ),


// //           SizedBox(height: 10.0),

// //           Card(
// //             elevation: 3.0,
// //             child: Container(
// //               decoration: BoxDecoration(
// //                 color: Colors.white,
// //                 borderRadius: BorderRadius.all(
// //                   Radius.circular(5.0),
// //                 ),
// //               ),
// //               child: TextField(
// //                 style: TextStyle(
// //                   fontSize: 15.0,
// //                   color: Colors.black,
// //                 ),
// //                 decoration: InputDecoration(
// //                   contentPadding: EdgeInsets.all(10.0),
// //                   border: OutlineInputBorder(
// //                     borderRadius: BorderRadius.circular(5.0),
// //                     borderSide: BorderSide(
// //                       color: Colors.white,
// //                     ),
// //                   ),
// //                   enabledBorder: OutlineInputBorder(
// //                     borderSide: BorderSide(
// //                       color: Colors.white,
// //                     ),
// //                     borderRadius: BorderRadius.circular(5.0),
// //                   ),
// //                   hintText: "Password",
// //                   prefixIcon: Icon(
// //                     Icons.lock_outline,
// //                     color: Colors.black,
// //                   ),
// //                   hintStyle: TextStyle(
// //                     fontSize: 15.0,
// //                     color: Colors.black,
// //                   ),
// //                 ),
// //                 obscureText: true,
// //                 maxLines: 1,
// //                 controller: _passwordControl,
// //               ),
// //             ),
// //           ),
          


// //             // Center(
// //             //   child: Container(
// //             //   decoration: BoxDecoration(
// //             //     color: Colors.white,
// //             //     borderRadius: BorderRadius.all(
// //             //       Radius.circular(5.0),
// //             //     ),
// //             //   ),
// //             //   child: GenderSelector(
// //             //     onChanged: (gender) {
// //             //       print(gender);
// //             //     },
// //             //   ),
// //             // ),
// //             // ),



// //           SizedBox(height: 30.0),

// //           Container(
// //             height: 50.0,
// //             child: RaisedButton(
// //               child: Text(
// //                 "Register".toUpperCase(),
// //                 style: TextStyle(
// //                   color: Colors.white,
// //                 ),
// //               ),
// //               onPressed: () {
// //                 currAcct = AccountModel(
// //                   name: _nameControl.text, 
// //                   username: _usernameControl.text,  
// //                   phoneNo: _phoneNoControl.text, 
// //                   address: _addressControl.text, 
// //                   dob: _dobControl.text, 
// //                   pswd: _passwordControl.text
// //                 );
// //                 _acctHelper.insertAccount(currAcct);
// //                 Navigator.of(context).push(
// //                   MaterialPageRoute(
// //                     builder: (BuildContext context) {
// //                       return MainScreen();
// //                     },
// //                   ),
// //                 );
// //               },
// //               color: Theme.of(context).accentColor,
// //             ),
// //           ),
          
// //           SizedBox(height: 10.0),

// //           Divider(
// //             color: Theme.of(context).accentColor,
// //           ),

// //           SizedBox(height: 10.0),

// //           Center(
// //             child: Container(
// //               width: MediaQuery.of(context).size.width / 2,
// //               child: Row(
// //                 children: <Widget>[
// //                   RawMaterialButton(
// //                     onPressed: () {},
// //                     fillColor: Colors.blue[800],
// //                     shape: CircleBorder(),
// //                     elevation: 4.0,
// //                     child: Padding(
// //                       padding: EdgeInsets.all(15),
// //                       child: Icon(
// //                         FontAwesomeIcons.facebookF,
// //                         color: Colors.white,
// // //              size: 24.0,
// //                       ),
// //                     ),
// //                   ),
// //                   RawMaterialButton(
// //                     onPressed: () {},
// //                     fillColor: Colors.white,
// //                     shape: CircleBorder(),
// //                     elevation: 4.0,
// //                     child: Padding(
// //                       padding: EdgeInsets.all(15),
// //                       child: Icon(
// //                         FontAwesomeIcons.google,
// //                         color: Colors.blue[800],
// // //              size: 24.0,
// //                       ),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //           SizedBox(height: 10.0),
// //         ],
// //       ),
// //     );
// //   }
// // }





// import 'package:bajan_eats/screens/main_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:bajan_eats/data/database_helper.dart';
// import 'package:bajan_eats/models/user.dart';

// class RegisterPage extends StatefulWidget {
//   @override
//   _RegisterPageState createState() => new _RegisterPageState();
// }

// class _RegisterPageState  extends State<RegisterPage> {
//   BuildContext _ctx;
//   bool _isLoading = false;
//   final formKey = new GlobalKey<FormState>();
//   final scaffoldKey = new GlobalKey<ScaffoldState>();
//   String _name, _username, _password;



//   @override
//   Widget build(BuildContext context) {
//     _ctx = context;
//     var loginBtn = new RaisedButton(
//       onPressed: _submit,
//       child: new Text("Register"),
//       color: Colors.green,
//     );


//     var loginForm = new Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: <Widget>[
//         new Text(
//           "Create an Account!",
//           textScaleFactor: 2.0,
//         ),
//         new Form(
//           key: formKey,
//           child: new Column(
//             children: <Widget>[
//               new Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: new TextFormField(
//                   onSaved: (val) => _name = val,
//                   decoration: new InputDecoration(labelText: "Name"),
//                 ),
//               ),
//               new Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: new TextFormField(
//                   onSaved: (val) => _username = val,
//                   decoration: new InputDecoration(labelText: "Email"),
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
//         title: new Text("Register"),
//       ),
//       key: scaffoldKey,
//       body: new Container(
//         child: new Center(
//           child: loginForm,
//         ),
//       ),
//     );
//   }

//   void _showSnackBar(String text) {
//     scaffoldKey.currentState.showSnackBar(new SnackBar(
//       content: new Text(text),
//     ));
//   }

//   void _submit(){
//     final form = formKey.currentState;

//     if (form.validate()) {
//       setState(() {
//         _isLoading = true;
//         form.save();
//         var user = new User(_name, _username, _password, null);
//         var db = new DatabaseHelper();
//         db.saveUser(user);
//         _isLoading = false;
//         Navigator.push(context, 
//           MaterialPageRoute(
//             builder: (context) => MainScreen()
//             )
//           );
                  
                
//       });
//     }
//   }
// }