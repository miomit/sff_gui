import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:sff_gui/window.dart';
import 'package:yaru/yaru.dart';

import 'theme.dart';

Future<void> main() async {
  if (Platform.isLinux || Platform.isWindows) {
    await YaruWindowTitleBar.ensureInitialized();
  }

  WidgetsFlutterBinding.ensureInitialized();
  SemanticsBinding.instance.ensureSemantics();

  runApp(
    InheritedYaruVariant(
      child: const Window(),
    ),
  );
}
