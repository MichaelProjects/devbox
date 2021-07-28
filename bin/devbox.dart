import 'dart:io';

import 'script.dart';

String scirptPath = '/usr/local/bin/devbox';
String scirptsFolder = '/storage';

void main(List<String> args) async {
  await createDirs();
  parseArgs(args);
}

void parseArgs(List<String> args) {
  var counter = 0;
  for (var x in args) {
    if (x.trim() == '-help') {
      print('-store   add another scirpt to the storage');
      print('-exe     to execute a given scirpt');
    }
    if (x.trim() == '-store') {
      storeScirpt("$scirptPath$scirptsFolder");
    }
    if (x.trim() == '-exe') {
      executeScirpt();
    }
    counter += 1;
  }
}

void createDirs() async {
  var a =
      await new Directory(scirptPath + scirptsFolder).create(recursive: true);
}
