import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectShowcase extends StatelessWidget {
  const ProjectShowcase({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          child: Text(
            'Project Showcase',
            textScaleFactor: 2,
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        Wrap(
          runAlignment: WrapAlignment.center,
          alignment: WrapAlignment.center,
          runSpacing: 32,
          spacing: 64,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            [
              'ShopClaws',
              'An Ecommerce App',
              'https://github.com/kunalmnnit/shopclaws'
            ],
            [
              'DigiLocker',
              'Blockchain Based Digital Locker',
              'https://github.com/kunalmnnit/Digital-Locker-with-Blockchain'
            ],
            [
              'Chh-Ola',
              'Fare Estimation for Cabs',
              'https://github.com/kunalmnnit/Chh-Ola'
            ],
            [
              'Grocery App',
              'Complete Grocery Selling Solution(App+Admin Panel)',
              'https://github.com/kunalmnnit/big-basket-clone-with-admin-panel'
            ],
          ]
              .map(
                (e) => ConstrainedBox(
                  constraints: const BoxConstraints(
                    minHeight: 125,
                    maxWidth: 500,
                  ),
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: ListTile(
                        title: Text(
                          e.first,
                          textScaleFactor: 2,
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            e.elementAt(1),
                          ),
                        ),
                        trailing: IconButton(
                          tooltip: 'Visit ${e.first}',
                          icon: Icon(
                            Icons.open_in_new,
                            color: Theme.of(context).accentColor,
                          ),
                          onPressed: () async {
                            if (await canLaunch(e.last)) await launch(e.last);
                          },
                        ),
                      ),
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
