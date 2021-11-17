import 'package:flutter/material.dart';

class ViewItem extends StatelessWidget {
  const ViewItem(
      {Key? key,
      required this.brand,
      required this.model,
      required this.year,
      required this.description,
      required this.imageUrl})
      : super(key: key);

  final String brand;
  final String model;
  final int year;
  final String description;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              FadeInImage(
                width: double.infinity,
                fit: BoxFit.cover,
                height: 200,
                image: NetworkImage(imageUrl),
                placeholder: const AssetImage("images/car_placeholder.png"),
              ),
              Text(brand),
              Text(year.toString())
            ],
          )),
    );
  }
}
