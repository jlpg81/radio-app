import 'package:http/http.dart' as http;

String uri = 'bando-radio-api.p.rapidapi.com';

class ApiHelper {
  // The api call is disconnected. Please check the readme to understand why.
  static Future getRadiosByCountry() async {
    var url = Uri.https(uri, 'stations/bycountry/au');
    var response = await http.get(url, headers: {
      'X-RapidAPI-Key': '8b86a85b5dmshe61bd872bde8bb8p1691aejsnf1677b526eaf1',
      'X-RapidAPI-Host': 'bando-radio-api.p.rapidapi.com',
    });

    if (response.statusCode == 200) {
      return response.statusCode;
    } else {
      return response.statusCode;
    }
  }
}
