import 'package:cement_industries_dealer/app/modules/home/home_screen.dart';
import 'package:cement_industries_dealer/generated/locales.dart';
import 'package:flutter/material.dart';

List<Map<String, dynamic>> upcomingEvent = [
  {
    "eventId": "Event-0000141",
    "eventName": "Zoom Event",
    "eventDesc": "TECHNOCRAT CONCLAVE",
    "eventAddress": "bcd 12 Pune Maharashtra 411057",
    "eventDate": "10-05-2025",
    "eventStatus": -1,
  },
  {
    "eventId": "Event-0000130",
    "eventName": "Zoom Event 2",
    "eventDesc": "TECHNOCRAT CONCLAVE",
    "eventAddress": "bcd 12 Pune Maharashtra 411057",
    "eventDate": "15-05-2025",
    "eventStatus": 1,
  },
  {
    "eventId": "Event-0000130",
    "eventName": "Zoom Event 2",
    "eventDesc": "TECHNOCRAT CONCLAVE",
    "eventAddress": "bcd 12 Pune Maharashtra 411057",
    "eventDate": "15-05-2025",
    "eventStatus": 0,
  },
];
List<Map<String, dynamic>> pastEvent = [
  {
    "eventId": "Event-0000140",
    "eventName": "Zoom Event",
    "eventDesc": "TECHNOCRAT CONCLAVE",
    "eventAddress": "bcd 12 Pune Maharashtra 411057",
    "eventDate": "28-01-2025",
    "eventStatus": -1,
  },
  {
    "eventId": "Event-0000129",
    "eventName": "Cement Dealer Event",
    "eventDesc": "Cement MILAN MAHOTSAV: CONTRACTOR CONFERENCE",
    "eventAddress": "park pune Maharashtra 411057",
    "eventDate": "23-01-2025",
    "eventStatus": 1,
  },
  {
    "eventId": "Event-0000129",
    "eventName": "Cement Dealer Event",
    "eventDesc": "Cement MILAN MAHOTSAV: CONTRACTOR CONFERENCE",
    "eventAddress": "park pune Maharashtra 411057",
    "eventDate": "23-01-2025",
    "eventStatus": 0,
  },
];
List<SaleMetric> product1MoM = [
  SaleMetric("Oct24", 10),
  SaleMetric("Nov24", 30),
  SaleMetric("Dec24", 40),
  SaleMetric("Jan24", 50),
  SaleMetric("Feb24", 30),
  SaleMetric("Mar24", 80),
  SaleMetric("Apr24", 70),
];
List<SaleMetric> product2MoM = [
  SaleMetric("Oct24", 20),
  SaleMetric("Nov24", 60),
  SaleMetric("Dec24", 70),
  SaleMetric("Jan24", 80),
  SaleMetric("Feb24", 100),
  SaleMetric("Mar24", 90),
  SaleMetric("Apr24", 60),
];
List<SaleMetric> product3MoM = [
  SaleMetric("Oct24", 40),
  SaleMetric("Nov24", 50),
  SaleMetric("Dec24", 30),
  SaleMetric("Jan24", 90),
  SaleMetric("Feb24", 80),
  SaleMetric("Mar24", 120),
  SaleMetric("Apr24", 100),
];

List<SaleMetric> product1QoQ = [
  SaleMetric("Quarter 1", 10),
  SaleMetric("Quarter 2", 30),
  SaleMetric("Quarter 3", 40),
  SaleMetric("Quarter 4", 50),
];
List<SaleMetric> product2QoQ = [
  SaleMetric("Quarter 1", 20),
  SaleMetric("Quarter 2", 60),
  SaleMetric("Quarter 3", 70),
  SaleMetric("Quarter 4", 80),
];
List<SaleMetric> product3QoQ = [
  SaleMetric("Quarter 1", 40),
  SaleMetric("Quarter 2", 50),
  SaleMetric("Quarter 3", 30),
  SaleMetric("Quarter 4", 90),
];
List<SaleMetric> product1YTD = [SaleMetric("2024", 10), SaleMetric("2025", 30)];
List<SaleMetric> product2YTD = [SaleMetric("2024", 20), SaleMetric("2025", 60)];
List<SaleMetric> product3YTD = [SaleMetric("2024", 40), SaleMetric("2025", 50)];

