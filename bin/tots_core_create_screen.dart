//import 'package:flutter_launcher_icons/constants.dart';
//import 'package:flutter_launcher_icons/main.dart' as flutter_launcher_icons;
import 'dart:io';

import 'package:tots_core/src/helpers/tots_string_helper.dart';

void main(List<String> arguments) {

  String controllerFile = '''
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class {{className}}Controller extends ChangeNotifier {

  final BuildContext context;

  {{className}}Controller(this.context);
}
''';

  String screenFile = '''
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class {{className}}Screen extends StatefulWidget {
  const {{className}}Screen({super.key});

  @override
  State<{{className}}Screen> createState() => _{{className}}ScreenState();

}

class _{{className}}ScreenState extends State<{{className}}Screen> {

  @override
  Widget build(BuildContext context) {
    return Consumer<{{className}}Controller>(
      builder: (context, controller, child) {
        
      },
    );
  }

}
''';

  String folderScreens = 'lib/screens/${arguments[0]}';
  String pathFullController = '$folderScreens/${arguments[0]}_controller.dart';
  String pathFullScreen = '$folderScreens/${arguments[0]}_screen.dart';

  // Intentar crear el archivo
  try {
    // Crea la carpeta si no existe
    Directory(folderScreens).createSync(recursive: true);

    // Create controller
    String controllerFileReplaced = controllerFile.replaceAll('{{className}}', TotsStringHelper.convertToCamelCase(arguments[0]));
    File(pathFullController).writeAsStringSync(controllerFileReplaced);

    // Create screen file
    String screenFileReplaced = screenFile.replaceAll('{{className}}', TotsStringHelper.convertToCamelCase(arguments[0]));
    File(pathFullScreen).writeAsStringSync(screenFileReplaced);

    print('Screen generated!');
  } catch (e) {
    print('Error al crear el archivo: $e');
  }
}