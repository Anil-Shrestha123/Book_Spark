import 'package:book_spark/Pages/auth/core/utils/utils.dart';
import 'package:book_spark/Pages/auth/screen/log_in_page.dart';
import 'package:book_spark/Pages/auth/services/auth_module.dart';
import 'package:book_spark/Pages/auth/services/auth_provider.dart';
import 'package:book_spark/Pages/auth/services/auth_service.dart';
import 'package:book_spark/pages/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore: camel_case_types
class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({super.key});

  @override
  ConsumerState<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
  bool _isLoading = false;

  Future<void> _signInWithGoogle() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final userCredential = await GoogleSignInService.signInWithGoogle();
      if (!mounted) return;
      //navigate to the next screen if success
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DashboardPage()),
      );
      if (userCredential != null) {
        if (!mounted) return;
        print('User signed in: ${userCredential.user?.displayName}');
      }
    } catch (e) {
      if (!mounted) return;
      showAppSnackbar(
        context: context,
        type: SnackbarType.error,
        description: "Google sign-in failed",
      );
      print('Sign in error: $e');
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void mySnackBar({required String message, required BuildContext context}) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  void signUp(formNotifier, formState, authMethod) async {
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
        MaterialPageRoute(builder: (context) => const DashboardPage()),
      );
      mySnackBar(message: "Sign Up Successful", context: context);
    } else {
      mySnackBar(message: res, context: context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final formState = ref.watch(authFormProvider);
    final formNotifier = ref.read(authFormProvider.notifier);
    final authMethod = ref.read(authMethodProvider);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage('assets/images/logo.png'), height: 150),
              Text(
                'Welcome',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('Create an account', style: TextStyle(fontSize: 16)),
              SizedBox(height: 40),
              TextField(
                autocorrect: false,
                onChanged: (value) => formNotifier.updateName(value),
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: 'Enter Your Name',
                  border: OutlineInputBorder(),
                  errorText: formState.nameError,
                ),
              ),
              SizedBox(height: 16),
              TextField(
                autocorrect: false,
                onChanged: (value) => formNotifier.updateEmail(value),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: 'Enter Your Email',
                  border: OutlineInputBorder(),
                  errorText: formState.emailError,
                ),
              ),
              SizedBox(height: 16),
              TextField(
                autocorrect: false,
                onChanged: (value) => formNotifier.updatePassword(value),
                keyboardType: TextInputType.visiblePassword,
                obscureText: formState.isPasswordHidden,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: 'Enter Your Password',
                  suffixIcon: IconButton(
                    onPressed: () => formNotifier.togglePasswordVisibility(),
                    icon: Icon(
                      formState.isPasswordHidden
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  ),
                  border: OutlineInputBorder(),
                  errorText: formState.passwordError,
                ),
              ),
              SizedBox(height: 16),
              formState.isLoading
                  ? Center(child: CircularProgressIndicator())
                  : SizedBox(
                      width: 250,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                        ),
                        onPressed: formState.isFormValid
                            ? () => signUp(formNotifier, formState, authMethod)
                            : null,
                        child: Text(
                          'Log In',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(height: 1, width: 135, color: Colors.black),
                  Text(
                    'OR',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Container(height: 1, width: 135, color: Colors.black),
                ],
              ),
              SizedBox(height: 16),
              _isLoading
                  ? Center(child: CircularProgressIndicator())
                  : SizedBox(
                      width: 250,
                      child: ElevatedButton(
                        onPressed: _signInWithGoogle,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Image(
                              image: AssetImage('assets/images/google.png'),
                              height: 30,
                            ),
                            const SizedBox(width: 8),
                            const Text('Continue with Google'),
                          ],
                        ),
                      ),
                    ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?"),
                  TextButton(
                    child: Text("Log In", style: TextStyle(color: Colors.blue)),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
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
}
