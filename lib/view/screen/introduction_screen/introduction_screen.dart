import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:survey_app/resources/app_color.dart';
import 'package:survey_app/resources/app_style.dart';
import 'package:survey_app/viewmodel/introduction_controller.dart';

import '../../../resources/app_images.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {

  final _pageController = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<IntroductionController>(builder: (context, value, child) {
          return Stack(
            children: [
              PageView(
                controller: _pageController,
                children: [
                  Container(
                    color: Colors.red,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(AppImage.introImage1),
                          Text(
                            'RED PAGE',
                            style: TextStyle(
                              fontSize: 45,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.blue,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(AppImage.introImage2),
                          Text(
                            'BLUE PAGE',
                            style: TextStyle(
                              fontSize: 45,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.black,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(AppImage.introImage3),
                          Text(
                            'BLACK PAGE',
                            style: TextStyle(
                              fontSize: 45,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.yellow,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(AppImage.introImage4),
                          Text(
                            'YELLOW PAGE',
                            style: TextStyle(
                              fontSize: 45,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.teal,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(AppImage.introImage5),
                          Text(
                            'TEAL PAGE',
                            style: TextStyle(
                              fontSize: 45,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.purple,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(AppImage.introImage6),
                          Text(
                            'PURPLE PAGE',
                            style: TextStyle(
                              fontSize: 45,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              Positioned(
                  bottom: 30,
                  left: 102,
                  right: 78,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: (){
                            if(value.currentIndex>0){
                              value.setCurrentIndex(value.currentIndex-1);
                            _pageController.jumpToPage(value.currentIndex-1);
                            }
                          },
                          icon: Icon(Icons.arrow_back, color: Colors.white, size: 30)
                      ),

                      SizedBox(
                        height: 20,
                        width: 135,
                        child: ListView.builder(
                            itemCount: 6,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: (){
                                  value.setCurrentIndex(index);
                                  _pageController.jumpToPage(value.currentIndex);
                                },
                                child: Container(
                                  height: 5,
                                  width: value.currentIndex == index ? 30 : 15,
                                  margin: EdgeInsets.only(right: 5.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: value.currentIndex == index ? Colors.deepOrangeAccent : Colors.white
                                  ),
                                ),
                              );
                            }
                        ),
                      ),

                      IconButton(
                          onPressed: (){
                            value.setCurrentIndex(value.currentIndex+1);
                            _pageController.jumpToPage(value.currentIndex+1);
                          },
                          icon: Icon(Icons.arrow_forward, color: Colors.white, size: 30)
                      )
                    ],
                  )
              ),
              
              Positioned(
                  top: 30,
                  right: 20,
                  child: GestureDetector(
                    onTap: (){
                      _pageController.jumpToPage(5);
                    },
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.amber
                  ),
                  child: Text('Skip',
                  style: AppStyle.boldTextStyle(
                    color: AppColor.appWhite
                  ),
                  ),
                ),
              ))
            ],
          );
        },)
    );
  }
}
