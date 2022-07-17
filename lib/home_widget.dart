import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'form_query_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {

  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    Widget child;
    switch(_currentIndex){
      case 0:
        child = Scaffold(
          appBar: AppBar(
              title: Center(
                child: Text('Update'),
              )
          ),
          body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                    child: RaisedButton(
                        onPressed: () => {
                          Navigator.pushNamed(context, '/new')
                        },
                        color: Colors.blue,
                        child: Text('New Entry'),
                        padding: EdgeInsets.all(20.0)
                    )
                ),
                Center(
                    child: RaisedButton(
                        onPressed: () => Navigator.pushNamed(context, '/edit'),
                        color: Colors.blue,
                        child: Text('Edit Existing Entry'),
                        padding: EdgeInsets.all(20.0)
                    )
                )
              ]
          ),
        );
        break;
      case 1:
        child = Scaffold(
          backgroundColor: Color.fromRGBO(255, 255, 255, 0),
          appBar: AppBar(
              title: Center(
                child: Text('Welcome to VMDb'),
              )
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image(
                    image: AssetImage('assets/logo.png')
                ),
                const SizedBox(height: 25),
                RaisedButton(
                  onPressed: () => Navigator.pushNamed(context, '/stats'),
                  color: Colors.blue,
                  child: Text('Stats'),
                  padding: EdgeInsets.all(10.0)
                 ),
              ],
            ),
            ),
          );
        break;
      case 2:
        child = QueryScreen();
        break;
    }
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.update),
              title: new Text('Update')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: new Text('Home')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.sort),
              title: new Text('Query')
          )
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}