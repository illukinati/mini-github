import 'package:flutter/material.dart';
import 'package:mini_github/presentation/core/colors.dart';
import 'package:mini_github/presentation/core/images.dart';

Widget searchBar({
  required BuildContext context,
  required bool isExpanded,
  required TextEditingController controller,
  required Function suffixIconTapped,
  required Function onChanged,
  required Function prefixIconTapped,
}) {
  var fullWidth = MediaQuery.of(context).size.width;

  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        width: 45,
        height: 45,
        child: Image.asset(MyImage.githubLogo),
      ),
      Spacer(flex: 1),
      AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        height: 45,
        width: isExpanded ? fullWidth - 61 : 45,
        decoration: BoxDecoration(
          color: MyColor.bgBlack,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: MyColor.blue, width: 1),
        ),
        alignment: Alignment.centerLeft,
        child:
            isExpanded
                ? TextField(
                  controller: controller,
                  autofocus: true,
                  style: TextStyle(color: MyColor.white),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search...',
                    hintStyle: TextStyle(color: MyColor.white),
                    prefixIcon: Icon(Icons.search, color: MyColor.white),
                    suffixIcon: IconButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        suffixIconTapped();
                      },
                      icon: Container(
                        decoration: BoxDecoration(
                          color: MyColor.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Icon(Icons.close, color: MyColor.bgBlack),
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    onChanged();
                  },
                )
                : Container(
                  decoration: BoxDecoration(
                    color: MyColor.bgBlack,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: MyColor.border),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.search, color: MyColor.white),
                    onPressed: () {
                      prefixIconTapped();
                    },
                  ),
                ),
      ),
    ],
  );
}
