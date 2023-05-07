import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moniepoint_test/utils/colors.dart';
import 'package:moniepoint_test/utils/locator.dart';
import 'package:moniepoint_test/utils/router/navigation_service.dart';
import 'package:moniepoint_test/utils/router/route_names.dart';
import 'package:moniepoint_test/utils/screensize.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({Key? key, this.imagePath, this.shirtName, this.price})
      : super(key: key);

  final String? imagePath;
  final String? shirtName;
  final String? price;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  final NavigationService _navigationService = locator<NavigationService>();

  bool _hasBeenPressed = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey.shade100,
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        child: InkWell(
          onTap: () {
            _navigationService.navigateTo(productDetailsRoute);
          },
          child: Column(
            children: [
              Container(
                  color: Colors.grey,
                  child: Stack(
                    children: [
                      Image.asset(
                        widget.imagePath!,
                        height: 100,
                        width: Responsive.width(context) * 0.8,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        width: 35,
                        height: 35,
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              _hasBeenPressed = !_hasBeenPressed;
                            });
                          },
                          icon: _hasBeenPressed
                              ? SvgPicture.asset(
                                  "assets/images/love_active.svg")
                              : SvgPicture.asset("assets/images/love.svg"),
                          iconSize: 28.0,
                        ),
                      ),
                    ],
                  )),
              Card(
                  color: Colors.grey.shade100,
                  elevation: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Shirt",
                          style:
                              Theme.of(context).textTheme.caption!.copyWith()),
                      SizedBox(height: Responsive.height(context) * 0.01),
                      Text(widget.shirtName!,
                          style: Theme.of(context).textTheme.caption!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 12)),
                      SizedBox(height: Responsive.height(context) * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                size: 16,
                                color: Colors.amber.shade400,
                              ),
                              Text("49 | 2998",
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(fontSize: 12)),
                            ],
                          ),
                          Text(widget.price!,
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16))
                        ],
                      ),
                    ],
                  ))
            ],
          ),
        ));
  }
}
