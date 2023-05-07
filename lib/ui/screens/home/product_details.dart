import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moniepoint_test/utils/colors.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({
    super.key,
  });

  @override
  State<ProductDetails> createState() => _ProductFullViewState();
}

class _ProductFullViewState extends State<ProductDetails>
    with TickerProviderStateMixin {
  late final AnimationController _topController;
  late final Animation<double> _topSplash;

  late final AnimationController _topSpace;
  late final Animation<EdgeInsetsGeometry> _topSpaceAnimation;

  late final AnimationController _bottomController;
  late final Animation<double> _bottomOpacityAnimation;

  late final AnimationController _bottomSlideController;
  late final Animation<Offset> _bottomSlideAnimation;

  late final AnimationController _middleOpacityController;
  late final Animation<double> _middleOpacityAnimation;
  String content = "about";
  void _startAnimations() async {
    _topController.forward();

    await Future.delayed(const Duration(milliseconds: 500));
    _topSpace.forward();

    _middleOpacityController.forward();

    _bottomController.forward();
    await Future.delayed(const Duration(milliseconds: 250));

    _bottomSlideController.forward();
  }

  @override
  void initState() {
    super.initState();

    _topController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _topSplash = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _topController,
        curve: Curves.easeIn,
      ),
    );

    _topSpace = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _topSpaceAnimation = Tween<EdgeInsetsGeometry>(
      begin: const EdgeInsets.only(top: 56),
      end: EdgeInsets.zero,
    ).animate(
      CurvedAnimation(
        parent: _topSpace,
        curve: Curves.easeIn,
      ),
    );

    _bottomController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _bottomOpacityAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _bottomController,
        curve: Curves.easeIn,
      ),
    );

    _bottomSlideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _bottomSlideAnimation =
        Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _bottomSlideController,
        curve: Curves.easeIn,
      ),
    );

    _middleOpacityController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 500,
      ),
    );

    _middleOpacityAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _middleOpacityController,
        curve: Curves.easeIn,
      ),
    );

    _startAnimations();
  }

  @override
  void dispose() {
    _topController.dispose();
    _topSpace.dispose();

    _bottomController.dispose();
    _bottomSlideController.dispose();

    _middleOpacityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite,
                color: Color(0xffE55986),
              )
              // : const Icon(Icons.favorite_border_outlined),
              ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share_outlined,
            ),
          ),
          SvgPicture.asset(
            "assets/images/cart.svg",
            width: 25,
            color: Colors.black,
          ),
        ],
      ),
      body: AnimatedBuilder(
        animation: _topController,
        builder: (context, child) => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Upper Section
                    Opacity(
                      opacity: _topSplash.value,
                      child: Container(
                        margin: _topSpaceAnimation.value,
                        color: const Color(0xffF7F7F7),
                        height: 336,
                        width: double.infinity,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Image.asset("assets/images/shirt2.webp"),
                            ),
                            Positioned(
                              top: 8,
                              left: 8,
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 8),
                                      height: 56,
                                      width: 48,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.grey,
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          "assets/images/shirt2_1.jpeg",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 8),
                                      height: 56,
                                      width: 48,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.grey,
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          "assets/images/shirt2_2.jpeg",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 8),
                                      height: 56,
                                      width: 48,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.grey,
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          "assets/images/shirt2_3.jpeg",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 8),
                                      height: 56,
                                      width: 48,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.grey,
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          "assets/images/shirt2_2.jpeg",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Middle section
                    Opacity(
                      opacity: _middleOpacityAnimation.value,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(
                            height: 24,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                "assets/images/store.svg",
                                width: 25,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              const Text(
                                "tokobaju.id",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const Text(
                            "Essentials Men's short-\nsleeve CrewNeck T-shirt",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Color(0xffFAB058),
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "4.9 Ratings",
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  )
                                ],
                              ),
                              const CircleAvatar(
                                radius: 3,
                                backgroundColor: Color(0xff989AA2),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "23k+ Reviews",
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  )
                                ],
                              ),
                              const CircleAvatar(
                                radius: 2,
                                backgroundColor: Color(0xff989AA2),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "2.9k+ Sold",
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  )
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Container(
                            height: 50,
                            child: Flex(
                              direction: Axis.vertical,
                              children: [
                                Expanded(
                                  child: DefaultTabController(
                                    length: 2,
                                    child: Column(
                                      children: <Widget>[
                                        DecoratedBox(
                                          decoration: const BoxDecoration(
                                              border: Border(
                                                  bottom: BorderSide(
                                                      color: AppColors.grey,
                                                      width: 2))),
                                          child: TabBar(
                                              onTap: (index) {
                                                switch (index) {
                                                  case 0:
                                                    setState(() {
                                                      content = "about";
                                                    });

                                                    break;
                                                  case 1:
                                                    setState(() {
                                                      content = "review";
                                                    });

                                                    break;
                                                  default:
                                                    content = "Other";
                                                    break;
                                                }
                                              },
                                              indicatorColor:
                                                  AppColors.primaryColor,
                                              unselectedLabelColor:
                                                  AppColors.black,
                                              labelColor: AppColors.black,
                                              tabs: [
                                                Tab(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        "About Item",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                content ==
                                                                        "about"
                                                                    ? FontWeight
                                                                        .bold
                                                                    : FontWeight
                                                                        .w400),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Tab(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        "Reviews",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                content ==
                                                                        "review"
                                                                    ? FontWeight
                                                                        .bold
                                                                    : FontWeight
                                                                        .w400),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ]),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Table(
                            defaultVerticalAlignment:
                                TableCellVerticalAlignment.middle,
                            border: const TableBorder(
                              bottom: BorderSide(
                                color: Color(0xffD1D1D1),
                              ),
                            ),
                            children: [
                              TableRow(
                                children: <Widget>[
                                  Row(
                                    children: const [
                                      Text("Brand:",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400)),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("ChArmkpR",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold))
                                    ],
                                  ),
                                  Row(
                                    children: const [
                                      Text("Color:",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400)),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("Aprikot",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold))
                                    ],
                                  ),
                                ],
                              ),
                              TableRow(
                                children: <Widget>[
                                  Row(
                                    children: const [
                                      Text("Brand:",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400)),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("ChArmkpR",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold))
                                    ],
                                  ),
                                  Row(
                                    children: const [
                                      Text("Color:",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400)),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("Aprikot",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold))
                                    ],
                                  ),
                                ],
                              ),
                              TableRow(
                                children: <Widget>[
                                  Row(
                                    children: const [
                                      Text("Brand:",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400)),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("ChArmkpR",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold))
                                    ],
                                  ),
                                  Row(
                                    children: const [
                                      Text("Color:",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400)),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("Aprikot",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold))
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            "Description",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(top: 8.0),
                                child: CircleAvatar(
                                  radius: 2,
                                  backgroundColor: Colors.grey,
                                ),
                              ),
                              SizedBox(width: 8),
                              Flexible(
                                child: Text(
                                  "Long sleeve shirt with a class button down",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(top: 8.0),
                                child: CircleAvatar(
                                  radius: 2,
                                  backgroundColor: Colors.grey,
                                ),
                              ),
                              SizedBox(width: 8),
                              Flexible(
                                child: Text(
                                  "Long sleeve shirt with a class button down",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(top: 8.0),
                                child: CircleAvatar(
                                  radius: 2,
                                  backgroundColor: Colors.grey,
                                ),
                              ),
                              SizedBox(width: 8),
                              Flexible(
                                child: Text(
                                  "Long sleeve shirt with a class button down",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(top: 8.0),
                                child: CircleAvatar(
                                  radius: 2,
                                  backgroundColor: Colors.grey,
                                ),
                              ),
                              SizedBox(width: 8),
                              Flexible(
                                child: Text(
                                  "Long sleeve shirt with a class button down",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(top: 8.0),
                                child: CircleAvatar(
                                  radius: 2,
                                  backgroundColor: Colors.grey,
                                ),
                              ),
                              SizedBox(width: 8),
                              Flexible(
                                child: Text(
                                  "Long sleeve shirt with a class button down",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Divider(),
                          const SizedBox(
                            height: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const Text(
                                "Shipping Information:",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: 'Delivery:  ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xff7C7E87),
                                      ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: "Shipping from Jakarta, Indonesia",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                            fontWeight: FontWeight.w700,
                                            color:
                                                brightness == Brightness.light
                                                    ? Colors.black
                                                    : Colors.white,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: 'Shipping:  ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xff7C7E87),
                                      ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: "Free International Shipping",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                            fontWeight: FontWeight.w700,
                                            color:
                                                brightness == Brightness.light
                                                    ? Colors.black
                                                    : Colors.white,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: 'Arrive:  ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xff7C7E87),
                                      ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text:
                                          "Estimated arrival on 25 - 27 Oct 2022",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                            fontWeight: FontWeight.w700,
                                            color:
                                                brightness == Brightness.light
                                                    ? Colors.black
                                                    : Colors.white,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          const Divider(),
                          const SizedBox(
                            height: 24,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CircleAvatar(
                                  radius: 32, backgroundColor: Colors.teal),
                              const SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Ade Store",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Flexible(
                                      child: Text(
                                        "Active 1hr ago | 78.2% Positive Feedback",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4, horizontal: 16),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: const Color(0xff4BB198),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SvgPicture.asset(
                                            "assets/images/store.svg",
                                            width: 25,
                                            color: AppColors.primaryColor,
                                          ),
                                          const SizedBox(
                                            width: 16,
                                          ),
                                          Text(
                                            "Visit store",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                  color:
                                                      const Color(0xff4BB198),
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          const Divider(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Opacity(
              opacity: _bottomOpacityAnimation.value,
              child: SlideTransition(
                  position: _bottomSlideAnimation,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 24),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: brightness == Brightness.light
                          ? Colors.white
                          : const Color(0xff8A8A8A),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          offset: const Offset(0, -2),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Total Price",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              "\$18.00",
                              style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              height: 50,
                              width: 70,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(6),
                                  bottomLeft: Radius.circular(6),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    "assets/images/cart.svg",
                                    width: 25,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Text("1",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                            Container(
                              height: 50,
                              width: 100,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(6),
                                  bottomRight: Radius.circular(6),
                                ),
                              ),
                              child: const Text("Buy Now",
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
