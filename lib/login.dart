import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final _UsernameController = TextEditingController();
    final _passwordController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 80),
            Column(
              children: [
                Image.asset("assets/diamond.png"),
                const SizedBox(
                  height: 16,
                ),
                const Text('SHRINE')
              ],
            ),
            const SizedBox(
              height: 120,
            ),
            TextField(
              controller: _UsernameController,
              decoration:
                  const InputDecoration(labelText: 'UserName', filled: true),
            ),
            const SizedBox(
              height: 12,
            ),
            TextField(
              controller: _passwordController,
              decoration:
                  const InputDecoration(labelText: 'Password', filled: true),
              obscureText: true,
            ),
            OverflowBar(
              alignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      _UsernameController.clear();
                      _passwordController.clear();
                    },
                    child: const Text('CANCEL')),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('NEXT'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
