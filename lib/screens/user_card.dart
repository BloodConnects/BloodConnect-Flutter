import 'package:flutter/material.dart';

Widget buildUserCard({
  required String name,
  required String bloodType,
  required String gender,
  required String location,
  required String imagePath,
  required VoidCallback onContactPressed,
}) {
  return Container(
    height: 135,
    width: 310,
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      color: Color.fromARGB(255, 203, 203, 203),
    ),
    child: Row(
      children: [
        SizedBox(
          height: double.infinity,
          width: 100,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12)
            ),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 5, top: 3, bottom: 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                maxLines: 2,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                bloodType,
                maxLines: 2,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                gender,
                maxLines: 2,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                location,
                maxLines: 2,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 30,
                child: ElevatedButton(
                  onPressed: onContactPressed,
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  child: const Text(
                    'Contact',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Inter'
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}
