import 'package:flutter/material.dart';
/* components */
import '../components/illust_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          IllustCard(),
          IllustCard(),
          IllustCard(),
        ],
      ),
    );
  }
}