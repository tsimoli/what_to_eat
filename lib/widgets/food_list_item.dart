import 'package:flutter/material.dart';
import 'package:what_to_eat/models/food.dart';
import 'package:what_to_eat/widgets/tag_icon.dart';

class FoodListItem extends StatelessWidget {
  final Food food;

  const FoodListItem({Key key, this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Divider(
            height: 5,
          ),
          Text(
            food.name,
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: food.tags
                  .map(
                    (tag) => Container(
                          child: _getTagIcon(tag),
                        ),
                  )
                  .toList(),
            ),
          )
        ],
      ),
    );
  }

  _getTagIcon(String tag) {
    switch (tag) {
      case "FAVORITE":
        return TagIcon(
          color: Colors.green[300],
          emoji: "⭐",
        );
        break;
      case "HEALTHY":
        return TagIcon(
          color: Colors.greenAccent,
          emoji: "💪",
        );
        break;
      case "TREAT":
        return TagIcon(
          color: Colors.red,
          emoji: "🍕",
        );
        break;
      case "CHEAP":
        return TagIcon(
          color: Colors.pink[200],
          emoji: "💰",
        );
        break;
      case "VEGETABLE":
        return TagIcon(
          color: Colors.green[300],
          emoji: "🥦",
        );
        break;
      case "FAST":
        return TagIcon(
          color: Colors.blue[200],
          emoji: "⏳",
        );
        break;
      default:
    }
  }
}
