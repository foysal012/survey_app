
import 'dart:io';

class AdHelper {
  static String get bannerAdUnitId {
    if(Platform.isAndroid){
      return 'ca-app-pub-9093812169385004/2784713845';
    } else if( Platform.isIOS) {
      return '<Your_IOS_BANNER_AD_ID>';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }
}