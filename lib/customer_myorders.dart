import 'package:flutter/material.dart';

class MyOrdersPage extends StatelessWidget {
  const MyOrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Replace this with actual data fetching logic
    final List<Order> orders = [
      Order(id: '1', date: '2022-04-25', totalAmount: 50.0),
      Order(id: '2', date: '2022-04-26', totalAmount: 70.0),
      Order(id: '3', date: '2022-04-27', totalAmount: 90.0),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('My Orders',style: TextStyle(color: Colors.white),),
        backgroundColor: Color(0xff078EB2),
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return ListTile(
            title: Text('Order ID: ${order.id}'),
            subtitle: Text('Date: ${order.date}'),
            trailing: Text('\$${order.totalAmount.toStringAsFixed(2)}'),
            onTap: () {
              // Handle tapping on order item
            },
          );
        },
      ),
    );
  }
}

class Order {
  final String id;
  final String date;
  final double totalAmount;

  Order({required this.id, required this.date, required this.totalAmount});
}
