import 'package:facebook_design_example/widgets/post.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: getMenuIconList().length,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: AppConstantsColor.backgroundColor,
        appBar: buildAppBar(),
        body: buildBody(),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: AppConstantsColor.containersColor,
      elevation: 0,
      title: const Text(
        'facebook',
        style: TextStyle(
          color: AppConstantsColor.whiteColor,
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      ),
      bottom: buildTabBar(),
      actions: [
        buildCircleAvatarButton(Icons.add),
        const SizedBox(width: 10),
        buildCircleAvatarButton(Icons.search),
        const SizedBox(width: 10),
        buildCircleAvatarButton(Icons.chat),
        const SizedBox(width: 10),
      ],
    );
  }

  TabBar buildTabBar() {
    return TabBar(
      splashFactory: NoSplash.splashFactory,
      enableFeedback: false,
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      onTap: (value) {
        setState(() {
          _index = value;
        });
      },
      indicatorColor: AppConstantsColor.blueColor,
      tabs: getMenuIconList(),
    );
  }

  List<Tab> getMenuIconList() {
    return [
      buildTabIcon(Icons.home_outlined, 0),
      buildTabIcon(Icons.group_outlined, 1),
      buildTabIcon(Icons.ondemand_video_rounded, 2),
      buildTabIcon(Icons.person_3_outlined, 3),
      buildTabIcon(Icons.notifications_none_outlined, 4),
    ];
  }

  Tab buildTabIcon(IconData icon, int tabIndex) {
    return Tab(
      icon: Icon(
        icon,
        color: _index != tabIndex
            ? AppConstantsColor.greyColor
            : AppConstantsColor.blueColor,
      ),
    );
  }

  CircleAvatar buildCircleAvatarButton(IconData icon) {
    return CircleAvatar(
      backgroundColor: AppConstantsColor.containersColor,
      child: IconButton(
        splashRadius: 10,
        onPressed: () {},
        icon: Icon(
          icon,
          color: AppConstantsColor.whiteColor,
        ),
      ),
    );
  }

  SingleChildScrollView buildBody() {
    var sizeDisplay = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: AppConstantsColor.greyColor.withOpacity(0.2),
            width: double.infinity,
            height: 1,
          ),
          buildStatusContainer(sizeDisplay),
          const SizedBox(height: 6),
          buildTabBarForStoriesAndReels(),
          buildStoryListView(),
          const PostWidget(),
          const PostWidget(),
        ],
      ),
    );
  }

  Container buildStatusContainer(Size sizeDisplay) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 65,
      color: AppConstantsColor.containersColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage('assets/profile.jpg'),
          ),
          GestureDetector(
            child: buildStatusInputContainer(sizeDisplay),
          ),
          Flexible(
            child: IconButton(
              splashRadius: 1,
              onPressed: () {},
              icon: const Icon(Icons.image, color: Colors.green),
            ),
          ),
        ],
      ),
    );
  }

  Container buildStatusInputContainer(Size sizeDisplay) {
    return Container(
      padding: const EdgeInsets.only(left: 17, top: 6, bottom: 6),
      width: sizeDisplay.width / 1.5,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        border: Border.all(color: AppConstantsColor.greyColor),
      ),
      child: const Text(
        '¿Qué estás pensando?',
        overflow: TextOverflow.ellipsis,
        style: TextStyle(color: AppConstantsColor.whiteColor),
      ),
    );
  }

  DefaultTabController buildTabBarForStoriesAndReels() {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Container(
        height: 40,
        color: AppConstantsColor.containersColor,
        child: TabBar(
          onTap: (value) {
            setState(() {
              _pageController.animateToPage(value,
                  duration: const Duration(milliseconds: 1),
                  curve: Curves.easeIn);
            });
          },
          tabs: const [
            Text('Historias'),
            Text('Reels'),
          ],
        ),
      ),
    );
  }

  Container buildStoryListView() {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
      color: AppConstantsColor.containersColor,
      height: 210,
      child: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          buildStoryListViewPage(),
          buildReelsListViewPage(),
        ],
      ),
    );
  }

  ListView buildStoryListViewPage() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 4,
      itemBuilder: (context, index) {
        return const StoryFormat(
            profilePath: 'assets/profile.jpg', name: 'Jhon Doe');
      },
    );
  }

  ListView buildReelsListViewPage() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 4,
      itemBuilder: (context, index) {
        return const StoryFormat(
          imagePath: 'assets/reference2.png',
        );
      },
    );
  }
}

class StoryFormat extends StatelessWidget {
  final String? profilePath;
  final String? name;
  final String? imagePath;
  const StoryFormat({
    super.key,
    this.profilePath,
    this.name,
    this.imagePath = 'assets/reference.png',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          color: AppConstantsColor.containersColor,
          borderRadius: BorderRadius.circular(12)),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath!,
              fit: BoxFit.cover,
              height: double.infinity,
            ),
          ),
          Container(
            color: AppConstantsColor.backgroundColor.withOpacity(0.5),
          ),
          if (profilePath != null)
            Positioned(
              top: 10,
              left: 5,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(40)),
                child: CircleAvatar(
                  backgroundImage: AssetImage(profilePath!),
                ),
              ),
            ),
          if (name != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0, left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    name!,
                    style: const TextStyle(color: AppConstantsColor.whiteColor),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
