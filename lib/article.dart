import 'package:blogclub/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: themeData.colorScheme.surface,
      floatingActionButton: InkWell(
        onTap: () {
          showSnakBar(context, 'Like button is clicked !');
        },
        child: Container(
          width: 111,
          height: 48,
          decoration: BoxDecoration(
              color: themeData.colorScheme.primary,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: themeData.colorScheme.primary.withOpacity(0.5),
                )
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.img.icons.thumbs.svg(),
              const SizedBox(
                width: 8,
              ),
              Text(
                '2.1k',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: themeData.colorScheme.onPrimary),
              )
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          CustomScrollView(
        
            slivers: [
            SliverAppBar(
                pinned: true,
                floating: true,
                title: const Text('Article'),
                actions: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_horiz_rounded)),
                  const SizedBox(
                    width: 16,
                  ),
                ]),
            SliverList(
              delegate: SliverChildListDelegate.fixed(
                [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                    child: Text(
                      'Four things every woman Needs to know',
                      style: themeData.textTheme.headline4,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 0, 16, 32),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Assets.img.stories.story9
                              .image(width: 48, height: 48, fit: BoxFit.cover),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Richard Gervain',
                                style: themeData.textTheme.bodyText1!
                                    .copyWith(fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              const Text('2m ago'),
                            ],
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              showSnakBar(context, 'bookmark button clicked !');
                            },
                            icon: Icon(
                              CupertinoIcons.bookmark,
                              color: themeData.colorScheme.primary,
                            )),
                        IconButton(
                            onPressed: () {
                              showSnakBar(context, 'share button clicked !');
                            },
                            icon: Icon(
                              CupertinoIcons.share,
                              color: themeData.colorScheme.primary,
                            ))
                      ],
                    ),
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                    child: Assets.background.singlePost.image(),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 32, 32, 16),
                    child: Text(
                      'Reference site about Lorem Ipsum about Lorem Ipsum',
                      style: themeData.textTheme.headline5,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                      style: themeData.textTheme.bodyText2,
                    ),
                  )
                ],
              ),
            ),
          ]),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 116,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    themeData.colorScheme.surface,
                    themeData.colorScheme.surface.withOpacity(0)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void showSnakBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
