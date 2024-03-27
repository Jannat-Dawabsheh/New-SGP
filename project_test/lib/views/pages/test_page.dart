import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_test/utils/app_colors.dart';
class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final ValueNotifier<int> _tabIndexIconButton = ValueNotifier(0);

  List<IconData> get _listIconTabToggle => [
        FontAwesomeIcons.child,
        FontAwesomeIcons.childDress,
      ];

  List<String> get _listGenderEmpty => ["", ""];
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: ValueListenableBuilder(
              valueListenable: _tabIndexIconButton,
              builder: (context, currentIndex, _) {
                return FlutterToggleTab(
                  width: 40,
                  borderRadius: 8,
                  selectedIndex: currentIndex,
                  selectedTextStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  unSelectedTextStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  selectedBackgroundColors: [ currentIndex==0?AppColors.blueCategory:AppColors.pinkCategory],
                  labels: _listGenderEmpty,
                  icons: _listIconTabToggle,
                  iconSize: 35,
                  selectedLabelIndex: (index) {
                    _tabIndexIconButton.value = index;
                  },
                );
              },
            ),
          ),
        ],
      );
  }
}