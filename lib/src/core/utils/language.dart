import 'package:recase/recase.dart';

/// Different types of casing for a string
enum CaseType {
  /// PascalCase
  pascal,

  ///Title Case
  title,

  /// Sentence case
  sentence,

  /// camelCase
  camel,

  ///CONSTANT_CASE
  constant,

  /// lowercase
  lower,
}

/// Convenience class for language-related methods
class Language {
  /// Recases the [value] string based on the [type] CaseType
  static String caseValue(String value, CaseType type) {
    switch (type) {
      case CaseType.sentence:
        return sentenceCase(value);
      case CaseType.title:
        return titleCase(value);
      case CaseType.constant:
        return constantCase(value);
      case CaseType.pascal:
        return pascalCase(value);
      case CaseType.camel:
        return camelCase(value);
      case CaseType.lower:
        return value.toLowerCase();
      default:
        return value;
    }
  }

  /// Returns the currency symbol for the given currency
  /// e.g. [NOK], [EUR] or [USD]
  static String currencySymbol(String currency) {
    switch (currency) {
      case 'NOK':
        return 'kr';
      case 'EUR':
        return '€';
      case 'USD':
        return '\$';
      default:
        return currency;
    }
  }

  /// Returns the string [s] as pascal case (PascalCase)
  static String pascalCase(String s) => ReCase(s).pascalCase;

  /// Returns the string [s] as constant case (CONSTANT_CASE)
  static String constantCase(String s) => ReCase(s).constantCase;

  /// Returns the string [s] as sentece case (Sentence case)
  static String sentenceCase(String s) => ReCase(s).sentenceCase;

  /// Returns the string [s] as title case (Title Case)
  static String titleCase(String s) => ReCase(s).titleCase;

  /// Returns the string [s] as camel case (camelCase)
  static String camelCase(String s) => ReCase(s).camelCase;
}
