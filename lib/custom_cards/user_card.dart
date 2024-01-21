import 'package:flutter/material.dart';

Widget buildUserCard({
  required String name,
  required String bloodType,
  required String gender,
  required String location,
  required String imagePath,
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
        child:  Stack(
          clipBehavior: Clip.none,
          children: [
            const Positioned(
              bottom: 80,
              left: 12,
              child: CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1662695090012-24ccea960995?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                ),
              ),
            ),
            const Positioned(
              left: 100,
              top: 6,
              child: SizedBox(
                width: 175,
                child: Text(
                  'Priyanka Fulwariya Omprakash',
                  maxLines: 2,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const Positioned(
              right: 12,
              top: 6,
              child: Text(
                'O+',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 24,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Positioned(
              top: 55,
              left: 12,
              child: SizedBox(
                width: 305,
                child: Text(
                  'Science City Approach, Sola Bridge, Ghatlodia, Ahmedabad, Gujarat - 380061',
                  maxLines: 2,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    color: Colors.black
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: 330,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                  color: Colors.grey[300]
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  child: Text(
                    'total health screening score',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: Colors.black
                    ),
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