import 'package:bajan_eats/screens/product_details.dart';
import 'package:bajan_eats/utils/dishes.dart';
import 'package:flutter/material.dart';
//import 'package:bajan_eats/utils/const.dart';
//import 'package:bajan_eats/utils/foods.dart';
//import 'package:bajan_eats/widgets/star_rating.dart';

class SearchScreen extends StatefulWidget {
  final image;
  final name;
  final price;

  SearchScreen({this.image, this.name, this.price});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with AutomaticKeepAliveClientMixin<SearchScreen> {
  final TextEditingController _searchControl = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
      child: ListView(
        children: <Widget>[
          SizedBox(height: 10.0),
          Card(
            elevation: 6.0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              child: TextField(
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  hintText: "Search..",
                  suffixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  hintStyle: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                ),
                maxLines: 1,
                controller: _searchControl,
              ),
            ),
          ),
          SizedBox(height: 5.0),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "History",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            primary: false,
            physics: NeverScrollableScrollPhysics(),
            itemCount: dishes == null ? 0 : dishes.length,
            itemBuilder: (BuildContext context, int index) {
              Map dish = dishes[index];
              return ListTile(
                title: Text(
                  "${dish['name']}",
                  style: TextStyle(
//                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                leading: CircleAvatar(
                  radius: 25.0,
                  backgroundImage: AssetImage(
                    "${dish['img']}",
                  ),
                ),
                subtitle: Row(),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => ProductDetails(
                        image: "${dish['img']}",
                        name: "${dish['name']}",
                        price: "${dish['price']}",
                      ),
                    ),
                  );
                },
              );
            },
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

// class DataSearch extends SearchDelegate<String> {
  

//   @override
//   List<Widget> buildActions(BuildContext context) {
    
//     return [
//       IconButton(
//         icon: Icon(Icons.clear),
//         onPressed: () {},
//       )
//     ];
//   }

//   @override
//   Widget buildLeading(BuildContext context) {
    
//     return IconButton(
//         icon: AnimatedIcon(
//           icon: AnimatedIcons.menu_arrow,
//           progress: transitionAnimation,
//         ),
//         onPressed: () {});
//   }

//   @override
//   Widget buildResults(BuildContext context) {
    
//     return null;
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
    
//     return null;
//   }
// }
