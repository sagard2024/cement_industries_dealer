import 'package:cement_industries_dealer/app/modules/cases/case_list/case_list_screen.dart';
import 'package:cement_industries_dealer/app/modules/cases/create_case/create_case_screen.dart';
import 'package:cement_industries_dealer/app/modules/notifications/notifications_screen.dart';
import 'package:cement_industries_dealer/app/modules/order_details/order_details_screen.dart';
import 'package:get/get.dart';
import 'package:cement_industries_dealer/app/modules/account_statement/account_statement_screen.dart';
import 'package:cement_industries_dealer/app/modules/home/home_screen.dart';
import 'package:cement_industries_dealer/app/modules/invoice/invoice_details/invoice_details_screen.dart';
import 'package:cement_industries_dealer/app/modules/invoice/invoice_list/invoice_list_screen.dart';
import 'package:cement_industries_dealer/app/modules/order_kei/order_kei_list_screen.dart';
import 'package:cement_industries_dealer/app/modules/order_placement/delivery_information.dart';
import 'package:cement_industries_dealer/app/modules/order_placement/order_placement_screen.dart';
import 'package:cement_industries_dealer/app/modules/order_placement/review_order_screen.dart';
import 'package:cement_industries_dealer/app/modules/payment/payment_screen.dart';
import 'package:cement_industries_dealer/app/modules/place_order/place_order_screen.dart';
import 'package:cement_industries_dealer/app/modules/product/product_list_screen.dart';
import 'package:cement_industries_dealer/app/modules/profile/profile_screen.dart';
import 'package:cement_industries_dealer/app/modules/receipt/receipt_details/receipt_details_screen.dart';
import 'package:cement_industries_dealer/app/modules/receipt/receipt_list/receipt_list_screen.dart';
import 'package:cement_industries_dealer/app/modules/retailer/order_retailer/order_retailer_list_screen.dart';
import 'package:cement_industries_dealer/app/modules/retailer/top_retailer/top_retailer_screen.dart';
import 'package:cement_industries_dealer/app/modules/scan/scan_screen.dart';
import 'package:cement_industries_dealer/app/modules/splash/splash_screen.dart';
import 'package:cement_industries_dealer/app/modules/view_scheme/view_scheme_screen.dart';

part 'app_routes.dart';

class AppPages {
  static const SPLASH_SCREEN = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(name: _Paths.SPLASH_SCREEN, page: () => const SplashScreen()),
    GetPage(name: _Paths.HOME_SCREEN, page: () => const HomeScreen()),
    GetPage(name: _Paths.SCAN_SCREEN, page: () => const ScanScreen()),
    GetPage(name: _Paths.ORDRE_KEI_LIST_SCREEN, page: () => const OrderKeiListScreen()),
    GetPage(name: _Paths.ORDER_RETAILER_LIST_SCREEN, page: () => const OrderRetailerListScreen()),
    GetPage(name: _Paths.RECEIPT_LIST_SCREEN, page: () => const ReceiptListScreen()),
    GetPage(name: _Paths.RECEIPT_DETAILS_SCREEN, page: () => const ReceiptDetailsScreen()),
    GetPage(name: _Paths.TOP_RETAILER_SCREEN, page: () => const TopRetailerScreen()),
    GetPage(name: _Paths.VIEW_SCHEME_SCREEN, page: () => const ViewSchemeScreen()),
    GetPage(name: _Paths.PRODUCT_LIST_SCREEN, page: () => const ProductListScreen()),
    GetPage(name: _Paths.ACCOUNT_STATEMENT_SCREEN, page: () => const AccountStatementScreen()),
    GetPage(name: _Paths.PAYMENT_SCREEN, page: () => const PaymentScreen()),
    GetPage(name: _Paths.INVOICE_LIST_SCREEN, page: () => const InvoiceListScreen()),
    GetPage(name: _Paths.INVOICE_DETAILS_SCREEN, page: () => const InvoiceDetailsScreen()),
    GetPage(name: _Paths.PLACE_ORDER_SCREEN, page: () => const PlaceOrderScreen()),
    GetPage(name: _Paths.PROFILE_SCREEN, page: () => const ProfileScreen()),
    GetPage(name: _Paths.ORDER_PLACEMENT, page: () => const OrderPlacementScreen()),
    GetPage(name: _Paths.DELIVERY_INFORMATION, page: () => const DeliveryInformationScreen()),
    GetPage(name: _Paths.REVIEW_ORDER_SCREEN, page: () => const ReviewOrderScreen()),
    GetPage(name: _Paths.CREATE_CASE_SCREEN, page: () => const CreateCaseScreen()),
    GetPage(name: _Paths.CASE_LIST_SCREEN, page: () => const CaseListScreen()),
    GetPage(name: _Paths.NOTIFICATIONS_SCREEN, page: () => const NotificationsScreen()),
    GetPage(name: _Paths.ORDER_DETAILS_SCREEN, page: () => const OrderDetailsScreen()),
  ];
}
