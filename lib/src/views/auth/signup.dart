import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String? mail;
  String? displayName;
  String? password;

  displaySnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(message),
      dismissDirection: DismissDirection.horizontal,
    ));
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
                  "Sign Up",
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontWeight: FontWeight.w200,
                      ),
                ),
              ),
              const SizedBox(height: 75),
              Container(
                margin: const EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.elliptical(150, 12),
                    topLeft: Radius.circular(100),
                  ),
                  color: Colors.grey.withOpacity(.4),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 55),
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 20, left: 80, top: 20),
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
                          const EdgeInsets.only(right: 20, left: 80, top: 20),
                      child: TextField(
                        onChanged: (value) {
                          displayName = value;
                        },
                        decoration: InputDecoration(
                          fillColor: Theme.of(context).scaffoldBackgroundColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          hintText: "Full Name",
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 20, left: 80, top: 20),
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
                        left: 80,
                        right: 20,
                      ),
                      child: Center(
                        child: FractionallySizedBox(
                          widthFactor: .6,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (mail == null || mail!.isEmpty) {
                                displaySnackBar("Enter your mail address");
                              } else if (!isEmail(mail!)) {
                                displaySnackBar("Invalid mail");
                              } else if (password == null ||
                                  password!.isEmpty) {
                                displaySnackBar("Enter your password");
                              } else if (password!.length < 6) {
                                displaySnackBar(
                                    "Password must have at least 6 char");
                              } else if (displayName == null ||
                                  displayName!.isEmpty) {
                                displaySnackBar("Enter your Full Name");
                              } else if (displayName!.trim().length < 3) {
                                displaySnackBar(
                                    "Name must have at least 3 chars");
                              } else {
                                /// Sign Up login here
                                /// Sign Up login here
                                /// Sign Up login here
                                /// Sign Up login here
                                /// Sign Up login here
                                /// Sign Up login here
                                /// Sign Up login here
                                /// Sign Up login here
                              }
                            },
                            child: const Text("Sign Up"),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 80,
                        right: 20,
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Already have an account, "),
                            MaterialButton(
                              // splashColor: Colors.blue,
                              highlightColor: Colors.blue.withOpacity(.4),
                              padding: EdgeInsets.zero,
                              height: 10,
                              minWidth: 0,
                              onPressed: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (_) => const LoginScreen(),
                                //   ),
                                // );
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "  login  ",
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
                'assets/enter.svg',
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
