import '../../../core/app_export.dart';
import '../../models/local_response/nav_item_model.dart';

final List<NavItemModel> navItemsData = [
  NavItemModel(icon: AppIcon.customerMenuIcon, index: 0, semanticsLabel: 'Customer Menu'),
  NavItemModel(icon: AppIcon.orderMenuIcon, index: 1, semanticsLabel: 'Order Menu'),
  NavItemModel(icon: AppIcon.tableMenuIcon, index: 2, semanticsLabel: 'Table Menu'),
  NavItemModel(icon: AppIcon.ticketMenuIcon, index: 3, semanticsLabel: 'Ticket Menu'),
  NavItemModel(icon: AppIcon.osMenuIcon, index: 4, semanticsLabel: 'OS Menu'),
  NavItemModel(icon: AppIcon.statMenuIcon, index: 5, semanticsLabel: 'Statistics Menu'),
  NavItemModel(icon: AppIcon.aboutMenuIcon, index: 6, semanticsLabel: 'About Menu'),
];
