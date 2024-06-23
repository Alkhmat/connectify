import 'package:connectify/code/repository/classes/repository_text.dart';
import 'package:connectify/code/repository/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeView()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              RepositoryText.hometext,
              style: GoogleFonts.pacifico(
                textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: h * 0.07,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Text(
              RepositoryText.subhometext,
              style: GoogleFonts.pacifico(
                textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: h * 0.025,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            SizedBox(height: h * 0.05),
            CircularProgressIndicator(
              color: Colors.black,
              strokeWidth: w * 0.01,
            ),
          ],
        ),
      ),
    );
  }
}
