import '../app_export.dart';
class AlertX{

  static Future showSingleActionDialog({
    required void Function() buttonAction,
    String? title,
    String? body,
    required String buttonText,
  }){
    
    return showDialog(
        context: Get.context!,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(16.0)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Container(
                    padding: AppPaddings.alertTopPadding,
                    child: Text(
                      "$title",
                    ),
                  ),
                  AppSpaces.verticalSectionSpaceS,
                  Container(
                    padding: EdgeInsets.only(top: 9),
                    child: Text(
                      "$body",
                      maxLines: 5,
                      style: AppTextStyle.subtitle,
                    ),
                  ),
                  AppSpaces.verticalSectionSpaceL,

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                          onTap: buttonAction,
                          child: Text(
                              buttonText,
                            ),
                      ),

                      AppSpaces.horizontalSectionSpaceXS,
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }


  static showDualActionDialog({
    required String question,
    required String optionText1,
    required String optionText2,
    required Function() optAction1,
    required Function() optAction2,
    Color? option2Color,
}){
    
    showDialog(
        context: Get.context!,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(16.0)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Container(
                    padding: AppPaddings.alertTopPadding,
                    child: Text(
                      question,
                      maxLines: 5,
                    ),
                  ),
                  AppSpaces.verticalSectionSpaceL,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                          onTap: optAction1,
                          child: Text(
                              optionText1,
                            ),
                      ),
                      AppSpaces.horizontalSectionSpaceM,
                      GestureDetector(
                        onTap: optAction2,
                        child: Text(
                            optionText2,
                          ),

                      ),
                      AppSpaces.horizontalSectionSpaceXS,
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
  static customWidgetDialog({
    required Widget child,
    required double containerWidth,
    bool? dismissible
  }){

    showDialog(
      barrierDismissible: dismissible??true,
        context: Get.context!,
        builder: (BuildContext context) {
          return AlertDialog(

              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16.0))),
              contentPadding: EdgeInsets.zero,
              content: SizedBox(
                  width: containerWidth,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      child
                    ],
                  )
              )
          );
        });
  }

}