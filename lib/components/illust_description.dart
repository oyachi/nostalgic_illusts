import 'package:flutter/material.dart';

class IllustDescription extends StatelessWidget {
  String _title = "";
  String _description = "";
  String _reflection = "";
  IllustDescription(this._title, this._description, this._reflection);

  @override
  Widget build(BuildContext context) {
    return Container(
              margin: const EdgeInsets.only(top: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
               ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        width: 150,
                        height: 7,
                        decoration: BoxDecoration(
                          color: Colors.red[50],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 10.0, left: 20.0, right: 20.0),
                    child: Text(
                      _title,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      _description,
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 10.0, left: 20.0, right: 20.0),
                    child: Text(
                      "Reflection",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      _reflection,
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            );
    }
}