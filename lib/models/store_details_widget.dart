import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orderizr/constants.dart';
import 'file:///D:/Work/Flutter_Projects/orderizr/lib/pages/menu_tabs/stores_menu.dart';

class StoreDetailWidget extends StatelessWidget {
  final Color color;
  final String name;

  StoreDetailWidget(this.color, this.name);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => StoreMenu()));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 185,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color:
                color == Color(0xffE8B62E) ? Colors.white : Color(0xffDADADA),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadiusDirectional.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 3,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            children: <Widget>[
              //Store details (logo, name, status)..
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 50.0),
                          child: Text(
                            'Starbucks Coffee',
                            style: TextStyle(
                                color: kSecondaryColor,
                                fontSize: 18,
                                fontFamily: 'Changa'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            name, // name of the store branch
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontFamily: 'Changa'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 130.0),
                          child: Text(
                            color == Color(0xffE8B62E) ? '(مفتوح)' : '(مغلق)',
                            style: TextStyle(
                                color: color, // closed or open colors..
                                fontSize: 16,
                                fontFamily: 'Changa'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0, right: 4.0),
                    child: Image.asset(
                      'assets/images/star.png',
                      height: 120,
                      width: 120,
                    ),
                  ),
                ],
              ),
              // time & distance..
              Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 14, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '06:30 AM - 9:30 PM',
                          style: TextStyle(
                              color: kMainColor, // closed or open colors..
                              fontSize: 12,
                              fontFamily: 'Changa'),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            'يبعد عنك مسافة 0.9 كم',
                            style: TextStyle(
                                color: Colors.grey, // closed or open colors..
                                fontSize: 12,
                                fontFamily: 'Changa'),
                          ),
                          Icon(
                            Icons.location_on,
                            size: 22,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ],
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
