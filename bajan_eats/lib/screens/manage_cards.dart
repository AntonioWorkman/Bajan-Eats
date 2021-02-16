import 'package:flutter/material.dart';
import 'package:bajan_eats/providers/user_provider.dart';
import 'package:provider/provider.dart';

class ManagaCardsScreen extends StatefulWidget {
  @override
  _ManagaCardsScreenState createState() => _ManagaCardsScreenState();
}

class _ManagaCardsScreenState extends State<ManagaCardsScreen> {

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Theme.of(context).backgroundColor,
        iconTheme: IconThemeData(color: Theme.of(context).accentColor,),
        title: Text(
          "My Cards",
          style: TextStyle(color: Theme.of(context).accentColor,),
        ),
      ),
      body: ListView.builder(
          itemCount: user.cards.length,
          itemBuilder: (_, index){
        return  Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).primaryColor,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey[200],
                      offset: Offset(2, 1),
                      blurRadius: 5
                  )
                ]
            ),
            child: ListTile(
              leading: Icon(Icons.credit_card),
              title: Text("**** **** **** ${user.cards[index].last4}"),
              subtitle: Text("${user.cards[index].month} / ${user.cards[index].year}"),
              trailing: Icon(Icons.more_horiz),
              onTap: (){

              },
            ),
          ),
        );

      })
    );
  }
}