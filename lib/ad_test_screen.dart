import 'package:painter/app_theme.dart';
import 'package:flutter/material.dart';

class AdTest extends StatefulWidget {
  @override
  _AdTestState createState() => _AdTestState();
}

class _AdTestState extends State<AdTest> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isLightMode = brightness == Brightness.light;

    return Container(
      color: isLightMode ? AppTheme.white : AppTheme.nearlyBlack,
      child: SafeArea(
          top: false,
          child: Scaffold(
              backgroundColor:
                  isLightMode ? AppTheme.white : AppTheme.nearlyBlack,
              body: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top,
                        left: 16,
                        right: 16),
                    child: Image.asset('assets/images/inviteImage.png'),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      'It\'s a Ad Test Screen',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: isLightMode ? Colors.black : Colors.white,
                      ),
                    ),
                  ),
                ],
              ))),
    );
  }
}
