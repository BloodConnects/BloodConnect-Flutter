import 'package:blood_donation_app/data/api/model/userModel.dart';
import 'package:flutter/material.dart';

Widget ExploreListContainer({
  required UserModel donor,
  required VoidCallback onContactPressed,
}) {
  return Column(
    children: [
      Container(
        height: 40,
        width: 330,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12), topRight: Radius.circular(12)),
            color: Colors.red[0]),
      ),
      Container(
        margin: const EdgeInsets.only(left: 8.0, right: 8.0),
        height: 130,
        width: 330,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(1.0, 2.0),
              blurRadius: 2,
              spreadRadius: 1.0,
            )
          ],
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              bottom: 80,
              left: 12,
              child: CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(
                  donor.profilePictureUrl.toString(),
                ),
              ),
            ),
            Positioned(
              left: 100,
              top: 6,
              child: SizedBox(
                width: 175,
                child: Text(
                  "Priyanka Fulwari",
                  maxLines: 2,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Positioned(
              right: 12,
              top: 6,
              child: Text(
                donor.bloodGroup?.toShortText()??"",
                style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 24,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              top: 55,
              left: 12,
              child: SizedBox(
                width: 305,
                child: Text(
                "Near Science City, Thaltej,\nAhemdabad",
                  maxLines: 2,
                  style:
                      const TextStyle(fontFamily: 'Inter', color: Colors.black),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: 330 - 16,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                    color: Colors.grey[300]),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  child: Text(
                    'She got 76% in Health Screening',
                    style: TextStyle(fontFamily: 'Inter', color: Colors.black),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ],
  );
}
