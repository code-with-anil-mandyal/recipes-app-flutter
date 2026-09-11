import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
                child: Text(
                  'Settings',
                  style: GoogleFonts.lato(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),

            // Profile card
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
                child: Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 54,
                        height: 54,
                        decoration: const BoxDecoration(
                          color: Color(0xFFFFD21F),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.person_rounded,
                          size: 28,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Recipe Lover',
                              style: GoogleFonts.lato(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Manage your preferences',
                              style: GoogleFonts.lato(
                                fontSize: 13,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(
                        Icons.chevron_right_rounded,
                        color: Colors.black45,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Preferences
            SliverToBoxAdapter(
              child: _Section(
                title: 'Preferences',
                children: [
                  _SettingItem(
                    icon: Icons.notifications_none_rounded,
                    title: 'Notifications',
                    subtitle: 'Recipe updates and reminders',
                    trailing: Switch(
                      value: true,
                      onChanged: null,
                      activeThumbColor: Colors.black,
                      activeTrackColor: Color(0xFFFFD21F),
                    ),
                  ),
                  _SettingItem(
                    icon: Icons.dark_mode_outlined,
                    title: 'Dark Mode',
                    subtitle: 'Change app appearance',
                    trailing: Switch(
                      value: false,
                      onChanged: null,
                      activeThumbColor: Colors.black,
                      activeTrackColor: Color(0xFFFFD21F),
                    ),
                  ),
                  _SettingItem(
                    icon: Icons.straighten_rounded,
                    title: 'Units',
                    subtitle: 'Metric',
                    trailing: const Icon(
                      Icons.chevron_right_rounded,
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
            ),

            // App
            SliverToBoxAdapter(
              child: _Section(
                title: 'App',
                children: [
                  _SettingItem(
                    icon: Icons.info_outline_rounded,
                    title: 'About',
                    subtitle: 'About Recipe App',
                    trailing: const Icon(
                      Icons.chevron_right_rounded,
                      color: Colors.black45,
                    ),
                  ),
                  _SettingItem(
                    icon: Icons.star_outline_rounded,
                    title: 'Rate the App',
                    subtitle: 'Share your experience',
                    trailing: const Icon(
                      Icons.chevron_right_rounded,
                      color: Colors.black45,
                    ),
                  ),
                  _SettingItem(
                    icon: Icons.share_outlined,
                    title: 'Share App',
                    subtitle: 'Share with your friends',
                    trailing: const Icon(
                      Icons.chevron_right_rounded,
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
            ),

            // Support
            SliverToBoxAdapter(
              child: _Section(
                title: 'Support',
                children: [
                  _SettingItem(
                    icon: Icons.help_outline_rounded,
                    title: 'Help & Feedback',
                    subtitle: 'Get help or send feedback',
                    trailing: const Icon(
                      Icons.chevron_right_rounded,
                      color: Colors.black45,
                    ),
                  ),
                  _SettingItem(
                    icon: Icons.privacy_tip_outlined,
                    title: 'Privacy Policy',
                    subtitle: 'Read our privacy policy',
                    trailing: const Icon(
                      Icons.chevron_right_rounded,
                      color: Colors.black45,
                    ),
                  ),
                  _SettingItem(
                    icon: Icons.description_outlined,
                    title: 'Terms & Conditions',
                    subtitle: 'App terms and conditions',
                    trailing: const Icon(
                      Icons.chevron_right_rounded,
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
            ),

            // Version
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 8, 24, 32),
                child: Center(
                  child: Text(
                    'Recipe App • Version 1.0.0',
                    style: GoogleFonts.lato(
                      fontSize: 12,
                      color: Colors.black38,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Section extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _Section({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4, bottom: 10),
            child: Text(
              title,
              style: GoogleFonts.lato(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Colors.black54,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(children: _addDividers(children)),
          ),
        ],
      ),
    );
  }

  List<Widget> _addDividers(List<Widget> children) {
    final result = <Widget>[];

    for (int i = 0; i < children.length; i++) {
      result.add(children[i]);

      if (i != children.length - 1) {
        result.add(const Divider(height: 1, indent: 68, endIndent: 16));
      }
    }

    return result;
  }
}

class _SettingItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Widget trailing;

  const _SettingItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 76,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFFFFD21F).withValues(alpha: 0.18),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, size: 21, color: Colors.black87),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.lato(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.lato(
                      fontSize: 12,
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 8),

            trailing,
          ],
        ),
      ),
    );
  }
}
