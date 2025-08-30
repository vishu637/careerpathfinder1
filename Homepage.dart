import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'hometab.dart';
import 'ResumeTab.dart';
import 'ProfileTab.dart';
import 'InternshipPage.dart';
import 'LoginPage.dart';

class Homepage extends StatefulWidget {
  final String username;

  const Homepage({Key? key, required this.username}) : super(key: key);
  @override
  _HomepageState createState() => _HomepageState();
}
class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
            appBar: AppBar(
              foregroundColor: Colors.white,
              actions: [
                IconButton(
                  icon: Icon(Icons.person, color: Colors.white),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                ),
              ],
              bottom: const TabBar(
                indicatorColor: Colors.white,
                unselectedLabelColor: Colors.black,
                labelColor: Colors.black,
                tabs: [
                  Tab(icon: Icon(Icons.home)),
                  Tab(icon: Icon(Icons.description)),
                  Tab(icon: Icon(Icons.perm_contact_cal_sharp)),
                  Tab(icon: Icon(Icons.work)),
                ],
              ), // TabBar
              title: const Text('    𝗖𝗔𝗥𝗘𝗘𝗥 𝗣𝗔𝗧𝗛 𝗙𝗜𝗡𝗗𝗘𝗥 ' ,style:TextStyle(color:Colors.black,fontSize:23)),
              backgroundColor: Colors.blue,
            ), // AppBar
            body:
            Expanded(child: TabBarView(
                children: [
                  hometab(),
                  ResumeTab(),
                  ProfileTab(username: widget.username),
                  InternshipPage(),
                ],
            ), // TabBarView
            ),
        ),
        );
    }
}

