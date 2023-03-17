import 'dart:math';

import 'package:flutter/cupertino.dart';

class MagicCounterclass extends ChangeNotifier {
  int _magicCount = 7;

  void changeCountValue() {
    _magicCount = Random().nextInt(7);
    notifyListeners();
  }

  void resetApp() {
    _magicCount = 7;
    notifyListeners();
  }

  int get magicCount => _magicCount;
}







class HobbySelector extends StatefulWidget {
  final List<String> hobbies;
  final ValueChanged<List<String>> onChanged;

  HobbySelector({required this.hobbies, required this.onChanged});

  @override
  _HobbySelectorState createState() => _HobbySelectorState();
}

class _HobbySelectorState extends State<HobbySelector> {
  List<String> _selectedHobbies = [];

  void _toggleHobby(String hobby) {
    setState(() {
      if (_selectedHobbies.contains(hobby)) {
        _selectedHobbies.remove(hobby);
      } else {
        _selectedHobbies.add(hobby);
      }
    });
    widget.onChanged(_selectedHobbies);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Hobbies:', style: TextStyle(fontSize: 18)),
        SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: widget.hobbies
              .map((hobby) => Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: _selectedHobbies.contains(hobby)
                          ? Colors.blue
                          : Colors.grey[300],
                    ),
                    child: GestureDetector(
                      onTap: () => _toggleHobby(hobby),
                      child: Text(hobby,
                          style: TextStyle(
                              fontSize: 16,
                              color: _selectedHobbies.contains(hobby)
                                  ? Colors.white
                                  : Colors.black)),
                    ),
                  ))
              .toList(),
        ),
      ],
    );
  }
}
