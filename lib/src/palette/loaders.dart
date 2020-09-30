import 'dart:convert';

import 'package:http/http.dart' as http;

import 'palette_data.dart';

/// {@category Palette}
/// Type definition for an [EufemiaPaletteLoader]
typedef EufemiaPaletteLoader = Future<EufemiaPaletteData> Function();

/// {@category Palette}
/// Loads [EufemiaPaletteData] from the given [url]
Future<EufemiaPaletteData> paletteUrlLoader(String url,
    {Map<String, String> headers}) async {
  final data = await http.get(url, headers: headers);
  if (data.body != null) {
    return EufemiaPaletteData.fromJson(jsonDecode(data.body));
  }
  throw Exception('Palette url loading failed (${data.statusCode})');
}
