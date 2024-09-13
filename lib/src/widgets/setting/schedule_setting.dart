import 'package:flutter/material.dart';
import 'package:temp_noti/src/constants/timer.dart';

class ScheduleSetting extends StatelessWidget {
  const ScheduleSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            Icon(Icons.schedule, color: Colors.white70),
            Text(
              " Schedule",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white70,
              ),
            ),
          ],
        ),
        const Text("Day", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                const Text("First Day", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900)),
                const SizedBox(height: 5),
                DropdownMenu(
                  initialSelection: Timer.day.first,
                  width: 100,
                  onSelected: (String? value) {
                    // This is called when the user selects an item.
                    // setState(() {
                    //   dropdownValue = value!;
                    // });
                  },
                  dropdownMenuEntries: Timer.day.map<DropdownMenuEntry<String>>((String value) {
                    return DropdownMenuEntry<String>(value: value, label: value);
                  }).toList(),
                ),
              ],
            ),
            const SizedBox(width: 10),
            Column(
              children: [
                const Text("Second Day", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900)),
                const SizedBox(height: 5),
                DropdownMenu(
                  initialSelection: Timer.day.first,
                  width: 100,
                  onSelected: (String? value) {
                    // This is called when the user selects an item.
                    // setState(() {
                    //   dropdownValue = value!;
                    // });
                  },
                  dropdownMenuEntries: Timer.day.map<DropdownMenuEntry<String>>((String value) {
                    return DropdownMenuEntry<String>(value: value, label: value);
                  }).toList(),
                ),
              ],
            ),
            const SizedBox(width: 10),
            Column(
              children: [
                const Text("Third Day", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900)),
                const SizedBox(height: 5),
                DropdownMenu(
                  initialSelection: Timer.day.first,
                  width: 100,
                  onSelected: (String? value) {
                    // This is called when the user selects an item.
                    // setState(() {
                    //   dropdownValue = value!;
                    // });
                  },
                  dropdownMenuEntries: Timer.day.map<DropdownMenuEntry<String>>((String value) {
                    return DropdownMenuEntry<String>(value: value, label: value);
                  }).toList(),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Text("Time", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("First Time: ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
            Row(
              children: [
                DropdownMenu(
                  initialSelection: Timer.hour.first,
                  width: 90,
                  onSelected: (String? value) {
                    // This is called when the user selects an item.
                    // setState(() {
                    //   dropdownValue = value!;
                    // });
                  },
                  dropdownMenuEntries: Timer.hour.map<DropdownMenuEntry<String>>((String value) {
                    return DropdownMenuEntry<String>(value: value, label: value);
                  }).toList(),
                ),
                const SizedBox(width: 10),
                DropdownMenu(
                  initialSelection: Timer.minute.first,
                  width: 90,
                  onSelected: (String? value) {
                    // This is called when the user selects an item.
                    // setState(() {
                    //   dropdownValue = value!;
                    // });
                  },
                  dropdownMenuEntries: Timer.minute.map<DropdownMenuEntry<String>>((String value) {
                    return DropdownMenuEntry<String>(value: value, label: value);
                  }).toList(),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Second Time: ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
            Row(
              children: [
                DropdownMenu(
                  initialSelection: Timer.hour.first,
                  width: 90,
                  onSelected: (String? value) {
                    // This is called when the user selects an item.
                    // setState(() {
                    //   dropdownValue = value!;
                    // });
                  },
                  dropdownMenuEntries: Timer.hour.map<DropdownMenuEntry<String>>((String value) {
                    return DropdownMenuEntry<String>(value: value, label: value);
                  }).toList(),
                ),
                const SizedBox(width: 10),
                DropdownMenu(
                  initialSelection: Timer.minute.first,
                  width: 90,
                  onSelected: (String? value) {
                    // This is called when the user selects an item.
                    // setState(() {
                    //   dropdownValue = value!;
                    // });
                  },
                  dropdownMenuEntries: Timer.minute.map<DropdownMenuEntry<String>>((String value) {
                    return DropdownMenuEntry<String>(value: value, label: value);
                  }).toList(),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Third Time: ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
            Row(
              children: [
                DropdownMenu(
                  initialSelection: Timer.hour.first,
                  width: 90,
                  onSelected: (String? value) {
                    // This is called when the user selects an item.
                    // setState(() {
                    //   dropdownValue = value!;
                    // });
                  },
                  dropdownMenuEntries: Timer.hour.map<DropdownMenuEntry<String>>((String value) {
                    return DropdownMenuEntry<String>(value: value, label: value);
                  }).toList(),
                ),
                const SizedBox(width: 10),
                DropdownMenu(
                  initialSelection: Timer.minute.first,
                  width: 90,
                  onSelected: (String? value) {
                    // This is called when the user selects an item.
                    // setState(() {
                    //   dropdownValue = value!;
                    // });
                  },
                  dropdownMenuEntries: Timer.minute.map<DropdownMenuEntry<String>>((String value) {
                    return DropdownMenuEntry<String>(value: value, label: value);
                  }).toList(),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
