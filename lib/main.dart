import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:kakao_login_ex/kakao_login.dart';
import 'package:kakao_login_ex/main_view_model.dart';

void main() {
  KakaoSdk.init(nativeAppKey: kKakaoNativeAppKey);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final viewModel = MainViewModel(KakaoLogin());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
                viewModel.user?.kakaoAccount?.profile?.profileImageUrl ?? ''),
            Text('${viewModel.isLogined}'),
            ElevatedButton(
              onPressed: () async {
                await viewModel.login();
                setState(() {});
              },
              child: const Text('Login'),
            ),
            ElevatedButton(
              onPressed: () async {
                await viewModel.logout();
                setState(() {});
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
