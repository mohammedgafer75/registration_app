import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:registration_app/Screens/department5s_page.dart';
import 'package:registration_app/Screens/home_page.dart';
import 'package:registration_app/Screens/pay_page.dart';
import 'package:registration_app/controller/auth_controller.dart';

class MainScreen extends StatelessWidget {
const MainScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
      AuthController auth = Get.find();
     final data = MediaQuery.of(context);
    final width = data.size.width;
    final height = data.size.height;
    return Scaffold(
      appBar: AppBar(title: Text('Admin Page'), actions: [
        IconButton(
            onPressed: () {
              auth.signOut();
            },
            icon: Icon(Icons.logout))
      ]),
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(
          top: height / 7,
        ),
        padding: EdgeInsets.only(left: width / 8, right: width / 8),
        child: Center(
          child: GridView.count(
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              crossAxisCount: 2,
              childAspectRatio: .90,
              children: const [
                Card_d(
                  icon: Icon(Icons.person, size: 30, color: Colors.white),
                  title: 'My Detils',
                  nav: HomePage(),
                ),
                Card_d(
                  icon: Icon(Icons.accessibility, size: 30, color: Colors.white),
                  title: ' Departments',
                  nav: Department5sPage(),
                ),
                Card_d(
                  icon: Icon(Icons.attach_money,size: 30, color: Colors.white),
                  title: 'Pay the fees',
                  nav: PayPage(),
                ),
              ]),
        ),
      ),
    );
  }
}

class Card_d extends StatefulWidget {
  const Card_d(
      {Key? key, required this.title, required this.icon, required this.nav})
      : super(key: key);
  final String title;
  final dynamic icon;
  final dynamic nav;

  @override
  State<Card_d> createState() => _Card_dState();
}

// ignore: camel_case_types
class _Card_dState extends State<Card_d> {
  void showBar(BuildContext context, String msg) {
    var bar = SnackBar(
      content: Text(msg),
    );
    ScaffoldMessenger.of(context).showSnackBar(bar);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => widget.nav));
      },
      child: Card(
        color: Colors.blueAccent,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Center(child: widget.icon),
              const SizedBox(
                height: 10,
              ),
              Text(widget.title, style: const TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}