
import '../../../core/app_export.dart';

class OsScreen extends StatelessWidget{
  const OsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("OS View", style: AppTextStyle.title,)
      ],
    );
  }
}