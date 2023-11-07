import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:string_validator/string_validator.dart';

import 'signup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, this.onThemeChanged});

  @override
  State<LoginScreen> createState() => _LoginScreenState();

  final VoidCallback? onThemeChanged;
}

class _LoginScreenState extends State<LoginScreen> {
  String? mail;
  String? password;

  displaySnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        dismissDirection: DismissDirection.horizontal,
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: MySliver(),
            pinned: true,
          ),
          SliverList.list(
            children: [
              const SizedBox(height: 50),
              Center(
                child: Text(
                  "Login",
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontWeight: FontWeight.w200,
                      ),
                ),
              ),
              const SizedBox(height: 75),
              Container(
                margin: const EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(20),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.elliptical(150, 12),
                    topRight: Radius.circular(100),
                  ),
                  color: Colors.grey.withOpacity(.4),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 55),
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 100, left: 20, top: 20),
                      child: TextField(
                        onChanged: (value) {
                          mail = value;
                        },
                        decoration: InputDecoration(
                          fillColor: Theme.of(context).scaffoldBackgroundColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          hintText: "Mail address",
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 100, left: 20, top: 20),
                      child: TextField(
                        onChanged: (value) {
                          password = value;
                        },
                        decoration: InputDecoration(
                          fillColor: Theme.of(context).scaffoldBackgroundColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          hintText: "Password",
                          suffixIcon: const Icon(Icons.visibility),
                        ),
                      ),
                    ),
                    const SizedBox(height: 55),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 100,
                      ),
                      child: Center(
                        child: FractionallySizedBox(
                          widthFactor: .6,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (mail == null || mail!.isEmpty) {
                                displaySnackBar("Enter your mail");
                              } else if (password == null ||
                                  password!.isEmpty) {
                                displaySnackBar("Enter your password");
                              } else if (!isEmail(mail!)) {
                                displaySnackBar("Invalid mail");
                              } else {
                                /// your login login here
                                /// your login login here
                                /// your login login here
                                /// your login login here
                                /// your login login here
                                /// your login login here
                                /// your login login here
                                /// your login login here
                                /// your login login here
                                /// your login login here
                              }
                            },
                            onLongPress: () {
                              if (widget.onThemeChanged != null) {
                                widget.onThemeChanged!();
                              }
                            },
                            child: const Text("Login"),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 100,
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't have an account, "),
                            MaterialButton(
                              // splashColor: Colors.blue,
                              highlightColor: Colors.blue.withOpacity(.4),
                              padding: EdgeInsets.zero,
                              height: 10,
                              minWidth: 0,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const SignUpScreen(),
                                  ),
                                );
                              },
                              child: const Text(
                                "  sign up  ",
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class MySliver extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    var percentage = max(0, shrinkOffset / 400);
    double opacity;
    if (shrinkOffset > 200) {
      opacity = 0;
    } else {
      opacity = 1;
    }
    return Stack(
      children: [
        ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
            child: Container(
              color: Theme.of(context).scaffoldBackgroundColor.withOpacity(.5),
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 250),
            opacity: min(1, max(0, opacity)).toDouble(),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 0),
              height: (1 - percentage) * 250,
              width: (1 - percentage) * 250,
              padding: EdgeInsets.all((1 - percentage) * 50),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular((1 - percentage) * 80),
                color: Colors.grey.withOpacity(.1),
              ),
              child: SvgPicture.asset(
                'assets/certification.svg',
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => 400;

  @override
  double get minExtent => 75;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
