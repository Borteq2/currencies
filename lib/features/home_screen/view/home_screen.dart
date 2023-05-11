import 'package:Currencies/features/currency_list_screen/currency_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  // int _selectedIndex = 0;
  //
  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  //
  //   _indexedRouting(index);
  // }
  // void _indexedRouting(int index) {
  //   try {
  //     switch (index) {
  //       case 0:
  //         Navigator.pushNamed(context, '/');
  //         break;
  //       case 1:
  //         Navigator.pushNamed(context, '/favorites');
  //         break;
  //       case 2:
  //         Navigator.pushNamed(context, '/list');
  //         break;
  //       case 3:
  //         Navigator.pushNamed(context, '/crypto');
  //         break;
  //       default:
  //         GetIt.I<Talker>().error('WRONG BOTTOM NAV INDEX');
  //     }
  //   } catch (e, st) {
  //     GetIt.instance<Talker>().handle(e, st);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Im homepage')
          ],
        ),
      ),
      // bottomNavigationBar: CupertinoTabBar(
      //   backgroundColor: Colors.black,
      //   items: const [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.favorite),
      //       label: 'Favorites',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.attach_money),
      //       label: 'Fiat',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.currency_bitcoin),
      //       label: 'Crypto',
      //     ),
      //   ],
      //   currentIndex: _selectedIndex,
      //   onTap: _onItemTapped,
      // ),
    );
  }
}
