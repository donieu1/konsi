class Validators {
 
  bool _validateCep(String value) {
    final RegExp regExp = RegExp(r'^\d{5}-?\d{3}$');
    return regExp.hasMatch(value);
  }

  String? cep(String? value) {
    if (value == null || value.isEmpty) {
      return 'O CEP é obrigatório.';
    }

    final String onlyDigits = value.replaceAll('-', '');
    if (onlyDigits.length != 8) {
      return 'O CEP deve conter exatamente 8 dígitos.';
    }

    if (!_validateCep(value)) {
      return 'O CEP está incorreto. Digite um CEP válido (ex: 12345-678 ou 12345678).';
    }
    return null;
  }
}
