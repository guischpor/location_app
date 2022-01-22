import 'package:flutter/material.dart';
import 'package:localtion_app/core/providers_list/providers_list.dart';
import 'package:localtion_app/pages/places_form_page.dart';
import 'package:localtion_app/pages/places_list_page.dart';
import 'package:provider/provider.dart';

import 'core/routes/app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final list = ProvidersList();

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: list.providers,
      child: MaterialApp(
        title: 'Great Places',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            accentColor: Colors.amber,
            primarySwatch: Colors.indigo,
          ),
        ),
        home: const PlacesListPage(),
        routes: {
          AppRoutes.placeListPage: (context) => const PlacesListPage(),
          AppRoutes.placeFormPage: (context) => const PlacesFormPage(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
