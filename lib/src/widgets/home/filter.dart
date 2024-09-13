import 'package:flutter/material.dart';

class FilterBox extends StatelessWidget {
  const FilterBox({super.key});

  @override
  Widget build(BuildContext context) {
    const List<String> hospital = ['ALL', 'THANES DEVELOPMENT', 'รพ.มะเร็งอุดรธานี'];
    const List<String> ward = ['ALL', 'DEV', 'Sci.1', 'test1'];
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        DropdownMenu<String>(
          width: MediaQuery.of(context).size.width * 0.9,
          initialSelection: hospital.first,
          label: const Text('Hospital'),
          onSelected: (_) {},
          dropdownMenuEntries: hospital.map<DropdownMenuEntry<String>>((String value) {
            return DropdownMenuEntry<String>(value: value, label: value);
          }).toList(),
          inputDecorationTheme: InputDecorationTheme(
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
            constraints: BoxConstraints.tight(const Size.fromHeight(40)),
            border: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            labelStyle: const TextStyle(color: Colors.white),
          ),
          textStyle: const TextStyle(fontSize: 14),
        ),
        const SizedBox(height: 8),
        DropdownMenu<String>(
          width: MediaQuery.of(context).size.width * 0.9,
          initialSelection: ward.first,
          label: const Text('Ward'),
          onSelected: (_) {},
          dropdownMenuEntries: ward.map<DropdownMenuEntry<String>>((String value) {
            return DropdownMenuEntry<String>(value: value, label: value);
          }).toList(),
          inputDecorationTheme: InputDecorationTheme(
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            constraints: BoxConstraints.tight(const Size.fromHeight(40)),
            border: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            labelStyle: const TextStyle(color: Colors.white),
          ),
          textStyle: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}
