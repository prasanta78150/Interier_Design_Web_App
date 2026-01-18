import 'package:flutter/material.dart';
import '../core/theme.dart';
import '../core/responsive.dart';
import '../widgets/custom_button.dart';
import '../core/mock_data.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDesktop = Responsive.isDesktop(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: isDesktop ? null : AppBar(title: const Text("Contact Us")),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: isDesktop ? 100 : 24.0,
            vertical: 40,
          ),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: isDesktop 
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 1, child: _buildInfoSection(context)),
                    const SizedBox(width: 100),
                    Expanded(flex: 1, child: _buildFormSection(context)),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInfoSection(context),
                    const SizedBox(height: 48),
                    _buildFormSection(context),
                  ],
                ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Let's Build Your\nDream Space",
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
            fontSize: Responsive.isDesktop(context) ? 48 : 32,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          "Our team of expert designers will work with you to create a space that reflects your personality and meets your needs.",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.6),
        ),
        const SizedBox(height: 48),
        _contactDetail(Icons.location_on_outlined, "Visit Us", MockData.location),
        const SizedBox(height: 24),
        _contactDetail(Icons.phone_outlined, "Call Us", MockData.phone),
        const SizedBox(height: 24),
        _contactDetail(Icons.mail_outline, "Email Us", MockData.email),
        const SizedBox(height: 16),
        const Text("Pan-India Services Available", style: TextStyle(color: SpaceTheme.accentGold, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildFormSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(12),
            blurRadius: 40,
            offset: const Offset(0, 10),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Talk to a Designer", style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 32),
          const TextField(
            decoration: InputDecoration(
              labelText: "Your Name",
              prefixIcon: Icon(Icons.person_outline),
            ),
          ),
          const SizedBox(height: 20),
          const TextField(
            decoration: InputDecoration(
              labelText: "Email Address",
              prefixIcon: Icon(Icons.email_outlined),
            ),
          ),
          const SizedBox(height: 20),
          const TextField(
            maxLines: 4,
            decoration: InputDecoration(
              labelText: "Project Requirements",
              alignLabelWithHint: true,
            ),
          ),
          const SizedBox(height: 40),
          CustomButton(
            text: "GET FREE QUOTE",
            isFullWidth: true,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _contactDetail(IconData icon, String title, String detail) {
    return Row(
      children: [
        Icon(icon, color: SpaceTheme.accentGold, size: 28),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            Text(detail, style: const TextStyle(color: SpaceTheme.softtext, fontSize: 14)),
          ],
        )
      ],
    );
  }
}
