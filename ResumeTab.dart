import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ResumeTab extends StatefulWidget {
  const ResumeTab({super.key});

  @override
  State<ResumeTab> createState() => _ResumeTabState();
}

class _ResumeTabState extends State<ResumeTab> {
  late final WebViewController _controller;

  final String htmlCode = """
  <!DOCTYPE html>
  <html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CSE Student Resume Builder</title>
    <style>
      body { font-family: Arial, sans-serif; background: #f4f4f4; margin:0; padding:0; }
      .container { width: 90%; max-width: 800px; margin: 20px auto; background:#fff; padding:20px; border-radius:8px; }
      h1 { text-align:center; color:#333; }
      label { display:block; margin:10px 0 5px; font-weight:bold; }
      input, textarea { width:100%; padding:8px; margin-bottom:15px; border-radius:5px; border:1px solid #ccc; }
      button { padding:10px 20px; background:#4CAF50; color:white; border:none; border-radius:5px; cursor:pointer; font-size:16px; }
      button:hover { background:#45a049; }
      .resume { margin-top:20px; padding:20px; background:#e8f0fe; border-radius:8px; }
      .resume h2 { margin-top:0; color:#2c3e50; }
      .resume img { width:120px; height:120px; border-radius:50%; object-fit:cover; float:right; margin-left:20px; border:2px solid #333; }
      .clear { clear:both; }
    </style>
  </head>
  <body>
    <div class="container">
      <h1>CSE Student Resume Builder</h1>
      <form id="resumeForm">
        <label for="photo">Upload Profile Image:</label>
        <input type="file" id="photo" accept="image/*">
        <label for="name">Full Name:</label>
        <input type="text" id="name" required>
        <label for="email">Email:</label>
        <input type="email" id="email" required>
        <label for="phone">Phone Number:</label>
        <input type="text" id="phone" required>
        <label for="address">Address:</label>
        <input type="text" id="address">
        <label for="objective">Career Objective:</label>
        <textarea id="objective" rows="3"></textarea>
        <label for="education">Education:</label>
        <textarea id="education" rows="3"></textarea>
        <label for="skills">Skills:</label>
        <textarea id="skills" rows="2"></textarea>
        <label for="projects">Projects:</label>
        <textarea id="projects" rows="3"></textarea>
        <label for="internships">Internships:</label>
        <textarea id="internships" rows="2"></textarea>
        <label for="achievements">Achievements:</label>
        <textarea id="achievements" rows="2"></textarea>
        <button type="button" onclick="generateResume()">Generate Resume</button>
      </form>
      <div id="resumeOutput" class="resume" style="display:none;"></div>
    </div>
    <script>
      function generateResume() {
        const photo = document.getElementById('photo').files[0];
        const name = document.getElementById('name').value;
        const email = document.getElementById('email').value;
        const phone = document.getElementById('phone').value;
        const address = document.getElementById('address').value;
        const objective = document.getElementById('objective').value;
        const education = document.getElementById('education').value;
        const skills = document.getElementById('skills').value;
        const projects = document.getElementById('projects').value;
        const internships = document.getElementById('internships').value;
        const achievements = document.getElementById('achievements').value;
        const resumeDiv = document.getElementById('resumeOutput');
        resumeDiv.style.display = 'block';
        let imgTag = '';
        if(photo) {
          const reader = new FileReader();
          reader.onload = function(e) {
            imgTag = '<img src="'+e.target.result+'" alt="Profile Image">';
            resumeDiv.innerHTML = imgTag +
              '<h2>'+name+'</h2>' +
              '<p><strong>Email:</strong> '+email+'</p>' +
              '<p><strong>Phone:</strong> '+phone+'</p>' +
              '<p><strong>Address:</strong> '+address+'</p>' +
              '<div class="clear"></div>' +
              '<h3>Career Objective</h3><p>'+objective+'</p>' +
              '<h3>Education</h3><p>'+education+'</p>' +
              '<h3>Skills</h3><p>'+skills+'</p>' +
              '<h3>Projects</h3><p>'+projects+'</p>' +
              '<h3>Internships</h3><p>'+internships+'</p>' +
              '<h3>Achievements</h3><p>'+achievements+'</p>';
          }
          reader.readAsDataURL(photo);
        } else {
          resumeDiv.innerHTML = 
            '<h2>'+name+'</h2>' +
            '<p><strong>Email:</strong> '+email+'</p>' +
            '<p><strong>Phone:</strong> '+phone+'</p>' +
            '<p><strong>Address:</strong> '+address+'</p>' +
            '<h3>Career Objective</h3><p>'+objective+'</p>' +
            '<h3>Education</h3><p>'+education+'</p>' +
            '<h3>Skills</h3><p>'+skills+'</p>' +
            '<h3>Projects</h3><p>'+projects+'</p>' +
            '<h3>Internships</h3><p>'+internships+'</p>' +
            '<h3>Achievements</h3><p>'+achievements+'</p>';
        }
      }
    </script>
  </body>
  </html>
  """;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadHtmlString(htmlCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CSE Resume Builder')),
      body: WebViewWidget(controller: _controller),
    );
  }
}