import 'package:flutter/material.dart';
import 'page4.dart';
import 'page5.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _bottomNavCurrentIndex = 0;
  List<Widget> _container = [Page4(), Page5()];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _container[_bottomNavCurrentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _bottomNavCurrentIndex = index;
          });
        },
        currentIndex: _bottomNavCurrentIndex,
        items: [
          BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.home,
                color: Colors.red,
              ),
              icon: Icon(Icons.home, color: Colors.grey),
              title: Text("page4",
                  style: TextStyle(
                    color:
                        _bottomNavCurrentIndex == 0 ? Colors.red : Colors.grey,
                  ))),
          BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.assignment,
                color: Colors.red,
              ),
              icon: Icon(Icons.assignment, color: Colors.grey),
              title: Text("page5",
                  style: TextStyle(
                    color:
                        _bottomNavCurrentIndex == 1 ? Colors.red : Colors.grey,
                  ))),
        ],
      ),
    );
  }
}
