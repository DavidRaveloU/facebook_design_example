import 'package:facebook_design_example/utils/constants.dart';
import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      margin: const EdgeInsets.only(top: 5),
      color: AppConstantsColor.containersColor,
      child: const DefaultTextStyle(
        style: TextStyle(color: AppConstantsColor.greyColor),
        child: Column(
          children: [
            PostHeaderWidget(),
            SizedBox(height: 10),
            PostBodyWidget(),
            PostFooterWidget(),
          ],
        ),
      ),
    );
  }
}

class PostFooterWidget extends StatelessWidget {
  const PostFooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          _buildLikesAndSharesRow(),
          const SizedBox(height: 8),
          _buildActionButtonsRow(),
        ],
      ),
    );
  }

  Widget _buildLikesAndSharesRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildLikesRow(),
          _buildSharesRow(),
        ],
      ),
    );
  }

  Widget _buildLikesRow() {
    return const Row(
      children: [
        Icon(
          Icons.heart_broken,
          color: Colors.red,
          size: 17,
        ),
        SizedBox(width: 4),
        Text('3,323'),
      ],
    );
  }

  Widget _buildSharesRow() {
    return const Row(
      children: [
        Text('321 comentarios'),
        SizedBox(width: 4),
        Icon(
          Icons.circle,
          size: 3,
          color: AppConstantsColor.greyColor,
        ),
        SizedBox(width: 4),
        Text('123 veces compartido'),
      ],
    );
  }

  Widget _buildActionButtonsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildActionButton(
          Icons.insert_link_outlined,
          'Me gusta',
        ),
        _buildActionButton(
          Icons.mode_comment_outlined,
          'Comentar',
        ),
        _buildActionButton(
          Icons.share,
          'Compartir',
        ),
      ],
    );
  }

  Widget _buildActionButton(IconData icon, String text) {
    return MaterialButton(
      onPressed: () {},
      child: Row(
        children: [
          Icon(icon, color: AppConstantsColor.greyColor),
          const SizedBox(width: 4),
          Text(
            text,
            style: const TextStyle(color: AppConstantsColor.greyColor),
          ),
        ],
      ),
    );
  }
}

class PostBodyWidget extends StatelessWidget {
  const PostBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildText(),
        const SizedBox(height: 10),
        Image.asset('assets/post.png'),
      ],
    );
  }

  Widget _buildText() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Lorem ipsum dolor sit amet,consectetur adipiscing elit.Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        ),
      ),
    );
  }
}

class PostHeaderWidget extends StatelessWidget {
  const PostHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildUserDetails(),
          _buildHeaderIcons(),
        ],
      ),
    );
  }

  Widget _buildUserDetails() {
    return const Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage('assets/profile.jpg'),
        ),
        SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Ahmed',
              style: TextStyle(
                color: AppConstantsColor.whiteColor,
                fontSize: 15,
              ),
            ),
            Row(
              children: [
                Text('3 h'),
                SizedBox(width: 4),
                Icon(
                  Icons.circle,
                  size: 3,
                  color: AppConstantsColor.greyColor,
                ),
                SizedBox(width: 4),
                Icon(
                  Icons.public,
                  color: AppConstantsColor.greyColor,
                  size: 14,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildHeaderIcons() {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          splashRadius: 1,
          icon: const Icon(
            Icons.more_horiz,
            color: AppConstantsColor.greyColor,
          ),
        ),
        IconButton(
          onPressed: () {},
          splashRadius: 1,
          icon: const Icon(
            Icons.close,
            color: AppConstantsColor.greyColor,
          ),
        ),
      ],
    );
  }
}
