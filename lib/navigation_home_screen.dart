import 'package:painter/app_theme.dart';
import 'package:painter/custom_drawer/drawer_user_controller.dart';
import 'package:painter/custom_drawer/home_drawer.dart';
import 'package:painter/feedback_screen.dart';
import 'package:painter/help_screen.dart';
import 'package:painter/home_screen.dart';
import 'package:painter/invite_friend_screen.dart';
import 'package:painter/ad_test_screen.dart';
import 'package:flutter/material.dart';

class NavigationHomeScreen extends StatefulWidget {
  @override
  _NavigationHomeScreenState createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  Widget? screenView;
  DrawerIndex? drawerIndex;

  @override
  void initState() {
    drawerIndex = DrawerIndex.HOME;
    screenView = const MyHomePage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.white,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: AppTheme.nearlyWhite,
          body: DrawerUserController(
            screenIndex: drawerIndex,
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            onDrawerCall: (DrawerIndex drawerIndexdata) {
              changeIndex(drawerIndexdata);
              //callback from drawer for replace screen as user need with passing DrawerIndex(Enum index)
            },
            screenView: screenView,
            //we replace screen view as we need on navigate starting screens like MyHomePage, HelpScreen, FeedbackScreen, etc...
          ),
        ),
      ),
    );
  }

  // 导航栏
  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      switch (drawerIndex) {
        // 首页
        case DrawerIndex.HOME:
          setState(() {
            screenView = const MyHomePage();
          });
          break;

        // 帮助
        case DrawerIndex.Help:
          setState(() {
            screenView = HelpScreen();
          });
          break;

        // 反馈
        case DrawerIndex.FeedBack:
          setState(() {
            screenView = FeedbackScreen();
          });
          break;

        // 邀请
        case DrawerIndex.Invite:
          setState(() {
            screenView = InviteFriend();
          });
          break;

        // 广告测试
        case DrawerIndex.AdTest:
          setState(() {
            screenView = AdTest();
          });
          break;

        default:
          break;
      }
    }
  }
}
