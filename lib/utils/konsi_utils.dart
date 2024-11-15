class KonsiUtils {
  static String? extractCepFromDescription(String description) {
    RegExp cepRegExp = RegExp(r'\d{5}-\d{3}');
    Match? match = cepRegExp.firstMatch(description);

    if (match != null) {
      return match.group(0);
    } else {
      return null;
    }
  }
}
