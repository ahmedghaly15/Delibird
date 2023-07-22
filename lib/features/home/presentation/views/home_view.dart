import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nexo_app/core/global/app_navigator.dart';
import 'package:nexo_app/core/network/local/cache_helper.dart';
import 'package:nexo_app/features/auth/presentation/views/log_in_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home View"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
            CacheHelper.removeData(key: 'uId');
            AppNavigator.navigateAndFinish(screen: () => const LoginView());
          },
          child: const Text(
            "Sign out",
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}
