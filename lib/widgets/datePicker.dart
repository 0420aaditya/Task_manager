import 'package:flutter/material.dart';

class DateTimePickerButton extends StatefulWidget {
  final ValueChanged<DateTime?> onChanged;
  final String buttonText;
  final String? hintText;

  const DateTimePickerButton({
    Key? key,
    required this.onChanged,
    required this.buttonText,
    this.hintText,
  }) : super(key: key);

  @override
  _DateTimePickerButtonState createState() => _DateTimePickerButtonState();
}

class _DateTimePickerButtonState extends State<DateTimePickerButton> {
  DateTime? _selectedDateTime;

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? pickedDateTime = await showDatePicker(
      context: context,
      initialDate: _selectedDateTime ?? DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2101),
    );
    if (pickedDateTime != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (pickedTime != null) {
        final DateTime combinedDateTime = DateTime(
          pickedDateTime.year,
          pickedDateTime.month,
          pickedDateTime.day,
          pickedTime.hour,
          pickedTime.minute,
        );
        setState(() {
          _selectedDateTime = combinedDateTime;
        });
        widget.onChanged(combinedDateTime);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.buttonText,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        ElevatedButton(
          onPressed: () => _selectDateTime(context),
          child: Text(_selectedDateTime != null
              ? '${_selectedDateTime!.day}/${_selectedDateTime!.month}/${_selectedDateTime!.year} ${_selectedDateTime!.hour}:${_selectedDateTime!.minute}'
              : widget.hintText ?? 'Select Date and Time'),
        ),
      ],
    );
  }
}