List<Map<String, dynamic>> receiptList = [
  {"transactionId": "1436134", "date": "05 Sep 2024", "referenceNo": "23587345", "amount": 350000, "typeOfCollection": "Online"},
  {"transactionId": "1436135", "date": "06 Sep 2024", "referenceNo": "23587346", "amount": 150000, "typeOfCollection": "Cash"},
  {"transactionId": "1436136", "date": "07 Sep 2024", "referenceNo": "23587347", "amount": 50000, "typeOfCollection": "Cheque"},
  {"transactionId": "1436137", "date": "08 Sep 2024", "referenceNo": "23587348", "amount": 75000, "typeOfCollection": "Online"},
  {"transactionId": "1436138", "date": "09 Sep 2024", "referenceNo": "23587349", "amount": 100000, "typeOfCollection": "Cash"},
  {"transactionId": "1436139", "date": "10 Sep 2024", "referenceNo": "23587350", "amount": 450000, "typeOfCollection": "Online"},
  {"transactionId": "1436140", "date": "11 Sep 2024", "referenceNo": "23587351", "amount": 250000, "typeOfCollection": "Not Available"},
  {"transactionId": "1436141", "date": "12 Sep 2024", "referenceNo": "23587352", "amount": 80000, "typeOfCollection": "Cheque"},
  {"transactionId": "1436142", "date": "13 Sep 2024", "referenceNo": "23587353", "amount": 300000, "typeOfCollection": "Online"},
  {"transactionId": "1436143", "date": "14 Sep 2024", "referenceNo": "23587354", "amount": 60000, "typeOfCollection": "Cash"},
];

List<Map<String, dynamic>> orderToKei = [
  {"salesOrderId": "#0-012344", "productName": "UltraMax Cement", "amount": 400, "orderPlacedDate": "12 Feb 2024"},
  {"salesOrderId": "#0-056789", "productName": "Duracrete 500", "amount": 250, "orderPlacedDate": "10 Feb 2024"},
  {"salesOrderId": "#0-098765", "productName": "StrongMix Pro", "amount": 150, "orderPlacedDate": "05 Feb 2024"},
];

List<Map<String, dynamic>> orderToRetailer = [
  {
    "salesOrderId": "#0-01928",
    "productName": "UltraMax Cement",
    "retailerName": "Aishwarya Retailer",
    "amount": 400,
    "orderPlacedDate": "12 Feb 2024",
  },
  {
    "salesOrderId": "#0-012344",
    "productName": "Duracrete 500",
    "retailerName": "Amit Retailer",
    "amount": 400,
    "orderPlacedDate": "12 Feb 2024",
  },
  {
    "salesOrderId": "#0-04567",
    "productName": "StrongMix Pro",
    "retailerName": "Bhavesh Electricals",
    "amount": 250,
    "orderPlacedDate": "10 Feb 2024",
  },
  {
    "salesOrderId": "#0-07891",
    "productName": "StoneBond Xtra",
    "retailerName": "City Power House",
    "amount": 180,
    "orderPlacedDate": "08 Feb 2024",
  },
  {
    "salesOrderId": "#0-01112",
    "productName": "Concrex Elite",
    "retailerName": "Electro Retail",
    "amount": 300,
    "orderPlacedDate": "05 Feb 2024",
  },
];

List<Map<String, dynamic>> top5Retailers = [
  {"salesOrderId": "#0040016613", "retailerName": "ADARSH BUILDING MATERIAL", "lastMonthValue": 3800, "thisMonthValue": 2600},
  {"salesOrderId": "#0040017169", "retailerName": "RK TRADERS, MANJIT CHOUDHARY", "lastMonthValue": 9800, "thisMonthValue": 5000},
  {"salesOrderId": "#0040017236", "retailerName": "JAI MAA AMBAY TRADERS, SHIVCHARAN G", "lastMonthValue": 4000, "thisMonthValue": 5790},
  {"salesOrderId": "#0040017890", "retailerName": "SHREE GANESH ELECTRICALS", "lastMonthValue": 4500, "thisMonthValue": 1500},
  {"salesOrderId": "#0040017925", "retailerName": "GLOBAL POWER SYSTEMS", "lastMonthValue": 6500, "thisMonthValue": 8000},
];

