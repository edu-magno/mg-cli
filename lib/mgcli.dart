import 'dart:io';

import 'menu.dart';
import 'template_options.dart';
import './extensions.dart';

exec() async {
  stdout.write('Digite o nome do arquivo (utilize snake_case)');
  String? fileName = stdin.readLineSync();

  final menu = Menu(
    options,
    stdin: stdin,
    stdout: stdout,
  );

  final optionSelected = menu.choose().value;
  stdout.write(optionSelected);

  final filePath = '${Directory.current.path}/${fileName}_$optionSelected.dart';

  final file = await File(filePath).create();

  final snakeToPascal = fileName.snakeCasetoSentenceCase() ?? '';

  await file.writeAsString(await getTemplate(
      template: optionSelected, templateClassName: snakeToPascal));
}

Future<String> getTemplate({
  required String template,
  required String templateClassName,
}) async {
  final t = await File('../lib/templates/$template.dart').readAsString();

  return t.replaceAll('Filename', templateClassName);
}
