import 'package:flutter/material.dart';
import 'base_page.dart';
import '../controllers/home_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePage extends StatelessWidget {
  final HomeController controller;

  ProfilePage(this.controller);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      bodyContent: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('assets/images/profile.png'),
              ),
              SizedBox(height: 10),
              Text(
                'Gusti Putu Wulandari',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Computer Science Student \n @Esa Unggul University',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.indigo,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        '2',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Blogs',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 20),
                  Column(
                    children: [
                      Text(
                        '10',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Projects',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 20),
                  Column(
                    children: [
                      Text(
                        '12',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Repos',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                "Hi, I'm Wulan!",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "I'm a Computer Science student at Esa Unggul University. I love diving into all things tech and coding. I also tutor students in programming using Python, which is a blast! I'm always on the lookout for new things to learn and ways to up my tech game.",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 15, left: 30),
                child: Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.locationDot,
                    ),
                    SizedBox(width: 12),
                    Text(
                      'Tangerang, Indonesia',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    IconButton(
                      icon: FaIcon(FontAwesomeIcons.github),
                      iconSize: 25,
                      onPressed: () {},
                      color: Colors.black,
                    ),
                    IconButton(
                      icon: FaIcon(FontAwesomeIcons.twitter),
                      iconSize: 25,
                      onPressed: () {},
                      color: Colors.lightBlue,
                    ),
                    IconButton(
                      icon: FaIcon(FontAwesomeIcons.instagram),
                      iconSize: 25,
                      onPressed: () {},
                      color: Colors.pink,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      selectedIndex: 1,
      controller: controller,
    );
  }
}
