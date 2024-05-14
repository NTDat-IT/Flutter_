import 'package:flutter/material.dart';
import 'package:weather_appdemo/page/detail/detail_page.dart';
import 'package:weather_appdemo/page/home/home_page.dart';

class BottomCustom extends StatefulWidget {
  const BottomCustom({super.key});

  @override
  State<BottomCustom> createState() => _BottomCustomState();
}

class _BottomCustomState extends State<BottomCustom> {
  List<BottomNavigationBarItem> listItem = [
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
    const BottomNavigationBarItem(
        icon: Icon(Icons.format_list_bulleted), label: "Detail"),
  ];

  int activePage = 0;

  List<Widget> listPage = [
    const HomePage(),
    const DetailPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listPage[activePage],
      extendBody: true, // xet gia tri trong suốt
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: activePage,
        selectedItemColor: Colors.white,
        backgroundColor: Colors.transparent,
        unselectedItemColor: Colors.black,
        items: listItem,
        onTap: (value) {
          setState(() {
            activePage = value;
          });
        },
      ),
    );
  }
}
