import 'dart:io' show Platform;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
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
      child: const Home(),
    ),
  );
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return YaruTheme(
      data: YaruThemeData(
        variant: InheritedYaruVariant.of(context),
      ),
      builder: (context, yaru, child) {
        return MaterialApp(
          title: 'Yaru',
          debugShowCheckedModeBanner: false,
          theme: yaru.theme,
          darkTheme: yaru.darkTheme,
          highContrastTheme: yaruHighContrastLight,
          highContrastDarkTheme: yaruHighContrastDark,
          home: const MyHomePage(title: 'Flutter Demo Home Page'),
          scrollBehavior: const MaterialScrollBehavior().copyWith(
            dragDevices: {
              PointerDeviceKind.mouse,
              PointerDeviceKind.touch,
              PointerDeviceKind.stylus,
              PointerDeviceKind.unknown,
              PointerDeviceKind.trackpad,
            },
          ),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return YaruMasterDetailPage(
      length: 2,
      appBar: YaruWindowTitleBar(
        title: const Text('Yaru'),
        border: BorderSide.none,
        backgroundColor: YaruMasterDetailTheme.of(context).sideBarColor,
      ),
      tileBuilder: (context, index, selected, availableWidth) {
        if (index == 0) {
          return const YaruMasterTile(
            leading: Icon(YaruIcons.ubuntu_logo),
            title: Text('Page 1'),
          );
        } else {
          return const YaruMasterTile(
            leading: Icon(YaruIcons.colors),
            title: Text('Page 2'),
          );
        }
      },
      pageBuilder: (context, index) {
        if (index == 0) {
          return YaruDetailPage(
            appBar: YaruWindowTitleBar(
              backgroundColor: Colors.transparent,
              border: BorderSide.none,
              leading:
                  Navigator.canPop(context) ? const YaruBackButton() : null,
              title: const Text('Page 1'),
            ),
            body: const Center(
              child: Text('Hello Ubuntu'),
            ),
          );
        } else {
          return YaruDetailPage(
            appBar: YaruWindowTitleBar(
              backgroundColor: Colors.transparent,
              border: BorderSide.none,
              leading:
                  Navigator.canPop(context) ? const YaruBackButton() : null,
              title: const Text('Page 2'),
            ),
            body: const Center(
              child: Text('Hello Yaru'),
            ),
          );
        }
      },
    );
  }
}
