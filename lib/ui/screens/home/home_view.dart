import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moniepoint_test/ui/screens/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:moniepoint_test/ui/widget/persistent_header.dart';
import 'package:moniepoint_test/utils/colors.dart';
import 'package:stacked/stacked.dart';
import 'package:moniepoint_test/utils/screensize.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Home>  with SingleTickerProviderStateMixin {
  int indexDisplayed = 0;
  late AnimationController _controller;
  late Animation<double> _animation;

  late ScrollController _scrollController;
  bool _showAppBar = true;

  @override
  void initState() {
    super.initState();
    _controller =
    AnimationController(vsync: this, duration: Duration(milliseconds: 5000))
      ..addListener(() {
        setState(() {});
      });

    _animation = Tween<double>(begin: 10.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.bounceInOut,
      ),
    );

    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (_showAppBar) {
          _showAppBar = false;
          _controller.forward();
        }
      } else {
        if (!_showAppBar) {
          _showAppBar = true;
          _controller.reverse();
        }
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    //This makes the view model accessible to the views using stacked
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        onModelReady: (model) {},
        builder: (context, model, child) {
          return Scaffold(
            body: CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverAppBar(
                  elevation: 0,
                  backgroundColor: Colors.white,
                  expandedHeight: 320.0,
                  floating: false,
                  pinned: true,
                  title: Container(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 8,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: Colors.grey),
                                ),
                                height: Responsive.height(context) * 0.05,
                                child: TextField(
                                  decoration: InputDecoration(
                                      filled: false,
                                      fillColor: Colors.transparent,
                                      border: InputBorder.none,
                                      focusColor: Colors.grey,
                                      // border: OutlineInputBorder(),
                                      prefixIcon: Padding(
                                          padding: EdgeInsets.all(10),
                                          child: SvgPicture.asset(
                                            "assets/images/search.svg",
                                            width: 25,
                                            color: Colors.grey,
                                          )),
                                      prefixIconColor: Colors.grey,
                                      // hintText: "search",
                                      labelText: 'Search..',
                                      labelStyle: const TextStyle(
                                          color: Colors.grey, fontSize: 12)),
                                ),
                              )),
                          const SizedBox(
                            width: 20,
                          ),
                          Badge(
                            backgroundColor: const Color(0xffE55986),
                            label: const Text(
                              "1",
                              style: TextStyle(color: Colors.white),
                            ),
                            child: SvgPicture.asset(
                              "assets/images/cart.svg",
                              width: 25,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Badge(
                            backgroundColor: const Color(0xffE55986),
                            label: const Text(
                              "9+",
                              style: TextStyle(color: Colors.white),
                            ),
                            child: SvgPicture.asset(
                              "assets/images/message.svg",
                              width: 25,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                        ],
                      )),
                  flexibleSpace: FlexibleSpaceBar(
                    background: Stack(children: [
                      CarouselSlider(
                        options: CarouselOptions(
                          autoPlay: true,
                          pageSnapping: false,
                          height: 380.0,
                          disableCenter: true,
                          enlargeCenterPage: false,
                          viewportFraction: 1.0,
                          onPageChanged: (index, reason) {
                            setState(() {
                              indexDisplayed = index;
                            });
                          },
                        ),
                        items: model.pages.map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return i;
                            },
                          );
                        }).toList(),
                      ),
                      Container(
                          padding: const EdgeInsets.only(top: 110, right: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: model.pages.map((urlOfItem) {
                              int index = model.pages.indexOf(urlOfItem);
                              return indexDisplayed == index
                                  ? Container(
                                      width: 15.0,
                                      height: 5.0,
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 2.0),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(2.0),
                                        shape: BoxShape.rectangle,
                                        color: indexDisplayed == index
                                            ? AppColors.black
                                            : Colors.grey,
                                      ),
                                    )
                                  : Container(
                                      width: 7.0,
                                      height: 7.0,
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 20.0, horizontal: 2.0),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: indexDisplayed == index
                                            ? Colors.black
                                            : Colors.grey,
                                      ),
                                    );
                            }).toList(),
                          )),
                    ]),
                  ),
                ),
                SliverToBoxAdapter(
                  child:Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 20),
                        height: 80,
                        width: Responsive.width(context),
                        child: ListView.builder(
                          itemBuilder: (BuildContext context, int index) {
                            return model.services[index];
                          },
                          itemCount: model.services.length,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                        ),
                      ),
                      Container(
                          padding: const EdgeInsets.only(top: 10, right: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: model.pages.map((urlOfItem) {
                              int index = model.pages.indexOf(urlOfItem);
                              return indexDisplayed == index
                                  ? Container(
                                      width: 15.0,
                                      height: 5.0,
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 2.0),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(2.0),
                                        shape: BoxShape.rectangle,
                                        color: indexDisplayed == index
                                            ? AppColors.black
                                            : Colors.grey,
                                      ),
                                    )
                                  : Container(
                                      width: 7.0,
                                      height: 7.0,
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 20.0, horizontal: 2.0),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: indexDisplayed == index
                                            ? Colors.black
                                            : Colors.grey,
                                      ),
                                    );
                            }).toList(),
                          )),
                    ],
                  ),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: PersistentHeader(
                    color: const Color(0xffF9F9F9),
                    child: Container(
                      padding: const EdgeInsets.only(
                          top: 20, bottom: 20, left: 10, right: 10),
                      color: Colors.grey.shade100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("Best Sale Product",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(
                            "See more",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 24,
                      crossAxisSpacing: 16,
                      mainAxisExtent: 256,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        final item = model.shirts[index];
                        return  Transform.translate(
                            offset: Offset(0, _animation.value),
                        child: item);
                      },
                      childCount: model.shirts.length,
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
