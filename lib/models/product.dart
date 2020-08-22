import 'package:flutter/material.dart';
import 'package:orderizr/pages/details_pages/store_details.dart';

// Product model that will be used for the stores & resturants.
class Product extends StatelessWidget {
  final String _resturant_logo;
  final String _resturant_name;

  Product(this._resturant_logo, this._resturant_name);

  Widget _buildContainer(logo, name, context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => StoreDetails()),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Container(
          height: 180,
          width: 120,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadiusDirectional.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 3,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                _resturant_logo,
                width: 200,
                height: 150,
              ),
              Text(
                _resturant_name,
                style: TextStyle(
                  color: Color(0xffC57A94),
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return _buildContainer(_resturant_logo, _resturant_name, context);
  }
}
