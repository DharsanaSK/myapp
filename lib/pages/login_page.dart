import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:myapp/components/my_button.dart';
import 'package:myapp/components/my_textfield.dart';
import 'package:myapp/components/square_tile.dart'
    as Components; // Import SquareTile from components with prefix
import 'package:myapp/pages/register_page.dart';
import 'package:myapp/pages/explorepage.dart';
import 'package:myapp/pages/homepage.dart'; // Import HomePage

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Text editing controllers
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  ui.Image? backgroundImage;
  bool isImageLoaded = false;

  // Sign user in method
  void signUserIn() {
    // Navigate to the ExplorePage when login button is clicked
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ExplorePage()),
    );
  }

  @override
  void initState() {
    super.initState();
    _loadImage('lib/images/home.png');
  }

  Future<void> _loadImage(String path) async {
    final ImageProvider imageProvider = AssetImage(path);
    final Completer<ui.Image> completer = Completer<ui.Image>();

    final ImageStream stream = imageProvider.resolve(ImageConfiguration.empty);
    stream.addListener(
      ImageStreamListener((ImageInfo info, bool _) {
        completer.complete(info.image);
      }),
    );

    try {
      final ui.Image image = await completer.future;
      setState(() {
        backgroundImage = image;
        isImageLoaded = true;
      });
    } catch (e) {
      debugPrint('Failed to load image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: CustomPaint(
          painter: BackgroundPainter(
            backgroundImage: backgroundImage,
          ),
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: screenHeight * 0.1),
                    // Logo with animation
                    AnimatedContainer(
                      duration: const Duration(seconds: 2),
                      curve: Curves.bounceInOut,
                      child: const Icon(
                        Icons.lock,
                        size: 100,
                        color: ui.Color.fromARGB(255, 94, 94, 93),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.1),
                    // Welcome back message
                    Text(
                      'Welcome back!',
                      style: TextStyle(
                        color: Color.fromARGB(255, 128, 125, 125),
                        fontSize: screenWidth * 0.05,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    // Username textfield
                    MyTextField(
                      controller: usernameController,
                      hintText: 'Username',
                      obscureText: false,
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    // Password textfield
                    MyTextField(
                      controller: passwordController,
                      hintText: 'Password',
                      obscureText: true,
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    // Forgot password
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    // Sign in button
                    MyButton(
                      onTap: signUserIn,
                      buttonText: 'Log-in',
                      successMessage: 'Logged in successfully',
                    ),
                    SizedBox(height: screenHeight * 0.07),
                    // Or continue with divider
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            'Or continue with',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.07),
                    // Google and Apple sign in buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Google button
                        Components.SquareTile(
                            imagePath: 'lib/images/google.png'),
                        SizedBox(width: 25),
                        // Apple button
                        Components.SquareTile(
                            imagePath: 'lib/images/apple.png'),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.07),
                    // Not a member? Register now
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Not a member?',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                        const SizedBox(width: 4),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterPage(),
                              ),
                            );
                          },
                          child: const Text(
                            'Register now',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.07),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BackgroundPainter extends CustomPainter {
  final ui.Image? backgroundImage;

  BackgroundPainter({this.backgroundImage});

  @override
  void paint(Canvas canvas, Size size) {
    if (backgroundImage == null) {
      return;
    }

    var paint = Paint()..style = PaintingStyle.fill;

    var path = Path()
      ..moveTo(0, size.height * 0.3)
      ..quadraticBezierTo(
          size.width * 0.5, size.height * 0.4, size.width, size.height * 0.3)
      ..lineTo(size.width, 0)
      ..lineTo(0, 0)
      ..close();

    canvas.clipPath(path);

    var imageRect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawImageRect(
      backgroundImage!,
      imageRect,
      imageRect,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
