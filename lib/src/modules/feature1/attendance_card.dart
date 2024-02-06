import 'package:flutter/material.dart';
import 'package:e_ticket_ris/src/config/color_constants.dart';

class AttendanceCard extends StatelessWidget {
  final String day;
  final String month;
  final String className;
  final String time;

  AttendanceCard({
    required this.day,
    required this.month,
    required this.className,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: hexToColor("#00426C"), // White background for the card
      elevation: 0, // Remove default shadow
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), // Rounded corners for the card
        side: BorderSide(
          color: hexToColor("#182138"), // Dark blue-gray border
          width: 4.5, // Border width
        ),
      ),
      child: Row(
        children: <Widget>[
          // Calendar-like section
          Container(
            color: hexToColor("#00426C"), // Dark blue background
            padding: EdgeInsets.all(8),
            child: Column(
              children: <Widget>[
                Text(
                  day,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  month.toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            // Class name and time section
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              color: hexToColor("#182138"), // Dark blue-gray background
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    className,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Vrijeme prijave:  " + time,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
