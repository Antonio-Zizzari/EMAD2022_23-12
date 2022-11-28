import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoPickerViewDate extends StatefulWidget {
  const CupertinoPickerViewDate({Key? key}) : super(key: key);

  @override
  _CupertinoPickerViewDateState createState() => _CupertinoPickerViewDateState();
}

class _CupertinoPickerViewDateState extends State<CupertinoPickerViewDate> {
  var selectItem;
  double _kPickerSheetHeight = 216.0;
  DateTime? dateTime;
  DateTime dateNow = DateTime.now();
  DateTime date = DateTime(2016, 10, 26);
  var time;
  int value = 0;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildBody(context)
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 13),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black54),
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () {
          showCupertinoModalPopup<void>(
            context: context, builder: (BuildContext context) {
            return _buildBottomPicker(_buildDateTimePicker());
          });
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(padding: const EdgeInsets.fromLTRB(0,0,6,0), child: Center(child: Icon(Icons.monitor_weight_outlined)),
            ),
            Container(
              child: Center(
                child: Text(date != null ? "${date.day} - ${date.month} - ${date.year}" : 'Inserisci data di nascita:',
                  style: TextStyle(color: Colors.black54)
                ),
              ),
            ),
            Spacer(),
            Icon(Icons.arrow_drop_down)
          ],
        ),
      ),
    );
  }

  Widget _buildDateTimePicker() {
    return CupertinoDatePicker(
      mode: CupertinoDatePickerMode.date,
      initialDateTime: date,
      maximumDate: dateNow,
      minimumDate: new DateTime(dateNow.year - 20, dateNow.month, dateNow.day),
      onDateTimeChanged: (DateTime newDate) {
        setState(() {
          date = newDate;
        });
      },
    );
  }
  Widget _buildBottomPicker(Widget picker) {
    return Container(
      height: _kPickerSheetHeight,
      padding: const EdgeInsets.only(top: 6.0),
      color: CupertinoColors.white,
      child: DefaultTextStyle(
        style: const TextStyle(
          color: CupertinoColors.black,
          fontSize: 22.0,
        ),
        child: GestureDetector(
          // Blocks taps from propagating to the modal sheet and popping.
          onTap: () {},
          child: SafeArea(
            top: false,
            child: picker,
          ),
        ),
      ),
    );
  }
}