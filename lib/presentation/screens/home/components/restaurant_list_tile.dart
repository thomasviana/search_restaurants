import 'package:flutter/material.dart';
import 'package:search_restaurants/core/restaurants/domain.dart';

class RestaurantListTile extends StatefulWidget {
  const RestaurantListTile({
    Key? key,
    required this.restaurant,
    this.onTap,
  }) : super(key: key);

  final Restaurant restaurant;
  final GestureTapCallback? onTap;

  @override
  State<RestaurantListTile> createState() => _RestaurantListTileState();
}

class _RestaurantListTileState extends State<RestaurantListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(widget.restaurant.imageUrl.toString()),
          ),
        ),
      ),
      title: Text(
        widget.restaurant.name,
        maxLines: 2,
      ),
      onTap: widget.onTap,
    );
  }
}
