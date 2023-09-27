import 'package:flutter/material.dart';
import 'component/body.dart';

class WebviewScreen extends StatelessWidget {
  final String? urlLinks;

  const WebviewScreen({
    Key? key,
    this.urlLinks,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(urlLinks: urlLinks),
    );
  }
}