List<Map<String, dynamic>> accountStatementList = [
  {"date": "23 May 2024", "action": "Ordered 25 MT UltraMax Cement", "points": 2000, "type": "Earned", "closingBalance": 16893},
  {"date": "25 May 2024", "action": "Ordered 10 MT Duracrete 500", "points": 800, "type": "Earned", "closingBalance": 17693},
  {"date": "28 May 2024", "action": "Redeemed for Amazon Gift Card", "points": 5000, "type": "Redeemed", "closingBalance": 12693},
  {"date": "30 May 2024", "action": "Redeemed for Flipkart Voucher", "points": 3000, "type": "Redeemed", "closingBalance": 9693},
  {
    "date": "01 June 2024",
    "action": "Points Expired due to 12 months inactivity",
    "points": 1000,
    "type": "Expired",
    "closingBalance": 8693,
  },
];

List<Map<String, dynamic>> productsList = [
  {"name": "Air Fryer", "brand": "Philips", "points": 2400, "imageUrl": LocaleKeys.iv_air_fryer},
  {"name": "Curling Iron", "brand": "Philips", "points": 1700, "imageUrl": LocaleKeys.iv_curling_iron},
  {"name": "iPhone 15 Pro", "brand": "Apple", "points": 15000, "imageUrl": LocaleKeys.iv_iphone_15},
  {"name": "Wireless Earbuds", "brand": "Sony", "points": 2200, "imageUrl": LocaleKeys.iv_wireless_earbuds},
  {"name": "Smart Watch", "brand": "Samsung", "points": 3800, "imageUrl": LocaleKeys.iv_smart_watch},
  {"name": "Laptop Sleeve", "brand": "Dell", "points": 1200, "imageUrl": LocaleKeys.iv_laptop_sleeve},
  {"name": "Bluetooth Speaker", "brand": "JBL", "points": 2700, "imageUrl": LocaleKeys.iv_bluetooth_speaker},
  {"name": "Gaming Mouse", "brand": "Logitech", "points": 1300, "imageUrl": LocaleKeys.iv_gaming_mouse},
];

List<Map<String, dynamic>> cases = [
  {
    'name': 'Shree Balaji Cement Traders',
    'contact': '9876543210',
    'product': 'OPC 43 Grade',
    'casetype': 'Quality Issue',
    'date': '2023-06-01',
    'status': 'new',
  },
  {
    'name': 'Vijay Construction Supplies',
    'contact': '9876543210',
    'product': 'PPC',
    'casetype': 'Delivery Delay',
    'date': '2023-06-02',
    'status': 'open',
  },
  {
    'name': 'Mahadev Cement Depot',
    'contact': '9876543210',
    'product': 'PSC',
    'casetype': 'Short Supply',
    'date': '2023-06-03',
    'status': 'in progress',
  },
  {
    'name': 'Rajeshwari Building Materials',
    'contact': '9876543210',
    'product': 'OPC 43 Grade',
    'casetype': 'Billing Discrepancy',
    'date': '2023-06-04',
    'status': 'resolved',
  },
  {
    'name': 'Anand Cement & Hardware',
    'contact': '9876543210',
    'product': 'OPC 43 Grade',
    'casetype': 'Quality Issue',
    'date': '2023-06-01',
    'status': 'fixed',
  },
  {
    'name': 'Saraswati Cement Distributors',
    'contact': '9876543210',
    'product': 'PPC',
    'casetype': 'Delivery Delay',
    'date': '2023-06-02',
    'status': 'new',
  },
  {
    'name': 'Om Shakti Traders',
    'contact': '9876543210',
    'product': 'PSC',
    'casetype': 'Short Supply',
    'date': '2023-06-03',
    'status': 'open',
  },
  {
    'name': 'Rajeshwari Building Materials',
    'contact': '9876543210',
    'product': 'OPC 43 Grade',
    'casetype': 'Billing Discrepancy',
    'date': '2023-06-04',
    'status': 'in progress',
  },
];

List<Map<String, dynamic>> allProducts = [
  {
    'name': 'OPC 43 Grade',
    'brand': 'Polycab',
    'color': 'White',
    'length': '0.5',
    'image':
    'https://vashiisl.com/cdn/shop/products/0.5PX1CWHIFR100-3_472x472.jpg',
    'quantity': '3',
  },
  {
    'name': 'PPC',
    'brand': 'Finolex',
    'color': 'Black',
    'length': '0.5',
    'image':
    'https://vashiisl.com/cdn/shop/products/1PX1CBLKFRLS100-2_473x473.jpg',
    'quantity': '2',
  },
  {
    'name': 'PSC',
    'brand': 'Polycab',
    'color': 'Red',
    'length': '2.5',
    'image':
    'https://vashiisl.com/cdn/shop/products/2.5PX1CREDFRLS100-2_500x500.jpg',
    'quantity': '5',
  },
];

