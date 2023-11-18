class TotsStringHelper {

  static String convertToCamelCase(String input) {
    List<String> partes = input.split('_');
    String resultado = '';

    for (String parte in partes) {
      resultado += parte.isNotEmpty ? parte[0].toUpperCase() + parte.substring(1).toLowerCase() : '';
    }

    return resultado;
  }

}