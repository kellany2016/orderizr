import 'package:flutter/material.dart';


class MainProduct extends StatelessWidget {
  final String _product_logo;
  final String _product_name;
  final String _product_calories;
  final String _product_price;

  MainProduct(this._product_logo, this._product_name,this._product_calories,this._product_price);
  TextStyle rowTextStyle = TextStyle(
    fontSize: 12,
    fontFamily: 'Changa',
    color: Colors.grey,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 120,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage(_product_logo),height: 80,width: 80,),
            Text(_product_name, style: TextStyle(
                fontFamily: 'Changa',
                fontSize: 14
            ),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(_product_price,style: rowTextStyle,),
                Text(_product_calories,style: rowTextStyle,)
              ],
            )
          ],
        ),
      ),
    );
  }
}
