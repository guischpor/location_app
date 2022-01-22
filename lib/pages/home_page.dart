import 'package:flutter/material.dart';
import 'package:localtion_app/widgets/app_bar_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        title: 'Home Page',
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Tela'),
      ),
    );
  }
}
