import 'package:flutter/material.dart';
import 'package:newapi/newsapi.dart';
import 'package:newapi/providers/news_provider.dart';
import 'package:newapi/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create:(context) => Newsprovider(),)
    ],
    child: const Root()));
}

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.home,
      routes: {
        Routes.home:(context)=>const Newsapi()
      },
    );
  }
}
