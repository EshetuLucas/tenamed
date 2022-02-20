import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const String DATABASE_PATH = 'hulunfechi_database';
const String EVENT_TABLE = 'event_table';
const String USER_TABLE = 'user_table';

List<Map<String, dynamic>> Categories = [
  {
    'title': 'Wellness',
    'subTitle': 'Keep it',
    'icon': 'assets/images/category_images/health.png',
  },
  {
    'title': 'Lab Tests',
    'subTitle': 'Home Collection',
    'icon': 'assets/images/category_images/lab.png',
  },
  {
    'title': 'Beauty',
    'subTitle': 'For all',
    'icon': 'assets/images/category_images/beauty.png',
  },
  {
    'title': 'COVID',
    'subTitle': 'Essential Items',
    'icon': 'assets/images/category_images/covid.png',
  },
  {
    'title': 'Devices',
    'subTitle': 'Medical device',
    'icon': 'assets/images/category_images/device.png',
  },
  {
    'title': 'Fitness',
    'subTitle': 'Vitamins & Mores',
    'icon': 'assets/images/category_images/fitness.png',
  },
  {
    'title': 'Ask a Dr',
    'subTitle': 'Chat,Auido & Video',
    'icon': 'assets/images/category_images/askDoctor.png',
  },
  {
    'title': 'Generics',
    'subTitle': 'All type',
    'icon': 'assets/images/category_images/pills.png',
  },
  {
    'title': 'Our Stores',
    'subTitle': 'Stores Nearby',
    'icon': 'assets/images/category_images/store.png',
  },
];

List<Map<String, dynamic>> BestSelling = [
  {
    'title': 'Wellness',
    'subTitle': 'Keep it',
    'icon': 'assets/images/category_images/bestSell1.jpeg',
  },
  {
    'title': 'Lab Tests',
    'subTitle': 'Home Collection',
    'icon': 'assets/images/category_images/bestSell2.jpeg',
  },
  {
    'title': 'Beauty',
    'subTitle': 'For all',
    'icon': 'assets/images/category_images/bestSell3.png',
  },
  {
    'title': 'COVID',
    'subTitle': 'Essential Items',
    'icon': 'assets/images/category_images/covid.png',
  },
  {
    'title': 'Devices',
    'subTitle': 'Medical device',
    'icon': 'assets/images/category_images/device.png',
  },
  {
    'title': 'Fitness',
    'subTitle': 'Vitamins & Mores',
    'icon': 'assets/images/category_images/fitness.png',
  },
  {
    'title': 'Ask a Dr',
    'subTitle': 'Chat,Auido & Video',
    'icon': 'assets/images/category_images/askDoctor.png',
  },
  {
    'title': 'Generics',
    'subTitle': 'All type',
    'icon': 'assets/images/category_images/pills.png',
  },
  {
    'title': 'Our Stores',
    'subTitle': 'Stores Nearby',
    'icon': 'assets/images/category_images/store.png',
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
