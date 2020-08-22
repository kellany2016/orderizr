import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:orderizr/constants.dart';
import 'package:orderizr/custom_widgets/list_builder.dart';
import 'file:///D:/Work/Flutter_Projects/orderizr/lib/pages/details_pages/store_details_widget.dart';
import 'package:orderizr/pages/tab_bar_pages/dessert_stores.dart';
import 'package:orderizr/pages/tab_bar_pages/food_resturants.dart';

class StoreMenu extends StatefulWidget {
  @override
  _StoreMenuState createState() => _StoreMenuState();
}

//_selectedTab =
class _StoreMenuState extends State<StoreMenu>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  int _selectedTab = 3;

  TextStyle _tabTextStyle = TextStyle(
    color: Colors.black,
    fontSize: 9,
    fontFamily: 'Changa',
  );

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this, initialIndex: 3);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: ListBuilder([
        StoreDetailWidget(Color(0xffE8B62E), 'طريق الملك عبد العزيز - الرياض'),
        //TabView..
                TabBar(
                  dragStartBehavior: DragStartBehavior.down,
                  indicatorColor: kMainColor,
                  labelStyle: tabTextStyle,
                  labelColor: kMainColor,
                  indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(width: 2.0, color: kMainColor),
                      insets: EdgeInsets.only(left: 15, right: 15)),
                  isScrollable: false,
                  controller: tabController,
                  onTap: (int index) {
                    setState(() {
                      _selectedTab = index;
                    });
                  },
                  tabs: <Widget>[
                    Tab(
                      text: 'الفطور',
                    ),
                    Tab(
                      text: 'المثلجات',
                    ),
                    Tab(
                      text: 'الساخن',
                    ),
                    Tab(
                      text: 'المنتجات المميزه',
                    ),
                  ],
                ),
              SizedBox(
                height: 700,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: TabBarView(
                        dragStartBehavior: DragStartBehavior.down,
                        controller: tabController,
                        children: <Widget>[
                          FoodResturants(),
                          DessertStores(),
                          FoodResturants(),
                          Row(
                            children: <Widget>[
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ]),
    );
  }
}
