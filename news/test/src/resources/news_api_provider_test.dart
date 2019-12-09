import 'package:news/src/resources/news_api_provider.dart';
import 'package:http/testing.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:test/test.dart';

void main() {
  test('FetchTopIds returns a list of ids', () async {
    final provider = NewsApiProvider();
    provider.client = MockClient((request) async {
      return Response(
        json.encode([1, 2, 3, 4]),
        200,
      );
    });
    final ids = await provider.fetchTopIds();
    expect(ids, [1, 2, 3, 4]);
  });

  test('Fetchitem return a item model', () async {
    final provider = NewsApiProvider();
    provider.client = MockClient((request) async {
      return Response(
        json.encode({
          'id': 123,
        }),
        200,
      );
    });

    final item = await provider.fetchItem(999);
    expect(item.id, 123);
  });
}
