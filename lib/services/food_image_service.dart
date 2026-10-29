import 'dart:convert';
import 'package:http/http.dart' as http;

class FoodImageService {
  static const String _apiKey =
      String.fromEnvironment('PIXABAY_API_KEY');

  static final Map<String, String?> _cache = {};

  Future<String?> getImageUrl(String query) async {
    if (_cache.containsKey(query)) {
      return _cache[query];
    }
    if (_apiKey.isEmpty) {
      return null;
    }

    try {
      final uri = Uri.https(
        'pixabay.com',
        '/api/',
        {
          'key': _apiKey,
          'q': query,
          'image_type': 'photo',
          'safesearch': 'true',
          'per_page': '5',
        },
      );

      final response = await http.get(uri);

      if (response.statusCode != 200) {
        return null;
      }

      final data = jsonDecode(response.body);
      final hits = data['hits'] as List;

      if (hits.isEmpty) {
        _cache[query] = null;
        return null;
      }

      final imageUrl = hits.first['webformatURL'] as String?;
      _cache[query] = imageUrl;

      return imageUrl;
    } catch (e) {
      return null;
    }
  }
}