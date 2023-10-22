import 'package:flutter/material.dart';
import 'package:mvvm/res/colors.dart';

class Categories extends StatelessWidget {

  List<BoxShadow> shadowList = [
    BoxShadow(color: Colors.grey, blurRadius: 9, offset: Offset(0, 2))
  ];

  String title;
  Color background;
  Color foreground;

  Categories({
    super.key,
    required this.title,
    this.background = Colors.black38,
    this.foreground = Colors.black87,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: shadowList,
                  borderRadius: BorderRadius.circular(40)
              ),
              child: Icon(Icons.add)
          ),
          SizedBox(height:10),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10,)
        ],
      ),
    );
  }
}
