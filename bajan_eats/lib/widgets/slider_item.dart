import 'package:flutter/material.dart';
//import 'package:bajan_eats/screens/product_details.dart';

class SliderItem extends StatelessWidget {
  final String name;
  final String img;
  //final bool isFav;
  final String restaurant;
  final String price;

  SliderItem(
      {Key key,
      @required this.name,
      @required this.img,
      //this.isFav,
      @required this.restaurant,
      @required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      primary: false,
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 3.2,
              width: MediaQuery.of(context).size.width,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  "$img",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Positioned(
            //   right: -10.0,
            //   bottom: 3.0,
            //   child: RawMaterialButton(
            //     onPressed: () {},
            //     fillColor: Colors.white,
            //     shape: CircleBorder(),
            //     elevation: 4.0,
            //     child: Padding(
            //       padding: EdgeInsets.all(5),
            //       child: Icon(
            //         isFav ? Icons.favorite : Icons.favorite_border,
            //         color: Colors.red,
            //         size: 17,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 2.0, top: 8.0),
          child: Text(
            "$name",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w900,
            ),
            maxLines: 2,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 2.0, top: 8.0),
          child: Text(
            "$restaurant",
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w500,
              color: Colors.blue,
            ),
            maxLines: 2,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 2.0, top: 1.0),
          child: Text(
            "$price",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
              color: Colors.green,
            ),
            textAlign: TextAlign.end,
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}
