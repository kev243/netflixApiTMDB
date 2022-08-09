import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:notnetflix/models/person.dart';
import 'package:notnetflix/services/api.dart';
class CastingCard extends StatelessWidget {
  final Person person;
  const CastingCard({Key? key,
  required this.person
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),
      ),
      child: Column(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: CachedNetworkImage(
            imageUrl: API().baseImageURL+person.imageURL!,
            width: 160,
            fit: BoxFit.cover,
            errorWidget: ((context, url, error) => const Center(
              child: Icon(Icons.error),
            )),
            ),
        )
      ]),
    );
    
  }
}