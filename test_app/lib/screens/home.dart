import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeActivity extends StatelessWidget {
  HomeActivity({super.key});
  final List<Map<String, String>> products = [
    {'name': 'Product 1', 'price': '10.0'},
    {'name': 'Product 2', 'price': '20.0'},
    {'name': 'Product 3', 'price': '30.0'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Lists'),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        // Make the body scrollable
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      Get.toNamed('/add'); // Navigate to the '/add' route
                    },
                    child: Text('Add Product'),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                      Get.toNamed('/');
                    },
                    child: Text('Logout'),
                  ),
                ],
              ),
            ),
            // ListView with separators
            ListView.separated(
              shrinkWrap:
                  true, // Ensures the ListView takes only the needed space
              physics:
                  NeverScrollableScrollPhysics(), // Disables scrolling on ListView (handled by SingleChildScrollView)
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(products[index]['name']!),
                  subtitle: Text(products[index]['price']!),
                );
              },
              separatorBuilder: (context, index) {
                return Row(
                  children: [
                    SizedBox(width: 20),
                    Container(
                      width: 200, // thickness of the vertical stick
                      height: 2, // height of the vertical stick
                      color: Colors.grey, // stick color
                    ),
                    Expanded(
                      child: Container(),
                    ), // This will push the stick to the left
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
