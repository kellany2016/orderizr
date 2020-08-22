import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:orderizr/constants.dart';
import 'package:orderizr/pages/drawer_pages/about_app.dart';
import 'package:orderizr/pages/drawer_pages/contact_us.dart';
import 'package:orderizr/pages/tab_bar_pages/coffee_stores.dart';
import 'package:orderizr/pages/tab_bar_pages/dessert_stores.dart';
import 'package:orderizr/pages/tab_bar_pages/food_resturants.dart';
import 'package:orderizr/pages/tab_bar_pages/special_stores.dart';

import '../drawer_pages/conditions.dart';
import '../drawer_pages/login.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int _selectedTab = 2;
  TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this, initialIndex: 3);
    SpecialStores.controller = tabController;
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
      backgroundColor: Colors.white,
      endDrawer: Drawer(
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SafeArea(
                child: Container(
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.clear,
                          color: Colors.grey,
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      Row(
                        children: <Widget>[
                          Image.asset(
                            'assets/images/alarm.png',
                            height: 30,
                            width: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Orderizr',
                              style: TextStyle(
                                  color: kMainColor,
                                  fontSize: 24,
                                  fontFamily: 'Rowdies'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                _buildListTilesofDrawer(
                    'تسجيل الدخول', Icons.subdirectory_arrow_right, () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                }),
                _buildListTilesofDrawer('عن التطبيق', Icons.warning, () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AboutApp()),
                  );
                }),
                _buildListTilesofDrawer('تواصل معنا', Icons.call, () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ContactUs()),
                  );
                }),
                _buildListTilesofDrawer('الشروط و الأساسيات', Icons.security,
                    () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Conditions()),
                  );
                }),
                _buildListTilesofDrawer('English', Icons.language, () {
                }),
              ],
            ),
            SizedBox(height: 410),
            Padding(
              padding: const EdgeInsets.only(left: 230.0),
              child: Text(
                'نسخة 1.0',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Orderizr',
          style: TextStyle(color: kMainColor, fontSize: 24),
        ),
        leading: Image.asset(
          'assets/images/alarm.png',
          height: 10,
          width: 10,
        ),
        titleSpacing: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black,
              size: 30,
            ),
            onPressed: null,
          ),
          Builder(
            builder: (context) => IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          ),
        ],
        bottom: TabBar(
          dragStartBehavior: DragStartBehavior.down,
          indicatorColor: kMainColor,
          labelStyle: tabTextStyle,
          onTap: (int index) {
            setState(() {
              _selectedTab = index;
            });
          },
          indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 2.0, color: kMainColor),
              insets: EdgeInsets.only(left: 15, right: 15)),
          isScrollable: false,
          controller: tabController,
          tabs: <Widget>[
            Tab(
              child: Text(
                'متاجر الحلاويات',
                style: tabTextStyle,
              ),
            ),
            Tab(
              child: Text(
                'مطاعم الأكلات',
                style: tabTextStyle,
              ),
            ),
            Tab(
              child: Text(
                'متاجر القهوه',
                style: tabTextStyle,
              ),
            ),
            Tab(
              child: Text(
                'المتاجر المميزه',
                style: tabTextStyle,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        // so i can add tabs as i wish..
        iconSize: 20,
        selectedIconTheme: IconThemeData(color: kSecondaryColor),
        unselectedIconTheme: IconThemeData(color: Colors.grey),
        backgroundColor: Colors.white,
        currentIndex: _selectedTab,
        onTap: (int index) {
          setState(() {
            _selectedTab = index;
            print(_selectedTab);
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text(
              'المفضله',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            title: Text('التنبيهات'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('الرئيسه'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('طلباتي'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('المحفظه'),
          ),
        ],
        //currentIndex: _selectedIndex,
        selectedItemColor: kSecondaryColor,
        //onTap: _onItemTapped,
      ),
      body: TabBarView(
        controller: tabController,
        children: <Widget>[
          DessertStores(),
          FoodResturants(),
          CoffeeStores(),
          SpecialStores(),
        ],
      ),
    );
  }

  Widget _buildListTilesofDrawer(
      String tileTitle, IconData iconData, Function navFunction) {
    return GestureDetector(
      onTap: navFunction,
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              tileTitle,
              style: TextStyle(
                fontFamily: 'Changa',
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Icon(
              iconData,
              color: Color(0xffB65979),
            ),
          ],
        ),
      ),
    );
  }
}
