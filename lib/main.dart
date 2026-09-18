import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:dio/dio.dart';
import 'package:nextflutter_app/presentation/screens/login_screen.dart';
import 'package:nextflutter_app/presentation/screens/register_screen.dart';
import 'package:nextflutter_app/presentation/screens/home_screen.dart';
import 'package:nextflutter_app/presentation/providers/auth_provider.dart';
import 'package:nextflutter_app/presentation/providers/movie_provider.dart';
import 'package:nextflutter_app/data/datasources/hive_auth_datasource.dart';
import 'package:nextflutter_app/data/models/movie_model.dart';
import 'package:nextflutter_app/data/datasources/movie_remote_datasource.dart';
import 'package:nextflutter_app/data/repositories/movie_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('auth');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider(HiveAuthDatasource())),
        ChangeNotifierProvider(create: (_) => MovieProvider(MovieRepository(MovieRemoteDatasource(Dio())))),
      ],
      child: MaterialApp(
        title: 'NextFlutter App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/login',
        routes: {
          '/login': (context) => const LoginScreen(),
          '/register': (context) => const RegisterScreen(),
          '/home': (context) => const HomeScreen(),
        },
      ),
    );
  }
}