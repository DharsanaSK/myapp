import 'package:flutter/material.dart';
import 'package:myapp/components/my_button.dart';
import 'package:myapp/components/my_textfield.dart';
import 'dart:ui' as ui;
import 'dart:async';
import 'dart:typed_data';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  // register user method
  void registerUser(BuildContext context) {
    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Registered successfully'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: CustomPaint(
          painter: BackgroundPainter(
            backgroundImage: const AssetImage('lib/images/tce.jpeg'),
          ),
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50),
                    const Icon(Icons.person_add, size: 100),
                    const SizedBox(height: 50),
                    Text(
                      'Create your account',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 25),
                    MyTextField(
                      controller: emailController,
                      hintText: 'Email',
                      obscureText: false,
                    ),
                    const SizedBox(height: 10),
                    MyTextField(
                      controller: usernameController,
                      hintText: 'Username',
                      obscureText: false,
                    ),
                    const SizedBox(height: 10),
                    MyTextField(
                      controller: passwordController,
                      hintText: 'Password',
                      obscureText: true,
                    ),
                    const SizedBox(height: 25),
                    MyButton(
                      onTap: () => registerUser(context),
                      buttonText: 'Register',
                      successMessage: 'Registered successfully',
                    ),
                    const SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already a member?',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                        const SizedBox(width: 4),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Login now',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
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
  final ImageProvider<Object> backgroundImage;

  BackgroundPainter({required this.backgroundImage});

  @override
  void paint(Canvas canvas, Size size) async {
    ui.Image? image;
    final Completer<ui.Image> completer = Completer<ui.Image>();

    final ImageStream stream =
        backgroundImage.resolve(ImageConfiguration.empty);
    stream.addListener(ImageStreamListener((ImageInfo info, bool _) {
      completer.complete(info.image);
    }));

    try {
      image = await completer.future;
    } catch (e) {
      debugPrint('Failed to load image: $e');
    }

    if (image != null) {
      final paint = Paint()..color = Colors.transparent;
      canvas.drawImage(image, Offset.zero, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
