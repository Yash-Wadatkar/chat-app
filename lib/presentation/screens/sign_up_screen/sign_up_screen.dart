import 'package:chat_app/core/common/custom_button.dart';
import 'package:chat_app/core/common/custom_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final emaiController = TextEditingController();
  final passwordController = TextEditingController();
  final userNameController = TextEditingController();
  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();

  final isPasswordVisible = ValueNotifier<bool>(false);

  final usernameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final phoneFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final nameFocusNode = FocusNode();

  @override
  void dispose() {
    emaiController.dispose();
    passwordController.dispose();
    userNameController.dispose();
    nameController.dispose();
    phoneNumberController.dispose();
    usernameFocusNode.dispose();
    emailFocusNode.dispose();
    phoneFocusNode.dispose();
    passwordFocusNode.dispose();
    nameFocusNode.dispose();
    super.dispose();
  }

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

  String? _validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Username is required';
    }
    if (value.length < 3) {
      return 'Username must be at least 3 characters long';
    }
    return null;
  }

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Full name is required';
    }
    return null;
  }

  String? _validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    final phoneRegex = RegExp(r'^\+?[0-9]{7,15}$');
    if (!phoneRegex.hasMatch(value)) {
      return 'Enter a valid phone number';
    }
    return null;
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
                  'Create Account',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Please fill in the details to create an account',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(color: Colors.grey),
                ),
                SizedBox(height: 30),
                CustomTextField(
                  hintText: 'Full Name',
                  controller: nameController,
                  obscureText: false,
                  prefixIcon: Icon(Icons.badge_outlined),
                  focusNode: nameFocusNode,
                  validator: (value) {
                    return _validateName(value);
                  },
                ),
                SizedBox(height: 16),
                CustomTextField(
                  hintText: 'Username',
                  controller: userNameController,
                  obscureText: false,
                  prefixIcon: Icon(Icons.alternate_email),
                  focusNode: usernameFocusNode,
                  validator: (value) {
                    return _validateUsername(value);
                  },
                ),

                SizedBox(height: 16),
                CustomTextField(
                  hintText: 'Email',
                  controller: emaiController,
                  obscureText: false,
                  focusNode: emailFocusNode,
                  validator: (value) {
                    return _validateEmail(value);
                  },
                  prefixIcon: Icon(Icons.email_outlined),
                ),
                SizedBox(height: 16),
                CustomTextField(
                  hintText: 'Phone Number',
                  controller: phoneNumberController,
                  obscureText: false,
                  prefixIcon: Icon(Icons.phone_outlined),
                  focusNode: phoneFocusNode,
                  validator: (value) => _validatePhoneNumber(value),
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
                      validator: (value) {
                        return _validatePassword(value);
                      },
                    );
                  },
                ),
                SizedBox(height: 16),

                SizedBox(height: 30),
                CustomButton(
                  text: 'Create Account',
                  onPressed: () {
                    /// this is so that when we click on button, keyboard is dismissed
                    FocusScope.of(context).unfocus();
                    if (_formKey.currentState?.validate() ?? false) {
                      // Handle sign up logic
                    }
                  },
                ),

                SizedBox(height: 20),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Already have an account? ",
                      style: Theme.of(context).textTheme.bodyMedium,
                      children: [
                        TextSpan(
                          text: 'Login',
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Handle log in navigation
                              Navigator.pop(context);
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
