import 'package:flutter/material.dart';



class RoadmapPage extends StatelessWidget {
  final List<RoadmapStep> steps = [
    RoadmapStep(
      title: '1st Year – Foundation',
      icon: Icons.school,
      description:
      '• Learn C, Python\n• Focus on Math, DS & Algo basics\n• Build logic with basic projects',
    ),
    RoadmapStep(
      title: '2nd Year – Development Phase',
      icon: Icons.computer,
      description:
      '• Learn OOPs, DBMS, OS\n• Web Dev / App Dev\n• Start competitive programming',
    ),
    RoadmapStep(
      title: '3rd Year – Skill Building',
      icon: Icons.build_circle,
      description:
      '• Explore AI/ML, Cloud, Blockchain\n• Build strong projects\n• Apply for internships',
    ),
    RoadmapStep(
      title: '4th Year – Career Launch',
      icon: Icons.rocket_launch,
      description:
      '• Placement prep\n• DSA Revision + System Design\n• Contribute to open source\n• Apply for jobs/higher studies',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CSE Roadmap'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: steps.length,
        itemBuilder: (context, index) {
          return RoadmapCard(step: steps[index]);
        },
      ),
    );
  }
}

class RoadmapStep {
  final String title;
  final IconData icon;
  final String description;

  RoadmapStep({
    required this.title,
    required this.icon,
    required this.description,
  });
}

class RoadmapCard extends StatelessWidget {
  final RoadmapStep step;

  RoadmapCard({required this.step});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.indigo,
          child: Icon(step.icon, color: Colors.white),
        ),
        title: Text(step.title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(step.description),
        ),
      ),
    );
  }
}