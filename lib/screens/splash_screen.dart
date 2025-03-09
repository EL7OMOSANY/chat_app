import 'package:chat_app/screens/sign_in_screen.dart';
import 'package:chat_app/widgets/app_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => SignInScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [
              const Color.fromARGB(255, 0, 121, 107),
              const Color.fromARGB(255, 0, 160, 107),
              const Color.fromARGB(255, 0, 220, 107),
              Colors.greenAccent,
              Colors.white,
            ],
            radius: 1.2,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: const Color.fromARGB(255, 221, 232, 238),
                radius: 90,
                child: AppImageWidget(),
              ),
              SizedBox(height: 60),
              AnimatedOpacity(
                opacity: .9,
                duration: Duration(seconds: 10),
                child: Text(
                  'Welcome in my chat',
                  style: TextStyle(
                    fontSize: 32,
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontFamily: "Pacifico",
                  ),
                ),
              ),
              SizedBox(height: 50),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 50),
                child: LinearProgressIndicator(
                  color: Color.fromARGB(255, 0, 110, 107),
                  borderRadius: BorderRadius.circular(35),
                ),
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
