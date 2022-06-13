import 'package:flutter/material.dart';

// We need satefull widget for our pages

class Pages extends StatefulWidget {
  @override
  _PagesState createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  List<String> pages = ['Eventos soft', 'Meus Eventos'];
  // By default our first item will be selected
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: SizedBox(
        height: 25,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: pages.length,
          itemBuilder: (context, index) => buildCategory(index),
        ),
      ),
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              pages[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: selectedIndex == index ? Colors.black : Colors.grey,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0 / 4), //top padding 5
              height: 3,
              width: 100,
              color: selectedIndex == index
                  ? const Color.fromRGBO(112, 82, 204, 1)
                  : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}
