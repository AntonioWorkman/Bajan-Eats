import 'package:bajan_eats/screens/restaurant.dart';
import 'package:bajan_eats/utils/restaurants.dart';
import 'package:bajan_eats/utils/dishes.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:bajan_eats/screens/dish.dart';
import 'package:bajan_eats/widgets/resturant_grid.dart';
import 'package:bajan_eats/widgets/slider_item.dart';



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin<Home>{

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }

  int _current = 0;


  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(

      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0,0,10.0,0),
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Popular Dishes",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                FlatButton(
                  child: Text(
                    "View More",
                    style: TextStyle(

                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  onPressed: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context){
                          return DishesScreen();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),

            SizedBox(height: 10.0),

            CarouselSlider(
              height: MediaQuery.of(context).size.height/2.4,
              items: map<Widget>(
                dishes,
                    (index, i){
                      Map dish = dishes[index];
                  return SliderItem(
                    img: dish['img'],
                    name: dish['name'],
                    restaurant: dish['restaurant'],
                    price: dish['price']
                  );
                },
              ).toList(),
              autoPlay: true,
              viewportFraction: 1.0,
              onPageChanged: (index) {
                setState(() {
                  _current = index;
                  
                });
              },
              
            ),

            SizedBox(height: 20.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Restaurants",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                FlatButton(
                  child: Text(
                    "View More",
                    style: TextStyle(

                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  onPressed: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context){
                          return RestaurantsScreen();
                        },
                      ),
                    );},
                ),
              ],
            ),
            SizedBox(height: 10.0),

            GridView.builder(
              shrinkWrap: true,
              primary: false,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 1.25),
              ),
              itemCount: restaurants == null ? 0 :restaurants.length,
              itemBuilder: (BuildContext context, int index) {

                Map restaurant = restaurants[index];

                return ResturantGridProduct(
                  img: restaurant['img'],
                  isFav: false,
                  name: restaurant['name'],
                  location: restaurant['location'],
                );
              },
            ),

            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
