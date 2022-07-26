import 'package:coffee_shop/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoggedStack extends StatefulWidget {
  const LoggedStack({Key? key}) : super(key: key);

  @override
  State<LoggedStack> createState() => _LoggedStackState();
}

class _LoggedStackState extends State<LoggedStack> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    Text(
      'FAVORITE',
      style: optionStyle,
    ),
    Text(
      'CART',
      style: optionStyle,
    ),
    Text(
      'PROFILE',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double bottomTabWidth = 60 + 37;

    return Scaffold(
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: SizedBox(
        height: 80,
        child: Column(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  left: <double>[
                    0,
                    bottomTabWidth,
                    bottomTabWidth * 2,
                    bottomTabWidth * 3,
                  ].elementAt(_selectedIndex),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Container(
                    height: 2,
                    color: Colors.brown,
                    // width: width(context) * 0.33,
                    // width: MediaQuery.of(context).size.width * 0.25,
                    width: 40,
                  ),
                ),
              ),
            ),
            Expanded(
              child: BottomNavigationBar(
                selectedLabelStyle: GoogleFonts.lato(fontSize: 12),
                unselectedLabelStyle: GoogleFonts.lato(fontSize: 12),
                unselectedItemColor: const Color(0xFFCBCBD4),
                elevation: 15,
                type: BottomNavigationBarType.fixed,
                backgroundColor: const Color(0xFFF8F7FA),
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_filled),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.favorite),
                    label: 'Favorite',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_bag_rounded),
                    label: 'Cart',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Profile',
                  ),
                ],
                currentIndex: _selectedIndex,
                selectedItemColor: Colors.brown,
                onTap: _onItemTapped,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
