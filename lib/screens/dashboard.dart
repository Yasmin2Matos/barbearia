import 'package:barberia/screens/barbeiros.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            // child: Image.asset(
            //    'https://www.google.com/url?sa=i&url=http%3A%2F%2Fwww.barbeariahermanos.com.br%2F&psig=AOvVaw1x7xTX7-R3XmBql_Rk5cQN&ust=1700686190422000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCLCU5_L71YIDFQAAAAAdAAAAABAR'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  (MaterialPageRoute(
                    builder: (context) => Barbeiros(),
                  )),
                );
              },
              child: Container(
                padding: EdgeInsets.all(8.0),
                height: 100,
                width: 150,
                color: Theme.of(context).primaryColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.people,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
