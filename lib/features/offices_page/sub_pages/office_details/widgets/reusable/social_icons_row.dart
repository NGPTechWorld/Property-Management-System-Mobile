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
    } else {
      debugPrint('Could not launch $url');
    }
  }

  Widget _buildIcon({required Widget icon, String? url}) {
    return GestureDetector(
      onTap: url == null || url.isEmpty ? null : () => _launchLink(url),
      child: Opacity(
        opacity: url == null || url.isEmpty ? 0.4 : 1.0,
        child: icon,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
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
      ],
    );
  }
}
