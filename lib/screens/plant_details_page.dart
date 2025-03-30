import 'package:flutter/material.dart';
import 'package:flutter_plant_shop_ui/cors/constants.dart';
import 'package:flutter_plant_shop_ui/models/plant_model.dart';

class PlantDetailsPage extends StatefulWidget {
  final Plant plant;
  const PlantDetailsPage({super.key, required this.plant});

  @override
  State<PlantDetailsPage> createState() => _PlantDetailsPageState();
}

class _PlantDetailsPageState extends State<PlantDetailsPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myBackgroundColor,
      appBar: AppBar(
        backgroundColor: myBackgroundColor,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 400,
                  child: PageView.builder(
                    itemCount: 3,
                    scrollDirection: Axis.vertical,
                    onPageChanged:
                        (value) => setState(() {
                          currentIndex = value;
                        }),
                    itemBuilder: (context, index) {
                      Image.asset(widget.plant.image);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
