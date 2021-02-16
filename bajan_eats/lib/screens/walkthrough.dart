// import 'package:bajan_eats/firebase/authenticate/authenticate.dart';
// import 'package:bajan_eats/firebase/authenticate/profile.dart';
// import 'package:bajan_eats/screens/login_screen.dart';
// import 'package:bajan_eats/screens/main_screen.dart';
// import 'package:bajan_eats/firebase/authenticate/sign_in.dart';
// import 'package:bajan_eats/screens/profile.dart';
// import 'package:flutter/material.dart';
// import 'package:introduction_screen/introduction_screen.dart';
// //import 'package:bajan_eats/screens/sign_up.dart';
// //import 'package:dots_indicator/dots_indicator.dart';


// class Walkthrough extends StatefulWidget {
//   @override
//   _WalkthroughState createState() => _WalkthroughState();
// }

// class _WalkthroughState extends State<Walkthrough> {
//   @override
//   Widget build(BuildContext context) {
//     List<PageViewModel> pages = [
//       PageViewModel(
//         title: "Fast Food",
//         body: 
//           "Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Nulla porttitor accumsan tincidunt.",
//         image: Image.asset(
//           "assets/fast_food.jpeg",
//           height: 175.0,
//         ),
//         decoration: PageDecoration(
//           titleTextStyle: TextStyle(
//             fontSize: 28.0,
//             fontWeight: FontWeight.w600,
//             color: Theme.of(context).accentColor,
//           ),
//           bodyTextStyle: TextStyle(fontSize: 15.0),
//           // dotsDecorator: DotsDecorator(
//           //   activeColor: Theme.of(context).accentColor,
//           //   activeSize: Size.fromRadius(8),
//           // ),
//           pageColor: Theme.of(context).primaryColor,
//         ),
//       ),

//       PageViewModel(
//         title: "Fast Delivery",
//         body: "Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Nulla porttitor accumsan tincidunt.",
//         image: Image.asset(
//           "assets/fast_delivery.png",
//           height: 185.0,
//         ),
//         decoration: PageDecoration(
//           titleTextStyle: TextStyle(
//             fontSize: 28.0,
//             fontWeight: FontWeight.w600,
//             color: Theme.of(context).accentColor,
//           ),
//           bodyTextStyle: TextStyle(fontSize: 15.0),
//           // dotsDecorator: DotsDecorator(
//           //   activeColor: Theme.of(context).accentColor,
//           //   activeSize: Size.fromRadius(8),
//           // ),
//           pageColor: Theme.of(context).primaryColor,
//         ),
//       ),

//       PageViewModel(
//         title: "Easy Payment",
//         body: "Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Nulla porttitor accumsan tincidunt.",
//         image: Image.asset(
//           "assets/easy_payment.jpeg",
//           height: 175.0,
//         ),
//         decoration: PageDecoration(
//           titleTextStyle: TextStyle(
//             fontSize: 28.0,
//             fontWeight: FontWeight.w600,
//             color: Theme.of(context).accentColor,
//           ),
//           bodyTextStyle: TextStyle(fontSize: 15.0),
//           // dotsDecorator: DotsDecorator(
//           //   activeColor: Theme.of(context).accentColor,
//           //   activeSize: Size.fromRadius(8),
//           // ),
//           pageColor: Theme.of(context).primaryColor,
//         ),
//       ),
//     ];

//     return WillPopScope(
//       onWillPop: ()=>Future.value(false),
//       child: Scaffold(
//         backgroundColor: Theme.of(context).primaryColor,
//         body: Padding(
//           padding: EdgeInsets.all(10.0),
//           child: IntroductionScreen(
//             pages: pages,
//             onDone: () {
//               Navigator.of(context).push(
//                 MaterialPageRoute(
//                   builder: (BuildContext context){
//                     return Authenticate();
//                     //return MainScreen();
                    
//                   },
//                 ),
//               );
//             },
//             onSkip: () {
//               Navigator.of(context).push(
//                 MaterialPageRoute(
//                   builder: (BuildContext context){
//                     return Authenticate();

//                     //return AccountScreen();
//                     //return MainScreen();
//                   },
//                 ),
//               );
//             },
//             showSkipButton: true,
//             skip: Text("Skip"),
//             next: Text(
//               "Next",
//               style: TextStyle(
//                 fontWeight: FontWeight.w800,
//                 color: Theme.of(context).accentColor,
//               ),
//             ),
//             done: Text(
//               "Done",
//               style: TextStyle(
//                 fontWeight: FontWeight.w800,
//                 color: Theme.of(context).accentColor,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
