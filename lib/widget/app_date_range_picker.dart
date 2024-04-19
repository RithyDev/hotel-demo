import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:flutter/material.dart';

class AppDateRangePicker extends StatefulWidget {
  final DateTime firstDate;
  final DateTime lastDate;

  const AppDateRangePicker(
      {super.key, required this.firstDate, required this.lastDate});

  @override
  State<AppDateRangePicker> createState() => _AppDateRangePickerState();
}

class _AppDateRangePickerState extends State<AppDateRangePicker> {
  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Select Date', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ),
        RangeDatePicker(
          minDate: widget.firstDate,
          maxDate: widget.lastDate,
          centerLeadingDate: true,
          highlightColor: Colors.blue,
          slidersSize: 20,
          splashRadius: 20,
          splashColor: color,
          singelSelectedCellTextStyle: const TextStyle(
              fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
          currentDateTextStyle: TextStyle(color: color),
          singelSelectedCellDecoration:
              BoxDecoration(color: color, borderRadius: BorderRadius.circular(12)),
          selectedCellsTextStyle:
              const TextStyle(fontSize: 14, color: Colors.black),
          padding: const EdgeInsets.all(0),
          leadingDateTextStyle: const TextStyle(color: Colors.black),
          enabledCellsTextStyle:
              const TextStyle(color: Color.fromARGB(255, 39, 39, 39)),
          daysOfTheWeekTextStyle: const TextStyle(
              color: Colors.black, fontSize: 12, fontWeight: FontWeight.w600),
          onRangeSelected: (value) => {},
        ),
      ],
    );
  }
}
