import 'package:flutter/material.dart';
import 'package:bajan_eats/screens/product_details.dart';


class CartItem extends StatelessWidget {
  final String name;
  final String img;
  final bool isFav;
  final String price;


  CartItem({
    Key key,
    @required this.name,
    @required this.img,
    @required this.isFav,
    @required this.price})
      :super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
      child: InkWell(
        onTap: (){
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context){
                return ProductDetails();
              },
            ),
          );
        },
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 0.0, right: 10.0),
              child: Container(
                height: MediaQuery.of(context).size.width/3.5,
                width: MediaQuery.of(context).size.width/3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    "$img",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  "$name",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                
                SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    
                    SizedBox(width: 10.0),

                    Text(
                      "$price",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w900,
                        color: Theme.of(context).accentColor,
                      ),
                    ),

                  ],
                ),

                SizedBox(height: 10.0),

                Text(
                  "Quantity: 1",
                  style: TextStyle(
                    fontSize: 11.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),


              ],

            ),
          ],
        ),
      ),
    );
  }
}
