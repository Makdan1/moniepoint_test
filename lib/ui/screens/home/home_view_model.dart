import 'package:flutter/material.dart';
import 'package:moniepoint_test/core/model/Items.dart';
import 'package:moniepoint_test/core/services/database_service.dart';
import 'package:moniepoint_test/ui/widget/product_widget.dart';
import 'package:moniepoint_test/ui/widget/services_widget.dart';
import 'package:moniepoint_test/ui/widget/top_widget.dart';
import 'package:moniepoint_test/utils/base_model.dart';
import 'package:moniepoint_test/utils/colors.dart';
import 'package:moniepoint_test/utils/helpers.dart';
import 'package:moniepoint_test/utils/locator.dart';

class HomeViewModel extends BaseModel {
  final DatabaseService helper = locator<DatabaseService>();

  List<Widget> get pages {
    return [
      const TopWidget(
        imagePath: "assets/images/cloth.png",
        backgroundColor: AppColors.grey,
      ),
      const TopWidget(
          imagePath: "assets/images/makeup.png",
          backgroundColor: Color(0xffffe5ec))
    ];
  }

  List<Widget> get services {
    return [
      const ServiceItem(
        icon: "category.svg",
        serviceName: "Category",
      ),
      const ServiceItem(
        icon: "flight.svg",
        serviceName: "Flight",
      ),
      const ServiceItem(icon: "bill.svg", serviceName: "Bill"),
      const ServiceItem(
        icon: "dataplan.svg",
        serviceName: "Data Plan",
      ),
      const ServiceItem(
        icon: "topup.svg",
        serviceName: "Top Up",
      ),
      const ServiceItem(
        icon: "category.svg",
        serviceName: "Category",
      ),
      const ServiceItem(
        icon: "flight.svg",
        serviceName: "Flight",
      ),
      const ServiceItem(icon: "bill.svg", serviceName: "Bill"),
      const ServiceItem(
        icon: "dataplan.svg",
        serviceName: "Data Plan",
      ),
      const ServiceItem(
        icon: "topup.svg",
        serviceName: "Top Up",
      ),
    ];
  }

  List<Widget> get shirts {
    return [
      const ProductItem(
        imagePath: "assets/images/shirt1.jpeg",
        shirtName: "Essentials Men's short-\nsleeve CrewNeck T-shirt",
        price: "\$18.00",
      ),
      const ProductItem(
        imagePath: "assets/images/shirt2.webp",
        shirtName: "Essentials Men's short-\nsleeve CrewNeck T-shirt",
        price: "\$12.00",
      ),
      const ProductItem(
        imagePath: "assets/images/shirt3.jpeg",
        shirtName: "Essentials Men's short-\nsleeve CrewNeck T-shirt",
        price: "\$10.00",
      ),
      const ProductItem(
        imagePath: "assets/images/shirt4.jpeg",
        shirtName: "Essentials Men's Regular-\nFit Long-Sleeve Oxford...",
        price: "\$20.00",
      ),
      const ProductItem(
        imagePath: "assets/images/shirt1.jpeg",
        shirtName: "Essentials Men's short-\nsleeve CrewNeck T-shirt",
        price: "\$18.00",
      ),
      const ProductItem(
        imagePath: "assets/images/shirt2.webp",
        shirtName: "Essentials Men's short-\nsleeve CrewNeck T-shirt",
        price: "\$12.00",
      ),
      const ProductItem(
        imagePath: "assets/images/shirt3.jpeg",
        shirtName: "Essentials Men's short-\nsleeve CrewNeck T-shirt",
        price: "\$10.00",
      ),
      const ProductItem(
        imagePath: "assets/images/shirt4.jpeg",
        shirtName: "Essentials Men's short-\nsleeve CrewNeck T-shirt",
        price: "\$20.00",
      ),
    ];
  }

  //Function to save after the save button clicked
  saveFavorite(ProductModel items) async {
    setBusy(true);
    //This convert the payload to the model
    //Items msg = Items.fromJson(items);
    notifyListeners();
    int result;
    //Then the model is passed to the database
    result = await DatabaseService.insert(items);
    if (result != 0) {
      setBusy(false);
      //Success
      showToast("Favorite saved successfully");
    } else {
      setBusy(false);
      // Failure
      showToast("Problem Saving Favorite'");
    }
  }

  saveCart(ProductModel items) async {
    setBusy(true);
    //This convert the payload to the model
    //Items msg = Items.fromJson(items);
    notifyListeners();
    int result;
    //Then the model is passed to the database
    result = await DatabaseService.insertCart(items);
    if (result != 0) {
      setBusy(false);
      //Success
      showToast("Cart saved successfully");
    } else {
      setBusy(false);
      // Failure
      showToast("Cart Saving Employee'");
    }
  }

  deleteFavorite(ProductModel items) async {
    setBusy(true);
    int result;
    result = await helper.delete(items);
    if (result != 0) {
      setBusy(false);
      //Success
      showToast("Favorite removed successfully");
      notifyListeners();
    } else {
      setBusy(false);
      // Failure
      showToast("Problem deleting Employee'");
      notifyListeners();
    }
  }
}
