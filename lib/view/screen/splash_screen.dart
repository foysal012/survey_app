import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:survey_app/resources/app_color.dart';
import 'package:survey_app/resources/app_style.dart';
import 'package:survey_app/view/screen/home_page.dart';

import 'introduction_screen/introduction_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  String? version;
  String? appName;
  String? packageName;
  String? buildNumber;

  Future<void> getAppInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    appName = packageInfo.appName;
    packageName = packageInfo.packageName;
    version = packageInfo.version;
    buildNumber = packageInfo.buildNumber;
    debugPrint('AppName: $appName');
    debugPrint('App Package Name: $packageName');
    debugPrint('App Version: $version');
    debugPrint('App Build Number: $buildNumber');
    debugPrint('App Package Info: $packageInfo');
  }

  Future<void> getNavigation() async {
   await Future.delayed(Duration(seconds: 3));
   // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomePage()), (route) => false);
   Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => IntroductionScreen()), (route) => false);
  }

  @override
  void initState() {
    super.initState();
    getAppInfo();
    getNavigation();
  }



  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        color: AppColor.primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50.0,
              backgroundColor: AppColor.appBackgroundColor,
              child: Text('SA',
                style: TextStyle(
                    fontSize: 28,
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic
                ),
              ),
            ),
            AppStyle.gap(10.0),

            Text('Survey App',
              style: AppStyle.boldTextStyle(
                  fontSize: AppStyle.fontSize18,
                  color: AppColor.appWhite
              ),
            ),
            AppStyle.gap(250.0),

            CupertinoActivityIndicator(
              radius: 15.0,
              color: AppColor.appWhite,
            ),
            AppStyle.gap(20.0),

            Text('Version: ${version ?? '1.0.0'}',
              style: AppStyle.boldTextStyle(
                  fontSize: AppStyle.fontSize16,
                  color: AppColor.appWhite
              ),
            ),
            AppStyle.gap(5.0),

            Text('Design & Develop by',
              style: AppStyle.boldTextStyle(
                  fontSize: AppStyle.fontSize12,
                  color: AppColor.appWhite
              ),
            ),

            Text('Foysal Joarder',
              style: AppStyle.boldTextStyle(
                  fontSize: AppStyle.fontSize18,
                  color: AppColor.appWhite
              ),
            ),

            AppStyle.gap(40.0)
          ],
        ),
      ),
    );
  }
}
