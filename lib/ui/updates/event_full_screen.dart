import 'package:blood_donation_app/ui/updates/dynamic_event_full_scree_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class EventFullScreen extends StatelessWidget {
  const EventFullScreen({super.key});

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
          'Events',
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'Inter',
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: const DynamicEventScreenCard(
        title: 'Blood Donation Camp',
        image:
            'https://images.unsplash.com/photo-1712921673244-de60e017f767?q=80&w=1975&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        location: 'Ahmedabad, Gujarat, India - 380061',
        time: '12:00 PM to 2:00 PM',
        description:
            'Local businesses work with us throughout the year to host blood donation events that help us recruit more donors. We always need new blood donors, and these local events are an important way for us to keep providing lifesaving blood to people in need.If you would like to work with us on creating a bespoke event',
        month: 'May',
        day: '21',
      ),
    );
  }
}
