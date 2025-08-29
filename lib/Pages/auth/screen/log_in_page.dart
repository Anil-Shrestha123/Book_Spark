import 'package:book_spark/Pages/auth/screen/sign_in_page.dart';
import 'package:book_spark/Pages/auth/services/auth_provider.dart';
import 'package:book_spark/Pages/auth/services/auth_service.dart';
import 'package:book_spark/pages/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final formState = ref.watch(authFormProvider);
    // final formNotifier = ref.read(authFormProvider.notifier);
    // final authMethod = ref.read(authMethodProvider);
    // void login()async{
    //   formNotifier.setLoading(true);
    //   final res = await authMethod.logInUser(
    //     email: formState.email,
    //     password: formState.password,
    //   );
    //   formNotifier.setLoading(false);
    //   if (res == "success") {
    //     Navigator.pushReplacement(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => const DashboardPage(),
    //       ),
    //     );
    //     mySnackBar(
    //       message: "Login Successful",
    //       context: context,
    //     );
    //   }else{
    //     mySnackBar(
    //       message: res,
    //       context: context,
    //     );
    //   }
    // }
    final formState = ref.watch(authFormProvider);
    final formNotifier = ref.read(authFormProvider.notifier);

    final authMethod = ref.read(authMethodProvider); // ✅ FIXED

    void login() async {
      formNotifier.setLoading(true);
      final res = await authMethod.logInUser(
        email: formState.email,
        password: formState.password,
      );
      formNotifier.setLoading(false);
      if (res == "success") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const DashboardPage(),
          ),
        );
        mySnackBar(
          message: "Login Successful",
          context: context,
        );
      } else {
        mySnackBar(
          message: res,
          context: context,
        );
      }
    }
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
              Image(image: AssetImage('assets/images/logo.png'), height: 200),
              Text(
                'Welcome',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('Log In', style: TextStyle(fontSize: 16)),
              SizedBox(height: 40),
              // _buildTextField(Icons.person, 'Username'),
              // SizedBox(height: 16),

              TextField(
                //obscureText: true,
                autocorrect: false,
                onChanged: (value) => formNotifier.updateEmail(value),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: 'Enter Your Email',
                  //suffixIcon: Icon(Icons.visibility),
                  border: OutlineInputBorder(),
                  errorText: formState.emailError,
                ),
              ),

              SizedBox(height: 16),
              TextField(
                //obscureText: true,
                autocorrect: false,
                onChanged: (value) => formNotifier.updatePassword(value),
                keyboardType: TextInputType.visiblePassword,
                obscureText: formState.isPasswordHidden,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: 'Enter Your Password',
                  suffixIcon: IconButton(onPressed: () => formNotifier.togglePasswordVisibility(), icon: Icon(formState.isPasswordHidden ? Icons.visibility_off : Icons.visibility)),
                  border: OutlineInputBorder(),
                  errorText: formState.passwordError,
                ),
              ),
              Row(
                children: [
                  Checkbox(value: false, onChanged: (value) {}),
                  Text(
                    'I agree with terms & conditions',
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
              SizedBox(height: 16),
              formState.isLoading ? Center(child: CircularProgressIndicator(),) : SizedBox(
                width: 250,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.deepPurple, // Change to your desired color
                  ),
                  onPressed: formState.isFormValid ? login : null,
                  child: Text(
                    'Log In',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'OR',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
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
                        image: AssetImage('assets/images/google.png'),
                        height: 30,
                      ),
                      SizedBox(width: 10),
                      Text('Continue with Google'),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have any account?"),
                  TextButton(
                    child: Text(
                      "Create an account",
                      style: TextStyle(color: Colors.blue),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const signinpage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  mySnackBar({required String message, required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
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

  // Widget _buildEmailField() {
  //   return TextField(
  //     //obscureText: true,
  //     keyboardType: TextInputType.emailAddress,
  //     decoration: InputDecoration(
  //       prefixIcon: Icon(Icons.email),
  //       hintText: 'Email',
  //       // suffixIcon: Icon(Icons.visibility),
  //       border: OutlineInputBorder(),
  //     ),
  //   );
  // }
  // Widget _buildPasswordField() {
  //   return TextField(
  //     obscureText: true,
  //     decoration: InputDecoration(
  //       prefixIcon: Icon(Icons.lock),
  //       hintText: 'Password',
  //       suffixIcon: Icon(Icons.visibility),
  //       border: OutlineInputBorder(),
  //     ),
  //   );
  // }
}
