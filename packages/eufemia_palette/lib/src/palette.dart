import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:eufemia_palette/src/palette_data.dart';

import 'loaders.dart';

class EufemiaPalette extends StatefulWidget {
  final EufemiaPaletteData data;
  final Widget child;
  final EufemiaPaletteLoader loader;
  final String preferenceKey;

  static const defaultPreferenceKey = 'eufemia_palette';

  const EufemiaPalette({
    Key key,
    this.data,
    this.loader,
    this.preferenceKey = defaultPreferenceKey,
    @required this.child,
  })  : assert(preferenceKey != null),
        super(key: key);

  EufemiaPalette.fromUrl({
    Key key,
    EufemiaPaletteData data,
    @required String url,
    Map<String, String> headers,
    String preferenceKey = defaultPreferenceKey,
    @required Widget child,
  }) : this(
          key: key,
          data: data,
          child: child,
          preferenceKey: preferenceKey,
          loader: () => paletteUrlLoader(url, headers: headers),
        );

  static EufemiaPaletteData of(BuildContext context) {
    final provider =
        context.dependOnInheritedWidgetOfExactType<EufemiaPaletteProvider>();
    if (provider == null) return EufemiaPaletteData.fallback();
    return provider.value;
  }

  static _EufemiaPaletteState _findState(BuildContext context) {
    final state = context.findAncestorStateOfType<_EufemiaPaletteState>();
    if (state == null) {
      throw Exception('No EufemiaPalette found in the widget tree');
    }
    return state;
  }

  static Future<void> updateFromUrl(
    BuildContext context,
    String url, {
    Map<String, String> headers,
    bool saveToPreferences = true,
  }) {
    return _findState(context).updateFromLoader(
      () => paletteUrlLoader(url, headers: headers),
      saveToPreferences: saveToPreferences,
    );
  }

  static Future<void> updateFromPreferences(BuildContext context) {
    return _findState(context).updateFromPreferences();
  }

  static Future<void> update(
    BuildContext context,
    EufemiaPaletteData palette, {
    bool saveToPreferences = true,
  }) {
    return _findState(context).update(
      palette,
      saveToPreferences: saveToPreferences,
    );
  }

  @override
  _EufemiaPaletteState createState() => _EufemiaPaletteState();
}

class _EufemiaPaletteState extends State<EufemiaPalette> {
  EufemiaPaletteData _data;

  @override
  void initState() {
    if (widget.data != null) {
      _data = widget.data;
    }

    _initAsync();
    super.initState();
  }

  Future<void> _initAsync() async {
    try {
      await updateFromPreferences();
    } catch (e) {
      print('Failed to load palette from preferences');
    }
    if (widget.loader != null) {
      await updateFromLoader(widget.loader);
    }
  }

  Future<void> update(
    EufemiaPaletteData palette, {
    bool saveToPreferences = true,
  }) async {
    if (saveToPreferences) {
      final json = jsonEncode(palette.toJson());
      final preferences = await SharedPreferences.getInstance();
      await preferences.setString(widget.preferenceKey, json);
    }
    setState(() => _data = palette);
  }

  Future<void> updateFromLoader(
    EufemiaPaletteLoader load, {
    bool saveToPreferences = true,
  }) async {
    final palette = await load();
    if (palette != null) {
      await update(
        palette,
        saveToPreferences: saveToPreferences,
      );
    }
  }

  Future<void> updateFromPreferences() async {
    final preferences = await SharedPreferences.getInstance();
    final json = preferences.getString(widget.preferenceKey);
    if (json != null) {
      final palette = EufemiaPaletteData.fromJson(jsonDecode(json));
      setState(() => _data = palette);
    }
  }

  @override
  Widget build(BuildContext context) {
    return EufemiaPaletteProvider(
      value: _data ?? EufemiaPaletteData.fallback(),
      child: widget.child,
    );
  }
}

class EufemiaPaletteProvider extends InheritedWidget {
  final EufemiaPaletteData value;

  EufemiaPaletteProvider({
    Key key,
    @required this.value,
    @required Widget child,
  })  : assert(value != null),
        super(child: child, key: key);

  @override
  bool updateShouldNotify(EufemiaPaletteProvider oldWidget) {
    return value != oldWidget.value;
  }
}
