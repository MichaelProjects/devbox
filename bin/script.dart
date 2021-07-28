import 'dart:io';

String scirptPath = '/usr/local/bin/devbox';
String scirptsFolder = '/storage';

void deployScirpt() {
  print('Please enter scirpt name, it needs to be in the current directory.');
  var name = stdin.readLineSync();
  var dir = Directory.current;
  var file = File(dir.toString() + name);
}

void storeScirpt(String pathDir) async {
  print('Please enter scirpt name, it needs to be in the current directory.');
  var name = stdin.readLineSync();
  var dir = Directory.current;
  var file = File(dir.toString() + name);
  var newName = name.split('.').first;
  var x = await Process.run('dart', ['compile', 'exe', '$name']);
  var y = await Process.run('mv', ['${newName}.exe', "$pathDir/."]);
  print(y.stderr);
}

getScirpts() async {
  var dir = Directory('$scirptPath$scirptsFolder');
  var x = await dir.list(recursive: true);
  print(x.last);
  var scirptNames = [];
  await x.forEach((abc) => {print(abc), scirptNames.add(abc.path)});
  return scirptNames;
}

void executeScirpt() async {
  print('List of executeable:');
  var scripts = getScirpts();
  print('-----------');
  print('Wirte scirpt that you want to execute');
  var name = stdin.readLineSync();
  for (var x in scripts) {
    if (x.trim() == name) {
      await Process.run('./${scirptPath}/$scirptsFolder/$name', []);
    }
  }
}

void refreshStorage() async {}
