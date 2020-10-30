import 'package:flutter/material.dart';
import 'package:online_shop/constants.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = ['Hand bag', 'Jewellery', 'Footwear', 'Dresses'];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: SizedBox(
          height: 25,
          // Compared to ListView(), ListView.builder() is appropriate for list views
          // with a large (or infinite) number of children because the builder is called
          // only for those children that are actually visible.
          // https://api.flutter.dev/flutter/widgets/ListView-class.html
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) => buildCategory(index),
          )
      ),
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          // Align left
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              categories[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: selectedIndex == index ? kTextColor : kTextLightColor,
              ),
            ),
            // Under bar of each Text
            Container(
              margin: EdgeInsets.only(top: kDefaultPadding / 4),
              height: 2,
              width: 30,
              color: selectedIndex == index ? Colors.black : Colors.transparent,
            )
          ],
        ),
      ),
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
    );
  }
}
