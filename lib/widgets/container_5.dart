import 'package:flutter/material.dart';

class Container5 extends StatelessWidget {
  const Container5({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image(
              image: NetworkImage(
                'https://cms-paris.ecomm.cencosud.com/cms/cl/ecommerce-content-assets/view_version/661972a7320cd1cf8b377674/0c876117-e729-4f4f-93bb-2ba49d5255a4.webp',
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image(
              image: NetworkImage(
                'https://cms-paris.ecomm.cencosud.com/cms/cl/ecommerce-content-assets/view_version/661972a7320cd1cf8b377674/f21fb72a-57db-4273-8940-65f5b5294514.webp',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
