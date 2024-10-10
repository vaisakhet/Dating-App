import 'package:dating_app/Core/Config/size_config.dart';
import 'package:dating_app/Resorces/app_assets.dart';
import 'package:dating_app/Resorces/app_color.dart';
import 'package:dating_app/Views/chat_tab.dart';
import 'package:dating_app/Views/favourite_tab.dart';
import 'package:dating_app/Views/home_tab.dart';
import 'package:dating_app/Views/profile_tab.dart';
import 'package:dating_app/controller/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomAppBr extends StatefulWidget {
  const BottomAppBr({Key? key}) : super(key: key);

  @override
  _BottomAppBrState createState() => _BottomAppBrState();
}

class _BottomAppBrState extends State<BottomAppBr> {
  int pageIndex = 0;

  final pages = [
    HomeScreenView(),
    const FavouriteTabView(),
    const ChatTabView(),
    const ProfileTabView(),
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final ThemeController _themeController = Get.find();

  bool value = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey, // Assign the key to Scaffold
      backgroundColor: AppColors.white,

      appBar: AppBar(
        backgroundColor: AppColors.white,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10, bottom: 10),
          child: Container(
            height: 40,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.black,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(AppAssets.eventLogo),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              print("Pressed");
              // Use the GlobalKey to access ScaffoldState and open the end drawer
              _scaffoldKey.currentState?.openEndDrawer();
            },
          ),
        ],
      ),
      endDrawer: Drawer(
        backgroundColor: AppColors.white,
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.dark_mode),
              title: Row(
                children: [
                  Text('Darck Mode'),
                  hsBox2,
                  Switch(
                      value: value,
                      onChanged: (val) {
                        setState(() {
                          value = !val;
                        });
                      })
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pushNamed(context, '/transactionsList');
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('LogOut'),
              onTap: () {
                Navigator.pushNamed(context, '/transactionsList');
              },
            ),
          ],
        ),
      ),
      body: pages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Widget buildMyNavBar(BuildContext context) {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(171, 127, 127, 127),
            offset: Offset(
              5.0,
              5.0,
            ),
            blurRadius: 20.0,
            spreadRadius: 2.0,
          ), //BoxShadow
          BoxShadow(
            color: Color.fromARGB(171, 127, 127, 127),
            offset: Offset(0.0, 0.0),
            blurRadius: 20.0,
            spreadRadius: 2.0,
          ), //BoxShadow
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 0;
              });
            },
            icon: pageIndex == 0
                ? Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.orange,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(5),
                      child: SizedBox(
                        width: 24,
                        height: 24,
                        child: Icon(
                          Icons.home_outlined,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  )
                : const Padding(
                    padding: EdgeInsets.all(5),
                    child: SizedBox(
                      width: 24,
                      height: 24,
                      child: Icon(
                        Icons.home_outlined,
                        color: AppColors.black,
                      ),
                    ),
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 1;
              });
            },
            icon: pageIndex == 1
                ? Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.orange,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(5),
                      child: SizedBox(
                        width: 24,
                        height: 24,
                        child: Icon(
                          Icons.favorite_outline,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  )
                : const Padding(
                    padding: EdgeInsets.all(5),
                    child: SizedBox(
                      width: 24,
                      height: 24,
                      child: Icon(
                        Icons.favorite_outline,
                        color: AppColors.black,
                      ),
                    ),
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 2;
              });
            },
            icon: pageIndex == 2
                ? Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.orange,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(5),
                      child: SizedBox(
                        width: 24,
                        height: 24,
                        child: Icon(
                          Icons.chat_outlined,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  )
                : const Padding(
                    padding: EdgeInsets.all(5),
                    child: SizedBox(
                      width: 24,
                      height: 24,
                      child: Icon(
                        Icons.chat_outlined,
                        color: AppColors.black,
                      ),
                    ),
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 3;
              });
            },
            icon: pageIndex == 3
                ? Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.orange,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(5),
                      child: SizedBox(
                        width: 24,
                        height: 24,
                        child: Icon(
                          Icons.person_outline,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  )
                : const Padding(
                    padding: EdgeInsets.all(5),
                    child: SizedBox(
                      width: 24,
                      height: 24,
                      child: Icon(
                        Icons.person_outline,
                        color: AppColors.black,
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
