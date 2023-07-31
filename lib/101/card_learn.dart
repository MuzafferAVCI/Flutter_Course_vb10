import 'package:flutter/material.dart';

class CardLearn extends StatelessWidget {
  CardLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          _CustomCard(
            child: SizedBox(
              height: 100,
              width: 300,
              child: Center(
                  child: Text(
                'Ali',
                style: TextStyle(fontSize: 24),
              )),
            ),
          ),
          Card(
            margin: ProjectMargins.cardMargin,
            child: SizedBox(
              height: 100,
              width: 200,
              child: Center(
                  child: Text(
                'Ali',
                style: TextStyle(fontSize: 20),
              )),
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
          Card(
            color: Theme.of(context).colorScheme.error,
            child: SizedBox(
              height: 100,
              width: 100,
              child: Center(
                child: Text('Ali'),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _CustomCard extends StatelessWidget {
  _CustomCard({super.key, required this.child});
  final Widget child;
  final roundedRectangleBorder =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: ProjectMargins.cardMargin,
      child: child,
      shape: roundedRectangleBorder,
    );
  }
}

class ProjectMargins {
  static const cardMargin = EdgeInsets.all(10);
}

//Borders :
// StadiumBorder(),
// CircleBorder(),
