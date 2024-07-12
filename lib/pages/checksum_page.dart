import 'package:flutter/material.dart';
import 'package:yaru/yaru.dart';

class ChecksumPage extends StatefulWidget {
  const ChecksumPage({super.key});

  @override
  State<ChecksumPage> createState() => _ChecksumPageState();
}

class _ChecksumPageState extends State<ChecksumPage> {
  final _labels = [
    "md5",
    "sha1",
    "sha224",
    "sha256",
    "sha384",
    "sha512",
    "sha512224",
    "sha512256",
  ];

  late List<bool> _isSelected;

  @override
  void initState() {
    super.initState();
    _isSelected = List.generate(_labels.length, (index) => false);
    _isSelected[1] = true;
  }

  @override
  Widget build(BuildContext context) {
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
                labels: _labels.map(Text.new).toList(),
                isSelected: _isSelected,
                onSelected: (index) => setState(() {
                  _isSelected[index] = !_isSelected[index];
                }),
              ),
              const SizedBox(
                height: 10,
              ),
              const TextField(
                decoration: InputDecoration(
                  hintText: "path/to/file",
                ),
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
                    onPressed: () {},
                  ),
                  TextButton(
                    onPressed: () {},
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
