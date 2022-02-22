import 'package:flutter/material.dart';
import 'package:foxy_flutter/widget/left_bar.dart';

class FoxyNotFound extends StatefulWidget {
  const FoxyNotFound({Key? key}) : super(key: key);

  @override
  _NotFoundState createState() => _NotFoundState();
}

class _NotFoundState extends State<FoxyNotFound> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          LeftBar(),
          Expanded(
            child: Center(child: Text('Not Implemented')),
          )
        ],
      ),
    );
  }
}
