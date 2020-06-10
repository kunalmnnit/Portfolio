import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/blocs/theme.dart';
import 'package:portfolio/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
      builder: (_) => ThemeChanger(ThemeData.dark()),
      child: MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      themeMode: theme.getTheme() == ThemeData.dark()
          ? ThemeMode.dark
          : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      title: 'Kunal Sevkani',
      darkTheme: ThemeData.dark().copyWith(
        textTheme: GoogleFonts.comfortaaTextTheme(
          ThemeData(
            primarySwatch: Colors.teal,
            brightness: Brightness.dark,
          ).textTheme,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      theme: ThemeData.light().copyWith(
        textTheme: GoogleFonts.comfortaaTextTheme(),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: Center(
          child: HomeScreen(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (theme.getTheme() == ThemeData.light())
              theme.setTheme(ThemeData.dark());
            else
              theme.setTheme(ThemeData.light());
          },
          tooltip:
              theme.getTheme() == ThemeData.dark() ? 'Light Mode' : 'DarkMode',
          child: Icon(Icons.wb_sunny),
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
