import 'package:bloc_test/data/repositories/login_repository.dart';
import 'package:bloc_test/presentation/blocs/login/login_bloc.dart';
import 'package:bloc_test/presentation/ui/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  // Ensure Flutter bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const MyApp(
      initialRoute: '/login',
    ),
  );
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({
    super.key,
    required this.initialRoute,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(
            repository: LoginRepository(),
          ),
        ),
        // Add other BlocProviders here as needed
      ],
      child: MaterialApp(
        title: 'Rupos Test',

        // Define your routes
        initialRoute: initialRoute,
        routes: {
          '/login': (context) => const LoginPage(),
          '/home': (context) =>
              const HomeScreen(), // You'll need to create this
        },
        // Handle unknown routes

        // Add route observer for analytics or navigation tracking
        // navigatorObservers: [
        //   RouteObserver<ModalRoute>(),
        // ],
      ),
    );
  }
}

// Simple home screen placeholder
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              // Clear stored credentials
              //final prefs = await SharedPreferences.getInstance();
              //await prefs.clear();

              // Navigate to login screen
              Navigator.of(context).pushNamedAndRemoveUntil(
                '/login',
                (route) => false,
              );
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('Welcome to Home Screen!'),
      ),
    );
  }
}
