import 'package:book_spark/Pages/log_in_page.dart';
import 'package:book_spark/pages/dashboard_page.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class signinpage extends StatelessWidget {
  const signinpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage('assets/images/logo.png'), height: 200),
              Text(
                'Welcome',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('Create an account', style: TextStyle(fontSize: 16)),
              SizedBox(height: 40),
              _buildUsernameField(),
              SizedBox(height: 16),
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
                    backgroundColor:
                        Colors.deepPurple, // Change to your desired color
                  ),
                  onPressed: () {
                    // Handle login action
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DashboardPage(),
                      ),
                    );
                  },
                  child: Text(
                    'Log In',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
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
                      Image(
                        image: AssetImage('assets/images/google.png', ),
                        height: 30,
                      ),
                      SizedBox(width: 8),
                      Text('Continue with Google'),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?"),
                  TextButton(
                    child: Text("Sign Up", style: TextStyle(color: Colors.blue),),
                    onPressed: (){
                      Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage()),
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

  Widget _buildUsernameField() {
    return TextField(
      //obscureText: true,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person),
        hintText: 'Username',
        //suffixIcon: Icon(Icons.visibility),
        border: OutlineInputBorder(),
      ),
    );
  }

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
        //suffixIcon: Icon(Icons.visibility),
        border: OutlineInputBorder(),
      ),
    );
  }
}