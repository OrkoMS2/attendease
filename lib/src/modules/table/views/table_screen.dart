
import '../../../core/app_export.dart';

class TableScreen extends StatelessWidget{
  const TableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Table View", style: AppTextStyle.title,)
      ],
    );
  }
}