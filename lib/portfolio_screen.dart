import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';


class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  Future<void> _openLink(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Responsive sizing
    final isSmallScreen = screenWidth < 600;
    final isMediumScreen = screenWidth >= 600 && screenWidth < 1200;

    // Calculate responsive dimensions
    final containerWidth = isSmallScreen
        ? screenWidth * 0.9
        : isMediumScreen
        ? screenWidth * 0.7
        : 600.0;

    final containerHeight = isSmallScreen
        ? screenHeight * 0.8
        : screenHeight * 0.85;

    final titleFontSize = isSmallScreen ? 24.0 : 32.0;
    final arabicFontSize = isSmallScreen ? 36.0 : 50.0;
    final subtitleFontSize = isSmallScreen ? 14.0 : 18.0;
    final buttonWidth = isSmallScreen ? screenWidth * 0.7 : 300.0;
    final buttonHeight = isSmallScreen ? 60.0 : 70.0;
    final iconSize = isSmallScreen ? 35.0 : 40.0;
    final iconSpacing = isSmallScreen ? 15.0 : 20.0;
    final borderRadius = isSmallScreen ? 30.0 : 40.0;

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: Alignment.topCenter,
              radius: 0.5,
              colors: [Colors.blue.shade900, Colors.black],
              stops: [0.0, 1.0],
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isSmallScreen ? 16.0 : 24.0,
                  vertical: 20.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: isSmallScreen ? 20 : 40),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(borderRadius),
                            color: Colors.blue.shade900,
                            image: DecorationImage(
                              image: AssetImage('assets/images/profile4.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          width: containerWidth,
                          height: containerHeight,
                        ),
                        Container(
                          width: containerWidth,
                          height: containerHeight,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.blue.withOpacity(0.2),
                                Colors.transparent,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(borderRadius),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(isSmallScreen ? 16.0 : 20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'Ahmed Mohamed',
                                  style: GoogleFonts.playwriteAuNsw(
                                    color: Colors.white,
                                    fontSize: titleFontSize,
                                    fontWeight: FontWeight.w800,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'أحمد محمد',
                                  style: GoogleFonts.reemKufi(
                                    color: Colors.white,
                                    fontSize: arabicFontSize,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: isSmallScreen ? 10 : 15),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: isSmallScreen ? 8.0 : 16.0,
                                  ),
                                  child: Text(
                                    'Flutter Developer | Teaching Assistant | Tech Blogger',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: subtitleFontSize,
                                      height: 1.3,
                                    ),
                                  ),
                                ),
                                SizedBox(height: isSmallScreen ? 20 : 30),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(buttonWidth, buttonHeight),
                                    backgroundColor: Color(0x051939FF),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: isSmallScreen ? 20 : 30,
                                      vertical: isSmallScreen ? 12 : 15,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  onPressed: () {
                                    _openLink('https://www.ahmedmohamed.info/');
                                  },
                                  child: Text(
                                    'Portfolio',
                                    style: GoogleFonts.playwriteAuNsw(
                                      color: Colors.white,
                                      fontSize: isSmallScreen ? 18 : 20,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                                SizedBox(height: isSmallScreen ? 20 : 30),
                                Wrap(
                                  alignment: WrapAlignment.center,
                                  spacing: iconSpacing,
                                  runSpacing: isSmallScreen ? 15.0 : 0,
                                  children: [
                                    _buildSocialIcon(
                                      'assets/images/instagram.png',
                                      'https://www.instagram.com/ahmed_mo058/',
                                      iconSize,
                                    ),
                                    _buildSocialIcon(
                                      'assets/images/facebook.png',
                                      'https://www.facebook.com/ahmed.mohammed.477153/',
                                      iconSize,
                                    ),
                                    _buildSocialIcon(
                                      'assets/images/linkedin.png',
                                      'https://www.linkedin.com/in/ahmed-mohammed-565251175/',
                                      iconSize,
                                    ),
                                    _buildSocialIcon(
                                      'assets/images/youtube.png',
                                      'https://www.youtube.com/@DexterousTech-v1z',
                                      iconSize,
                                    ),
                                    _buildSocialIcon(
                                      'assets/images/whats.png',
                                      'https://wa.link/9g0r4a',
                                      iconSize,
                                    ),
                                  ],
                                ),
                                SizedBox(height: isSmallScreen ? 16 : 20),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: isSmallScreen ? 20 : 40),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialIcon(String assetPath, String url, double size) {
    return InkWell(
      onTap: () => _openLink(url),
      borderRadius: BorderRadius.circular(size / 2),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Image.asset(
          assetPath,
          width: size,
          height: size,
        ),
      ),
    );
  }
}