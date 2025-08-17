import 'package:flutter/material.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialIconsRow extends StatelessWidget {
  const SocialIconsRow({
    super.key,
    this.instagramUrl,
    this.whatsappUrl,
    this.facebookUrl,
  });

  final String? instagramUrl;
  final String? whatsappUrl;
  final String? facebookUrl;

  void _launchLink(String? url) async {
    if (url == null || url.isEmpty) return;
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  Widget _buildIcon({required Widget icon, String? url}) {
    if (url == null || url.isEmpty) return const SizedBox.shrink();
    return GestureDetector(onTap: () => _launchLink(url), child: icon);
  }

  @override
  Widget build(BuildContext context) {
    final icons =
        <Widget>[
          _buildIcon(
            icon: Assets.icons.insta.svg(height: AppSize.s34),
            url: instagramUrl,
          ),
          _buildIcon(
            icon: Assets.icons.whatsapp.svg(height: AppSize.s34),
            url: whatsappUrl,
          ),
          _buildIcon(
            icon: Assets.icons.facebook.svg(height: AppSize.s34),
            url: facebookUrl,
          ),
        ].where((e) => e is! SizedBox).toList(); // حذف الفارغات

    if (icons.isEmpty) return const SizedBox.shrink();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: icons,
    );
  }
}
