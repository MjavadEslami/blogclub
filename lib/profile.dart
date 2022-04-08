import 'package:blogclub/data.dart';
import 'package:blogclub/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'gen/fonts.gen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final posts = AppDatabase.posts;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeData.colorScheme.background,
        title: const Text('profile'),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.more_horiz_rounded)),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(32, 32, 32, 64),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(32),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 20,
                          color: themeData.colorScheme.onBackground
                              .withOpacity(0.2),
                        ),
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(24),
                        child: Row(
                          children: [
                            Container(
                              width: 84,
                              height: 84,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                gradient: const LinearGradient(
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Color(0xff376AED),
                                    Color(0xff49B0E2),
                                    Color(0xff9CECFB),
                                  ],
                                ),
                              ),
                              child: Container(
                                margin: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(22),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Assets.img.stories.story1
                                          .image(width: 75, height: 75)),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('@mjavad'),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    'M.javad Eslami',
                                    style: themeData.textTheme.bodyText1!
                                        .copyWith(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    'Mobile Programer',
                                    style: themeData.textTheme.bodyText1!
                                        .copyWith(
                                            color:
                                                themeData.colorScheme.primary),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(32, 0, 32, 16),
                        child: Text(
                          'About me',
                          style: themeData.textTheme.headline6,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(32, 0, 32, 32),
                        child: Text(
                            'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content'),
                      ),
                      const SizedBox(
                        height: 28,
                      ),
                    ],
                  ),
                ),
                Positioned(
                    bottom: 20,
                    right: 96,
                    left: 96,
                    child: Container(
                      height: 20,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            blurRadius: 20,
                            color: themeData.colorScheme.onBackground
                                .withOpacity(0.5))
                      ]),
                    )),
                Positioned(
                  bottom: 30,
                  right: 68,
                  left: 68,
                  child: Container(
                    height: 68,
                    decoration: BoxDecoration(
                      color: themeData.colorScheme.primary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                                color: const Color(0xff2151CD),
                                borderRadius: BorderRadius.circular(12)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('52',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            themeData.colorScheme.onPrimary)),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  'Post',
                                  style: themeData.textTheme.bodyText1!.apply(
                                      color: themeData.colorScheme.onPrimary),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('250',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: themeData.colorScheme.onPrimary)),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                'Following',
                                style: themeData.textTheme.bodyText1!.apply(
                                    color: themeData.colorScheme.onPrimary),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('4.5K',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: themeData.colorScheme.onPrimary)),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                'Followers',
                                style: themeData.textTheme.bodyText1!.apply(
                                    color: themeData.colorScheme.onPrimary),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32)),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10, color: Colors.black.withOpacity(0.2))
                  ]),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(32),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Text(
                          'My Posts',
                          style: themeData.textTheme.headline6,
                        )),
                        IconButton(
                          onPressed: () {},
                          icon: Assets.img.icons.grid.svg(),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Assets.img.icons.table.svg(),
                        )
                      ],
                    ),
                  ),
                  ListView.builder(
                      physics: ClampingScrollPhysics(),
                      itemCount: posts.length,
                      itemExtent: 141,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.fromLTRB(32, 8, 32, 0),
                          height: 149,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 10,
                                    color: Colors.black.withOpacity(0.1))
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Row(children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                    'assets/img/posts/small/${posts[index].imageFileName}'),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      posts[index].caption,
                                      style: const TextStyle(
                                          fontFamily: FontFamily.aviner,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xff376AED)),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      posts[index].title,
                                      style:
                                          Theme.of(context).textTheme.subtitle2,
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Icon(
                                          CupertinoIcons.hand_thumbsup,
                                          size: 16,
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodyText2!
                                              .color,
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          posts[index].likes,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2,
                                        ),
                                        const SizedBox(
                                          width: 16,
                                        ),
                                        Icon(
                                          CupertinoIcons.clock,
                                          size: 16,
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodyText2!
                                              .color,
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          posts[index].time,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2,
                                        ),
                                        const SizedBox(
                                          width: 16,
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 0, 16, 0),
                                            alignment: Alignment.centerRight,
                                            child: Icon(
                                              posts[index].isBookmarked
                                                  ? CupertinoIcons.bookmark_fill
                                                  : CupertinoIcons.bookmark,
                                              size: 16,
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2!
                                                  .color,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ]),
                          ),
                        );
                      
                      }),
                      const SizedBox(height: 32,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
