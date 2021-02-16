import 'package:bajan_eats/utils/restaurants.dart';
import 'package:flutter/material.dart';
//import 'package:bajan_eats/screens/notifications.dart';
//import 'package:bajan_eats/widgets/badge.dart';
import 'package:bajan_eats/widgets/resturant_grid.dart';


class RestaurantsScreen extends StatefulWidget {
  @override
  _RestaurantsScreenState createState() => _RestaurantsScreenState();
}

class _RestaurantsScreenState extends State<RestaurantsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_backspace,
          ),
          onPressed: ()=>Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          "Restaurants",
        ),
        elevation: 0.0,
      ),

      body: Padding(
          padding: EdgeInsets.fromLTRB(10.0,0,10.0,0),
        child: ListView(

          children: <Widget>[
            Text(
              "Fast Food",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
              maxLines: 2,
            ),
            Divider(),

            GridView.builder(
              shrinkWrap: true,
              primary: false,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 1.25),
              ),
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                Map restaurant = fastFoodRestaurants[index];
                return ResturantGridProduct(
                  img: restaurant['img'],
                  isFav: false,
                  name: restaurant['name'],
                  location: restaurant['location'],
                );
              },
            ),

            SizedBox(height: 20.0),
            Text(
              "Italian",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
              maxLines: 2,
            ),
            Divider(),

            GridView.builder(
              shrinkWrap: true,
              primary: false,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 1.25),
              ),
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                Map resturant = italianRestaurants[index];
                return ResturantGridProduct(
                  img: resturant['img'],
                  isFav: false,
                  name: resturant['name'],
                  location: resturant['location'],
                );
              },
            ),

            SizedBox(height: 20.0),
            Text(
              "Chinese",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
              maxLines: 2,
            ),
            Divider(),

            GridView.builder(
              shrinkWrap: true,
              primary: false,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 1.25),
              ),
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                Map resturant = chineseRestaurants[index];
                return ResturantGridProduct(
                  img: resturant['img'],
                  isFav: false,
                  name: resturant['name'],
                  location: resturant['location'],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
