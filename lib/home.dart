
import 'package:blogclub/gen/assets.gen.dart';
import 'package:blogclub/gen/fonts.gen.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'carousel/carousel_slider.dart';
import 'data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    final stores = AppDatabase.stories;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 32, 32, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hi M.javad",
                    style: themeData.textTheme.subtitle1,
                  ),
                  Assets.img.icons.notification.image(width: 32, height: 32),
                  
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 24),
              child: Text(
                "Explore today",
                style: themeData.textTheme.headline4,
              ),
            ),
            _StoriesList(stores: stores),
            const SizedBox(
              height: 16,
            ),
            const _CategoriesList(),
            const _PostsList(),
          ]),
        ),
      ),
    );
  }
}

class _CategoriesList extends StatelessWidget {
  const _CategoriesList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = AppDatabase.categories;
    return CarouselSlider.builder(
        itemCount: categories.length,
        itemBuilder: (context, index, realIndex) {
          return _CategroyIteam(
            left: realIndex == 0 ? 32 : 8,
            right: realIndex == categories.length - 1 ? 32 : 8,
            category: categories[realIndex],
          );
        },
        options: CarouselOptions(
            scrollPhysics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            viewportFraction: 0.8,
            aspectRatio: 1.2,
            initialPage: 0,
            disableCenter: true,
            autoPlay: false,
            enableInfiniteScroll: false,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height));
  }
}

class _CategroyIteam extends StatelessWidget {
  final Category category;
  final double left;
  final double right;
  const _CategroyIteam({
    Key? key,
    required this.category,
    required this.left,
    required this.right,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(left, 0, right, 0),
      child: Stack(
        children: [
          Positioned.fill(
            top: 100,
            left: 65,
            right: 65,
            bottom: 24,
            child: Container(
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(blurRadius: 20, color: Color(0xaa0D253c))
              ]),
            ),
          ),
          Positioned.fill(
            child: Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(32),
                  child: Image.asset(
                    "assets/img/posts/large/${category.imageFileName}",
                    fit: BoxFit.cover,
                  )),
              foregroundDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                gradient: const LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                  colors: [
                    Color(0xff0D253c),
                    Colors.transparent,
                  ],
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(32),
              ),
            ),
          ),
          Positioned(
            bottom: 48,
            left: 32,
            child: Text(
              category.title,
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .apply(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}

class _StoriesList extends StatelessWidget {
  const _StoriesList({
    Key? key,
    required this.stores,
  }) : super(key: key);

  final List<StoryData> stores;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 98,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
          scrollDirection: Axis.horizontal,
          itemCount: stores.length,
          itemBuilder: (context, index) {
            final story = stores[index];
            return _Story(story: story, stores: stores);
          }),
    );
  }
}

class _Story extends StatelessWidget {
  const _Story({
    Key? key,
    required this.story,
    required this.stores,
  }) : super(key: key);

  final StoryData story;
  final List<StoryData> stores;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(4, 2, 4, 0),
      child: Column(
        children: [
          Stack(
            children: [
              story.isViewed
                  ? _profileImageViewed(context)
                  : _profileImageNormal(),
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(
                  'assets/img/icons/${story.iconFileName}',
                  width: 24,
                  height: 24,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Text(story.name)
        ],
      ),
    );
  }

  Container _profileImageNormal() {
    return Container(
      width: 68,
      height: 68,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          colors: [
            Color(0xff376AED),
            Color(0xff49B0E2),
            Color(0xff9CECFB),
          ],
        ),
      ),
      child: Container(
        margin: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(5),
        child: _profileImage(),
      ),
    );
  }

  Widget _profileImageViewed(context) {
    return SizedBox(
      width: 68,
      height: 68,
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: const Radius.circular(24),
        strokeWidth: 2,
        color: Theme.of(context).textTheme.bodyText2!.color!,
        dashPattern: const [8, 3],
        padding: const EdgeInsets.all(5),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
          ),
          child: _profileImage(),
        ),
      ),
    );
  }

  Widget _profileImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset('assets/img/stories/${story.imageFileName}'),
    );
  }
}

class _PostsList extends StatelessWidget {
  const _PostsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final posts = AppDatabase.posts;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(32, 16, 24, 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Latest News',
                style: Theme.of(context).textTheme.headline5,
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'More',
                  style: TextStyle(
                    color: Color(0xff376AED),
                  ),
                ),
              )
            ],
          ),
        ),
        ListView.builder(
            physics: const ClampingScrollPhysics(),
            itemExtent: 141,
            shrinkWrap: true,
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];
              return _PostIteam(post: post);
            })
      ],
    );
  }
}

class _PostIteam extends StatelessWidget {
  const _PostIteam({
    Key? key,
    required this.post,
  }) : super(key: key);

  final PostData post;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 149,
      margin: const EdgeInsets.fromLTRB(32, 8, 32, 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              blurRadius: 10,
              color: Color(0x1a5282FF),
            )
          ]),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16)),
              child:
                  Image.asset('assets/img/posts/small/${post.imageFileName}')),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post.caption,
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
                  post.title,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(
                      CupertinoIcons.hand_thumbsup,
                      size: 16,
                      color: Theme.of(context).textTheme.bodyText2!.color,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      post.likes,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Icon(
                      CupertinoIcons.clock,
                      size: 16,
                      color: Theme.of(context).textTheme.bodyText2!.color,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      post.time,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                        alignment: Alignment.centerRight,
                        child: Icon(
                          post.isBookmarked
                              ? CupertinoIcons.bookmark_fill
                              : CupertinoIcons.bookmark,
                          size: 16,
                          color: Theme.of(context).textTheme.bodyText2!.color,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
