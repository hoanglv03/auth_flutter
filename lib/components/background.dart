import 'package:auth_flutter_with_firebase/helpers/Const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Background extends StatelessWidget {
  const Background(
      {super.key, required this.child, this.viewBottom, required this.onTab});
  final Widget child;
  final Widget? viewBottom;
  final Function onTab;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform.translate(
          offset: const Offset(150, -180),
          child: Transform.rotate(
            angle: 170,
            child: Image.asset(
              AppImage.backgroundImage,
              scale: 0.7,
              opacity: const AlwaysStoppedAnimation(.6),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 20,
            bottom: MediaQuery.of(context).padding.bottom,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  GestureDetector(
                    onTap: () => {onTab()},
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.buttonBackgroundArrow,
                      ),
                      margin: const EdgeInsets.only(
                        left: 25,
                      ),
                      padding: const EdgeInsets.only(left: 10),
                      child: const Center(
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.buttonArrow,
                        ),
                      ),
                    ),
                  ),
                  child
                ],
              ),
              viewBottom != null ? viewBottom! : const SizedBox()
            ],
          ),
        ),
      ],
    );
  }
}
