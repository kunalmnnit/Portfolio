import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.all(24),
      children: [
        Align(
          child: FloatingActionButton.extended(
            shape: const StadiumBorder(),
            highlightElevation: 2,
            elevation: 0,
            onPressed: null,
            label: const Text(
              "Hello I'm",
              textScaleFactor: 1.5,
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const ListTile(
          leading: Icon(
            Icons.account_circle,
          ),
          title: SelectableText(
            'Kunal Sevkani',
            textScaleFactor: 2,
            toolbarOptions: ToolbarOptions(
              copy: true,
              selectAll: true,
            ),
          ),
          subtitle: Text(
            'Developer | Programmer',
          ),
        ),
        ...const [
          [
            Icon(Icons.location_on),
            'Jaipur,Rajasthan,India',
          ],
          [
            Icon(Icons.email),
            'ksevkani495@gmail.com',
          ]
        ]
            .map(
              (e) => ListTile(
                leading: e.first,
                title: SelectableText(
                  e.last,
                  toolbarOptions: ToolbarOptions(
                    copy: true,
                    selectAll: true,
                    cut: true,
                  ),
                ),
              ),
            )
            .toList(),
        ButtonBar(
          children: [
            [FontAwesome5Brands.github, 'https://github.com/kunalmnnit']
          ]
              .map(
                (e) => Tooltip(
                  message: 'Visit ${e.last}',
                  child: RaisedButton(
                    onPressed: () async {
                      if (await canLaunch(e.last)) await launch(e.last);
                    },
                    color: Theme.of(context).accentColor,
                    shape: const CircleBorder(),
                    child: Icon(
                      e.first,
                      size: IconTheme.of(context).size - 4,
                    ),
                  ),
                ),
              )
              .toList(),
        )
      ],
    );
  }
}
