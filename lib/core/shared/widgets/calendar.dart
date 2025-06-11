import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';

class CustomCalendarController extends ChangeNotifier {
  DateTime? _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  DateTime? get selectedDay => _selectedDay;
  DateTime get focusedDay => _focusedDay;

  void setSelectedDay(DateTime day) {
    _selectedDay = day;
    notifyListeners();
  }

  void setFocusedDay(DateTime day) {
    _focusedDay = day;
    notifyListeners();
  }

  void reset() {
    _selectedDay = DateTime.now();
    _focusedDay = DateTime.now();
    notifyListeners();
  }
}

class CustomCalendar extends StatefulWidget {
  const CustomCalendar({
    super.key,
    required this.controller,
    this.height,
    this.fun,
  });

  final CustomCalendarController controller;
  final double? height;
  final fun;
  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  final Color selectedDayColor = const Color(0XFF078962);
  late final Color todayColor;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    todayColor = const Color(0xFF078962).withAlpha((0.5 * 255).toInt());
  }

  String _getFormattedMonthYear(DateTime date) {
    const arabicMonths = [
      'يناير',
      'فبراير',
      'مارس',
      'أبريل',
      'مايو',
      'يونيو',
      'يوليو',
      'أغسطس',
      'سبتمبر',
      'أكتوبر',
      'نوفمبر',
      'ديسمبر',
    ];
    return '${arabicMonths[date.month - 1]} ${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey.shade300, width: 3.0),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.chevron_left),
                  onPressed: () {
                    final newFocusedDay = DateTime(
                      widget.controller.focusedDay.year,
                      widget.controller.focusedDay.month - 1,
                      1,
                    );
                    if (newFocusedDay.isAfter(DateTime.utc(2024, 12, 31))) {
                      setState(() {
                        widget.controller.setFocusedDay(newFocusedDay);
                      });
                    }
                  },
                ),
                Text(
                  _getFormattedMonthYear(widget.controller.focusedDay),
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.chevron_right),
                  onPressed: () {
                    final newFocusedDay = DateTime(
                      widget.controller.focusedDay.year,
                      widget.controller.focusedDay.month + 1,
                      1,
                    );
                    if (newFocusedDay.isBefore(DateTime.utc(2031, 1, 1))) {
                      setState(() {
                        widget.controller.setFocusedDay(newFocusedDay);
                      });
                    }
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: TableCalendar(
              locale: 'ar',
              availableCalendarFormats: const {CalendarFormat.month: 'شهر'},
              startingDayOfWeek: StartingDayOfWeek.sunday,
              headerVisible: false,
              firstDay: DateTime.utc(2025, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: widget.controller.focusedDay,
              calendarFormat: CalendarFormat.month,
              daysOfWeekStyle: const DaysOfWeekStyle(
                weekdayStyle: TextStyle(fontSize: 12),
                weekendStyle: TextStyle(fontSize: 12),
              ),
              calendarStyle: CalendarStyle(
                selectedDecoration: BoxDecoration(
                  color: selectedDayColor,
                  shape: BoxShape.circle,
                ),
                todayDecoration: BoxDecoration(
                  color: todayColor,
                  shape: BoxShape.circle,
                ),
              ),
              selectedDayPredicate:
                  (day) => isSameDay(widget.controller.selectedDay, day),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  widget.controller.setSelectedDay(selectedDay);
                  widget.controller.setFocusedDay(focusedDay);
                });
                if (widget.fun != null) {
                  widget.fun!();
                }
              },
              onPageChanged: (focusedDay) {
                setState(() {
                  widget.controller.setFocusedDay(focusedDay);
                });
              },
              calendarBuilders: CalendarBuilders(
                defaultBuilder:
                    (context, day, _) => Center(
                      child: Text(
                        '${day.day}',
                        style: const TextStyle(color: Colors.black),
                        textDirection: TextDirection.ltr,
                      ),
                    ),
                selectedBuilder:
                    (context, day, _) => _buildCircle(day, selectedDayColor),
                todayBuilder:
                    (context, day, _) => _buildCircle(day, todayColor),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCircle(DateTime day, Color color) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        width: 36,
        height: 36,
        child: Center(
          child: Text(
            '${day.day}',
            style: const TextStyle(color: Colors.white),
            textDirection: TextDirection.ltr,
          ),
        ),
      ),
    );
  }
}
