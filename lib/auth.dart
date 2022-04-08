import 'package:blogclub/gen/assets.gen.dart';
import 'package:blogclub/home.dart';
import 'package:blogclub/main.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  static const int loginTab = 0;
  static const int signUpTab = 1;
  int selecetedTabIndex = loginTab;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final tabTextStyle = TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(32),
              child: Assets.img.icons.logo.svg(width: 120),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: themeData.colorScheme.primary,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                selecetedTabIndex = loginTab;
                              });
                            },
                            child: Text(
                              'login'.toUpperCase(),
                              style: tabTextStyle.apply(
                                  color: selecetedTabIndex == loginTab
                                      ? Colors.white
                                      : Colors.white54),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                selecetedTabIndex = signUpTab;
                              });
                            },
                            child: Text(
                              'sing up'.toUpperCase(),
                              style: tabTextStyle.apply(
                                  color: selecetedTabIndex == signUpTab
                                      ? Colors.white
                                      : Colors.white54),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: themeData.colorScheme.surface,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(32),
                            topRight: Radius.circular(32),
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(32, 48, 32, 48),
                            child: selecetedTabIndex == loginTab
                                ? _Login(themeData: themeData)
                                : _SingUp(themeData: themeData),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _Login extends StatelessWidget {
  const _Login({
    Key? key,
    required this.themeData,
  }) : super(key: key);

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'welcome back',
          style: themeData.textTheme.headline5,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          'Sing in with your account',
          style: themeData.textTheme.subtitle1!.apply(fontSizeFactor: 0.8),
        ),
        const SizedBox(
          height: 16,
        ),
        const TextField(
          decoration: InputDecoration(label: Text('Username')),
        ),
        _PasswordTextField(),
        const SizedBox(
          height: 24,
        ),
        ElevatedButton(
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                Size(MediaQuery.of(context).size.width, 60),
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            onPressed: () {},
            child: Text('login'.toUpperCase())),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Forgot your password?'),
            const SizedBox(
              width: 8,
            ),
            TextButton(onPressed: () {}, child: const Text('Reset here')),
          ],
        ),
        const Center(
            child: Text(
          'OR SING IN WITH',
          style: TextStyle(letterSpacing: 2),
        )),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.img.icons.google.image(width: 36, height: 36),
            const SizedBox(
              width: 24,
            ),
            Assets.img.icons.twitter.image(width: 36, height: 36),
            const SizedBox(
              width: 24,
            ),
            Assets.img.icons.facebook.image(width: 36, height: 36),
          ],
        )
      ],
    );
  }
}

class _SingUp extends StatelessWidget {
  const _SingUp({
    Key? key,
    required this.themeData,
  }) : super(key: key);

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'welcome to Blog Club',
          style: themeData.textTheme.headline5,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          'please enter your information',
          style: themeData.textTheme.subtitle1!.apply(fontSizeFactor: 0.8),
        ),
        const SizedBox(
          height: 16,
        ),
        const TextField(
          decoration: InputDecoration(label: Text('FullName')),
        ),
        const SizedBox(
          height: 16,
        ),
        const TextField(
          decoration: InputDecoration(label: Text('Username')),
        ),
        const _PasswordTextField(),
        const SizedBox(
          height: 24,
        ),
        ElevatedButton(
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                Size(MediaQuery.of(context).size.width, 60),
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const MainScreen()));
            },
            child: Text('sign up'.toUpperCase())),
        const SizedBox(
          height: 32,
        ),
        const Center(
            child: Text(
          'OR SIGN UP WITH',
          style: TextStyle(letterSpacing: 2),
        )),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.img.icons.google.image(width: 36, height: 36),
            const SizedBox(
              width: 24,
            ),
            Assets.img.icons.twitter.image(width: 36, height: 36),
            const SizedBox(
              width: 24,
            ),
            Assets.img.icons.facebook.image(width: 36, height: 36),
          ],
        )
      ],
    );
  }
}

class _PasswordTextField extends StatefulWidget {
  const _PasswordTextField({
    Key? key,
  }) : super(key: key);

  @override
  State<_PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<_PasswordTextField> {
  bool show = false;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: show,
      enableSuggestions: false,
      autocorrect: false,
      decoration: InputDecoration(
        label: const Text('Password'),
        suffix: InkWell(
          onTap: () {
            setState(() {
              show = !show;
            });
          },
          child: Text(
            show ? 'Show' : 'Hide',
            style: TextStyle(
                fontSize: 14, color: Theme.of(context).colorScheme.primary),
          ),
        ),
      ),
    );
  }
}
