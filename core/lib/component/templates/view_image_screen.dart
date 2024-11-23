import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

import '../molecules/app_bar.dart';

class GSViewImageScreen extends StatelessWidget {
  final String url;
  final String title;

  const GSViewImageScreen(this.url, {super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: GSAppBar(titleText: title),
        body: Container(color: Colors.white, child: _body(context)));
  }

  Widget _body(BuildContext context) {
    return PhotoView(
      imageProvider: NetworkImage(url),
    );
  }
}
