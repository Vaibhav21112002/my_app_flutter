import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:mailto/mailto.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String number = "+91 9971002651";
    String email = "arun3216@gmail.com";
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('images/profile.jpeg'),
                ),
                Text(
                  "Arun Gupta",
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Pacifico',
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "GOOGLE SOFTWARE ENGINEER",
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'SourceSansPro',
                    letterSpacing: 2.5,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                  width: 200.0,
                  child: Divider(
                    color: Color.fromARGB(255, 198, 195, 195),
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    await FlutterPhoneDirectCaller.callNumber(number);
                  },
                  child: Card(
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    color: Colors.white,
                    child: ListTile(
                      leading: Icon(
                        Icons.phone,
                        color: Colors.teal,
                      ),
                      title: Text(
                        number,
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.teal,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'SourceSansPro',
                          letterSpacing: 2.5,
                        ),
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    final mailtoLink = Mailto(
                      to: [email],
                      subject: 'Sample Mail',
                      body: 'This is a sample Mail. Add your message here',
                    );
                    await launchUrl(
                      Uri(
                        path: mailtoLink.toString(),
                      ),
                    );
                  },
                  child: Card(
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    color: Colors.white,
                    child: ListTile(
                      leading: Icon(
                        Icons.email,
                        color: Colors.teal,
                      ),
                      title: Text(
                        email,
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.teal,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'SourceSansPro',
                          letterSpacing: 2.5,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
