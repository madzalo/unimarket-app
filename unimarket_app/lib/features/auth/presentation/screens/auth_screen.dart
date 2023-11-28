import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:unimarket_app/features/auth/data/models/signin_model.dart';
import 'package:unimarket_app/features/auth/presentation/bloc/remote/auth_bloc.dart';
import 'package:unimarket_app/features/auth/presentation/bloc/remote/auth_event.dart';
import 'package:unimarket_app/features/auth/presentation/bloc/remote/auth_state.dart';
import 'package:unimarket_app/features/home/home.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(''),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: email,
                        decoration: const InputDecoration(labelText: "Email"),
                      ),
                      TextFormField(
                        controller: password,
                        decoration:
                            const InputDecoration(labelText: "Password"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      BlocBuilder<AuthBloc, AuthState>(
                          builder: (context, state) {
                        if (state is SignInLoadingDone) {
                          String role = onNavigate(state.token!);
                          if (role == 'CUSTOMER') {
                            WidgetsBinding.instance
                                .addPostFrameCallback((timeStamp) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Home()));
                            });
                          }
                          if (role == 'SELLER') {
                            WidgetsBinding.instance
                                .addPostFrameCallback((timeStamp) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Home()));
                            });
                          }
                        }
                        if (state is SignInLoadingError) {
                          print(state.error);
                        }

                        return ElevatedButton(
                          onPressed: () {
                            _onSignIn(
                                context,
                                SignInModel(
                                    email: email.text,
                                    password: password.text));
                          },
                          child: const Text("Login"),
                        );
                      })
                    ],
                  ))
            ]),
          ),
        ),
      );
    });
  }

  void _onSignIn(BuildContext context, SignInModel signInModel) {
    BlocProvider.of<AuthBloc>(context).add(SignIn(signInModel));
  }
}

String onNavigate(String token) {
  String accessToken = jsonDecode(token)['access_token'];
  Map<String, dynamic> decodedToken = JwtDecoder.decode(accessToken);
  final roles = decodedToken['payload']['roles'];
  if (roles.contains("CUSTOMER")) {
    return "CUSTOMER";
  }
  if (roles.contains("SELLER")) {
    return "SELLER";
  } else {
    return "ADMIN";
  }
}
