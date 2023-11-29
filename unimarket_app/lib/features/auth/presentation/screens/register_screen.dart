import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unimarket_app/core/common/custom_elevated_button.dart';
import 'package:unimarket_app/core/common/custom_text_form_field.dart';
import 'package:unimarket_app/core/common/vertical_space.dart';
import 'package:unimarket_app/features/auth/data/models/signup_model.dart';
import 'package:unimarket_app/features/auth/presentation/bloc/remote/auth_bloc.dart';
import 'package:unimarket_app/features/auth/presentation/bloc/remote/auth_event.dart';
import 'package:unimarket_app/features/auth/presentation/bloc/remote/auth_state.dart';
import 'package:unimarket_app/injection_container.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  static const routeName = "/register-screen";

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => sl.get<AuthBloc>(),
        child: Scaffold(
          body: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(8),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 90,
                    child: CustomTextFormField(
                        controller: firstName, label: "FirstName"),
                  ),
                  SizedBox(
                    height: 90,
                    child: CustomTextFormField(
                        controller: lastName, label: "LastName"),
                  ),
                  SizedBox(
                    height: 90,
                    child:
                        CustomTextFormField(controller: email, label: "Email"),
                  ),
                  SizedBox(
                    height: 90,
                    child: CustomTextFormField(
                        controller: password, label: "Password"),
                  ),
                  BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
                    if (state is SignUpLoading) {
                      return const CircularProgressIndicator.adaptive();
                    }
                    if (state is SignUpLoadingDone) {
                      print("Account created, log in with your crdentials");
                    }
                    if (state is SignUpLoadingError) {
                      print("Error ");
                    }
                    return CustomElevatedButton(
                        label: "Create Account",
                        onTap: () {
                          _onSignUp(
                              context,
                              SignUpModel(
                                  firstName: firstName.text,
                                  lastName: lastName.text,
                                  email: email.text,
                                  password: password.text));
                        });
                  }),
                  verticalSpace(30),
                  CustomElevatedButton(
                    label: "Login",
                    onTap: () {
                      Navigator.pop(context);
                    },
                    backgroundColor: Colors.white,
                    color: Colors.black,
                    elevation: 0,
                  ),
                ],
              ),
            ),
          )),
        ));
  }

  void _onSignUp(BuildContext context, SignUpModel signUpModel) {
    BlocProvider.of<AuthBloc>(context).add(SignUp(signUpModel));
  }
}
