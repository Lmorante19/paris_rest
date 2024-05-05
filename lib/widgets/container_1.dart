import 'package:flutter/material.dart';

class Container1 extends StatefulWidget {
  const Container1({
    Key? key,
  }) : super(key: key);

  @override
  _ContainerUnoState createState() => _ContainerUnoState();
}

class _ContainerUnoState extends State<Container1> {
  bool isImageChanged = false;

  void changeImage() {
    setState(() {
      isImageChanged = !isImageChanged;
    });
  }

  @override
  Widget build(BuildContext context) {
    String imageUrl = isImageChanged
        ? 'https://cms-paris.ecomm.cencosud.com/cms/cl/ecommerce-content-assets/view_version/661972a7320cd1cf8b377674/ad967025-ba06-4dc5-a951-af9b3613d249.webp'
        : 'https://cms-paris.ecomm.cencosud.com/cms/cl/ecommerce-content-assets/view_version/661972a7320cd1cf8b377674/0a2b5f30-c552-437e-9c89-d4baed4571db.webp';

    return GestureDetector(
      onTap: changeImage,
      child: Image.network(imageUrl),
    );
  }
}
