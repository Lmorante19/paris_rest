import 'package:flutter/material.dart';

class Container4 extends StatelessWidget {
  const Container4({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Image(
          image: NetworkImage(
            'https://cms-paris.ecomm.cencosud.com/cms/cl/ecommerce-content-assets/view_version/661972a7320cd1cf8b377674/d16ef601-84e2-4089-9e09-02415e0215fd.jpg',
          ),
        ),
      ),
    ]);
  }
}
