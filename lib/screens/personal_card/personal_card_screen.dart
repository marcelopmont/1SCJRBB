import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class PersonalCardScreen extends StatelessWidget {
  static const String id = 'personal_card';

  const PersonalCardScreen({
    Key? key,
    required this.arguments,
  }) : super(key: key);

  final PersonalCardScreenArguments arguments;

  @override
  Widget build(BuildContext context) {
    final myPhone = arguments.phone;
    final myEmail = arguments.email;

    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile.jpg'),
                radius: 100,
              ),
              const SizedBox(height: 16),
              Text(
                'Marcelo Montanher',
                style: GoogleFonts.indieFlower(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Material(
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(1000),
                ),
                elevation: 16,
                child: ListTile(
                  onTap: () {
                    launchUrl(
                      Uri(
                        scheme: 'tel',
                        query: '+$myPhone',
                      ),
                    );
                  },
                  leading: const Icon(
                    Icons.phone_android,
                    color: Colors.teal,
                  ),
                  title: Text(
                    myPhone,
                    style: const TextStyle(
                      color: Colors.teal,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(1000)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        spreadRadius: 10,
                        blurRadius: 5,
                        offset: Offset(5, 5),
                      )
                    ]),
                child: ListTile(
                  leading: const Icon(
                    Icons.email,
                    color: Colors.teal,
                  ),
                  onTap: () {
                    launchUrl(
                      Uri(
                        scheme: 'mailto',
                        path: myEmail,
                        query: 'subject=Olá',
                      ),
                    );
                  },
                  title: Text(
                    myEmail,
                    style: const TextStyle(color: Colors.teal),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PersonalCardScreenArguments {
  PersonalCardScreenArguments({
    required this.phone,
    required this.email,
  });

  String phone;
  String email;
}