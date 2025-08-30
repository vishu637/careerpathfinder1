import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class InternshipPage extends StatefulWidget {
  const InternshipPage({super.key});

  @override
  State<InternshipPage> createState() => _InternshipPageState();
}

class _InternshipPageState extends State<InternshipPage> {
  late GoogleMapController _mapController;

  final List<Map<String, dynamic>> internships = [
    {"title": "Flutter Developer Intern", "company": "Tech Corp", "lat": 18.5204, "lng": 73.8567},
    {"title": "AI Intern", "company": "AI Labs", "lat": 18.5220, "lng": 73.8540},
    {"title": "Web Developer Intern", "company": "Web Solutions", "lat": 18.5180, "lng": 73.8550},
    {"title": "Data Analyst Intern", "company": "Data Minds", "lat": 18.5215, "lng": 73.8575},
    {"title": "UI/UX Intern", "company": "Creative Studio", "lat": 18.5195, "lng": 73.8580},
    {"title": "Blockchain Intern", "company": "ChainWorks", "lat": 18.5230, "lng": 73.8525},
    {"title": "Marketing Intern", "company": "Market Experts", "lat": 18.5200, "lng": 73.8530},
    {"title": "Robotics Intern", "company": "RoboTech", "lat": 18.5225, "lng": 73.8555},
    {"title": "Machine Learning Intern", "company": "ML Hub", "lat": 18.5210, "lng": 73.8560},
    {"title": "Backend Developer Intern", "company": "ServerWorks", "lat": 18.5190, "lng": 73.8570},
  ];

  Set<Marker> getMarkers() {
    return internships
        .map(
          (intern) => Marker(
        markerId: MarkerId(intern['company']),
        position: LatLng(intern['lat'], intern['lng']),
        infoWindow: InfoWindow(title: intern['title'], snippet: intern['company']),
      ),
    )
        .toSet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pune Internships')),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: GoogleMap(
              initialCameraPosition: const CameraPosition(
                target: LatLng(18.5204, 73.8567), // Pune center
                zoom: 13,
              ),
              markers: getMarkers(),
              onMapCreated: (controller) => _mapController = controller,
            ),
          ),
          Expanded(
            flex: 3,
            child: ListView.builder(
              itemCount: internships.length,
              itemBuilder: (context, index) {
                final intern = internships[index];
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    leading: const Icon(Icons.school, color: Colors.blue),
                    title: Text(intern['title']),
                    subtitle: Text(intern['company']),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}