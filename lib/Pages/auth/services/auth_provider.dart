
import 'package:book_spark/Pages/auth/module/auth_module.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthFormNotifier extends StateNotifier<AuthFormState> {
  AuthFormNotifier() : super(AuthFormState());

  void togglePasswordVisibility() {
    state = state.copyWith(isPasswordHidden: !state.isPasswordHidden);
  }

  void updateName(String name) {
    String? nameError;
    if (name.isNotEmpty && name.length < 6) {
      nameError = 'Name must be at least 6 characters';
    }
    state = state.copyWith(name: name, nameError: nameError);
  }

  void updateEmail(String email) {
    String? emailError;
    if (email.isNotEmpty &&
        !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      emailError = 'Invalid email address';
    }
    state = state.copyWith(email: email, emailError: emailError);
  }

  void updatePassword(String password) {
    String? passwordError;
    if (password.isNotEmpty && password.length < 6) {
      passwordError = 'Password must be at least 6 characters';
    }
    state = state.copyWith(password: password, passwordError: passwordError);
  }

  void setLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }

  // void emailChanged(String email) {
  //   state = state.copyWith(email: email);
  // }

  // void passwordChanged(String password) {
  //   state = state.copyWith(password: password);
  // }


  // void submit() {
  //   // Handle form submission 
  // }
}

final authFormProvider = StateNotifierProvider<AuthFormNotifier, AuthFormState>(
  (ref) {
    return AuthFormNotifier();
  },
);
