import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:survey_app/resources/app_color.dart';
import 'package:survey_app/resources/app_style.dart';
import 'package:survey_app/services/ad_helper.dart';
import 'package:survey_app/view/screen/question_page.dart';
import 'package:survey_app/view/screen/reward_ad_screen.dart';
import 'interstitial_ad_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  BannerAd? _bannerAd;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _bannerAd = ad as BannerAd;
          });
        },
        onAdFailedToLoad: (ad, error) {
          debugPrint('Failed to load a banner ad: ${error.message}');
          ad.dispose();
        },
      )
    ).load();
  }

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
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
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
                        textAlign: TextAlign.center
                      ),
                    ),
                  ),
                  AppStyle.gap(10.0),

                  GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => RewardAdScreen())),
                    child: Container(
                      height: 30,
                      width: 60,
                      padding: AppStyle.padding(2.5),
                      decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius: AppStyle.radius(10.0)
                      ),
                      child: Text('Reward Add', style: AppStyle.boldTextStyle(
                          fontSize: AppStyle.fontSize14,
                          color: AppColor.appWhite
                      ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if(_bannerAd != null)
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: _bannerAd?.size.height.toDouble(),
                width: _bannerAd?.size.width.toDouble(),
                child: AdWidget(ad: _bannerAd!),
              ),
            )
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
          onPressed: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context) => InterstitialAdScreen())),
          child: Icon(Icons.near_me),
      ),
    );
  }
}