List<String> caseTypes = [
  'Quality Issue',
  'Delivery Delay',
  'Short Supply',
  'Billing Discrepancy',
  'Packaging Issue',
  'Leakage',
  'Spillage',
  'Others',
];

Color getStatusColor(String status) {
  switch (status.toLowerCase()) {
    case 'new':
      return Colors.red;
    case 'open':
      return Colors.orange;
    case 'in progress':
      return Colors.orangeAccent;
    case 'resolved':
      return Colors.green;
    case 'fixed':
      return Colors.teal;
    default:
      return Colors.grey;
  }
}

Color getOrderStatusColor(String status) {
  switch (status.toLowerCase()) {
    case 'approved':
      return Colors.blue;
    case 'pending approval':
      return Colors.orange;
    case 'dispatched':
      return Colors.purple;
    case 'delivered':
      return Colors.green;
    case 'cancelled':
      return Colors.red;
    default:
      return Colors.grey;
  }
}

List<Map<String, dynamic>> orders = [
  {
    'orderNumber': 'ORD-00123',
    'orderDate': '25-Jul-2025',
    'dealerName': 'Shree Balaji Cement',
    'productType': 'OPC 43 Grade',
    'quantity': '20',
    'orderStatus': 'Approved',
    'vehicleType': 'Full Truck Load',
    'preferredSource': 'Plant - Nimbahera',
    'expectedDeliveryDate': '30-Jul-2025',
    'orderValue': '₹1,80,000',
    'city': 'Pune',
  },
  {
    'orderNumber': 'ORD-00124',
    'orderDate': '25-Jul-2025',
    'dealerName': 'Mahadeva Cement Depot',
    'productType': 'PPC',
    'quantity': '15',
    'orderStatus': 'Pending Approval',
    'vehicleType': 'Mini Truck',
    'preferredSource': 'Depot - Bangalore',
    'expectedDeliveryDate': '31-Jul-2025',
    'orderValue': '₹1,25,000',
    'city': 'Mumbai',
    'areaOffice': 'Area Office - Mumbai',
    'phoneNo': '9876543210'
  },
  {
    'orderNumber': 'ORD-00125',
    'orderDate': '26-Jul-2025',
    'dealerName': 'Om Shakti Traders',
    'productType': 'OPC 53 Grade',
    'quantity': '25',
    'orderStatus': 'Dispatched',
    'vehicleType': 'Full Truck Load',
    'preferredSource': 'Plant - Gujarat',
    'expectedDeliveryDate': '29-Jul-2025',
    'orderValue': '₹2,25,000',
    'city': 'Ahmedabad',
  },
  {
    'orderNumber': 'ORD-00126',
    'orderDate': '26-Jul-2025',
    'dealerName': 'Anand Cement & Hardware',
    'productType': 'PPC',
    'quantity': '10',
    'orderStatus': 'Cancelled',
    'vehicleType': 'Mini Truck',
    'preferredSource': 'Depot - Jaipur',
    'expectedDeliveryDate': '-',
    'orderValue': '₹85,000',
    'city': 'Jaipur',
  },
  {
    'orderNumber': 'ORD-00127',
    'orderDate': '27-Jul-2025',
    'dealerName': 'Sai Krupa Cement House',
    'productType': 'OPC 43 Grade',
    'quantity': '18',
    'orderStatus': 'Delivered',
    'vehicleType': 'Full Truck Load',
    'preferredSource': 'Plant - Nimbahera',
    'expectedDeliveryDate': '28-Jul-2025',
    'orderValue': '₹1,62,000',
    'city': 'Pune',
  },
];



