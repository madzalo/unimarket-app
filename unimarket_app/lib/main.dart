import 'package:flutter/material.dart';
import 'package:unimarket_app/core/routes/router.dart';
import 'package:unimarket_app/features/auth/presentation/screens/auth_screen.dart';
import 'package:unimarket_app/injection_container.dart';

void main() async {
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
        title: 'Flutter Demo',
        theme: ThemeData(
            fontFamily: "Lato",
            useMaterial3: true,
            colorScheme:
                ColorScheme.fromSeed(seedColor: const Color(0xFF022AA4))),
        onGenerateRoute: ((settings) => generateRoute(settings)),
        home: const AuthScreen()

        //  MultiBlocProvider(providers: [
        //   BlocProvider<AuthBloc>(create: (context) => AuthBloc(sl(), sl()))
        // ], child: const AuthScreen()),
        );
  }
}
