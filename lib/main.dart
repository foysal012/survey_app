import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:survey_app/view/screen/introduction_screen/introduction_screen.dart';
import 'package:survey_app/view/screen/splash_screen.dart';
import 'package:survey_app/viewmodel/introduction_controller.dart';
import 'package:survey_app/viewmodel/question_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // MobileAds.instance.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => QuestionController(),),
        ChangeNotifierProvider(create: (context) => IntroductionController(),)
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        // home: IntroductionScreen(),
      ),
    );
  }
}

