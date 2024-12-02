import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> items = [
    {
      'name': 'T-shirt',
      'image': 'https://lsco.scene7.com/is/image/lsco/173690053-dynamic1-pdp?fmt=webp&qlt=70&resMode=sharp2&fit=crop,1&op_usm=0.6,0.6,8&wid=880&hei=880',
      'description': 'A comfortable cotton T-shirt.',
      'price': '\$20'
    },
    {
      'name': 'Jeans',
      'image': 'https://lsco.scene7.com/is/image/lsco/362000124-detail1-pdp-lse?fmt=webp&qlt=70&resMode=sharp2&fit=crop,1&op_usm=0.6,0.6,8&wid=880&hei=880',
      'description': 'Classic blue jeans.',
      'price': '\$40'
    },
    {
      'name': 'Jacket',
      'image': 'https://tailoredathlete.co.uk/cdn/shop/files/Photo-333_1200x.jpg?v=1731987245',
      'description': 'A warm and stylish jacket.',
      'price': '\$60'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('211211 Нина Коцеска'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            child: ListTile(
              leading: Image.network(item['image']),
              title: Text(item['name']),
              subtitle: Text(item['price']),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetails(item: item),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class ProductDetails extends StatelessWidget {
  final Map<String, dynamic> item;

  const ProductDetails({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item['name']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(item['image']),
            SizedBox(height: 16),
            Text(
              item['name'],
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(item['description']),
            SizedBox(height: 8),
            Text(
              item['price'],
              style: TextStyle(fontSize: 20, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
