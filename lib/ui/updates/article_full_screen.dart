import 'package:blood_donation_app/ui/updates/dynamic_article_full_screen_card.dart';
import 'package:blood_donation_app/ui/updates/dynamic_event_full_scree_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArticleFullScreen extends StatelessWidget {
  const ArticleFullScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: const Text(
          'Article',
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'Inter',
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: const DynamicArticleScreenCard(
        username: 'BloodConnect',
        profilePic:
            'https://images.unsplash.com/photo-1713211072614-5990c5fcf6a4?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        postingTime: '10 minutes ago',
        articleTitle:
            'Meta to label AI-generated content instead of removing it',
        description:
            "Yes, our home screen wasn't the first thing they wanted to see, especially on the app. They need to know how their business is going. Fair enough! For the website, we have an integrated dashboard there, but for the mobile app? We don’t. Okay, but what about responsive design? The dashboard needs a large screen to be shown so unfortunately, they can’t see the website dashboard from their mobiles as well. The general solution was to add a dashboard .",
        image:
            'https://images.unsplash.com/photo-1633113212423-dc2828784c7e?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      ),
    );
  }
}
