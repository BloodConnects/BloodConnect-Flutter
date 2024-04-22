import 'package:blood_donation_app/ui/color_schemes.g.dart';
import 'package:blood_donation_app/ui/updates/dynamic_event_full_scree_card.dart';
import 'package:blood_donation_app/ui/updates/event_full_screen.dart';
import 'package:blood_donation_app/ui/updates/updates_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class EventsCard extends StatelessWidget {
  final String month;
  final String day;
  final String title;
  final String time;

  const EventsCard(
      {super.key,
      required this.month,
      required this.day,
      required this.title,
      required this.time});

  @override
  Widget build(BuildContext context) {
    UpdatesController updatesController = Get.put(UpdatesController());

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: updatesController.isEventCardPressed.isTrue
                      ? lightColorScheme.primary
                      : const Color.fromRGBO(224, 224, 224, 1),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(1.0, 2.0),
                      blurRadius: 2.5,
                      spreadRadius: 1.5,
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        month.toUpperCase(),
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: updatesController.isEventCardPressed.isTrue
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        day,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: updatesController.isEventCardPressed.isTrue
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        title,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: updatesController.isEventCardPressed.isTrue
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              time,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 12,
                                color:
                                    updatesController.isEventCardPressed.isTrue
                                        ? Colors.white
                                        : Colors.black,
                              ),
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {
                              updatesController.toggleEventCard();
                              Get.to(const EventFullScreen());
                            },
                            icon: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: updatesController.isEventCardPressed.isTrue
                                  ? Colors.white
                                  : Colors.black,
                              size: 22,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(224, 224, 224, 1),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(1.0, 2.0),
                      blurRadius: 2.5,
                      spreadRadius: 1.5,
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        month.toUpperCase(),
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        day,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        title,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              time,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {
                              Get.to(const EventFullScreen());
                            },
                            icon: const Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.black,
                              size: 22,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
      ],
    );
  }
}
