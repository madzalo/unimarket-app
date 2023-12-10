import 'package:flutter/material.dart';
import 'package:unimarket_app/core/routes/router.dart';
import 'package:unimarket_app/features/auth/presentation/screens/auth_screen.dart';
import 'package:unimarket_app/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'unimarket',
        theme: ThemeData(
          fontFamily: "Lato",
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 20, 70, 219),
            primary: const Color.fromARGB(255, 20, 70, 219),
          ),
        ),
        onGenerateRoute: ((settings) => generateRoute(settings)),
        home: const AuthScreen()

        //  MultiBlocProvider(providers: [
        //   BlocProvider<AuthBloc>(create: (context) => AuthBloc(sl(), sl()))
        // ], child: const AuthScreen()),
        );
  }
}
