import 'package:flutter_test/flutter_test.dart';
import 'package:radio_app/helpers/api.dart';

void main() {
  group('App connects to Bando Radio API', () {
    test('get status code 200', () async {
      await expectLater(ApiHelper.getRadiosByCountry(), completion(200));
    });
  });
}
