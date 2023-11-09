import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BookBanner extends StatefulWidget {
  const BookBanner({super.key});

  @override
  BookBannerState createState() => BookBannerState();
}

class BookBannerState extends State<BookBanner> {
  BannerAd? _bannerAd;

  final String _adUnitId = Platform.isAndroid
      ? true // test advertisements? true for test, false for making money
          ? 'ca-app-pub-3940256099942544/6300978111'
          // ignore: dead_code
          : 'ca-app-pub-2189583625067617/7466268659'
      : 'ca-app-pub-3940256099942544/2934735716';

  /// Loads and shows a banner ad.
  ///
  /// Dimensions of the ad are determined by the AdSize class.
  void _loadAd() async {
    BannerAd(
      adUnitId: _adUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (ad) {
          setState(() {
            _bannerAd = ad as BannerAd;
          });
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (ad, err) {
          ad.dispose();
        },
      ),
    ).load();
  }

  @override
  void initState() {
    super.initState();
    _loadAd();
  }

  @override
  Widget build(BuildContext context) {
    if (_bannerAd == null) {
      return const Text('');
    }

    return SizedBox(
      width: _bannerAd!.size.width.toDouble(),
      height: 50,
      child: AdWidget(ad: _bannerAd!),
    );
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }
}
