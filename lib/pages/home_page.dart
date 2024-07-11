import 'package:flutter/material.dart';
import 'package:yaru/yaru.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        YaruSection(
          headline: const Text("Yaml Config"),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    label: const Text("Open"),
                    icon: const Icon(YaruIcons.document_open),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text("New"),
                  )
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Column(
          children: [
            GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: switch (MediaQuery.sizeOf(context).width) {
                  > 1400 => 4,
                  <= 1400 && > 1200 => 3,
                  <= 1200 && > 1000 => 2,
                  _ => 1,
                },
                childAspectRatio: switch (MediaQuery.sizeOf(context).width) {
                  > 1400 => 2,
                  <= 1400 && > 1200 => 2,
                  <= 1200 && > 700 => 2.5,
                  _ => 2,
                },
                crossAxisSpacing: 10,
              ),
              shrinkWrap: true,
              children: [
                for (var i = 0; i < 20; i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: YaruSection(
                      headline: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              "Config Title ${MediaQuery.sizeOf(context).width}",
                              overflow: TextOverflow.fade,
                              maxLines: 1,
                              softWrap: false,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Transform.scale(
                              scale: 0.7,
                              child: YaruCircularProgressIndicator(),
                            ),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                child: const Text("Run"),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text("Option"),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
