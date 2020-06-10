import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(
        24,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        const ListTile(
          title: SelectableText(
            'About Me',
            textScaleFactor: 2.0,
            toolbarOptions: ToolbarOptions(
              copy: true,
              selectAll: true,
            ),
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        const ListTile(
          title: Text(
            'A Simple Living Boy with High Aspirations. I Like to take up on new challenges and take them down right from the step.',
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        Wrap(
          runAlignment: WrapAlignment.spaceAround,
          alignment: WrapAlignment.spaceAround,
          crossAxisAlignment: WrapCrossAlignment.center,
          runSpacing: 16,
          children: [
            ['C', 'https://en.wikipedia.org/wiki/C_(programming_language)'],
            ['C++', 'https://en.wikipedia.org/wiki/C%2B%2B'],
            [
              'Java',
              'https://en.wikipedia.org/wiki/Java_(programming_language)'
            ],
            [
              'Dart',
              'https://en.wikipedia.org/wiki/Dart_(programming_language)'
            ],
            [
              'Python',
              'https://en.wikipedia.org/wiki/Python_(programming_language)'
            ],
          ]
              .map(
                (e) => FloatingActionButton.extended(
                  highlightElevation: 2,
                  elevation: 2,
                  tooltip: 'Visit ${e.first} Wiki',
                  shape: const StadiumBorder(),
                  onPressed: () async {
                    if (await canLaunch(e.last)) launch(e.last);
                  },
                  label: Text(e.first),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
