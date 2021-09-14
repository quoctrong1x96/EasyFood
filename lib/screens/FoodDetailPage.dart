import 'package:cenafood/models/others/Food.dart';
import 'package:cenafood/widgets/CustomIconButton.dart';
import 'package:flutter/material.dart';

class FoodDetailPage extends StatefulWidget {
  final FoodModel food;

  const FoodDetailPage({required Key key, required this.food})
      : super(key: key);
  @override
  _FoodDetailPageState createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  FoodModel get food => widget.food;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          buildImage(),
          buildFoodInfo(),
          buildAppBar(),
          buildOrderButton(),
        ],
      ),
    );
  }

  Widget buildFoodInfo() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height / 2 - 16,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  food.name,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  "\$${food.price}",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 12),
            Text("Italian soup"),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ...List.generate(
                    5, (index) => Icon(Icons.star, color: Colors.yellow)),
                Text("${food.rating}"),
                Text("(1k+)"),
                Spacer(),
                CustomIconButton(
                  key: new Key("abc"),
                  icon: Icon(Icons.remove, size: 16),
                  onPressed: () {},
                  backgroundColor: Colors.black.withOpacity(0.1),
                  margin: EdgeInsets.all(2.0),
                ),
                Text("1", style: TextStyle(fontSize: 18)),
                CustomIconButton(
                  key: new Key("abcd"),
                  icon: Icon(Icons.add, size: 16),
                  onPressed: () {},
                  backgroundColor: Colors.black.withOpacity(0.1),
                  margin: EdgeInsets.all(2.0),
                ),
              ],
            ),
            buildDescription(),
            buildIngredient(),
          ],
        ),
      ),
    );
  }

  Widget buildDescription() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Ingredient",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 12),
          Text(food.description),
        ],
      ),
    );
  }

  Widget buildIngredient() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Description",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 12),
          Container(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                10,
                (index) => Container(
                  child: Card(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        "https://source.unsplash.com/200x20$index/?vegetable",
                      ),
                    ),
                  ),
                  width: 100,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildImage() {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      child: Image.network(
        food.image,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget buildOrderButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Material(
        elevation: 3,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CustomIconButton(
                  margin: EdgeInsets.all(2.0),
                  icon: Icon(Icons.add_shopping_cart, color: Colors.green),
                  onPressed: () {},
                  borderColor: Colors.grey,
                  key: new Key("1")),
              SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                  ),
                  // color: Colors.green,
                  // shape: RoundedRectangleBorder(
                  //   borderRadius: BorderRadius.circular(8),
                  // ),
                  child: Text(
                    "Place an Order",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAppBar() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomIconButton(
              key: new Key("123"),
              margin: EdgeInsets.all(2.0),
              icon: Icon(Icons.arrow_back),
              backgroundColor: Colors.white,
              onPressed: () => Navigator.of(context).pop(),
            ),
            CustomIconButton(
              key: new Key("12344"),
              margin: EdgeInsets.all(2.0),
              backgroundColor: Colors.white.withOpacity(0.5),
              icon: Icon(Icons.favorite, color: Colors.red),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
