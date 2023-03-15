import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ProfileImage extends StatelessWidget {
  final String imageUrl;
  final bool isLoading;

  const ProfileImage({required this.imageUrl, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (isLoading)
          Positioned.fill(
            child:  SpinKitDualRing(
              color: Colors.deepPurpleAccent.shade200, // Set the color of the loading spinner to purple
              size: 100.0, // Set the size of the loading spinner
            ),
          ),
          CircleAvatar(
          radius: 25,
          backgroundImage: NetworkImage(
            imageUrl,
          ),
        ),

      ],
    );
  }
}