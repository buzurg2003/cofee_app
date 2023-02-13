import 'package:coffee_app/detail_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  static var screenHeight;
  static var screenWidth;

  Widget buildCoffeeCategory({categoryName, isSelected}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            categoryName,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isSelected?Colors.orange:Colors.white,
              fontSize: 17,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildSingleItem({
    images, 
    title, 
    subTitle,
    price,
    context,
  }){
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => DetailPage(),
          ),
        );
      },
      child: Container(
        width: screenWidth * 0.4 + 10,
        height: screenHeight * 0.3 + 25,
        margin: EdgeInsets.all(15.0),
        padding: EdgeInsets.all(10.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color(0xFF242424),
          borderRadius: BorderRadius.circular(15.0)
        ),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(images),
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        subTitle,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                '\$$price',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xffaeaeae)
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    screenHeight=MediaQuery.of(context).size.height;
    screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xff0c0f14),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(
            
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Find the best',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange
                      ),
                    ),
                    Text('coffee for you',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: TextField(
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 15,
                    ),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.orange,
                      ),
                      hintText: 'Find your coffee',
                      hintStyle: TextStyle(
                        color: Colors.orange
                      ),
                      fillColor: Color(0xFF242424),
                      filled: true,
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    buildCoffeeCategory(
                      categoryName: 'All',
                      isSelected: true,
                    ),
                    buildCoffeeCategory(
                      categoryName: 'Cappuccino',
                      isSelected: false,
                    ),
                    buildCoffeeCategory(
                      categoryName: 'Black',
                      isSelected: false,
                    ),
                    buildCoffeeCategory(
                      categoryName: 'Latte',
                      isSelected: false,
                    ),
                    buildCoffeeCategory(
                      categoryName: 'Tea',
                      isSelected: false,
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    buildSingleItem(
                      context: context,
                      images: './lib/images/black.png',
                      title: 'Black',
                      subTitle: 'With chocolate',
                      price: 4.20,
                    ),
                    buildSingleItem(
                      context: context,
                      images: './lib/images/cappuccino.png',
                      title: 'Cappuccino',
                      subTitle: 'With almond milk',
                      price: 10.00,
                    ),
                    buildSingleItem(
                      context: context,
                      images: './lib/images/latte.png',
                      title: 'Latte',
                      subTitle: 'With almond milk',
                      price: 5.10,
                    ),
                    buildSingleItem(
                      context: context,
                      images: './lib/images/tea.png',
                      title: 'Tea',
                      subTitle: 'With lemon',
                      price: 4.20,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 5,
                ),
                child: ListTile(
                  leading: Text(
                    'Special for you',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    padding: EdgeInsets.all(12.0),
                    margin: EdgeInsets.symmetric(
                      horizontal: 15,  
                    ),
                    height: screenHeight * 0.2 - 20,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xff171b22),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  './lib/images/black.png'
                                ),
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 8
                                ),
                                child: Text(
                                  ' Black \n Must Try!',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.orange,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 15
                                ),
                                child: Text(
                                  'With chocolate',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 15
                                        ),
                                        child: Text(
                                          '\$\t', 
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xffaeaeae),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        '4.20',
                                        style: TextStyle(
                                          color: Color(0xffaeaeae),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      right: 15,
                    ),
                    height: 25.0,
                    width: 50.0,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    padding: EdgeInsets.all(12.0),
                    margin: EdgeInsets.symmetric(
                      horizontal: 15,  
                    ),
                    height: screenHeight * 0.2 - 20,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xff171b22),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  './lib/images/cappuccino.png'
                                ),
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 8
                                ),
                                child: Text(
                                  ' Cappuccino \n Must Try!',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.orange,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 15
                                ),
                                child: Text(
                                  'With almond milk',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 15
                                        ),
                                        child: Text(
                                          '\$\t', 
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xffaeaeae),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        '4.20',
                                        style: TextStyle(
                                          color: Color(0xffaeaeae),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      right: 15,
                    ),
                    height: 25.0,
                    width: 50.0,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    padding: EdgeInsets.all(12.0),
                    margin: EdgeInsets.symmetric(
                      horizontal: 15,  
                    ),
                    height: screenHeight * 0.2 - 20,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xff171b22),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  './lib/images/latte.png'
                                ),
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 8
                                ),
                                child: Text(
                                  ' Latte \n Must Try!',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.orange,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 15
                                ),
                                child: Text(
                                  'With almond milk',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 15
                                        ),
                                        child: Text(
                                          '\$\t', 
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xffaeaeae),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        '4.20',
                                        style: TextStyle(
                                          color: Color(0xffaeaeae),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      right: 15,
                    ),
                    height: 25.0,
                    width: 50.0,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    padding: EdgeInsets.all(12.0),
                    margin: EdgeInsets.symmetric(
                      horizontal: 15,  
                    ),
                    height: screenHeight * 0.2 - 20,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xff171b22),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  './lib/images/tea.png'
                                ),
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 8
                                ),
                                child: Text(
                                  ' Tea \n Must Try!',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.orange,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 15
                                ),
                                child: Text(
                                  'With lemon',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 15
                                        ),
                                        child: Text(
                                          '\$\t', 
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xffaeaeae),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        '4.20',
                                        style: TextStyle(
                                          color: Color(0xffaeaeae),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      right: 15,
                    ),
                    height: 25.0,
                    width: 50.0,
                  ),
                ],
              ),
            ],
          ),
        ) 
      ),
    );
  }
}