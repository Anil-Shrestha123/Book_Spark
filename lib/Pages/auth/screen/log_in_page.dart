import 'package:book_spark/Pages/auth/core/utils/utils.dart';
import 'package:book_spark/Pages/auth/screen/sign_in_page.dart';
import 'package:book_spark/Pages/auth/services/auth_module.dart';
import 'package:book_spark/Pages/auth/services/auth_provider.dart';
import 'package:book_spark/Pages/auth/services/auth_service.dart';
import 'package:book_spark/pages/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {

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


  void login() async {
    final formNotifier = ref.read(authFormProvider.notifier);
    final formState = ref.read(authFormProvider);
    final authMethod = ref.read(authMethodProvider);

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

  mySnackBar({required String message, required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final formState = ref.watch(authFormProvider);
    final formNotifier = ref.read(authFormProvider.notifier);

    return Scaffold(
      body: SafeArea(
        child: Padding(
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
                Text('Log In', style: TextStyle(fontSize: 16)),
                SizedBox(height: 40),
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
                      icon: Icon(formState.isPasswordHidden
                          ? Icons.visibility_off
                          : Icons.visibility),
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
                          onPressed: formState.isFormValid ? login : null,
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
                    Container(
                      height: 1,
                      width: 135,
                      color: Colors.black,
                    ),
                    Text(
                      'OR',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Container(
                      height: 1,
                      width: 135,
                      color: Colors.black,
                    ),
                  ],
                ),
                SizedBox(height: 16),
                _isLoading
                  ? Center(child: CircularProgressIndicator())
                  :SizedBox(
                  width: 250,
                  child: ElevatedButton(
                    onPressed: _signInWithGoogle,
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
                            builder: (context) => const SignInPage(),
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
      ),
    );
  }
}
