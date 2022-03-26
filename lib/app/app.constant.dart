import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const String DATABASE_PATH = 'hulunfechi_database';
const String EVENT_TABLE = 'event_table';
const String USER_TABLE = 'user_table';

List<Map<String, dynamic>> Categories = [
  // {
  //   'title': 'Wellness',
  //   'subTitle': 'Keep it',
  //   'icon': 'assets/images/category_images/health.png',
  //   'items': LAB,
  // },
  {
    'title': 'Lab Tests',
    'subTitle': 'Home Collection',
    'icon': 'assets/images/category_images/lab.png',
    'items': AskD,
  },
  {
    'title': 'Beauty',
    'subTitle': 'For all',
    'icon': 'assets/images/category_images/beauty.png',
    'items': Beauty,
  },
  {
    'title': 'COVID',
    'subTitle': 'Essential Items',
    'icon': 'assets/images/category_images/covid.png',
    'items': LAB,
  },
  {
    'title': 'Devices',
    'subTitle': 'Medical device',
    'icon': 'assets/images/category_images/device.png',
    'items': LAB,
  },
  {
    'title': 'Fitness',
    'subTitle': 'Vitamins & Mores',
    'icon': 'assets/images/category_images/fitness.png',
    'items': Fit,
  },
  {
    'title': 'Ask a Dr',
    'subTitle': 'Chat,Auido & Video',
    'icon': 'assets/images/category_images/askDoctor.png',
    'items': LAB,
  },
  {
    'title': 'Generics',
    'subTitle': 'All type',
    'icon': 'assets/images/category_images/pills.png',
    'items': LAB,
  },
  {
    'title': 'Our Stores',
    'subTitle': 'Stores Nearby',
    'icon': 'assets/images/category_images/store.png',
    'items': LAB,
  },
];

