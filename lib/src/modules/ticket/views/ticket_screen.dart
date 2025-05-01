
import '../../../core/app_export.dart';

class TicketScreen extends StatelessWidget{
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Ticket View", style: AppTextStyle.title,)
      ],
    );
  }
}