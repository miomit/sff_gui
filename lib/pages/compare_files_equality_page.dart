import 'package:flutter/material.dart';
import 'package:yaru/yaru.dart';

class CompareFilesEqualityPage extends StatelessWidget {
  const CompareFilesEqualityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        YaruSection(
          headline: const Text("Compare Files"),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "path/to/file",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: ElevatedButton.icon(
                      icon: const Icon(YaruIcons.document_open),
                      label: const Text("Open"),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "path/to/file",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: ElevatedButton.icon(
                      icon: const Icon(YaruIcons.document_open),
                      label: const Text("Open"),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text("Compare"),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: YaruSection(
            headline: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: Row(
                    children: [
                      Text(
                        "Equal: ",
                        overflow: TextOverflow.fade,
                        maxLines: 1,
                        softWrap: false,
                      ),
                      Text(
                        "Yes",
                        overflow: TextOverflow.fade,
                        maxLines: 1,
                        softWrap: false,
                        style: TextStyle(
                          color: YaruColors.olive,
                        ),
                      ),
                    ],
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
            child: const Column(
              children: [
                YaruTile(
                  title: Text("File 1"),
                  subtitle: Text("file_name_1.jpg"),
                ),
                YaruTile(
                  title: Text("File 2"),
                  subtitle: Text("file_name_2.jpg"),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: YaruSection(
            headline: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: Row(
                    children: [
                      Text(
                        "Equal: ",
                        overflow: TextOverflow.fade,
                        maxLines: 1,
                        softWrap: false,
                      ),
                      Text(
                        "No",
                        overflow: TextOverflow.fade,
                        maxLines: 1,
                        softWrap: false,
                        style: TextStyle(
                          color: YaruColors.red,
                        ),
                      ),
                    ],
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
            child: const Column(
              children: [
                YaruTile(
                  title: Text("File 1"),
                  subtitle: Text("file_name_1.jpg"),
                ),
                YaruTile(
                  title: Text("File 2"),
                  subtitle: Text("file_name_2.jpg"),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
