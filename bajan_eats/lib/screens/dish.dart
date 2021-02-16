import 'package:flutter/material.dart';
import 'package:bajan_eats/utils/dishes.dart';
import 'package:bajan_eats/widgets/food_grid.dart';


class DishesScreen extends StatefulWidget {
  @override
  _DishesScreenState createState() => _DishesScreenState();
}

class _DishesScreenState extends State<DishesScreen> {
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
          "Dishes",
        ),
        backgroundColor: Theme.of(context).accentColor,
        elevation: 0.0,
      ),

      body: Padding(
          padding: EdgeInsets.fromLTRB(10.0,0,10.0,0),
        child: ListView(

          children: <Widget>[
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
                Map dish = fastFoodDishes[index];
                return FoodGridProduct(
                  img: dish['img'],
                  isFav: false,
                  name: dish['name'],
                  price: dish['price'],
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
                Map dish = fastFoodDishes[index];
                return FoodGridProduct(
                  img: dish['img'],
                  isFav: false,
                  name: dish['name'],
                  price: dish['price'],
                );
              },
            ),

            SizedBox(height: 20.0),
            Text(
              "African",
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
                Map dish = fastFoodDishes[index];
                return FoodGridProduct(
                  img: dish['img'],
                  isFav: false,
                  name: dish['name'],
                  price: dish['price'],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
