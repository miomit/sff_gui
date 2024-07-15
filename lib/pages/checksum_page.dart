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
        for (var res in context.watch<ChecksumProvider>().resList)
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: YaruSection(
              headline: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      res.file.path,
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
                  for (var hashRes in res.checksumMap.entries)
                    YaruTile(
                      title: Text(hashRes.key.toString()),
                      subtitle: Text(hashRes.value.toString()),
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
