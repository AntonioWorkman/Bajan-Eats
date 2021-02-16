import 'dart:async';
import 'package:bajan_eats/services/user.dart';
import 'package:bajan_eats/utils/const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bajan_eats/models/cards.dart';
import 'package:bajan_eats/models/purchase.dart';
import 'package:bajan_eats/models/user.dart';
import 'package:bajan_eats/services/cards.dart';
import 'package:bajan_eats/services/purchases.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class UserProvider with ChangeNotifier {
  FirebaseAuth _auth;
  FirebaseUser _user;
  Status _status = Status.Uninitialized;
  Status get status => _status;
  FirebaseUser get user => _user;
  Firestore _firestore = Firestore.instance;
  UserService _userService = UserService();
  CardServices _cardServices = CardServices();
  PurchaseServices _purchaseServices = PurchaseServices();

  UserModel _userModel;
  List<CardModel> cards = [];
  List<PurchaseModel> purchaseHistory = [];

////////////////////////////////////////////////////////////////////////////////

  UserProvider() {
    checkTheme();
  }

  ThemeData theme = Constants.lightTheme;
  Key key = UniqueKey();
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  void setKey(value) {
    key = value;
    notifyListeners();
  }

  void setNavigatorKey(value) {
    navigatorKey = value;
    notifyListeners();
  }

  void setTheme(value, c) {
    theme = value;
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString("theme", c).then((val) {
        SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          statusBarColor:
              c == "dark" ? Constants.darkPrimary : Constants.lightPrimary,
          statusBarIconBrightness:
              c == "dark" ? Brightness.light : Brightness.dark,
        ));
      });
    });
    notifyListeners();
  }

  ThemeData getTheme(value) {
    return theme;
  }

  Future<ThemeData> checkTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    ThemeData t;
    String r =
        prefs.getString("theme") == null ? "light" : prefs.getString("theme");

    if (r == "light") {
      t = Constants.lightTheme;
      setTheme(Constants.lightTheme, "light");
    } else {
      t = Constants.darkTheme;
      setTheme(Constants.darkTheme, "dark");
    }

    return t;
  }

////////////////////////////////////////////////////////////////////////////////

//  we will make this variables public for now
  final formKey = GlobalKey<FormState>();

//  getter

  UserModel get userModel => _userModel;
  bool hasStripeId = true;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController phoneNo = TextEditingController();

  UserProvider.initialize() : _auth = FirebaseAuth.instance {
    _auth.onAuthStateChanged.listen(_onStateChanged);
  }

  Future<bool> signIn() async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth.signInWithEmailAndPassword(
          email: email.text.trim(), password: password.text.trim());
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      print(e.toString());
      return false;
    }
  }

  void hasCard() {
    hasStripeId = !hasStripeId;
    notifyListeners();
  }

  Future<void> loadCardsAndPurchase({String userId}) async {
    cards = await _cardServices.getCards(userId: userId);
    purchaseHistory =
        await _purchaseServices.getPurchaseHistory(userId: userId);
  }

  Future<bool> signUp() async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth
          .createUserWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then((result) {
        _firestore.collection('users').document(result.user.uid).setData({
          'name': name.text,
          'email': email.text,
          'address': address.text,
          'phoneNo': phoneNo.text,
          'uid': result.user.uid,
        });
      });
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      print(e.toString());
      return false;
    }
  }

  Future signOut() async {
    _auth.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  void clearController() {
    name.text = "";
    password.text = "";
    email.text = "";
  }

  Future<void> _onStateChanged(FirebaseUser user) async {
    if (user == null) {
      _status = Status.Unauthenticated;
    } else {
      _user = user;
      _status = Status.Authenticated;
      _userModel = await _userService.getUserById(user.uid);
      cards = await _cardServices.getCards(userId: user.uid);
      purchaseHistory =
          await _purchaseServices.getPurchaseHistory(userId: user.uid);
      if (_userModel.stripeId == null) {
        hasStripeId = false;
        notifyListeners();
      }
    }

    notifyListeners();
  }

  Future<String> getCurrentUser() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    if (user != null) {
      return user.uid;
    } else {
      return null;
    }
  }
}
