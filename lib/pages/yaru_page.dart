import 'package:flutter/material.dart';
import 'package:sff_gui/pages/checksum_page.dart';
import 'package:sff_gui/pages/compare_files_equality_page.dart';
import 'package:sff_gui/pages/home_page.dart';
import 'package:yaru/yaru.dart';

class YPage {
  String title;
  Widget? icon;
  Widget? Function() getChild;
  YPage({
    required this.title,
    required this.getChild,
    this.icon,
  });
}

class YaruPage extends StatelessWidget {
  YaruPage({super.key});

  final List<YPage> pageList = [
    YPage(
      title: "Home",
      getChild: () => const HomePage(),
    ),
    YPage(
      title: "Checksum",
      getChild: () => const ChecksumPage(),
    ),
    YPage(
      title: "CompareFilesEquality",
      getChild: () => const CompareFilesEqualityPage(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return YaruMasterDetailPage(
      length: pageList.length,
      appBar: YaruWindowTitleBar(
        title: const Text('SFF'),
        border: BorderSide.none,
        backgroundColor: YaruMasterDetailTheme.of(context).sideBarColor,
      ),
      tileBuilder: (context, index, selected, availableWidth) => YaruMasterTile(
        leading: pageList[index].icon,
        title: Text(pageList[index].title),
      ),
      pageBuilder: (context, index) => YaruDetailPage(
        appBar: YaruWindowTitleBar(
          backgroundColor: const Color.fromARGB(0, 241, 11, 11),
          border: BorderSide.none,
          leading: Navigator.canPop(context) ? const YaruBackButton() : null,
          title: Text(pageList[index].title),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            child: pageList[index].getChild(),
          ),
        ),
      ),
    );
  }
}
