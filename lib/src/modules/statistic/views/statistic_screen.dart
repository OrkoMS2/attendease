
import '../../../core/app_export.dart';

class StatisticScreen extends StatelessWidget{
  const StatisticScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Statistic View", style: AppTextStyle.title,)
      ],
    );
  }
}