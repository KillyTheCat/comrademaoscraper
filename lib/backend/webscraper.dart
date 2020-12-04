import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ScraperFunctions {
  // Pretend to be random user agents to trick Cloudfare
  final List<String> _webUserAgents = [
    "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36",
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36",
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36",
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.86 Safari/537.36",
    "Mozilla/5.0 (Windows NT 6.2; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36",
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36",
  ];

  final List<String> _mobileUserAgents = [
    "Mozilla/5.0 (Linux; Android 7.0; SM-G892A Build/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Mobile Safari/537.36",
    "Mozilla/5.0 (Linux; Android 6.0.1; SM-G920V Build/MMB29K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.98 Mobile Safari/537.36",
    "Mozilla/5.0 (Linux; Android 6.0.1; Nexus 6P Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.83 Mobile Safari/537.36",
    "Mozilla/5.0 (Linux; Android 7.1.1; G8231 Build/41.2.A.0.219; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/59.0.3071.125 Mobile Safari/537.36",
    "Mozilla/5.0 (Linux; Android 6.0.1; E6653 Build/32.2.A.0.253) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.98 Mobile Safari/537.36",
    'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)',
  ];

  Future<String> getBody({
    String siteType = 'boxnovel',
    String chapterTitle,
    String chapterNumber,
  }) async {
    String corsProxyAppend =
            (kIsWeb) ? 'https://cors-anywhere.herokuapp.com/' : '',
        urlString;

    if (siteType.compareTo('boxnovel') == 0)
      urlString =
          '${corsProxyAppend}https://web.scraper.workers.dev/?url=https%3A%2F%2F$siteType.com%2Fnovel%2F$chapterTitle%2Fchapter-$chapterNumber&selector=p&scrape=text&pretty=true';
    else if (siteType.compareTo('comrademao') == 0)
      urlString =
          '${corsProxyAppend}https://web.scraper.workers.dev/?url=https%3A%2F%2F$siteType.com%2Fmtl%2F$chapterTitle%2F$chapterTitle-chapter-$chapterNumber&selector=p&scrape=text&pretty=true';

    String content = '';
    try {
      List<String> _userAgents = (kIsWeb) ? _webUserAgents : _mobileUserAgents;
      Random randomizer = Random();
      http.Response response = await http.get(
        urlString,
        headers: {
          // Pretend to be random user agents to trick Cloudfare
          "User-Agent": _userAgents[randomizer.nextInt(_userAgents.length)],
        },
      );
      print(response.statusCode);

      if (response.statusCode == 200) {
        final query = json.decode(response.body);
        final List<dynamic> bodyElement = query['result']['p'];

        if (bodyElement == null || bodyElement.isEmpty)
          throw Exception('No content found!');

        // TODO: Cleanup. First lines are about Site and Last few lines contain fluff too.
        bodyElement.forEach((element) {
          if (element is String) {
            element = element.replaceAll(RegExp(r'&#8217;'), "'");
            element = element.replaceAll(RegExp(r'&#8220;'), '"');
            element = element.replaceAll(RegExp(r'&#8221;'), '"');
            element = element.replaceAll(RegExp(r'&#8211;'), '–');
            element = element.replaceAll(RegExp(r'&#8212;'), '—');
            content += '$element\n';
          }
        });
      } else if (response.statusCode == 503) {
        // DO YOUR THANG ASSHOLE
        // DO I REALLY NEED TO ANYMORE IDIOT
      } else {
        throw Exception('HTTP Request Failed! (${response.statusCode})');
      }
    } catch (e) {
      content = '${e.toString()}';
    }
    return content;
  }
}

ScraperFunctions scraperFunctions = ScraperFunctions();
// planning to put all the scraper functions in this file.
