import 'package:book_spark/Pages/auth/screen/log_in_page.dart';
import 'package:book_spark/Pages/auth/services/auth_provider.dart';
import 'package:book_spark/Pages/auth/services/auth_service.dart';
import 'package:book_spark/pages/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore: camel_case_types
class signinpage extends ConsumerWidget {
  const signinpage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formState = ref.watch(authFormProvider);
    final formNotifier = ref.read(authFormProvider.notifier);
    final authMethod = ref.read(authMethodProvider);
    void signUp()async{
      formNotifier.setLoading(true);
      final res = await authMethod.signUpUser(
        email: formState.email,
        password: formState.password,
        name: formState.name,
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
          message: "Sign Up Successful",
          context: context,
        );
      }else{
        mySnackBar(
          message: res,
          context: context,
        );
      }
      // result.fold(
      //   (error) {
      //     // Handle error
      //   },
      //   (user) {
      //     // Handle successful sign up
      //   },
      // );
    }
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
              TextField(
                //obscureText: true,
                autocorrect: false,
                onChanged: (value) => formNotifier.updateName(value),
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: 'Enter Your Name',
                  //suffixIcon: Icon(Icons.visibility),
                  border: OutlineInputBorder(),
                  errorText: formState.nameError,
                ),
              ),
              SizedBox(height: 16),
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
                  Text('I agree with terms & conditions', style: TextStyle(color: Colors.blue),),
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
                  // onPressed: () {
                  //   // Handle login action
                  //   Navigator.pushReplacement(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => const DashboardPage(),
                  //     ),
                  //   );
                  // },
                  onPressed: formState.isFormValid ? signUp : null,
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

  mySnackBar({required String message, required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}