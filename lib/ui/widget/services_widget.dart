import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ServiceItem extends StatelessWidget {
  const ServiceItem({Key? key, this.icon, this.serviceName}) : super(key: key);

  final String? icon;
  final String? serviceName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.grey.shade100,
            ),
            child: SvgPicture.asset("assets/images/$icon", width: 15,),
          ),
        ),
      const  SizedBox(
          height: 5,
        ),
        Text(
          serviceName!,
          style: const TextStyle(color: Colors.grey, fontSize: 10),
        ),
      ],
    );
  }
}
