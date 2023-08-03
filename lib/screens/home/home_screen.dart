import 'package:bmi_calculator/models/Product.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../size_config.dart';
import '../details/components/body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // It help us to  make our UI responsive
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(
        product: Product(
          id: "1",
          price: 1600,
          title: "Wood Frame",
          image: "https://i.imgur.com/sI4GvE6.png",
          category: "Chair",
          subTitle: "Tieton Armchair",
          description: description,
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: IconButton(
        icon: Image(
          image: AssetImage(
            "assets/icons/menu.png",
          ),
          height: SizeConfig.defaultSize! * 2, //20
        ),
        onPressed: () {},
      ),
      actions: <Widget>[
        IconButton(
          icon: Image(
            image: AssetImage("assets/icons/scan.png"),
            height: SizeConfig.defaultSize! * 2.4, //24
          ),
          onPressed: () {},
        ),
        Center(
          child: Text(
            "Scan",
            style: TextStyle(color: kTextColor, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(width: SizeConfig.defaultSize),
      ],
    );
  }
}
