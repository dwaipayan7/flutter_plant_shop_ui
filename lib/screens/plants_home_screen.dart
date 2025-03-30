import 'package:flutter/material.dart';
import 'package:flutter_plant_shop_ui/cors/constants.dart';
import 'package:flutter_plant_shop_ui/models/plant_model.dart';
import 'package:flutter_plant_shop_ui/screens/plant_details_page.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PlantsHomeScreen extends StatefulWidget {
  const PlantsHomeScreen({super.key});

  @override
  State<PlantsHomeScreen> createState() => _PlantsHomeScreenState();
}

class _PlantsHomeScreenState extends State<PlantsHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myBackgroundColor,
      appBar: headerPart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            searchField(),
            MasonryGridView(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              crossAxisSpacing: 25,
              mainAxisSpacing: 25,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),

              gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              children: [
                Text(
                  "Found \n10 Results",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    height: 1.1,
                  ),
                ),
                for (var plant in plants)
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PlantDetailsPage(plant: plant),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                      ),
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(child: Image.asset(plant.image)),
                          SizedBox(height: 5),
                          Text(
                            plant.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              height: 1,
                            ),
                          ),

                          if (plant.category != null)
                            Text(
                              plant.category!,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                              ),
                            ),

                          Row(
                            children: [
                              Text(
                                "\$${plant.price}",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: -1,
                                ),
                              ),
                              Spacer(),
                              CircleAvatar(
                                radius: 18,
                                backgroundColor: Colors.black,
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                  size: 22,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget searchField() {
    return Padding(
      padding: EdgeInsets.all(22),
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
                hintText: "Plant",
                hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withOpacity(0.7),
                  letterSpacing: -.5,
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 15,
                ),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),

          SizedBox(width: 10),
          Expanded(
            flex: 1,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(Icons.tune),
            ),
          ),
        ],
      ),
    );
  }

  AppBar headerPart() {
    return AppBar(
      backgroundColor: myBackgroundColor,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_ios),
      ),
      centerTitle: true,
      title: Text(
        "Search Products",
        style: TextStyle(
          color: Colors.black54,
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 15),
          child: Image.asset("assets/profile.png"),
        ),
      ],
    );
  }
}
