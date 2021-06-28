import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

const double WIDTH = 500.0;
const double HEIGHT = 500.0;

class BannerAdWidget extends StatefulWidget {
  @override
  _BannerAdWidgetState createState() => _BannerAdWidgetState();
}

class _BannerAdWidgetState extends State<BannerAdWidget> {
  final BannerAd myBanner = BannerAd(
    adUnitId: BannerAd.testAdUnitId,
    size: AdSize.banner,
    request: AdRequest(),
    listener: BannerAdListener(),
  );
  AdWidget _adWidget;
  Container _adContainer;

  _BannerAdWidgetState() {
    _adWidget = AdWidget(ad: myBanner);
    _adContainer = Container(
      alignment: Alignment.center,
      child: _adWidget,
      width: WIDTH,
      height: HEIGHT,
    );
  }

  @override
  void initState() {
    super.initState();

    myBanner..load();
  }

  @override
  void dispose() {
    myBanner..dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => _adContainer;
}
