import 'package:flutter/material.dart';

class HOME extends StatefulWidget {
  const HOME({super.key});

  @override
  _HOMEState createState() => _HOMEState();
}

class _HOMEState extends State<HOME> {
  int _currentIndex = 0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App Bar with three icons (hamburger, search, qr code)
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu), // Hamburger menu icon on the left
          onPressed: () {
            // Add your menu functionality here
          },
        ),
        title: Image.asset(
          'assets/splash.png',
          height: 100, 
          width: 120, // Adjust width as needed
        ),
        centerTitle: true,
        actions: [
          // Search icon on the right
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Add your search functionality here
            },
          ),
          // QR Code icon on the right
          IconButton(
            icon: Icon(Icons.qr_code),
            onPressed: () {
              // Add your QR Code functionality here
            },
          ),
        ],
      ),
     body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hey Mohit',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'What are you looking for today?',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

             
              Image.asset(
                'assets/TOP.png',
                height: 200, 
                width: 400, // Adjust width
              ),
              SizedBox(height: 5),
              Image.asset(
                'assets/Center.png',
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Add functionality for "See More"
                  },
                  child: Text(
                    'See More',
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Image.asset(
                'assets/middle1.png',
              ),
              Image.asset(
                'assets/MIDDLE2.png',
              ),
              SizedBox(height: 20),

              // New Images: Lipstick and Powder side by side
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Lipstick Image
                  Image.asset(
                    'assets/lipstick.png',
                    width: 160, // Adjust width
                    height: 250, 
                  ),
                  // Powder Image
                  Image.asset(
                    'assets/multikit.png',
                    width: 160, // Adjust width
                    height: 250, 
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Display list of recommended items directly
            
            ],
          ),
        ),
      ),
      // Custom Bottom Navigation Bar as Row
      bottomNavigationBar: Container(
        height: 100,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Home Icon and Text
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.home, color: _currentIndex == 0 ? Colors.orange : Colors.grey),
                  onPressed: () {
                    setState(() {
                      _currentIndex = 0;
                    });
                  },
                ),
                Text('Home', style: TextStyle(color: _currentIndex == 0 ? Colors.orange : Colors.grey)),
              ],
            ),
            // Category Icon and Text
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.category, color: _currentIndex == 1 ? Colors.orange : Colors.grey),
                  onPressed: () {
                    setState(() {
                      _currentIndex = 1;
                    });
                  },
                ),
                Text('Category', style: TextStyle(color: _currentIndex == 1 ? Colors.orange : Colors.grey)),
              ],
            ),
            // Message Icon and Text
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.message, color: _currentIndex == 2 ? Colors.orange : Colors.grey),
                  onPressed: () {
                    setState(() {
                      _currentIndex = 2;
                    });
                  },
                ),
                Text('Message', style: TextStyle(color: _currentIndex == 2 ? Colors.orange : Colors.grey)),
              ],
            ),
            // Cart Icon and Text
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.shopping_cart, color: _currentIndex == 3 ? Colors.orange : Colors.grey),
                  onPressed: () {
                    setState(() {
                      _currentIndex = 3;
                    });
                  },
                ),
                Text('Cart', style: TextStyle(color: _currentIndex == 3 ? Colors.orange : Colors.grey)),
              ],
            ),
            // Private Icon and Text
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.lock, color: _currentIndex == 4 ? Colors.orange : Colors.grey),
                  onPressed: () {
                    setState(() {
                      _currentIndex = 4;
                    });
                  },
                ),
                Text('Private', style: TextStyle(color: _currentIndex == 4 ? Colors.orange : Colors.grey)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
