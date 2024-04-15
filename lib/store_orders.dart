import 'package:flutter/material.dart';

class StoreOrdersPage extends StatelessWidget {
  const StoreOrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff078EB2),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(
                context); // Navigate back when the back button is pressed
          },
        ),
        title: Text(
          'Orders',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListView(
              shrinkWrap: true,
              padding: EdgeInsets.all(2.0),
              children: [
                _buildOrderSection(context, 'Delivered', [
                  _buildOrderTile(context, 'Order #1234', 'customer1', 'Delivered'),
                  // Add more orders with status 'Delivered'
                ]),
                SizedBox(height: 20,),
                _buildOrderSection(context, 'On Its Way', [
                  _buildOrderTile(context, 'Order #5678', 'customer2', 'On Its Way'),
                  // Add more orders with status 'On Its Way'
                ]),
                SizedBox(height: 20,),
                _buildOrderSection(context, 'to be Delivered', [
                  _buildOrderTile(context, 'Order #91011', 'customer3', 'To be Delivered'),
                  // Add more orders with status 'To be Delivered'
                ]),
              ],
            ),
            SizedBox(height: 20),
            Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(20.0),
                  child: Image.asset(
                    'assets/image/icon8.png',
                    width: 300.0,
                    height: 300.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderSection(BuildContext context, String sectionTitle, List<Widget> orders) {
    return ExpansionTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            sectionTitle,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Navigate to order tracking page for this section
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OrderTrackingPage(sectionTitle: sectionTitle),
                ),
              );
            },
            child: Text('Track Orders'),
          ),
        ],
      ),
      children: orders,
    );
  }

  Widget _buildOrderTile(BuildContext context, String orderId, String customerName, String orderStatus) {
    return Card(
      elevation: 3.0,
      margin: EdgeInsets.symmetric(vertical: 5.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        title: Text(
          orderId,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5.0),
            Text(
              'Customer: $customerName',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              'Status: $orderStatus',
              style: TextStyle(
                fontSize: 16.0,
                color: _getStatusColor(orderStatus), // Adding color based on status
              ),
            ),
          ],
        ),
        onTap: () {
          // Handle tapping on the order tile to view details
          // You can navigate to a detailed order view if needed
        },
      ),
    );
  }

  // Function to get status color
  Color _getStatusColor(String orderStatus) {
    switch (orderStatus) {
      case 'Delivered':
        return Colors.green;
      case 'On Its Way':
        return Colors.orange;
      case 'To be Delivered':
        return Colors.blue;
      default:
        return Colors.black;
    }
  }
}

class OrderTrackingPage extends StatelessWidget {
  final String sectionTitle;

  const OrderTrackingPage({Key? key, required this.sectionTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xff078EB2),

        title: Text('Track Orders - $sectionTitle',style:
          TextStyle(color: Colors.white),),
      ),
      body: Center(
        child: Text(
          'Track orders related to $sectionTitle here',
          style: TextStyle(fontSize: 20.0,),
        ),
      ),
    );
  }
}
