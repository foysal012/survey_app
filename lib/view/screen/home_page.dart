import 'package:flutter/material.dart';
import 'package:survey_app/resources/app_color.dart';
import 'package:survey_app/resources/app_style.dart';
import 'package:survey_app/view/screen/question_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage', style: AppStyle.boldTextStyle(fontSize: AppStyle.fontSize18, color: AppColor.appWhite)),
        backgroundColor: AppColor.primaryColor,
      ),
      body: Container(
        padding: AppStyle.padding(10.0),
        decoration: BoxDecoration(
          color: AppColor.appBackgroundColor
        ),
        child: Center(
          child: GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => QuestionPage())),
            child: Container(
              height: 30,
              width: 60,
              padding: AppStyle.padding(2.5),
              decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: AppStyle.radius(10.0)
              ),
              child: Text('Start', style: AppStyle.boldTextStyle(
                  fontSize: AppStyle.fontSize14,
                  color: AppColor.appWhite
              ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
