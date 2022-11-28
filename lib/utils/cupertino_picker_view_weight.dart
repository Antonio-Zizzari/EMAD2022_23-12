import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoPickerViewWeight extends StatefulWidget {
  const CupertinoPickerViewWeight({Key? key}) : super(key: key);

  @override
  _CupertinoPickerViewWeightState createState() => _CupertinoPickerViewWeightState();
}

class _CupertinoPickerViewWeightState extends State<CupertinoPickerViewWeight> {
  var selectItem;
  double _kPickerSheetHeight = 216.0;
  DateTime? dateTime;
  Duration initialtimer = new Duration();
  var time;
  int value = 0;
  final items = [
    '2 kg',
    '3 kg',
    '4 kg',
    '5 kg',
    '6 kg',
    '7 kg',
    '8 kg',
    '9 kg',
    '10 kg',
    '11 kg',
    '12 kg',
    '13 kg',
    '14 kg',
    '15 kg',
    '16 kg',
    '17 kg',
    '18 kg',
    '19 kg',
    '20 kg',
    '21 kg',
    '22 kg',
    '23 kg',
    '24 kg',
    '25 kg'
  ];


  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildBody(context)
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.35,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 13),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black54),
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () {
          showCupertinoModalPopup<void>(
              context: context, builder: (BuildContext context) {
            return _buildBottomPicker(
                _buildCupertinoPicker()
            );
          });
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(padding: const EdgeInsets.fromLTRB(0,0,6,0), child: Center(child: Icon(Icons.monitor_weight_outlined)),
            ),
            Container(
              child: Center(
                child: Text(selectItem != null ? selectItem : 'Peso:',
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
  
  Widget _buildCupertinoPicker() {
    return Container(
      child: CupertinoPicker(
        backgroundColor: Colors.white,
        itemExtent: 35,
        //height of each item
        looping: true,
        children: items.map((item) =>
            Center(
              child: Text(item,
                style: TextStyle(fontSize: 24),),
            )).toList(),
        onSelectedItemChanged: (index) {
          setState(() => this.value = index);
          selectItem = items[index];
          // setState(() {
          //   selectItem=value.toString();
          // });
        },
      ),
    );
  }
  Widget _buildDateTimePicker() {
    return CupertinoDatePicker(
        mode: CupertinoDatePickerMode.dateAndTime,
        initialDateTime: dateTime,
        onDateTimeChanged: (DateTime newDataTime) {
          if (mounted) {
            setState(() {
              dateTime = newDataTime;
            });
          }
        });
  }
  Widget timePicker() {
    return CupertinoTimerPicker(
      mode: CupertinoTimerPickerMode.hms,
      minuteInterval: 1,
      secondInterval: 1,
      initialTimerDuration: initialtimer,
      onTimerDurationChanged: (Duration changedtimer) {
        setState(() {
          initialtimer = changedtimer;
          time = changedtimer.inHours.toString() +
              ' hrs ' +
              (changedtimer.inMinutes % 60).toString() +
              ' mins ' +
              (changedtimer.inSeconds % 60).toString() +
              ' secs';
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