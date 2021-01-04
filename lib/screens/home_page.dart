import 'package:flutter/material.dart';
import 'package:groceries_app/screens/detail_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ProductCard> productData = [
    ProductCard(
      id: 1,
      title: "Organic Bannas",
      image: "assets/images/banana.png",
      price: 4,
      quantity: " 1kg, priceg",
    ),
    ProductCard(
      id: 2,
      title: "Red Apple",
      image: "assets/images/apple.png",
      price: 4,
      quantity: " 1kg, priceg",
    ),
    ProductCard(
      id: 3,
      title: "Bell Pepper Red",
      image: "assets/images/pepper.png",
      price: 4,
      quantity: " 1kg, priceg",
    ),
    ProductCard(
      id: 4,
      title: "Ginger",
      image: "assets/images/ginger.png",
      price: 4,
      quantity: " 250gm, priceg",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(8),
        height: 45,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/store.png'),
                  Text('Store'),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/search.png'),
                  Text('Explore'),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/cart.png'),
                  Text('Cart'),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/bookmark.png'),
                  Text('Favourite'),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/user.png'),
                  Text('Account'),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: 10),
                Image.asset(
                  "assets/images/logo2.png",
                  height: 30,
                  width: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/map.png",
                      height: 30,
                      width: 30,
                    ),
                    Text("Dhaka, Banassre"),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  height: 45,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFFFECEFF1),
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search Store',
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 90,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFFFECEFF1),
                    ),
                    borderRadius: BorderRadius.circular(13),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFFFFCDD2).withOpacity(.7),
                          Color(0xFFFECEFF1),
                          Colors.white,
                          Colors.white,
                          Color(0xFFFECEFF1),
                          Color(0xFFFECEFF1),
                        ]),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Image.asset(
                          'assets/images/banner1.png',
                          height: 80,
                        ),
                      ),
                      Positioned(
                        top: 26,
                        left: 110,
                        child: Text(
                          'Fresh Vegetables',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Positioned(
                        top: 45,
                        left: 120,
                        child: Text(
                          'Get Up To 40% OFF',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 12,
                            color: Color(0xFF81C784),
                          ),
                        ),
                      ),
                      Positioned(
                        top: -30,
                        right: -50,
                        child: Image.asset(
                          'assets/images/banner2.png',
                          height: 80,
                        ),
                      ),
                      Positioned(
                        bottom: -20,
                        right: -20,
                        child: Image.asset(
                          'assets/images/banner3.png',
                          height: 80,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 280,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.82,
                    ),
                    itemCount: productData.length,
                    itemBuilder: (context, index) => ProductCard(
                      product: productData[index],
                      press: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailPage(
                                    product: productData[index],
                                  ))),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key key,
    this.image,
    this.title,
    this.quantity,
    this.id,
    this.price,
    this.product,
    this.press,
  }) : super(key: key);
  final String image, title, quantity;
  final int id, price;
  final ProductCard product;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        height: 160,
        width: 120,
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xFFFECEFF1),
          ),
          borderRadius: BorderRadius.circular(13),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5),
              Image.asset(product.image),
              SizedBox(height: 10),
              Text(
                product.title,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                product.quantity,
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.black45,
                ),
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${product.price}",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Image.asset(
                    'assets/images/button.png',
                    height: 30,
                    width: 30,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
