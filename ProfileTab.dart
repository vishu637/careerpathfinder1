import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileTab extends StatefulWidget {
  final String username; // username for saving/loading profile

  const ProfileTab({Key? key, required this.username}) : super(key: key);

  @override
  _ProfileTabState createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  final _formKey = GlobalKey<FormState>();

  // Profile fields
  String name = '';
  String email = '';
  String age = '';
  String profession = '';
  String institute = '';
  String city = '';
  String yearOfStudy = '';

  bool showProfile = false; // Toggle between form and profile

  // Controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _professionController = TextEditingController();
  final TextEditingController _instituteController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadProfile(); // Load profile when page opens
  }

  Future<void> _loadProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedName = prefs.getString('${widget.username}_name');
    if (savedName != null) {
      setState(() {
        name = savedName;
        email = prefs.getString('${widget.username}_email') ?? '';
        age = prefs.getString('${widget.username}_age') ?? '';
        profession = prefs.getString('${widget.username}_profession') ?? '';
        institute = prefs.getString('${widget.username}_institute') ?? '';
        city = prefs.getString('${widget.username}_city') ?? '';
        yearOfStudy = prefs.getString('${widget.username}_year') ?? '';

        // Set controllers
        _nameController.text = name;
        _emailController.text = email;
        _ageController.text = age;
        _professionController.text = profession;
        _instituteController.text = institute;
        _cityController.text = city;
        _yearController.text = yearOfStudy;

        showProfile = true; // Show profile directly if exists
      });
    }
  }

  Future<void> _saveProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('${widget.username}_name', name);
    await prefs.setString('${widget.username}_email', email);
    await prefs.setString('${widget.username}_age', age);
    await prefs.setString('${widget.username}_profession', profession);
    await prefs.setString('${widget.username}_institute', institute);
    await prefs.setString('${widget.username}_city', city);
    await prefs.setString('${widget.username}_year', yearOfStudy);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Profile Saved!')),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _ageController.dispose();
    _professionController.dispose();
    _instituteController.dispose();
    _cityController.dispose();
    _yearController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Generator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: showProfile ? _buildProfileCard() : _buildForm(),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _buildTextField('Name', _nameController),
          SizedBox(height: 10),
          _buildTextField('Email', _emailController),
          SizedBox(height: 10),
          _buildTextField('Age', _ageController, isNumber: true),
          SizedBox(height: 10),
          _buildTextField('Preferred Profession', _professionController),
          SizedBox(height: 10),
          _buildTextField('Institute Name', _instituteController),
          SizedBox(height: 10),
          _buildTextField('City', _cityController),
          SizedBox(height: 10),
          _buildTextField('Year of Study', _yearController, isNumber: true),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _saveFormValues();
                setState(() {
                  showProfile = true;
                });
              }
            },
            child: Text('Generate Profile'),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.indigo.shade100,
              child: Icon(
                Icons.person,
                size: 50,
                color: Colors.indigo,
              ),
            ),
            SizedBox(height: 15),
            Text(name, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text(email),
            Text('Age: $age'),
            Text('Preferred Profession: $profession'),
            SizedBox(height: 10),
            Text('Institute: $institute'),
            Text('City: $city'),
            Text('Year of Study: $yearOfStudy'),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      showProfile = false;
                    });
                  },
                  icon: Icon(Icons.edit),
                  label: Text('Edit'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                ),
                ElevatedButton.icon(
                  onPressed: _saveProfile,
                  icon: Icon(Icons.save),
                  label: Text('Save'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _saveFormValues() {
    name = _nameController.text;
    email = _emailController.text;
    age = _ageController.text;
    profession = _professionController.text;
    institute = _instituteController.text;
    city = _cityController.text;
    yearOfStudy = _yearController.text;
  }

  Widget _buildTextField(String label, TextEditingController controller, {bool isNumber = false}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      validator: (val) => val == null || val.isEmpty ? 'Enter $label' : null,
    );
  }
}