import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class Translations {
  Translations(Locale locale) {
    this.locale = locale;
    _localizedValues = {};
  }

  Locale locale;
  static Map<String, dynamic> _localizedValues;

  static Translations of(BuildContext context) {
    return Localizations.of<Translations>(context, Translations);
  }

  String get(String key, [List replacements]) {
    return _getTranslation(key, replacements);
  }

  String _getTranslation(String key, [List replacements]) {
    String stringValue = _localizedValues[key] ?? '#$key not found#';
    replacements?.forEach((value) {
      stringValue = stringValue.replaceFirst(RegExp("%s%"), value);
    });

    return stringValue;
  }

  static Future<Translations> load(Locale locale) async {
    Translations translations = Translations(locale);
    String jsonContent =
        await rootBundle.loadString("res/locales/${locale.languageCode}.json");
    _localizedValues = json.decode(jsonContent);
    return translations;
  }

  get currentLanguage => locale.languageCode;
}

class TranslationsDelegate extends LocalizationsDelegate<Translations> {
  const TranslationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'fr'].contains(locale.languageCode);

  @override
  Future<Translations> load(Locale locale) => Translations.load(locale);

  @override
  bool shouldReload(TranslationsDelegate old) => false;
}
