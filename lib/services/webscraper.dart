import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;
import 'package:beautifulsoup/beautifulsoup.dart' as bs;

Future<List> getBooks(String url, String chapternumber) async {
  final response =
      await http.get('https://boxnovel.com/novel/$url/chapter-$chapternumber');

  var soup = bs.Beautifulsoup(response.body);
  final String content = soup.get_text();
  print(content);
}

// planning to put all the scraper functions in this file.