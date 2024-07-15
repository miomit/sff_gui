import 'dart:io';

import 'package:filesystem_picker/filesystem_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sff_gui/providers/checksum_provider.dart';
import 'package:yaru/yaru.dart';

class ChecksumPage extends StatefulWidget {
  const ChecksumPage({super.key});

  @override
  State<ChecksumPage> createState() => _ChecksumPageState();
}

class _ChecksumPageState extends State<ChecksumPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controllerPath = TextEditingController(
      text: context.read<ChecksumProvider>().pathToFile,
    );
    controllerPath.addListener(() {
      context.read<ChecksumProvider>().pathToFile = controllerPath.text;
    });
    return Column(
      children: [
        YaruSection(
          headline: const Text("Checksum Calculator"),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              YaruChoiceChipBar(
                selectedFirst: false,
                showCheckMarks: false,
                shrinkWrap: false,
                clearOnSelect: false,
                yaruChoiceChipBarStyle: YaruChoiceChipBarStyle.stack,
                labels: context
                    .watch<ChecksumProvider>()
                    .hashMethodChoices
                    .map((v) => Text(v.name))
                    .toList(),
                isSelected: context
                    .watch<ChecksumProvider>()
                    .hashMethodChoices
                    .map((v) => v.isSelect)
                    .toList(),
                onSelected:
                    context.read<ChecksumProvider>().onSelectHashMethods,
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                decoration: const InputDecoration(hintText: "path/to/file"),
                controller: controllerPath,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton.icon(
                    icon: const Icon(YaruIcons.document_open),
                    label: const Text("Open"),
                    onPressed: () async {
                      if (await FilesystemPicker.openDialog(
                        title: 'Save to folder',
                        context: context,
                        rootDirectory: Directory("/"),
                        fsType: FilesystemType.folder,
                        pickText: 'Save file to this folder',
                      )
                          case String text) {
                        controllerPath.text = text;
                      }
                    },
                  ),
                  TextButton(
                    onPressed: () {
                      //context.read<ChecksumProvider>().increment();
                    },
                    child: const Text("Calculate"),
                  ),
                ],
              ),
            ],
          ),
        ),
        for (int i = 0; i < 40; i++)
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: YaruSection(
              headline: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: Text(
                      "File Name",
                      overflow: TextOverflow.fade,
                      maxLines: 1,
                      softWrap: false,
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: YaruIconButton(
                        onPressed: () {},
                        icon: const Icon(
                          YaruIcons.trash,
                          color: YaruColors.red,
                        ),
                      )),
                ],
              ),
              child: Column(
                children: [
                  YaruTile(
                    title: const Text("md5"),
                    subtitle: const Text("8c160d222c3c808406927c970c979a3d"),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(YaruIcons.copy),
                    ),
                  ),
                  YaruTile(
                    title: const Text("sha512"),
                    subtitle: const Text(
                        "6aea8d760013c78b79628b77ac616a5519f8f4990cea8c5dd490f2f29a9d32e0b6593ed42d2532ce3937261e33ca121c98af3dd6466b5d193c8cff3f570a93f3"),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(YaruIcons.copy),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
