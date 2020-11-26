import 'package:http/http.dart';
import 'package:html/parser.dart' show parse;

Future<String> getBody({
  String siteType = 'boxnovel',
  String chapterTitle,
  String chapterNumber,
}) async {
  String urlString, bodyObjectName;
  if (siteType.compareTo('boxnovel') == 0) {
    urlString =
        'https://boxnovel.com/novel/$chapterTitle/chapter-$chapterNumber';
    bodyObjectName = 'chapter-entity';
  } else if (siteType.compareTo('comrademao') == 0) {
    urlString =
        'https://comrademao.com/mtl/$chapterTitle/$chapterTitle-chapter-$chapterNumber/';
    bodyObjectName = 'site-main';
  }
  Response response = await get(urlString);

  var soup = parse(response.body);
  final query = soup.querySelector('html');
  final dynamic bodyElements = query.getElementsByClassName(bodyObjectName);
  dynamic bodyElement = bodyElements[0];

  String content = 'Error: No Text Recieved';
  if (bodyElement.hasContent()) content = bodyElement.text;
  return content;
}

// planning to put all the scraper functions in this file.
