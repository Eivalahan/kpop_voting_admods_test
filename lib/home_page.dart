import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomeRoute extends StatefulWidget {
  const HomeRoute({super.key});

  @override
  State<HomeRoute> createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder<void>(
        future: _initGoogleMobileAds(),
        builder: (BuildContext context, AsyncSnapshot<void> snapShot) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Google Mod Ads Test with Test ID",
                  style: TextStyle(fontSize: 32),
                  textAlign: TextAlign.center,
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 72),
                ),
                if (snapShot.hasData)
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).hintColor,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/banner_ad_page');
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 48.0,
                        vertical: 12.0,
                      ),
                      child: Text('Banner Ad'),
                    ),
                  )
                else if (snapShot.hasError)
                  const Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 60,
                  )
                else
                  const SizedBox(
                    width: 48,
                    height: 48,
                    child: CircularProgressIndicator(),
                  ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).hintColor,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/interstitial_ad_page');
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 48.0,
                      vertical: 12.0,
                    ),
                    child: Text('Interstitial Ad'),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  // TODO: Change return type to Future<InitializationStatus>
  Future<InitializationStatus> _initGoogleMobileAds() {
    // TODO: Initialize Google Mobile Ads SDK
    return MobileAds.instance.initialize();
  }
}
