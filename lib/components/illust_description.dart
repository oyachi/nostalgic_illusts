import 'package:flutter/material.dart';

class IllustDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
              margin: EdgeInsets.only(top: 20),
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
               ),
              child: Text(
                "Macbook",
                style: Theme.of(context).textTheme.headline6,
              ),
            );
    }
}