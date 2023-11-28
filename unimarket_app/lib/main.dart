import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unimarket_app/core/routes/router.dart';
import 'package:unimarket_app/features/auth/presentation/bloc/remote/auth_bloc.dart';
import 'package:unimarket_app/features/auth/presentation/screens/auth_screen.dart';
import 'package:unimarket_app/injection_container.dart';

void main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: ((settings) => generateRoute(settings)),
      home: MultiBlocProvider(providers: [
        BlocProvider<AuthBloc>(create: (context) => AuthBloc(sl()))
      ], child: const AuthScreen()),
    );
  }
}
