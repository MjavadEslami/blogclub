import 'package:blogclub/auth.dart';
import 'package:blogclub/data.dart';
import 'package:blogclub/gen/assets.gen.dart';
import 'package:blogclub/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBordingScreen extends StatefulWidget {
  const OnBordingScreen({Key? key}) : super(key: key);

  @override
  State<OnBordingScreen> createState() => _OnBordingScreenState();
}

class _OnBordingScreenState extends State<OnBordingScreen> {
  final PageController _pageController = PageController();
  final iteams = AppDatabase.onbrdings;
  int page = 0;

  @override
  void initState() {
    _pageController.addListener(() {
      if (_pageController.page!.round() != page) {
        setState(() {
          page = _pageController.page!.round();
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Scaffold(
      backgroundColor: themeData.colorScheme.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 32, 0, 8),
                child: Assets.background.onboarding.image(),
              ),
            ),
            Container(
              height: 324,
              padding: const EdgeInsets.fromLTRB(32, 32, 32, 32),
              decoration: BoxDecoration(
                color: themeData.colorScheme.surface,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 20, color: Colors.black.withOpacity(0.1))
                ],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: PageView.builder(
                          physics: const BouncingScrollPhysics(),
                          controller: _pageController,
                          itemCount: iteams.length,
                          itemBuilder: (context, index) {
                            return Column(children: [
                              Text(
                                iteams[index].title,
                                style: themeData.textTheme.headline5,
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              Text(
                                iteams[index].description,
                                style: themeData.textTheme.subtitle1!
                                    .apply(fontSizeFactor: 0.9),
                              )
                            ]);
                          })),
                  Container(
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SmoothPageIndicator(
                          controller: _pageController,
                          count: iteams.length,
                          effect: ExpandingDotsEffect(
                              dotWidth: 8,
                              dotHeight: 8,
                              activeDotColor: themeData.colorScheme.primary,
                              dotColor: themeData.colorScheme.primary
                                  .withOpacity(0.1)),
                        ),
                        ElevatedButton(
                            style: ButtonStyle(
                              minimumSize:
                                  MaterialStateProperty.all(const Size(88, 60)),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                            onPressed: () {
                              if (page == iteams.length - 1) {
                                Navigator.of(context).pushReplacement(
                                    
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const AuthScreen()));
                              } else {
                                _pageController.animateToPage(page + 1,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.decelerate);
                              }
                            },
                            child: Icon(page == iteams.length - 1
                                ? CupertinoIcons.check_mark
                                : CupertinoIcons.arrow_right))
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
