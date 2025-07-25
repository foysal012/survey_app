import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:survey_app/services/ad_helper.dart';

class RewardAdScreen extends StatefulWidget {
  const RewardAdScreen({super.key});

  @override
  State<RewardAdScreen> createState() => _RewardAdScreenState();
}

class _RewardAdScreenState extends State<RewardAdScreen> {

  RewardedAd? _rewardedAd;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    RewardedAd.load(
        adUnitId: AdHelper.rewardedAdUnitId,
        request: AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (ad) {
            ad.fullScreenContentCallback = FullScreenContentCallback(
              onAdDismissedFullScreenContent: (ad){},
            );
            setState(() {
              _rewardedAd = ad;
            });
          },
          onAdFailedToLoad: (error) {
            debugPrint('Failed to load a rewarded ad: ${error.message}');
          },
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reward Ad Screen"),
      ),

      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.teal,
        ),
        child: Column(
          children: [
            GestureDetector(
                onTap:(){
                  _rewardedAd?.show(onUserEarnedReward: (ad, reward) {

                  });
                },
                child: Text('Tap Here')
            )
          ],
        ),
      ),
    );
  }
}