List<Map<String, dynamic>> BestSelling = [
  {
    'title': 'Wellness',
    'subTitle': 'Keep it',
    'icon': 'assets/images/category_images/bestSell1.jpeg',
    'items': LAB,
  },
  {
    'title': 'Lab Tests',
    'subTitle': 'Home Collection',
    'icon': 'assets/images/category_images/bestSell2.jpeg',
    'items': LAB,
  },
  {
    'title': 'Beauty',
    'subTitle': 'For all',
    'icon': 'assets/images/category_images/bestSell3.png',
    'items': LAB,
  },
  {
    'title': 'COVID',
    'subTitle': 'Essential Items',
    'icon': 'assets/images/category_images/covid.png',
    'items': LAB,
  },
  {
    'title': 'Devices',
    'subTitle': 'Medical device',
    'icon': 'assets/images/category_images/device.png',
    'items': LAB,
  },
  {
    'title': 'Fitness',
    'subTitle': 'Vitamins & Mores',
    'icon': 'assets/images/category_images/fitness.png',
    'items': LAB,
  },
  {
    'title': 'Ask a Dr',
    'subTitle': 'Chat,Auido & Video',
    'icon': 'assets/images/category_images/askDoctor.png',
    'items': LAB,
  },
  {
    'title': 'Generics',
    'subTitle': 'All type',
    'icon': 'assets/images/category_images/pills.png',
    'items': LAB,
  },
  {
    'title': 'Our Stores',
    'subTitle': 'Stores Nearby',
    'icon': 'assets/images/category_images/store.png',
    'items': LAB,
  },
];
const List<Map<String, dynamic>> ACCOUNT_OPTIONS = [
  {
    'title': 'My Reminder',
    'iconData': Icons.alarm,
  },
  {
    'title': 'Notification',
    'iconData': FontAwesomeIcons.solidBell,
  },
  {'title': 'History', 'iconData': FontAwesomeIcons.history},
  {
    'title': 'Language',
    'iconData': FontAwesomeIcons.language,
  },
  {
    'title': 'Setting',
    'iconData': Icons.settings,
  },
  // {'title': 'Following', 'iconData': Icons.thumb_up_alt_outlined},
  {
    'title': 'Terms & Conditions',
    'iconData': CupertinoIcons.signature,
  },
  {
    'title': 'Help center',
    'iconData': Icons.help_outline,
  },
  {
    'title': 'About',
    'iconData': Icons.info_outlined,
  },
  {
    'title': 'Log out',
    'iconData': Icons.logout_rounded,
  },
];
const List<Map<String, dynamic>> LAB = [
  {
    'title': 'Cold & Cough',
    'iconData': 'assets/images/entertainers_images/lab1.jpg'
  },
  {
    'title': 'Cardiology',
    'iconData': 'assets/images/entertainers_images/lab2.jpg'
  },
  {
    'title': 'Counseling',
    'iconData': 'assets/images/entertainers_images/lab3.jpg'
  },
  {'title': 'ENT', 'iconData': 'assets/images/entertainers_images/lab4.jpg'},
  {
    'title': 'Dentist',
    'iconData': 'assets/images/entertainers_images/lab5.jpg'
  },
  {
    'title': 'Heamatology',
    'iconData': 'assets/images/entertainers_images/lab6.jpg'
  },
];
const List<Map<String, dynamic>> Appointment = [
  {
    'title': 'Clinic',
  },
  {
    'title': 'Hospital',
  },
  {
    'title': 'Lab test',
  },
  {
    'title': 'Consultation',
  },
];
const List<Map<String, dynamic>> AskD = [
  {
    'title': 'Covid 19',
    'iconData': 'assets/images/entertainers_images/askd1.jpg',
    'price': 'Price 1000ETB'
  },
  {
    'title': 'Diabetes',
    'iconData': 'assets/images/entertainers_images/askd2.jpg',
    'price': 'Price 300ETB'
  },
  {
    'title': 'Full body check',
    'iconData': 'assets/images/entertainers_images/askd3.jpg',
    'price': 'Price 2000ETB'
  },
  {
    'title': 'Heart',
    'iconData': 'assets/images/entertainers_images/askd4.jpg',
    'price': 'Price 300ETB'
  },
  {
    'title': 'Kidney',
    'iconData': 'assets/images/entertainers_images/askd5.jpg',
    'price': 'Price 350ETB'
  },
  {
    'title': 'Vitamin',
    'iconData': 'assets/images/entertainers_images/askd6.jpg',
    'price': 'Price 200ETB'
  },
];
const List<Map<String, dynamic>> Fit = [
  {
    'title': 'Vitamins',
    'iconData': 'assets/images/entertainers_images/fit1.jpg',
    'price': 'Price 100ETB'
  },
  {
    'title': 'Nutrafirst salmon fish',
    'iconData': 'assets/images/entertainers_images/fit2.jpg',
    'price': 'Price 1300ETB'
  },
  {
    'title': 'Family Nutrition',
    'iconData': 'assets/images/entertainers_images/fit3.jpg',
    'price': 'Price 1900ETB'
  },
  {
    'title': 'Nitethru Sleep Aid',
    'iconData': 'assets/images/entertainers_images/fit4.jpg',
    'price': 'Price 2000ETB'
  },
  {
    'title': 'Sport Supplement',
    'iconData': 'assets/images/entertainers_images/fit5.jpg',
    'price': 'Price 2000ETB'
  },
  {
    'title': 'Pro360 Gold Protein Powder',
    'iconData': 'assets/images/entertainers_images/fit6.jpg',
    'price': 'Price 2000ETB'
  },
  {
    'title': 'Weight Management',
    'iconData': 'assets/images/entertainers_images/fit7.jpg',
    'price': 'Price 2000ETB'
  },
];
const List<Map<String, dynamic>> Beauty = [
  {
    'title': 'Street wear lip2last',
    'iconData': 'assets/images/entertainers_images/beauty2.jpg',
    'price': 'Price 100ETB'
  },
  {
    'title': 'Fragrance',
    'iconData': 'assets/images/entertainers_images/beauty3.jpg',
    'price': 'Price 1300ETB'
  },
  {
    'title': 'Robero cavailli',
    'iconData': 'assets/images/entertainers_images/beauty4.jpg',
    'price': 'Price 1900ETB'
  },
  {
    'title': 'Mens grooming',
    'iconData': 'assets/images/entertainers_images/beauty5.jpg',
    'price': 'Price 2000ETB'
  },
  {
    'title': 'Gillete Mach',
    'iconData': 'assets/images/entertainers_images/beauty6.jpg',
    'price': 'Price 400ETB'
  },
  // {
  //   'title': 'Hairmac Professinal',
  //   'iconData': 'assets/images/entertainers_images/beauty7.jpg',
  //   'price': 'Price 6000ETB'
  // },
  // {
  //   'title': 'Skin Care',
  //   'iconData': 'assets/images/entertainers_images/beauty8.jpg',
  //   'price': 'Price 8000ETB'
  // },
  // {
  //   'title': 'Soulforwe Glitter',
  //   'iconData': 'assets/images/entertainers_images/beauty9.jpg',
  //   'price': 'Price 1000ETB'
  // },
];
List<String> Knowledge = [
  'Agerawi',
  'Merejawo',
  'Timihert',
  'Mebkat',
  'Gubegnt',
  'Meleyet',
  'Lihket',
  'Memesker',
  'Meteyek',
  'Zegawich',
  'Tewedadari',
  'Enibret',
  'Metenbey',
  'Mefeten',
  'Maseracha',
  'Wetatoch',
  'Setoch',
  'Awajoch',
  'Meneged',
  'Fithawi',
  'Mekemer',
  'Mefeleg',
];
List<String> Law = [
  'Megeber',
  'Firdbet',
  'Torhail',
  'Poleticawi',
  'Asatafi',
  'Metekom',
  'Birr fiset',
  'Metenbey',
  'Megebaya',
  'Awajoch',
  'Fithawi',
  'Mefeleg',
  'Yizota',
  'Ketemoch',
  'Marakot',
  'Tetekaminet',
];
List<String> Finance = [
  'Mamrecha',
  'Gibrnawo',
  'Mahlek',
  'Gubgnt',
  'Nibret',
  'Asatafi',
  'Shirkna',
  'Zegawichi',
  'Metenbey',
  'Megebaya',
  'Meneged',
  'Mekemer',
  'Mefeleg',
  'Meshekel',
  'Ketemoch',
  'Marakot',
  'Tetekaminet',
];
List<String> Technology = [
  'Gulbet',
  'Mitket',
  'Technology',
  'Enibret',
  'Metenbey',
  'Mefeleg',
];
List<String> Competition = [
  'Gitmiya',
  'Asatafi',
  'Meshelem',
  'Tewedadari',
  'Mefeten',
  'Mefeleg',
];

