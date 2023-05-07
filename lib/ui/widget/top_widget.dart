import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moniepoint_test/utils/colors.dart';
import 'package:moniepoint_test/utils/screensize.dart';

class TopWidget extends StatelessWidget {
  final String? imagePath;
  final Color? backgroundColor;
  const TopWidget({Key? key, this.imagePath, this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            color: backgroundColor,
            child: Align(
                alignment: Alignment.bottomRight,
                child: Image.asset(
                  imagePath!,
                  width: Responsive.width(context) / 1.8,
                ))),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 130,
              ),
              Text(
                '#FASHION DAY',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
              const SizedBox(
                height: 10,
              ),
              Text('80% OFF',
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 32)),
              const SizedBox(
                height: 10,
              ),
              Text('Discover fashion that suits to\nyour style',
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        color: Colors.black54,
                      )),
              const SizedBox(
                height: 10,
              ),
              OutlinedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.grey.shade800),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  )),
                ),
                onPressed: () {},
                child: Text(
                  "Check this out",
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(color: Colors.white),
                ),
              )
            ],
          ),
        ),

        // const Positioned(child: MySearchBar())
      ],
    );
  }
}