List<Map<String, dynamic>> invoiceList = [
  {
    'orderId': 'ORD7583',
    'customerName': 'Shree Balaji Cement Traders',
    'orderDate': '20 April 2025',
    'totalAmount': 150.75,
    'status': 'Shipped',
    'items': [
      {'productId': 'PROD101', 'quantity': 2},
      {'productId': 'PROD205', 'quantity': 1},
    ],
    'shippingAddress': {'street': '123 Fantasy Lane', 'city': 'Storyville', 'zip': '98765'},
  },
  {
    'orderId': 'ORD9124',
    'customerName': 'Vijay Construction Supplies',
    'orderDate': '21 April 2025',
    'totalAmount': 85.00,
    'status': 'Processing',
    'items': [
      {'productId': 'PROD310', 'quantity': 5},
    ],
    'shippingAddress': {'street': '456 Construct Ave', 'city': 'Builderton', 'zip': '12345'},
  },
  {
    'orderId': 'ORD3357',
    'customerName': 'Mahadev Cement Depot',
    'orderDate': '22 April 2025',
    'totalAmount': 210.50,
    'status': 'Delivered',
    'items': [
      {'productId': 'PROD101', 'quantity': 1},
      {'productId': 'PROD415', 'quantity': 3},
      {'productId': 'PROD520', 'quantity': 1},
    ],
    'shippingAddress': {'street': '789 Silent St', 'city': 'Movietown', 'zip': '54321'},
  },
  {
    'orderId': 'ORD6219',
    'customerName': 'Rajeshwari Building Materials',
    'orderDate': '23 April 2025',
    'totalAmount': 99.99,
    'status': 'Shipped',
    'items': [
      {'productId': 'PROD625', 'quantity': 1},
    ],
    'shippingAddress': {'street': '1 Wonder Way', 'city': 'Themyscira', 'zip': '67890'},
  },
  {
    'orderId': 'ORD1088',
    'customerName': 'Anand Cement & Hardware',
    'orderDate': '24 April 2025',
    'totalAmount': 345.20,
    'status': 'Pending',
    'items': [
      {'productId': 'PROD730', 'quantity': 2},
      {'productId': 'PROD835', 'quantity': 1},
    ],
    'shippingAddress': {'street': '1 Mission Rd', 'city': 'Impossible City', 'zip': '11223'},
  },
  {
    'orderId': 'ORD4471',
    'customerName': 'Saraswati Cement Distributors',
    'orderDate': '24 April 2025',
    'totalAmount': 55.60,
    'status': 'Delivered',
    'items': [
      {'productId': 'PROD205', 'quantity': 3},
    ],
    'shippingAddress': {'street': '2 Southside St', 'city': 'Chicago', 'zip': '60609'},
  },
  {
    'orderId': 'ORD8235',
    'customerName': 'Om Shakti Traders',
    'orderDate': '25 April 2025',
    'totalAmount': 12.95,
    'status': 'Cancelled',
    'items': [
      {'productId': 'PROD940', 'quantity': 1},
    ],
    'shippingAddress': {'street': '3 Vandelay Apt', 'city': 'New York', 'zip': '10023'},
  },
  {
    'orderId': 'ORD5501',
    'customerName': 'Sai Krupa Cement House',
    'orderDate': '26 April 2025',
    'totalAmount': 180.00,
    'status': 'Processing',
    'items': [
      {'productId': 'PROD101', 'quantity': 1},
      {'productId': 'PRODBOOK', 'quantity': 5},
    ],
    'shippingAddress': {'street': '4 Library Ln', 'city': 'Hogwarts', 'zip': ' magia'},
  },
  {
    'orderId': 'ORD2963',
    'customerName': 'Durga Cement & Steels',
    'orderDate': '26 April 2025',
    'totalAmount': 450.80,
    'status': 'Shipped',
    'items': [
      {'productId': 'PRODWHIP', 'quantity': 1},
      {'productId': 'PRODHAT', 'quantity': 1},
      {'productId': 'PRODARTIFACT', 'quantity': 1},
    ],
    'shippingAddress': {'street': '5 Adventure Ave', 'city': 'Archaeology Town', 'zip': '98712'},
  },
  {
    'orderId': 'ORD7140',
    'customerName': 'Ganesh Infrastructure Mart',
    'orderDate': '27 April 2025',
    'totalAmount': 75.30,
    'status': 'Pending Payment',
    'items': [
      {'productId': 'PRODRUM', 'quantity': 10},
    ],
    'shippingAddress': {'street': '6 Pirate Bay', 'city': 'Tortuga', 'zip': ' carib'},
  },
];
