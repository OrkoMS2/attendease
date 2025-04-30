import 'package:flutter/services.dart';

import "../app_export.dart";
import 'dart:convert';
import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';


class Utils {

  static void showBottomSheet(
      BuildContext context, {
        required final Widget child,
        required final VoidCallback onClicked,
      }) =>
      showCupertinoModalPopup(
        context: context,
        builder: (context) => CupertinoActionSheet(
          actions: [
            child,
          ],
          cancelButton: CupertinoActionSheetAction(
            onPressed: onClicked,
            child: const Text('Done'),
          ),
        ),
      );
  static DateTime stringToDateTime(
      {
        required final String dateString
      }) {
    DateTime date = DateFormat("hh:mm:ss").parse(dateString);
    return date;
  }

  static String timeAgo(String dateString) {
    DateTime parsedDate = DateTime.parse(dateString).toLocal();
    Duration difference = DateTime.now().difference(parsedDate);

    if (difference.inSeconds < 60) {
      return "Just now";
    } else if (difference.inMinutes < 60) {
      return "${difference.inMinutes} ${difference.inMinutes == 1 ? "Minute" : "Minutes"} ago";
    } else if (difference.inHours < 24) {
      return "${difference.inHours} ${difference.inHours == 1 ? "Hour" : "Hours"} ago";
    } else if (difference.inDays < 30) {
      return "${difference.inDays} ${difference.inDays == 1 ? "Day" : "Days"} ago";
    } else if (difference.inDays < 365) {
      int months = (difference.inDays / 30).floor();
      return "$months ${months == 1 ? "Month" : "Months"} ago";
    } else {
      int years = (difference.inDays / 365).floor();
      return "$years ${years == 1 ? "Year" : "Years"} ago";
    }
  }
  static String getTimeAgo(String isoDateString) {
    final from = DateTime.parse(isoDateString).toLocal();
    final now = DateTime.now();
    final diff = now.difference(from);

    int totalDays = diff.inDays;
    int months = totalDays ~/ 30;
    int days = totalDays % 30;
    int hours = diff.inHours % 24;
    int minutes = diff.inMinutes % 60;

    final buffer = StringBuffer();

    if (months > 0) buffer.write('$months month${months > 1 ? 's' : ''} ');
    if (days > 0) buffer.write('$days day${days > 1 ? 's' : ''} ');
    if (hours > 0) buffer.write('$hours hour${hours > 1 ? 's' : ''} ');
    if (months == 0 && days == 0 && hours == 0 && minutes > 0) {
      buffer.write('$minutes min${minutes > 1 ? 's' : ''} ');
    }

    return buffer.toString().trim() + ' ago';
  }
  static String formatDateString(String isoDate, {String format = "dd/MM/yyyy"}) {
    try {
      DateTime dateTime = DateTime.parse(isoDate).toLocal();

      switch (format) {
        case "MM/dd/yy":
          return "${_twoDigits(dateTime.month)}/${_twoDigits(dateTime.day)}/${dateTime.year.toString().substring(2)}";
        case "MM/dd/yyyy":
          return "${_twoDigits(dateTime.month)}/${_twoDigits(dateTime.day)}/${dateTime.year}";
        case "dd/MM/yyyy":
          return "${_twoDigits(dateTime.day)}/${_twoDigits(dateTime.month)}/${dateTime.year}";

        case "dd-MMM-yyyy":
          return "${_twoDigits(dateTime.day)}-${_monthName(dateTime.month)}-${dateTime.year}";

        default:
          return "${_twoDigits(dateTime.day)}/${_twoDigits(dateTime.month)}/${dateTime.year}"; // default
      }
    } catch (e) {
      return "Invalid Date";
    }
  }

  static String _twoDigits(int n) => n.toString().padLeft(2, '0');

  static String _monthName(int month) {
    const List<String> months = [
      "Jan", "Feb", "Mar", "Apr", "May", "Jun",
      "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
    ];
    return months[month - 1];
  }


}