List<String> Belief = [
  'Tilket',
  'Mamlek',
  'Asatafi',
  'Metenbey',
  'Mefeleg',
];

List<String> Health = [
  'Tenachen',
  'Asatafi',
  'Metenbey',
  'Mefeleg',
  'Setoch',
  'Wetatoch'
];

List<String> get All => [
      ...Knowledge,
      ...Law,
      ...Finance,
      ...Technology,
      ...Competition,
      ...Belief,
      ...Health
    ];

List<String> AgerawiCategory = [
  'ICT',
  'Manufacturing',
  'Trading',
  'Health',
  'Education',
  'Agriculture',
  'Investment',
  'Finance',
  'Socila & Culture',
  'Politics & Economy',
  'Sport',
  'Youth, Women & Children',
  'Environment && Climate',
  'Justice',
  'Entertainment',
  'Media',
  'Art',
  'Defense',
  'Security',
  'Construction',
  'Transport',
  'Tourism',
  'Science & Technology',
  'Tax & Customs',
  'Power && Energy',
  'Land',
];

List<String> AgerawiSubCategory = [
  'News',
  'Announcement',
  'Products & Service',
  'Exhabitions',
  'Partnership',
  'Calls for paper',
  'Rules & Regulation',
  'Conferences',
  'Grants',
  'Researches',
  'Loans',
  'Jobs',
  'Bids',
  'Inagurations',
  'Scholarship',
  'Events',
  'Projects',
  'Competitions',
  'Seminars',
  'Conferences',
  'Tariffs',
  'Others',
];
