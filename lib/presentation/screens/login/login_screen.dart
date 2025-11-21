import 'package:chat_app/core/common/custom_button.dart';
import 'package:chat_app/core/common/custom_text_field.dart';
import 'package:chat_app/presentation/screens/sign_up_screen/sign_up_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emaiController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final passwordFocusNode = FocusNode();
  final emailFocusNode = FocusNode();

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  final isPasswordVisible = ValueNotifier<bool>(false);

  @override
  void dispose() {
    emaiController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Text(
                  'Welcome Back to jungle',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Sign in to continue',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(color: Colors.grey),
                ),
                SizedBox(height: 30),
                CustomTextField(
                  hintText: 'Email',
                  controller: emaiController,
                  obscureText: false,
                  focusNode: emailFocusNode,
                  validator: (value) => _validateEmail(value),
                  prefixIcon: Icon(Icons.email_outlined),
                ),
                SizedBox(height: 16),
                ValueListenableBuilder<bool>(
                  valueListenable: isPasswordVisible,
                  builder: (context, value, child) {
                    return CustomTextField(
                      hintText: 'Password',
                      controller: passwordController,
                      obscureText: value,
                      prefixIcon: Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        splashColor: Colors.transparent,
                        icon: Icon(
                          value ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          isPasswordVisible.value = !isPasswordVisible.value;
                        },
                      ),
                      focusNode: passwordFocusNode,
                      validator: (value) => _validatePassword(value),
                    );
                  },
                ),
                SizedBox(height: 30),
                CustomButton(
                  text: 'Login',
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      // Process data.
                    }
                  },
                ),

                SizedBox(height: 20),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Don't have an account? ",
                      style: Theme.of(context).textTheme.bodyMedium,
                      children: [
                        TextSpan(
                          text: 'Sign Up',
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Handle sign up navigation
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const SignUpScreen();
                                  },
                                ),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
