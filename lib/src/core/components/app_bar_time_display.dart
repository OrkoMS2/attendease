import 'dart:async';

import '../app_export.dart';

class AppBarTimeDisplay extends StatefulWidget {
  const AppBarTimeDisplay({super.key});

  @override
  State<AppBarTimeDisplay> createState() => _AppBarTimeDisplayState();
}

class _AppBarTimeDisplayState extends State<AppBarTimeDisplay> {
  late Timer _timer;
  late String _formattedTime;

  @override
  void initState() {
    super.initState();
    _updateTime();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) => _updateTime());
  }

  void _updateTime() {
    final now = DateTime.now();
    final hour = now.hour % 12 == 0 ? 12 : now.hour % 12;
    final minute = now.minute.toString().padLeft(2, '0');
    final period = now.hour >= 12 ? 'PM' : 'AM';
    setState(() {
      _formattedTime = '${hour.toString().padLeft(2, '0')} : $minute $period';
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _formattedTime,
      style: AppTextStyle.title.copyWith(
        fontSize: 21.sp,
        color: AppColor.white,
      ),
    );
  }
}
