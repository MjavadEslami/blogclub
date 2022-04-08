import 'dart:ui';

import 'package:blogclub/article.dart';
import 'package:blogclub/gen/assets.gen.dart';
import 'package:blogclub/gen/fonts.gen.dart';
import 'package:blogclub/home.dart';
import 'package:blogclub/onBording.dart';
import 'package:blogclub/profile.dart';
import 'package:blogclub/splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const primeryTextColor = Color(0xff0D253c);
    const secendryTextColor = Color(0xff2D4379);
    const primaryColor = Color(0xff376AED);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: const ColorScheme.light(
            primary: primaryColor,
            onPrimary: Colors.white,
            onSurface: primeryTextColor,
            surface: Colors.white,
            background: Color(0xffFBFCFF),
            onBackground: primeryTextColor),
        textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
                textStyle: MaterialStateProperty.all(const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: FontFamily.aviner)))),
        textTheme: const TextTheme(
          headline6: TextStyle(
              fontFamily: FontFamily.aviner,
              fontWeight: FontWeight.bold,
              color: primeryTextColor,
              fontSize: 18),
          headline5: TextStyle(
              fontFamily: FontFamily.aviner,
              fontWeight: FontWeight.w700,
              color: primeryTextColor,
              fontSize: 20),
          headline4: TextStyle(
            fontFamily: FontFamily.aviner,
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: primeryTextColor,
          ),
          subtitle1: TextStyle(
            fontFamily: FontFamily.aviner,
            color: secendryTextColor,
            fontWeight: FontWeight.w200,
            fontSize: 18,
          ),
          subtitle2: TextStyle(
            fontFamily: FontFamily.aviner,
            color: primeryTextColor,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
          bodyText2: TextStyle(
              fontFamily: FontFamily.aviner,
              color: secendryTextColor,
              fontSize: 16),
          bodyText1: TextStyle(
              fontFamily: FontFamily.aviner,
              color: primeryTextColor,
              fontSize: 14),
          caption: TextStyle(
              fontFamily: FontFamily.aviner,
              fontWeight: FontWeight.w700,
              color: Color(0xff7B8BB2),
              fontSize: 10),
        ),
        appBarTheme: const AppBarTheme(
          titleSpacing: 32,
          backgroundColor: Colors.white,
          foregroundColor: primeryTextColor,
        ),
      ),
      // home: Stack(
      //   children: [
      //     const Positioned.fill(child: HomeScreen()),
      //     Positioned(
      //       bottom: 0,
      //       left: 0,
      //       right: 0,
      //       child: _BottomNavigation(),
      //     ),
      //   ],
      // ),
      home: const SplashScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

const int homeIndex = 0;
const int articleIndex = 1;
const int searchIndex = 2;
const int profileIndex = 3;
const double bottomNavigationHeight = 65;

class _MainScreenState extends State<MainScreen> {
  int selectedTabIndex = homeIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            bottom: bottomNavigationHeight,
            child: IndexedStack(
              index: selectedTabIndex,
              children: const [
                HomeScreen(),
                ArticleScreen(),
                SearchScreen(),
                ProfileScreen()
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _BottomNavigation(
              selectedIndex: selectedTabIndex,
              onSelectedTab: (int index) {
                setState(() {
                  selectedTabIndex = index;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomNavigation extends StatelessWidget {
  final Function(int index) onSelectedTab;
  final int selectedIndex;

  const _BottomNavigation(
      {Key? key, required this.onSelectedTab, required this.selectedIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: bottomNavigationHeight,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: const Color(0xff9B8487).withOpacity(0.3),
                )
              ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _BottomNavigationIteam(
                    iconFileName: "h.png",
                    activeIconFileName: "h-a.png",
                    tiitle: "home",
                    isActive: selectedIndex == homeIndex ? true : false,
                    OnTap: () {
                      onSelectedTab(homeIndex);
                    },
                  ),
                  _BottomNavigationIteam(
                    iconFileName: "a.png",
                    activeIconFileName: "a-a.png",
                    tiitle: "article",
                    isActive: selectedIndex == articleIndex ? true : false,
                    OnTap: () {
                      onSelectedTab(articleIndex);
                    },
                  ),
                  Expanded(child: Container()),
                  _BottomNavigationIteam(
                    iconFileName: "s.png",
                    activeIconFileName: "s-a.png",
                    tiitle: "search",
                    isActive: selectedIndex == searchIndex ? true : false,
                    OnTap: () {
                      onSelectedTab(searchIndex);
                    },
                  ),
                  _BottomNavigationIteam(
                    iconFileName: "m.png",
                    activeIconFileName: "m-a.png",
                    tiitle: "menu",
                    isActive: selectedIndex == profileIndex ? true : false,
                    OnTap: () {
                      onSelectedTab(profileIndex);
                    },
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              width: 65,
              height: 85,
              alignment: Alignment.topCenter,
              child: Container(
                  height: 65,
                  decoration: BoxDecoration(
                      color: Color(0xff376AED),
                      borderRadius: BorderRadius.circular(32.5),
                      border: Border.all(
                        color: Colors.white,
                        width: 4,
                      )),
                  child: Image.asset('assets/img/icons/plus.png')),
            ),
          )
        ],
      ),
    );
  }
}

class _BottomNavigationIteam extends StatelessWidget {
  final String iconFileName;
  final String activeIconFileName;
  final String tiitle;
  final bool isActive;
  final Function() OnTap;

  const _BottomNavigationIteam(
      {Key? key,
      required this.iconFileName,
      required this.activeIconFileName,
      required this.tiitle,
      required this.OnTap,
      required this.isActive})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: OnTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/img/icons/${isActive ? activeIconFileName : iconFileName}',
              width: 24,
              height: 24,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              tiitle,
              style: Theme.of(context).textTheme.caption!.apply(
                    color: isActive
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).textTheme.caption!.color,
                  ),
            )
          ],
        ),
      ),
    );
  }
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('search screen')),
    );
  }
}
