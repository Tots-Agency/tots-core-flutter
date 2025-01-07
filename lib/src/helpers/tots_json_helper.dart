class TotsJsonHelper {

  static double toDouble(dynamic value) {
    if(value is double){
      return value;
    } else if(value is int){
      return value.toDouble();
    } else if(value is String){
      return double.parse(value);
    } else if(value is bool){
      return value == true ? 1.0 : 0.0;
    } else {
      return 0.0;
    }
  }

  static int toInt(dynamic value) {
    if(value is int){
      return value;
    } else if(value is String && value.isNotEmpty && value == 'null'){
      return 0;
    } else if(value is String && value.isNotEmpty){
      return int.parse(value);
    } else if(value is bool){
      return value == true ? 1 : 0;
    } else {
      return 0;
    }
  }

  static bool toBool(dynamic value) {
    if(value is bool){
      return value;
    } else if(value is int){
      return value == 1;
    } else if(value is String){
      return value == 'true';
    } else {
      return false;
    }
  }

  static toStringValue(dynamic value) {
    if(value is String){
      return value;
    } else if(value is int){
      return value.toString();
    } else if(value is double){
      return value.toString();
    } else {
      return '';
    }
  }

}