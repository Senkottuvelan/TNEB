import 'package:flutter/material.dart';
import 'package:tneb/ui/home.dart';
import 'bill_calculator.dart';

class Navigator_Bottom extends StatefulWidget {
  const Navigator_Bottom({Key? key}) : super(key: key);

  @override
  State<Navigator_Bottom> createState() => _Navigator_BottomState();
}

class _Navigator_BottomState extends State<Navigator_Bottom> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    BillCalculator()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,

        selectedFontSize:20,
        unselectedFontSize: 15,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,size: 20,),
            label: 'Home',
            backgroundColor: Colors.transparent,

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate,size: 20,),
            label: 'Tariff Calculator',
            backgroundColor: Colors.transparent,

          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.yellow,
        onTap: _onItemTapped,
      ),
    );
  }
}
