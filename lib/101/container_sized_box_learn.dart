import 'package:flutter/material.dart';

class ContainerSizedBoxLearn extends StatelessWidget {
  const ContainerSizedBoxLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            width: 300,
            height: 200,
            child: Text('a' * 500),
          ),
          const SizedBox.shrink(),
          SizedBox.square(
            dimension: 50,
            child: Text('b' * 50),
          ),
          Container(
            height: 50,
            constraints: BoxConstraints(
                maxWidth: 200, minWidth: 100, minHeight: 10, maxHeight: 150),
            child: Text(
              'a' * 100,
              maxLines: 2,
            ),
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            decoration: ProjectUtility.boxDecoration,
          )
        ],
      ),
    );
  } // Eger bunun bır ekran cızımı olmasını ıstıyorsak statelesswidget ı extend etmelıyız.

}

class ProjectUtility {
  static BoxDecoration boxDecoration = BoxDecoration(
      //color: Colors.red,
      borderRadius: BorderRadius.circular(10),
      gradient: LinearGradient(colors: [Colors.red, Colors.black]),
      boxShadow: [
        BoxShadow(
          color: Colors.green,
          offset: Offset(0.1, 1),
          blurRadius: 12,
        )
      ],
      //shape: BoxShape.circle,

      border: Border.all(
        width: 10,
        color: Colors.white12,
      ));
}

class ProjectContainerDecoration extends BoxDecoration {
  ProjectContainerDecoration()
      : super(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(colors: [Colors.red, Colors.black]),
            boxShadow: [
              BoxShadow(
                color: Colors.green,
                offset: Offset(0.1, 1),
                blurRadius: 12,
              )
            ],
            //shape: BoxShape.circle,

            border: Border.all(
              width: 10,
              color: Colors.white12,
            ));
}
