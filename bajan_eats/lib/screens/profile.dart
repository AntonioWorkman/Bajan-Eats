//import 'package:bajan_eats/providers/user_provider.dart';
import 'package:bajan_eats/screens/credit_card.dart';
//import 'package:bajan_eats/screens/manage_cards.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
//import 'package:bajan_eats/utils/const.dart';

class Profile extends StatefulWidget {
  final String name;
  final String email;
  final String phoneNo;
  final String address;

  Profile({this.name, this.email, this.phoneNo, this.address});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  //final UserProvider _auth = UserProvider.initialize();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;
  

  @override
  void initState() {
    super.initState();
    initUser();
  }

  initUser() async {
    user = await _auth.currentUser();
    setState(() {});
  }
  
  @override
  Widget build(BuildContext context) {
    //final user = Provider.of<UserProvider>(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Image.asset(
                    "assets/profile.jpeg",
                    fit: BoxFit.cover,
                    width: 100.0,
                    height: 100.0,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Bajan Eats',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "bajaneats2020@gmail.com",
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          InkWell(
                            onTap: () async {
                              await _auth.signOut();
                            },
                            child: Text(
                              "Logout",
                              style: TextStyle(
                                fontSize: 13.0,
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context).accentColor,
                              ),
                              textAlign: TextAlign.right,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  flex: 3,
                ),
              ],
            ),
            Divider(),
            Container(height: 15.0),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                "Account Information".toUpperCase(),
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              title: Text(
                "Full Name",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
              subtitle: Text(
                'Bajan Eats',
              ),
            ),
            ListTile(
              title: Text(
                "Email",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
              subtitle: Text(
                'bajaneats2020@gmail.com',
              ),
            ),
            ListTile(
              title: Text(
                "Phone",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
              subtitle: Text(
                "246-223-8909",
              ),
            ),
            ListTile(
              title: Text(
                "Address",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
              subtitle: Text(
                "Waterford, St.Michael",
              ),
            ),
            
            Divider(),
            ListTile(
              title: Text(
                "Add Card",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
              trailing: IconButton(
                icon: Icon(Icons.add),
                iconSize: 40.0,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return CreditCard();
                      },
                    ),
                  );
                },
              ),
            ),
            // ListTile(
            //   title: Text(
            //     "View Card",
            //     style: TextStyle(
            //       fontSize: 17,
            //       fontWeight: FontWeight.w700,
            //     ),
            //   ),
            //   trailing: IconButton(
            //     icon: Icon(Icons.credit_card),
            //     iconSize: 40.0,
            //     onPressed: () {
            //       Navigator.of(context).push(
            //         MaterialPageRoute(
            //           builder: (BuildContext context) {
            //             return ManagaCardsScreen();
            //           },
            //         ),
            //       );
            //     },
            //   ),
            // ),
            // Divider(),
            // ListTile(
            //   title: Text(
            //     "Dark Theme",
            //     style: TextStyle(
            //       fontSize: 17,
            //       fontWeight: FontWeight.w700,
            //     ),
            //   ),
            //   trailing: Switch(
            //     value: Provider.of<UserProvider>(context).theme ==
            //             Constants.lightTheme
            //         ? false
            //         : true,
            //     onChanged: (v) async {
            //       if (v) {
            //         Provider.of<UserProvider>(context, listen: false)
            //             .setTheme(Constants.darkTheme, "dark");
            //       } else {
            //         Provider.of<UserProvider>(context, listen: false)
            //             .setTheme(Constants.lightTheme, "light");
            //       }
            //     },
            //     activeColor: Theme.of(context).accentColor,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

Text userName(DocumentSnapshot snapshot) {
  if (snapshot.data == null) {
    return Text('no data set in the user document in firestore');
  } else {
    return Text(snapshot.data['name']);
  }
}
