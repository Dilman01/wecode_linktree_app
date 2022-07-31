import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  var isLogin = true;

  Future<void> _sumbit() async {
    UserCredential authResult;
    final isValid = _formKey.currentState!.validate();
    try {
      if (isLogin) {
        authResult = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
      } else {
        if (isValid) {
          authResult =
              await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim(),
          );
          _formKey.currentState!.save();
          await FirebaseFirestore.instance
              .collection('users')
              .doc(authResult.user!.uid)
              .set({
            'username': _usernameController.text.trim(),
            'email': _emailController.text.trim(),
          });
        }
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message!),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    if (!isLogin)
                      TextFormField(
                        key: const ValueKey('username'),
                        controller: _usernameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your name!';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          labelText: 'Username',
                        ),
                      ),
                    TextFormField(
                      key: const ValueKey('email'),
                      controller: _emailController,
                      validator: (value) {
                        if (value!.isEmpty || !value.contains('@')) {
                          return 'Please enter a valid email address!';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                      ),
                    ),
                    TextFormField(
                      key: const ValueKey('password'),
                      controller: _passwordController,
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty || value.length < 6) {
                          return 'Password must be at least 6 characters!';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Password',
                      ),
                    ),
                    if (!isLogin)
                      TextFormField(
                        key: const ValueKey('confirPassword'),
                        obscureText: true,
                        validator: !isLogin
                            ? (value) {
                                if (value != _passwordController.text) {
                                  return 'Passwords do not match!';
                                }
                              }
                            : null,
                        decoration: const InputDecoration(
                          labelText: 'Confirm Password',
                        ),
                      ),
                    ElevatedButton(
                      onPressed: _sumbit,
                      child: Text(isLogin ? 'Login' : 'Singup'),
                    ),
                    TextButton(
                      child: Text(isLogin
                          ? 'Sing up instead!'
                          : 'Have an account? login'),
                      onPressed: () {
                        setState(() {
                          isLogin = !isLogin;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
