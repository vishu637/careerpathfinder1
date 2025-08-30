import 'package:flutter/material.dart';

class hometab extends StatelessWidget {
  final List<Map<String, dynamic>> steps = [
    {
      "icon": Icons.picture_as_pdf,
      "title": "Build Resume",
      "subtitle": "Create a professional resume instantly.",
      "color": Colors.blue
    },
    {
      "icon": Icons.add_road_sharp,
      "title": "Career Roadmaps",
      "subtitle": "Explore personalized paths for CSE careers.",
      "color": Colors.orange
    },
    {
      "icon": Icons.work,
      "title": "Find Internships",
      "subtitle": "Get internship opportunities based on your profile.",
      "color": Colors.green
    },
    {
      "icon": Icons.videogame_asset,
      "title": "Play Career Quiz",
      "subtitle": "Test knowledge & explore careers with fun quizzes.",
      "color": Colors.purple
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          // ===== Header Section =====
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 60, horizontal: 20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.indigo, Colors.deepPurple],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.explore, size: 80, color: Colors.white),
                SizedBox(height: 20),
                Text(
                  "Career Path Finder",
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(height: 10),
                Text(
                  "Your all-in-one guide for CSE Careers 🚀",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
              ],
            ),
          ),

          SizedBox(height: 40),

          // ===== How App Works Section =====
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Text(
                  "How the App Works",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo),
                ),
                SizedBox(height: 20),

                // Steps List
                ...steps.map((step) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 12),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor:
                          (step["color"] as Color).withOpacity(0.15),
                          child: Icon(step["icon"],
                              size: 32, color: step["color"]),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                step["title"],
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87),
                              ),
                              SizedBox(height: 6),
                              Text(
                                step["subtitle"],
                                style: TextStyle(
                                    fontSize: 14, color: Colors.grey[700]),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ],
            ),
          ),

          SizedBox(height: 40),

          // ===== Footer =====
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Colors.indigo.shade100,
            child: Column(
              children: [
                Text(
                  "© 2025 Career Path Finder",
                  style: TextStyle(color: Colors.black54),
                ),
                SizedBox(height: 5),
                Text(
                  "Built with ❤ for CSE Engineers",
                  style: TextStyle(color: Colors.black87),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}


/*import 'package:flutter/material.dart';

class hometab extends StatelessWidget {
  final List<Map<String, dynamic>> steps = [
    {
      "icon": Icons.picture_as_pdf,
      "title": "Build Resume",
      "subtitle": "Create a professional resume instantly.",
      "color": Colors.blue
    },
    {
      "icon": Icons.add_road_sharp,
      "title": "Career Roadmaps",
      "subtitle": "Explore personalized paths for CSE careers.",
      "color": Colors.orange
    },
    {
      "icon": Icons.work,
      "title": "Find Internships",
      "subtitle": "Get internship opportunities based on your profile.",
      "color": Colors.green
    },
    {
      "icon": Icons.videogame_asset,
      "title": "Play Career Quiz",
      "subtitle": "Test knowledge & explore careers with fun quizzes.",
      "color": Colors.purple
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ===== Header Section =====
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 60, horizontal: 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.indigo, Colors.deepPurple],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.explore, size: 80, color: Colors.white),
                  SizedBox(height: 20),
                  Text(
                    "Career Path Finder",
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Your all-in-one guide for CSE Careers 🚀",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                  ),
                ],
              ),
            ),

            SizedBox(height: 40),

            // ===== How App Works Section =====
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Text(
                    "How the App Works",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo),
                  ),
                  SizedBox(height: 20),

                  Column(
                    children: List.generate(steps.length, (index) {
                      final step = steps[index];
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 12),
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 8,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor:
                              (step["color"] as Color).withOpacity(0.15),
                              child: Icon(step["icon"],
                                  size: 32, color: step["color"]),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    step["title"],
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87),
                                  ),
                                  SizedBox(height: 6),
                                  Text(
                                    step["subtitle"],
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.grey[700]),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),

            SizedBox(height: 40),

            // ===== Footer =====
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              color: Colors.indigo.shade100,
              child: Column(
                children: [
                  Text(
                    "© 2025 Career Path Finder",
                    style: TextStyle(color: Colors.black54),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Built with ❤ for CSE Engineers",
                    style: TextStyle(color: Colors.black87),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
*/