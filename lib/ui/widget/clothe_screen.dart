import 'package:flutter/material.dart';
import 'package:moniepoint_test/utils/colors.dart';

class MyClotheDisplayScreen extends StatelessWidget {
  const MyClotheDisplayScreen({Key? key, this.imagePath, this.price})
      : super(key: key);

  final String? imagePath;
  final String? price;

  @override
  Widget build(BuildContext context) {
    Size gSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.chevron_left,
                color: Colors.black,
                size: 40.0,
              )),
        ),
        actions: [
          const Icon(
            Icons.favorite,
            color: Colors.red,
            size: 35.0,
          ),
          SizedBox(width: gSize.width * 0.05),
          const Icon(
            Icons.share,
            color: Colors.black,
            size: 35.0,
          ),
          Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Badge(
                label: const Text(
                  "1",
                  style: TextStyle(color: Colors.white),
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.shopping_bag_outlined,
                  ),
                  iconSize: 30,
                  color: Colors.black,
                  onPressed: () {},
                ),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
          child: Column(children: [
            // SizedBox(
            //   height: gSize.height * 0.02,
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey.shade100),
                height: gSize.height * 0.4,
                width: gSize.width * 1.0,
                child: Stack(children: [
                  Align(
                    child: Image.asset(
                      imagePath!,
                      height: gSize.height * 0.3,
                      width: gSize.width * 0.5,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                      top: 10,
                      left: 10,
                      // width: 35,
                      // height: 35,
                      child: Column(
                        children: [
                          MySmallImages(
                            imagePath: imagePath!,
                          ),
                          MySmallImages(
                            imagePath: imagePath!,
                          ),
                          MySmallImages(
                            imagePath: imagePath!,
                          ),
                          MySmallImages(
                            imagePath: imagePath!,
                          )
                        ],
                      )),
                ]),
              ),
            ),
            SizedBox(
              height: gSize.height * 0.01,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.grey,
                        size: 26,
                      ),
                      SizedBox(
                        width: gSize.width * 0.02,
                      ),
                      Text("tokobaju.id",
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(color: Colors.grey, fontSize: 17)),
                    ],
                  ),
                  SizedBox(
                    height: gSize.height * 0.01,
                  ),
                  Text("Essentials Men's short-sleeve\nCrewNeck T-shirt",
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: Colors.black,
                          fontSize: 19,
                          fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: gSize.height * 0.016,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 20,
                            color: Colors.amber.shade400,
                          ),
                          Text("4.9 Ratings",
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(
                                      color: Colors.grey,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600)),
                        ],
                      ),
                      const Icon(
                        Icons.circle,
                        size: 8,
                        color: Colors.grey,
                      ),
                      Text("2.3+ Reviews",
                          style: Theme.of(context).textTheme.caption!.copyWith(
                              color: Colors.grey,
                              fontSize: 17,
                              fontWeight: FontWeight.w600)),
                      const Icon(
                        Icons.circle,
                        size: 8,
                        color: Colors.grey,
                      ),
                      Text("2.9+ Sold",
                          style: Theme.of(context).textTheme.caption!.copyWith(
                              color: Colors.grey,
                              fontSize: 17,
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                  SizedBox(
                    height: gSize.height * 0.016,
                  ),
                  const MyTabBar(),
                ],
              ),
            ),
          ]),
        ),
      ),
      bottomNavigationBar: Container(
        height: gSize.height * 0.14,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: gSize.height * 0.08,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Total Price",
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                            )),
                    Text(price!,
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontSize: 23,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryColor))
                  ],
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    height: gSize.height * 0.06,
                    width: gSize.width * 0.18,
                    child: OutlinedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.primaryColor),
                        shape: MaterialStateProperty.all(
                            const RoundedRectangleBorder(
                          // borderRadius: BorderRadius.circular(4.0),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              bottomLeft: Radius.circular(4.0)),
                        )),
                      ),
                      onPressed: () {},
                      child: Row(
                        children: [
                          const Icon(
                            Icons.shopping_bag_outlined,
                            color: Colors.white,
                          ),
                          Text(
                            "1",
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: gSize.height * 0.06,
                    width: gSize.width * 0.3,
                    child: OutlinedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.grey.shade800),
                        shape: MaterialStateProperty.all(
                            const RoundedRectangleBorder(
                          // borderRadius: BorderRadius.circular(4.0),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(4.0),
                              bottomRight: Radius.circular(4.0)),
                        )),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Buy Now",
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MySmallImages extends StatelessWidget {
  const MySmallImages({Key? key, this.imagePath}) : super(key: key);

  final String? imagePath;
  @override
  Widget build(BuildContext context) {
    Size gSize = MediaQuery.of(context).size;
    return Container(
        height: gSize.height * 0.08,
        width: gSize.width * 0.1,
        child: Column(children: [
          Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(1.0),
                  topRight: Radius.circular(1.0)),
            ),
            child: Image.asset(
              imagePath!,
              height: gSize.height * 0.03,
              width: gSize.width * 0.5,
              fit: BoxFit.cover,
            ),
          ),
        ]));
  }
}

class MyTabBar extends StatefulWidget {
  const MyTabBar({Key? key}) : super(key: key);

  @override
  State<MyTabBar> createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size gSize = MediaQuery.of(context).size;
    return Container(
      color: Colors.grey.shade100,
      height: gSize.height,
      child: Column(
        children: [
          TabBar(
            unselectedLabelColor: Colors.black,
            labelColor: AppColors.primaryColor,
            labelStyle: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(fontSize: 17, fontWeight: FontWeight.w600),
            tabs: const [
              Tab(
                text: 'About Item',
              ),
              Tab(
                text: 'Reviews',
              )
            ],
            controller: _tabController,
            indicatorSize: TabBarIndicatorSize.tab,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: 'Brand:',
                              style:
                                  Theme.of(context).textTheme.caption!.copyWith(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400,
                                      )),
                          TextSpan(
                              text: '   Versace',
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                      color:
                                          Colors.black)), // this is invisible
                        ]),
                      ),
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: 'Color:',
                              style:
                                  Theme.of(context).textTheme.caption!.copyWith(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400,
                                      )),
                          TextSpan(
                              text: '   Burgundy',
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                      color:
                                          Colors.black)), // this is invisible
                        ]),
                      )
                    ],
                  ),
                ),
                const Text('')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
