import 'package:flutter/material.dart';
import 'package:machinetest_app/widgets/bottom_navigation.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/promotional_banner.dart';
import '../widgets/kyc_detail.dart';
import '../widgets/logo_icons.dart';
import '../widgets/exclusive_container.dart';
import '../widgets/chat_floating_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const Center(child: Text('Home Screen')),
    const Center(child: Text('Categories Screen')),
    const Center(child: Text('Deals Screen')),
    const Center(child: Text('Cart Screen')),
    const Center(child: Text('Profile Screen')),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bannerWidth = screenWidth * 0.85;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Promotional Banners
            SizedBox(
              height: 180,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(vertical: 16),
                children: [
                  const SizedBox(width: 16),
                  Container(
                    width: bannerWidth,
                    margin: const EdgeInsets.only(right: 16),
                    child: PromotionalBanner(
                      title: 'Special Offer!',
                      description: 'Get amazing deals on all products',
                      value: '20M',
                      unit: 'Units',
                      imagePath: 'assets/images/pb01.png',
                      onApply: () {
                        print('Banner 1 applied');
                      },
                    ),
                  ),
                  Container(
                    width: bannerWidth,
                    margin: const EdgeInsets.only(right: 16),
                    child: PromotionalBanner(
                      title: 'Flash Sale!',
                      description: 'Limited time offers on electronics',
                      value: '15M',
                      unit: 'Units',
                      imagePath: 'assets/images/pb0.png',
                      onApply: () {
                        print('Banner 2 applied');
                      },
                    ),
                  ),
                  Container(
                    width: bannerWidth,
                    margin: const EdgeInsets.only(right: 16),
                    child: PromotionalBanner(
                      title: 'Mega Discount!',
                      description: 'Huge savings on fashion items',
                      value: '10M',
                      unit: 'Units',
                      imagePath: 'assets/images/pb1.png',
                      onApply: () {
                        print('Banner 3 applied');
                      },
                    ),
                  ),
                  Container(
                    width: bannerWidth,
                    margin: const EdgeInsets.only(right: 16),
                    child: PromotionalBanner(
                      title: 'Clearance Sale!',
                      description: 'Last chance to grab deals',
                      value: '5M',
                      unit: 'Units',
                      imagePath: 'assets/images/pb2.png',
                      onApply: () {
                        print('Banner 4 applied');
                      },
                    ),
                  ),
                ],
              ),
            ),
            // KYC Details Card
            const SizedBox(height: 16),
            const KycDetail(),
            const SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                height: 100,
                child: const LogoIcons(),
              ),
            ),
            const SizedBox(height: 16),
            const ExclusiveContainer(),
            const SizedBox(height: 16),
            // Your other content goes here
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: _screens[_currentIndex],
            ),
          ],
        ),
      ),
      floatingActionButton: const ChatFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: BottomNavigation(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
