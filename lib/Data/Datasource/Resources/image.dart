import 'package:flutter/widgets.dart';

class ImageWidget extends StatelessWidget {
  final String imageUrl;
  const ImageWidget({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      fit: BoxFit.fill,
      height: 150,
      width: 360,
    );
  }
}
