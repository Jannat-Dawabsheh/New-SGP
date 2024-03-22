import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late String email;

  @override
  Widget build(BuildContext context) {
   final token=ModalRoute.of(context)?.settings.arguments.toString();
   Map<String,dynamic>jwtDecodedToken=JwtDecoder.decode(token!);
    email=jwtDecodedToken['email'];
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(email),
      ),
    );
  }
}