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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 400,
                  child: PageView.builder(
                    itemCount: 3, //
                    scrollDirection: Axis.vertical,
                    onPageChanged:
                        (value) => setState(() {
                          currentIndex = value;
                        }),
                    itemBuilder: (context, index)
                      => Hero(
                        tag: widget.plant.image,
                        child: Image.asset(
                          widget.plant.image, // Use multiple images
                          // fit: BoxFit.cover,
                        ),
                      )

                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: Column(
                    children: List.generate(
                      3,
                      (index) => AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        margin: EdgeInsets.only(bottom: 5),
                        width: 7,
                        height: index == currentIndex ? 20 : 7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color:
                              index == currentIndex
                                  ? primaryColor
                                  : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                widget.plant.name,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1,
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                "This is a plant",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black54,
                  letterSpacing: -.5,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        height: 270,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),

        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                plantsInfo(Icons.height, "Height", widget.plant.height),
                plantsInfo(
                  Icons.device_thermostat,
                  "Temperature",
                  widget.plant.temparature,
                ),
                plantsInfo(Icons.yard_outlined, "Pot", widget.plant.pot),
              ],
            ),

            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total Price",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        letterSpacing: -1,
                      ),
                    ),

                    Text(
                      "\$${widget.plant.price}",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        height: 1,
                        letterSpacing: -1,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                  decoration: BoxDecoration(
                    color: cartButtonColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text("Add to Cart", style: TextStyle(
                    color: Colors.white
                  ),),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget plantsInfo(icon, name, value) => Column(
    children: [
      Icon(icon, size: 45, color: Colors.white),
      SizedBox(height: 4),
      Text(
        name,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w800,
          color: Colors.white,
          letterSpacing: -1,
        ),
      ),
      Text(value, style: TextStyle(fontSize: 12, color: Colors.grey.shade200)),
    ],
  );
}
