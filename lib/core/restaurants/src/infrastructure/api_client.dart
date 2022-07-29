import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:utils/http.dart';

@injectable
class ApiClient {
  ApiClient();

  Future<List> getRestaurants() {
    // const endpointUrl = 'api.yelp.com';
    final endpointUrl =
        Uri.parse('https://api.yelp.com/v3/businesses/search?location=london');

    const apiKey =
        'zpuKTByC5TcnFXktUXvjIDpMSaT1bsU3O4MrO8R7OfibVQTgeBAzXw4zSeyRa7UEBoE8YDmvFuDJvR802L86BcU3pCzv6-1azS9MjFNmGbl3QFiBgzwyRJGuokPkYnYx';

    // final queryString = Uri.https(endpointUrl, '/v3/businesses/search');

    return get(endpointUrl, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $apiKey',
    }).mapResponse((response) {
      print(jsonDecode(response.body)['businesses']);
      return jsonDecode(response.body)['businesses'];
    });
  }
}
