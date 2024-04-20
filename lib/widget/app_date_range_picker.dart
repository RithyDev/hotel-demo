import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:hotel_app/widget/app_button_styles.dart';

class AppDateRangePicker extends StatefulWidget {
  final DateTime firstDate;
  final DateTime lastDate;
  final DateTimeRange? initialDateSelected;

  const AppDateRangePicker(
      {super.key,
      required this.firstDate,
      required this.lastDate,
      this.initialDateSelected});

  @override
  State<AppDateRangePicker> createState() => _AppDateRangePickerState();
}

class _AppDateRangePickerState extends State<AppDateRangePicker> {
  DateTimeRange? result;

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Select Date',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ),
        _renderCalander(color),
        _renderActions(context)
      ],
    );
  }

  Widget _renderActions(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _renderCancelButton(),
        _renderApplyButton(context),
      ],
    );
  }

  Widget _renderApplyButton(BuildContext context) {
    return Expanded(
        child: appRoundedButton(context,
            child: Text(
              'Apply',
              style: _actionTextStyle,
            ),
            onPressed: widget.initialDateSelected != null || result != null
                ? () => apply()
                : null));
  }

  Expanded _renderCancelButton() {
    return Expanded(
        child: SizedBox(
            height: 55,
            child: TextButton(
                onPressed: () => cancel(),
                child: Text(
                  'Cancel',
                  style: _actionTextStyle.copyWith(color: Colors.red),
                ))));
  }

  Widget _renderCalander(Color color) {
    return RangeDatePicker(
      minDate: widget.firstDate,
      maxDate: widget.lastDate,
      initialDate: widget.initialDateSelected?.start,
      centerLeadingDate: true,
      highlightColor: Colors.blue,
      slidersSize: 20,
      splashRadius: 2,
      splashColor: color,
      selectedRange: widget.initialDateSelected,
      singelSelectedCellTextStyle: const TextStyle(
          fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
      currentDateTextStyle: TextStyle(color: color),
      singelSelectedCellDecoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(12)),
      selectedCellsTextStyle:
          const TextStyle(fontSize: 14, color: Colors.black),
      padding: const EdgeInsets.all(0),
      leadingDateTextStyle: const TextStyle(color: Colors.black),
      disabledCellsTextStyle: const TextStyle(color: Colors.grey),
      enabledCellsTextStyle:
          const TextStyle(color: Color.fromARGB(255, 39, 39, 39)),
      daysOfTheWeekTextStyle: const TextStyle(
          color: Colors.black, fontSize: 12, fontWeight: FontWeight.w600),
      onRangeSelected: (value) => {
        setState(() {
          result = value;
        })
      },
    );
  }

  TextStyle get _actionTextStyle =>
      const TextStyle(color: Colors.white, fontWeight: FontWeight.w600);

  void cancel() {
    Navigator.of(context).pop();
  }

  void apply() {
    Navigator.of(context).pop(result);
  }
}
