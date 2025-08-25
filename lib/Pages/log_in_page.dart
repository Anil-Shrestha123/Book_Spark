import 'package:book_spark/Pages/sign_in_page.dart';
import 'package:book_spark/pages/dashboard_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Image.asset(
      //     'assets/images/logo.png', // Make sure this path is correct
      //     height: 100, // Adjust size as needed
      //   ),
      //   centerTitle: true,
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      // ),

      // appBar: AppBar(
      //   title: Text('LOGO', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
      //   centerTitle: true,
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      // ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage('assets/images/logo.png'), height: 200,),
              Text(
                'Welcome',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('Log In', style: TextStyle(fontSize: 16)),
              SizedBox(height: 40),
              // _buildTextField(Icons.person, 'Username'),
              // SizedBox(height: 16),
              _buildEmailField(),
              SizedBox(height: 16),
              _buildPasswordField(),
              Row(
                children: [
                  Checkbox(value: false, onChanged: (value) {}),
                  Text('I agree with terms & conditions', style: TextStyle(color: Colors.blue),),
                ],
              ),
              SizedBox(height: 16),
              SizedBox(
                width: 250,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple, // Change to your desired color
                  ),
                  onPressed: () {
                    // Handle login action
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const DashboardPage()),
                    );
                  }, 
                  child: Text('Log In', style: TextStyle(color: Colors.white, fontSize: 20),),
                ),
              ),
              SizedBox(height: 16),
              Text('OR', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              SizedBox(height: 16),
              SizedBox(
                width: 250,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(image: AssetImage('assets/images/google.png'), height: 30),
                      SizedBox(width: 10),
                      Text('Continue with Google'),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have any account?"),
                  TextButton(
                    child: Text("Create an account", style: TextStyle(color: Colors.blue),),
                    onPressed: (){
                      Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const signinpage()),
                    );
                    }, 
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget _buildTextField(IconData icon, String hint) {
  //   return TextField(
  //     decoration: InputDecoration(
  //       prefixIcon: Icon(icon),
  //       hintText: hint,
  //       border: OutlineInputBorder(),
  //     ),
  //   );
  // }

  Widget _buildEmailField() {
    return TextField(
      //obscureText: true,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.email),
        hintText: 'Email',
        // suffixIcon: Icon(Icons.visibility),
        border: OutlineInputBorder(),
      ),
    );
  }
  Widget _buildPasswordField() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock),
        hintText: 'Password',
        suffixIcon: Icon(Icons.visibility),
        border: OutlineInputBorder(),
      ),
    );
  }
}