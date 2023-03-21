import 'package:flutter/material.dart';
import 'package:magic_ball/controler/magic_provider/magic_logic.dart';

import 'package:magic_ball/view/screen/magic_functions.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MagicCounterclass>(create: (_) => MagicCounterclass(), )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          canvasColor: secondcolour
        ),
        home: MagicFunctions(),
      ),
    );
  }
}






class CustomChoiceChip extends StatefulWidget {
  final List<String> options;
  final ValueChanged<String> onChanged;
  final String initialValue;

  const CustomChoiceChip({
    Key? key,
    required this.options,
    required this.onChanged,
    this.initialValue = '',
  }) : super(key: key);

  @override
  _CustomChoiceChipState createState() => _CustomChoiceChipState();
}

class _CustomChoiceChipState extends State<CustomChoiceChip> {
  late String _selectedOption;

  @override
  void initState() {
    super.initState();
    _selectedOption = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Wrap(
        spacing: 8.0,
        children: widget.options
            .map(
              (option) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: _selectedOption == option
                      ? Colors.blue
                      : Colors.grey[300],
                ),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _selectedOption = option;
                    });
                    widget.onChanged(option);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 8.0,
                    ),
                    child: Text(
                      option,
                      style: TextStyle(
                        color: _selectedOption == option
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}


class SwiperWidget extends StatelessWidget {
  const SwiperWidget({
    Key? key,
    required this.swiperHeight,
  }) : super(key: key);

  final double swiperHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: swiperHeight,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image.asset(
            offerImages(index + 1),
            fit: BoxFit.fill,
          );
        },
        autoplay: true,
        pagination: const SwiperPagination(
            margin: EdgeInsets.all(2), builder: SwiperPagination.dots),
        itemCount: 3,
        itemWidth: 300.0,
        itemHeight: 400.0,
      ),
    );
  }
}


class Sssssssssss extends StatefulWidget {
  @override
  _SssssssssssState createState() => _SssssssssssState();
}

class _SssssssssssState extends State<Sssssssssss> {
  late String _selectedOption;

  @override
  void initState() {
    super.initState();
    _selectedOption = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Choice Chip Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomChoiceChip(
              options: ['Option 1', 'Option 2', 'Option 3'],
              initialValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            Text('Selected Option: $_selectedOption'),
          ],
        ),
      ),
    );
  }
}
