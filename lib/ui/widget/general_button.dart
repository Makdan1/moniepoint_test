import 'package:flutter/material.dart';
import 'package:moniepoint_test/utils/colors.dart';


//A button designed to be used throughout the app
class GeneralButton extends StatelessWidget {
  final Function onPressed;
  final BorderRadius borderRadius;
  final Color borderColor;
  final Color splashColor;
  final String buttonText;
  final Color buttonTextColor;
  final bool active;
   GeneralButton({  required this.onPressed, this.borderRadius = const BorderRadius.all(Radius.circular(10)), this.splashColor = AppColors.primaryColor, required this.buttonText, this.buttonTextColor = const Color(0xffFFFFFF), this.borderColor = Colors.transparent, this.active = true})
     ;

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return
      SizedBox(
          //padding: EdgeInsets.all(20),
          height: 50,
          width: deviceWidth,
          child:
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: splashColor,
                shape: RoundedRectangleBorder(
                  borderRadius: borderRadius,
                  side: BorderSide(color: borderColor),
                )),


            onPressed: () {
                    onPressed();
                  },
            child: Text(buttonText, style: TextStyle(color: buttonTextColor, ),),

          )
      );

  }
}
