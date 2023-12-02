import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unimarket_app/core/common/custom_elevated_button.dart';
import 'package:unimarket_app/core/common/custom_text_form_field.dart';
import 'package:unimarket_app/core/common/vertical_space.dart';
import 'package:unimarket_app/features/auth/data/models/signin_model.dart';
import 'package:unimarket_app/features/auth/presentation/bloc/remote/auth_bloc.dart';
import 'package:unimarket_app/features/auth/presentation/bloc/remote/auth_event.dart';
import 'package:unimarket_app/features/auth/presentation/bloc/remote/auth_state.dart';
import 'package:unimarket_app/features/auth/presentation/screens/register_screen.dart';
import 'package:unimarket_app/features/home/main_screen.dart';
import 'package:unimarket_app/features/seller/seller_main_screen.dart';
import 'package:unimarket_app/injection_container.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});
  static const routeName = "/auth-screen";

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => sl.get<AuthBloc>(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text(''),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 90,
                              child: CustomTextFormField(
                                  controller: email, label: "Email"),
                            ),
                            SizedBox(
                              height: 90,
                              child: CustomTextFormField(
                                  controller: password, label: "Password"),
                            ),
                            verticalSpace(20),
                            BlocBuilder<AuthBloc, AuthState>(
                                builder: (context, state) {
                              if (state is SignInLoading) {
                                return const CircularProgressIndicator
                                    .adaptive();
                              }
                              if (state is SignInLoadingDone) {
                                print(state.token);
                                String role = onNavigate(state.token!);
                                if (role == 'CUSTOMER') {
                                  WidgetsBinding.instance
                                      .addPostFrameCallback((timeStamp) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const MainScreen()));
                                  });
                                }
                                if (role == 'SELLER') {
                                  WidgetsBinding.instance
                                      .addPostFrameCallback((timeStamp) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SellerMainScreen()));
                                  });
                                }
                              }
                              if (state is SignInLoadingError) {
                                print(state.error);
                              }
                              return CustomElevatedButton(
                                  label: "Login",
                                  onTap: () {
                                    _onSignIn(
                                        context,
                                        SignInModel(
                                            email: email.text,
                                            password: password.text));
                                  });
                            }),
                            verticalSpace(20),
                            CustomElevatedButton(
                              label: "Create Account",
                              onTap: () {
                                Navigator.pushNamed(
                                    context, RegisterScreen.routeName);
                              },
                              backgroundColor: Colors.white,
                              color: Colors.black,
                              elevation: 0,
                            ),
                          ],
                        ))
                  ]),
            ),
          ),
        ));
  }

  void _onSignIn(BuildContext context, SignInModel signInModel) {
    BlocProvider.of<AuthBloc>(context).add(SignIn(signInModel));
  }
}

String onNavigate(String token) {
  print("decoding token");
  String accessToken = jsonDecode(token)['access_token'];
  Map<String, dynamic> decodedToken = JwtDecoder.decode(accessToken);
  shareToken(token);
  print(decodedToken);
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

void shareToken(String token) async {
  // SharedPreferences.setMockInitialValues({});

  Map<String, dynamic> data = jsonDecode(token);

  // Access the "access_token" field
  String accessToken = data['access_token'];
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', accessToken);
  final String? action = prefs.getString('token');

  // Print the access token
  print('Access Token: $accessToken');
  print('Access Token From Prefs: $action');
}
