//import 'package:bajan_eats/utils/dishes.dart';
import 'package:flutter/material.dart';
import 'package:bajan_eats/screens/product_details.dart';

class FoodGridProduct extends StatelessWidget {
  final String name;
  final String img;
  final bool isFav;
  final String price;

  FoodGridProduct({
    Key key,
    @required this.name,
    @required this.img,
    @required this.isFav,
    this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ListView(
        shrinkWrap: true,
        primary: false,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 3.6,
                width: MediaQuery.of(context).size.width / 2.2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    "$img",
                    fit: BoxFit.fill,
                  ),
                ),
              ),

              // Fav icon
              Positioned(
                right: -10.0,
                bottom: 3.0,
                child: RawMaterialButton(
                  onPressed: () {},
                  fillColor: Colors.white,
                  shape: CircleBorder(),
                  elevation: 4.0,
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Icon(
                      isFav ? Icons.favorite : Icons.favorite_border,
                      color: Colors.red,
                      size: 17,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 2.0, top: 8.0),
            child: Text(
              "$name",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w900,
              ),
              maxLines: 2,
            ),
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.only(bottom: 2.0, top: 1.0),
            child: Text(
              "$price",
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
                color: Colors.blue,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
          ),
        ],
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => ProductDetails(
              image: "$img",
              name: "$name",
              price: "$price",
            ),
          ),
        );
      },
    );
  }
}
