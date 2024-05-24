import 'package:auth_flutter_with_firebase/helpers/Const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainHeader extends StatelessWidget {
  const MainHeader(
      {super.key,
      this.title = AppHomeText.findYourFavoriteFood,
      this.isNotification = false,
      this.onPressNotification});

  final String title;
  final bool isNotification;
  final Function()? onPressNotification;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Image.asset(
            AppImage.backgroundHeader,
            opacity: const AlwaysStoppedAnimation(.4),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, left: 31, right: 31),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: AppTextStyle.bold31,
                ),
                GestureDetector(
                  onTap: onPressNotification,
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(13)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Center(
                      child: Stack(
                        children: [
                          Image.asset(AppImage.iconNotification),
                          if (isNotification)
                            Positioned(
                                left: 10,
                                top: -2,
                                child: Container(
                                  width: 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    border: Border.all(
                                        width: 2, color: Colors.white),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                  ),
                                  child: const SizedBox(),
                                ))
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
