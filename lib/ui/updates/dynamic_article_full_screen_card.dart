import 'package:flutter/material.dart';

class DynamicArticleScreenCard extends StatelessWidget {
  final String username;
  final String profilePic;
  final String postingTime;
  final String articleTitle;
  final String description;
  final String image;

  const DynamicArticleScreenCard(
      {super.key,
      required this.username,
      required this.profilePic,
      required this.postingTime,
      required this.articleTitle,
      required this.description,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: const Color.fromRGBO(224, 224, 224, 1),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(1.0, 2.0),
                  blurRadius: 2.0,
                  spreadRadius: 1.0,
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10,),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundImage: NetworkImage(profilePic),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            username,
                            style: const TextStyle(
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            postingTime,
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 13,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    articleTitle,
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: SizedBox(
                      height: 180,
                      width: double.infinity,
                      child: Image.network(image, fit: BoxFit.cover,),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    description,
                    style: const TextStyle(
                      fontFamily: 'Inter',
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
