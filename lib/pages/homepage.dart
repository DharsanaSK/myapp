import 'package:flutter/material.dart';
import 'dart:ui';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/images/tourist.png'),
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
          ),
          // Blur effect
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
            child: Container(
              color: Colors.black.withOpacity(0.1),
            ),
          ),
          // Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      ' TOURISTER',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromARGB(204, 255, 255, 255),
                        fontSize:
                            screenWidth * 0.1, // Adjust font size dynamically
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.4),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: Text('EXPLORE'),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.2,
                          vertical: screenHeight * 0.03,
                        ),
                        backgroundColor: Color.fromARGB(177, 201, 208, 206),
                        textStyle: TextStyle(
                          fontSize: screenWidth * 0.06,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SquareTile(imagePath: 'lib/images/google.png'),
                        const SizedBox(width: 25),
                        SquareTile(imagePath: 'lib/images/apple.png'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SquareTile extends StatelessWidget {
  final String imagePath;

  const SquareTile({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: Text('CONTINUE WITH YOUR EMAIL'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(screenWidth * 0.05),
        decoration: BoxDecoration(
          border: Border.all(color: Color.fromARGB(255, 255, 253, 253)),
          borderRadius: BorderRadius.circular(12),
          color: Color.fromARGB(255, 231, 228, 228),
        ),
        child: Image.asset(
          imagePath,
          height: screenWidth * 0.1,
        ),
      ),
    );
  }
}
