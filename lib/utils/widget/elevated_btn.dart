import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:krystal_digital/utils/theme.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';



class BtnElevated extends StatefulWidget {
  final Widget child;
  final bool useFlexibleWith;
  final VoidCallback? onPressed;
  final double btnHeight, btnWidth, btnRadius;
  final bool isLoading;
  final bool disabled;
  final Color btnColor;
  const BtnElevated(
      {Key? key,
        required this.child,
        this.btnHeight = 38.0,
        this.useFlexibleWith = false,
        this.btnRadius = 10.0,
        this.btnWidth = double.infinity,
        this.isLoading = false,
        this.disabled = false,
        this.btnColor = const Color.fromRGBO(255, 68, 0, 1),
        required this.onPressed})
      : super(key: key);

  @override
  State<BtnElevated> createState() => _BtnElevatedState();
}

class _BtnElevatedState extends State<BtnElevated> {
  @override
  Widget build(BuildContext context) {
    // Color primaryColor = Theme.of(context).colorScheme.primary;
    return SizedBox(
      height: widget.btnHeight.h,
      width: widget.useFlexibleWith == true ? null : widget.btnWidth.w,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            disabledBackgroundColor:Colors.grey.withOpacity(0.3) ,
            backgroundColor: widget.disabled ? Colors.grey: widget.btnColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(widget.btnRadius),
            ),
          ),
          onPressed: widget.disabled ? (){} : widget.onPressed,
          child: widget.isLoading ? LoadingAnimation(color: appPurple) : widget.child),
    );
  }


  Function()? onpressed(){
    if(widget.isLoading){
      return null;
    }
    if(widget.disabled){
      return (){};
    }
    else{
      print('called');
      widget.onPressed;
    }
  }


}

class LoadingAnimation extends StatelessWidget {
  final Color color;
  final double height;

  const LoadingAnimation(
      {Key? key, this.color = Colors.white, this.height = 15})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.inkDrop(
        color: color,
        size: height.h,
      ),
    );
  }
}
