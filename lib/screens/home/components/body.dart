import 'package:flutter/material.dart';
import 'package:online_shop/constants.dart';
import 'package:online_shop/models/product.dart';

import 'categories.dart';
import 'item_card.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Wrap Text with Padding by 'Show Context Actions(option+Enter)' on Text -> 'Wrap with padding'
        Padding(
          // Padding on left and right of Text
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Text(
            'Women',
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        // Tab bar
        Categories(),
        // A widget that expands a child of a Row, Column, or Flex so that the child fills the available space
        // https://api.flutter.dev/flutter/widgets/Expanded-class.html
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: GridView.builder(
              itemCount: products.length,
              gridDelegate:
                  // crossAxisCount: number of items in row
                  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                // Vertical margin
                mainAxisSpacing: kDefaultPadding,
                //Horizontal margin
                crossAxisSpacing: kDefaultPadding,
                // childAspectRatio = width / height
                // Longer vertically
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) => ItemCard(
                product: products[index],
              ),
            ),
          ),
        )
      ],
    );
  }
}
