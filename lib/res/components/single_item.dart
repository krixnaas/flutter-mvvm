import 'package:flutter/material.dart';

class SingleItem extends StatelessWidget {

  String title;
  String time;
  String state;
  String description;
  bool isFav;
  String phone;
  String message;

  SingleItem({
    super.key,
    required this.title,
    required this.time,
    required this.state,
    required this.description,
    required this.isFav,
    required this.phone,
    required this.message
  });



  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 10),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      child: Icon(Icons.add),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title, style: TextStyle(fontSize: 18)),
                        Text(time, style: TextStyle(fontSize: 12),),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      child: Icon(isFav?Icons.star_outlined:Icons.star_border_outlined),
                    ),
                    if(state!=null)
                    Container(
                      child: Text(state,style: TextStyle(fontSize: 14)),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10,),
            Container(
              child: Text(description,style: TextStyle(fontSize: 14)),
            ),
            SizedBox(height: 5,),
            Divider(),
            SizedBox(height: 10,),
            /*
            SizedBox(height: 10,),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                    width: 0.5,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15,),*/
            Row(
              children: [
                if (phone != "")
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        // Handle phone icon tap
                      },
                      child: Container(
                        child: Icon(Icons.phone),
                      ),
                    ),
                  ),
                if (message != "")
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        // Handle message icon tap
                      },
                      child: Container(
                        child: Icon(Icons.sms),
                      ),
                    ),
                  ),
                /*
                if (chat != null)
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        // Handle chat icon tap
                      },
                      child: Container(
                        child: Icon(Icons.chat),
                      ),
                    ),
                  ),
                */
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        // Handle more icon tap
                      },
                      child: Container(
                        child: Icon(Icons.more_vert),
                      ),
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
