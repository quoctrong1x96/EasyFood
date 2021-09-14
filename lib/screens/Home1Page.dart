import 'package:cenafood/models/others/Category.dart';
import 'package:cenafood/models/others/Food.dart';
import 'package:cenafood/widgets/CategoryCart.dart';
import 'package:cenafood/widgets/CustomFilterButton.dart';
import 'package:cenafood/widgets/CustomIconButton.dart';
import 'package:cenafood/widgets/FoodCart.dart';
import 'package:flutter/material.dart';

class Home1Page extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Home1Page> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          children: [
            buildHeader(),
            SizedBox(height: 20),
            buildSearch(),
            buildFilter(),
            buildFoodList(),
            buildSectionTitle(),
            buildCategoryList(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Gọi món',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Liked',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Thông báo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Cá nhân',
          ),
        ],
      ),
    );
  }

  Widget buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomIconButton(
              onPressed: () {},
              icon: Icon(Icons.menu),
              key: new Key(""),
              margin: EdgeInsets.all(2.0),
            ),
            CircleAvatar(
              backgroundImage:
                  NetworkImage("https://source.unsplash.com/200x200/?man"),
            ),
          ],
        ),
        SizedBox(height: 16),
        Text("Hello X", style: TextStyle(fontSize: 16)),
        Text(
          "Food delivery",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget buildSearch() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search food",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              contentPadding: EdgeInsets.all(8),
              suffixIcon: Icon(Icons.search),
            ),
          ),
        ),
        CustomIconButton(
          key: new Key(""),
          margin: EdgeInsets.only(left: 8),
          icon: Icon(Icons.filter_list),
          onPressed: () {},
          backgroundColor: Colors.green,
        ),
      ],
    );
  }

  Widget buildFilter() {
    return Container(
      height: 32,
      margin: EdgeInsets.only(top: 16),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          FilterButton(
            title: "Popular",
            isSelected: true,
            key: new Key(""),
          ),
          FilterButton(
            title: "New Items",
            isSelected: false,
            key: new Key(""),
          ),
          FilterButton(
            title: "Hot deal",
            key: new Key(""),
            isSelected: false,
          ),
          FilterButton(
            title: "Combo pack",
            key: new Key(""),
            isSelected: false,
          ),
        ],
      ),
    );
  }

  Widget buildFoodList() {
    return Container(
      height: 220,
      margin: EdgeInsets.only(top: 24),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: foodList.length,
        itemBuilder: (context, index) {
          FoodModel food = foodList[index];
          return FoodCard(
            food: food,
            key: new Key(""),
          );
        },
      ),
    );
  }

  Widget buildSectionTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Explore Categories",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            onPrimary: Colors.green,
          ),
          // textColor:
          child: Text("View all"),
        ),
      ],
    );
  }

  Widget buildCategoryList() {
    return GridView.builder(
      itemCount: categories.length,
      shrinkWrap: true,
      primary: false,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 16 / 6,
      ),
      itemBuilder: (context, index) {
        final Category category = categories[index];
        return CategoryCard(
          category: category,
          key: new Key(""),
        );
      },
    );
  }
}
