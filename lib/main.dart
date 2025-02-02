import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/users/presentation/bloc/user_bloc.dart';
import 'features/users/presentation/pages/user_page.dart';
import 'injection_container.dart' as di;

void main() {
  // Initialize Dependency Injection
  di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.sl<UserBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Clean Architecture',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: UserPage(),
      ),
    );
  }
}
