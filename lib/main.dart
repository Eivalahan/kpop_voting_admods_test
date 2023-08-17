import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:kpop_voting_test/home_page.dart';
import 'package:kpop_voting_test/banner_ad_page.dart';
import 'package:kpop_voting_test/interstitial_ad_page.dart';

List<String> testDeviceIds = ['614BF64655476E8DD9A225BCAACAFDE3'];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  RequestConfiguration configuration =
      RequestConfiguration(testDeviceIds: testDeviceIds);
  MobileAds.instance.updateRequestConfiguration(configuration);
  runApp(
    MaterialApp(
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => const HomeRoute(),
        '/banner_ad_page': (BuildContext context) => const BannerAdPage(),
        '/interstitial_ad_page':(BuildContext context)=> const InterstitialAdPage(),
      },
    ),
  );
}
