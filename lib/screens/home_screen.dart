import 'package:flutter/material.dart';
import 'package:portfolio/screens/about_me.dart';
import 'package:portfolio/screens/project_showcase.dart';
import 'package:portfolio/screens/technical_skills.dart';
import 'package:portfolio/screens/contact_me.dart';
import 'package:portfolio/screens/info_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        physics: const BouncingScrollPhysics(),
        primary: true,
        children: <Widget>[
          const SizedBox(
            height: 64,
          ),
          Wrap(
            alignment: WrapAlignment.center,
            runSpacing: 64,
            spacing: 64,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Image.asset(
                'assets/images/profile.png',
                width: 436,
                height: 436,
                isAntiAlias: true,
                frameBuilder:
                    (_, Widget child, int frame, bool wasSynchronouslyLoaded) {
                  return wasSynchronouslyLoaded
                      ? child
                      : AnimatedOpacity(
                          opacity: frame == null ? 0 : 1,
                          duration: const Duration(seconds: 1),
                          curve: Curves.easeOut,
                          child: child,
                        );
                },
              ),
              const SizedBox(
                width: 500,
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(24),
                    ),
                  ),
                  child: InfoScreen(),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 64,
          ),
          Wrap(
            alignment: WrapAlignment.center,
            runSpacing: 32,
            spacing: 64,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/svg.png',
                width: 436,
                isAntiAlias: true,
                frameBuilder:
                    (_, Widget child, int frame, bool wasSynchronouslyLoaded) {
                  return wasSynchronouslyLoaded
                      ? child
                      : AnimatedOpacity(
                          opacity: frame == null ? 0 : 1,
                          duration: const Duration(seconds: 1),
                          curve: Curves.easeOut,
                          child: child,
                        );
                },
              ),
              const SizedBox(
                width: 500,
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(24),
                    ),
                  ),
                  child: AboutMe(),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 64,
          ),
          const ProjectShowcase(),
          const SizedBox(
            height: 64,
          ),
          Wrap(
            runAlignment: WrapAlignment.center,
            alignment: WrapAlignment.center,
            runSpacing: 32,
            spacing: 64,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: const [
              TechnicalSkills(),
              ContactMe(),
            ]
                .map(
                  (e) => SizedBox(
                    width: 500,
                    child: Card(
                      elevation: 2,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                      ),
                      child: e,
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(
            height: 64,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: Text(
                  '© ${DateTime.now().year} Kunal Sevkani. All rights reserved.'),
            ),
          ),
        ],
      ),
    );
  }
}
