/*
import 'package:cenafood/shared/color.dart';
import 'package:cenafood/states/provider/navigation_provider.dart';
import 'package:cenafood/ui/screens/food/explore_screen.dart';
import 'package:cenafood/ui/screens/offers/offers_screen.dart';
import 'package:cenafood/ui/screens/user/profile.dart';
import 'package:cenafood/ui/widgets/bottom_navbar.dart';
import 'package:cenafood/ui/widgets/bottom_navbar_2.dart';
import 'package:provider/provider.dart';
*/
import 'package:cenafood/ui/screens/food/explore_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MainScreen());

/// This is the main application widget.
class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    ExploreScreen(),
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Sample'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.pink,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}


/*
void main() {
  runApp(const MainScreen());
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
            title: const Text('Main Screen'),
          ),
          body: PageView(
            children: [
              ExploreScreen(),
              OffersScreen(),
              UserProfileScreen(),
            ],
          ),
        ),
      ),
    );
  }
}

*/
/*
class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    NavigationProvider navigation =
        Provider.of<NavigationProvider>(context, listen: false);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            color: baseDarkColor,
          ),
          SafeArea(
            child: Stack(
              children: [
                Container(
                  color: baseDarkColor,
                ),
                PageView(
                  controller: navigation.pageIndex,
                  onPageChanged: (index) {
                    navigation.changeIndex(index);
                  },
                  children: [
                    ExploreScreen(),
                    OffersScreen(),
                    OffersScreen(),
                    UserProfileScreen(),
                  ],
                ),
                BottomNavbar(),
                //BottomNav2(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
*/
