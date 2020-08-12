import 'dart:convert';

import 'package:http/http.dart' as http;

import 'palette_data.dart';

typedef EufemiaPaletteLoader = Future<EufemiaPaletteData> Function();

Future<EufemiaPaletteData> paletteUrlLoader(String url,
    {Map<String, String> headers}) async {
  final data = await http.get(url, headers: headers);
  if (data.body != null) {
    return EufemiaPaletteData.fromJson(jsonDecode(data.body));
  }
  throw Exception('Palette url loading failed (${data.statusCode})');
}
