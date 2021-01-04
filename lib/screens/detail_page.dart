import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:groceries_app/screens/home_page.dart';

class DetailPage extends StatelessWidget {
  final ProductCard product;

  const DetailPage({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFECEFF1),
        elevation: 0,
        actions: [
          Image.asset('assets/images/save.png'),
        ],
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: 160,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(33),
                    bottomRight: Radius.circular(33),
                  ),
                  color: Color(0xFFFECEFF1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Image.asset(
                    product.image,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.title,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "\$${product.price}",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      product.quantity,
                      style: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 10),
                    Counter(),
                    SizedBox(height: 10),
                    ExpandablePanel(
                      header: Text(
                        'Product Detail',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      expanded: Text(
                        'Apples Are Nutritious, Apples May Be Good For Weight Loes. Apples May Be Good For Your Heart. As Part Of A Beautiful And Varied Diet.',
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                        softWrap: true,
                        maxLines: 6,
                      ),
                    ),
                    SizedBox(height: 10),
                    ExpandablePanel(
                      header: Text(
                        'Nutritions',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      expanded: Text(
                        'Apples Are Nutritious, Apples May Be Good For Weight Loes. Apples May Be Good For Your Heart. As Part Of A Beautiful And Varied Diet.',
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                        softWrap: true,
                        maxLines: 6,
                      ),
                    ),
                    SizedBox(height: 10),
                    ExpandablePanel(
                      header: Row(
                        children: [
                          Text(
                            'Review',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Spacer(),
                          Image.asset('assets/images/star.png'),
                          Image.asset('assets/images/star.png'),
                          Image.asset('assets/images/star.png'),
                          Image.asset('assets/images/star.png'),
                          Image.asset('assets/images/star.png'),
                        ],
                      ),
                      expanded: Text(
                        'Apples Are Nutritious, Apples May Be Good For Weight Loes. Apples May Be Good For Your Heart. As Part Of A Beautiful And Varied Diet.',
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                        softWrap: true,
                        maxLines: 6,
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: FlatButton(
                        color: Color(0xFF81C784),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Add To Basket',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int numOfCount = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(
            Icons.remove,
            color: Colors.black45,
          ),
          onPressed: () {
            setState(() {
              numOfCount--;
            });
          },
        ),
        SizedBox(
          height: 43,
          width: 37,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(23),
              border: Border.all(
                color: Color(0xFFFECEFF1),
              ),
            ),
            child: Text(
              numOfCount.toString().padLeft(2, '0'),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
        IconButton(
          icon: Icon(
            Icons.add,
            color: Colors.black45,
          ),
          onPressed: () {
            setState(() {
              numOfCount++;
            });
          },
        ),
        Spacer(),
        Image.asset('assets/images/bookmark.png'),
      ],
    );
  }
}
