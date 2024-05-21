
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class InfiniteScrollScreen extends StatefulWidget {
  const InfiniteScrollScreen({Key? key}) : super(key: key);

  @override
  _InfiniteScrollScreenState createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  late List<bool> _isCheckedList;

  @override
  void initState() {
    super.initState();
    _isCheckedList =
        List.generate(50, (_) => false); // Initialize checkbox values
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scroll List Screen'),
      ),
      body: _buildList(context),
    );
  }

  Widget _buildList(BuildContext context) {
    const itemCount = 50; // Number of items in the list

    return ListView.builder(
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return _buildListItem(context, index);
      },
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    final IconData iconData = _getIconData(context, index);
    final String randomText = 'Option #${index + 1}';
    return Card(
      child: ListTile(
        leading: Icon(iconData, color: Colors.black), // Icon on the left
        title: Text(randomText), // Text on the right
        onTap: () {
          setState(() {
            _isCheckedList[index] =
                !_isCheckedList[index]; // Toggle checkbox value
          });
        },
        trailing: Checkbox.adaptive(
          onChanged: (_) {
            setState(() {
              _isCheckedList[index] =
                  !_isCheckedList[index]; // Toggle checkbox value
            });
          },
          value: _isCheckedList[index],
        ),
      ),
    );
  }

  IconData _getIconData(BuildContext context, int index) {
    IconData iconData;

    if (Theme.of(context).platform == TargetPlatform.iOS) {
      final cupertinoIcons = [
        CupertinoIcons.house,
        CupertinoIcons.airplane,
        CupertinoIcons.money_dollar,
        CupertinoIcons.camera,
        CupertinoIcons.car,
        CupertinoIcons.bitcoin,
        CupertinoIcons.heart,
        CupertinoIcons.photo_fill_on_rectangle_fill,
        CupertinoIcons.music_note,
      ];
      iconData = cupertinoIcons[index % cupertinoIcons.length];
    } else {
      final materialIcons = [
        Icons.home,
        Icons.airplanemode_active,
        Icons.attach_money,
        Icons.cake,
        Icons.camera,
        Icons.directions_car,
        Icons.currency_bitcoin,
        Icons.favorite,
        Icons.photo_library_sharp,
        Icons.music_note,
      ];
      iconData = materialIcons[index % materialIcons.length];
    }

    return iconData;
  }
}
