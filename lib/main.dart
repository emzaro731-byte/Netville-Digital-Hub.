import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const NetvilleApp());

const ink = Color(0xFF07111F);
const panel = Color(0xFF102139);
const blue = Color(0xFF55A7FF);
const aqua = Color(0xFF6CF0E2);
const line = Color(0xFF233C59);

// Replace this placeholder with the business WhatsApp number in international
// format without "+" or spaces, e.g. 2348012345678.
const businessWhatsApp = '2348088476779';

class NetvilleApp extends StatelessWidget {
  const NetvilleApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Netville Digital Hub',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.dark,
          scaffoldBackgroundColor: ink,
          colorScheme: ColorScheme.fromSeed(seedColor: blue, brightness: Brightness.dark),
          appBarTheme: const AppBarTheme(backgroundColor: ink, foregroundColor: Colors.white, centerTitle: false),
          cardTheme: CardThemeData(
            color: panel,
            elevation: 0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22), side: const BorderSide(color: line)),
          ),
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: panel,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: line)),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: blue)),
          ),
        ),
        home: const HomeShell(),
      );
}

class Service {
  final String title, subtitle, icon, price;
  const Service(this.title, this.subtitle, this.icon, this.price);
}

const services = [
  Service('Website Design', 'Business websites, landing pages and product catalogues.', '🌐', 'Custom quote'),
  Service('Android Apps', 'Mobile apps, prototypes and APK build setup.', '📱', 'Custom quote'),
  Service('AI Solutions', 'AI assistants, content tools and smart workflows.', '✦', 'Scope-based'),
  Service('Digital Products', 'Templates, guides and downloadable resources.', '🛍️', 'Coming soon'),
  Service('Digital Consulting', 'Plan your idea, features and launch roadmap.', '🧭', 'Ask for a quote'),
  Service('Maintenance', 'Updates, fixes and ongoing project support.', '🔧', 'Monthly plans'),
];

class HomeShell extends StatefulWidget {
  const HomeShell({super.key});
  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int tab = 0;

  void goTo(int index) => setState(() => tab = index);

  @override
  Widget build(BuildContext context) {
    final pages = [
      DashboardPage(onStart: () => goTo(3), onServices: () => goTo(1)),
      const ServicesPage(),
      const PortfolioPage(),
      const EnquiryPage(),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Row(children: [
          CircleAvatar(backgroundColor: blue, child: Text('N', style: TextStyle(color: ink, fontWeight: FontWeight.w900))),
          SizedBox(width: 10),
          Expanded(child: Text('NETVILLE DIGITAL HUB', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900, letterSpacing: .35))),
        ]),
      ),
      body: IndexedStack(index: tab, children: pages),
      bottomNavigationBar: NavigationBar(
        selectedIndex: tab,
        onDestinationSelected: goTo,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.dashboard_outlined), selectedIcon: Icon(Icons.dashboard), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.grid_view_rounded), label: 'Services'),
          NavigationDestination(icon: Icon(Icons.auto_awesome_mosaic_outlined), label: 'Portfolio'),
          NavigationDestination(icon: Icon(Icons.chat_bubble_outline), label: 'Contact'),
        ],
      ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  final VoidCallback onStart;
  final VoidCallback onServices;
  const DashboardPage({super.key, required this.onStart, required this.onServices});

  @override
  Widget build(BuildContext context) => ListView(
        padding: const EdgeInsets.all(18),
        children: [
          Container(
            padding: const EdgeInsets.all(23),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(26),
              gradient: const LinearGradient(colors: [Color(0xFF153A60), Color(0xFF0B1A2B)], begin: Alignment.topLeft, end: Alignment.bottomRight),
              border: Border.all(color: const Color(0xFF2B5276)),
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('DIGITAL IDEAS. REAL-WORLD IMPACT.', style: TextStyle(color: aqua, fontSize: 10, fontWeight: FontWeight.w900, letterSpacing: 1.2)),
              const SizedBox(height: 16),
              const Text('Build your next\ndigital advantage.', style: TextStyle(fontSize: 34, height: 1.08, fontWeight: FontWeight.w900, letterSpacing: -1)),
              const SizedBox(height: 12),
              const Text('Websites, Android apps, AI solutions and digital products for your next big idea.', style: TextStyle(color: Color(0xFFB4C6DB), height: 1.5)),
              const SizedBox(height: 20),
              Wrap(spacing: 10, runSpacing: 10, children: [
                FilledButton.icon(onPressed: onStart, icon: const Icon(Icons.arrow_forward), label: const Text('Start a project')),
                OutlinedButton(onPressed: onServices, child: const Text('Explore services')),
              ]),
            ]),
          ),
          const SizedBox(height: 26),
          const SectionHeading(eyebrow: 'WHAT WE DO', title: 'Digital services for your goals', subtitle: 'Practical solutions for brands, creators and growing businesses.'),
          const SizedBox(height: 12),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: services.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 11, crossAxisSpacing: 11, childAspectRatio: .91),
            itemBuilder: (context, i) => ServiceCard(service: services[i]),
          ),
          const SizedBox(height: 22),
          const Card(child: Padding(padding: EdgeInsets.all(19), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('HOW IT WORKS', style: TextStyle(color: aqua, fontSize: 11, fontWeight: FontWeight.w900, letterSpacing: 1.2)),
            SizedBox(height: 12),
            ProcessLine(number: '01', title: 'Tell us your idea', detail: 'Explain what you want to build.'),
            ProcessLine(number: '02', title: 'Plan the project', detail: 'Agree on features, budget and timeline.'),
            ProcessLine(number: '03', title: 'Build and improve', detail: 'Review progress and refine the result.'),
          ]))),
          const SizedBox(height: 18),
          const Center(child: Text('Your idea. Our digital craft.', style: TextStyle(color: Colors.white54, fontSize: 12))),
        ],
      );
}

class SectionHeading extends StatelessWidget {
  final String eyebrow, title, subtitle;
  const SectionHeading({super.key, required this.eyebrow, required this.title, required this.subtitle});
  @override
  Widget build(BuildContext context) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(eyebrow, style: const TextStyle(color: aqua, fontSize: 11, fontWeight: FontWeight.w900, letterSpacing: 1.3)),
        const SizedBox(height: 6),
        Text(title, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w900, height: 1.15)),
        const SizedBox(height: 6),
        Text(subtitle, style: const TextStyle(color: Colors.white60, height: 1.45)),
      ]);
}

class ProcessLine extends StatelessWidget {
  final String number, title, detail;
  const ProcessLine({super.key, required this.number, required this.title, required this.detail});
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 14),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(number, style: const TextStyle(color: aqua, fontWeight: FontWeight.w900)),
          const SizedBox(width: 14),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.w800)),
            Text(detail, style: const TextStyle(color: Colors.white60, fontSize: 13)),
          ])),
        ]),
      );
}

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});
  @override
  Widget build(BuildContext context) => ListView(padding: const EdgeInsets.all(17), children: [
        const SectionHeading(eyebrow: 'OUR SERVICES', title: 'What can we build for you?', subtitle: 'Choose a service and contact us to discuss the right scope for your needs.'),
        const SizedBox(height: 18),
        ...services.map((s) => Padding(padding: const EdgeInsets.only(bottom: 12), child: ServiceCard(service: s, wide: true))),
        const SizedBox(height: 10),
        const Text('Prices depend on project scope. Confirm the price and deliverables before work begins.', style: TextStyle(color: Colors.white54, fontSize: 12)),
      ]);
}

class ServiceCard extends StatelessWidget {
  final Service service;
  final bool wide;
  const ServiceCard({super.key, required this.service, this.wide = false});

  @override
  Widget build(BuildContext context) => Card(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: wide
              ? Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(service.icon, style: const TextStyle(fontSize: 28)),
                  const SizedBox(width: 13),
                  Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(service.title, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
                    const SizedBox(height: 5),
                    Text(service.subtitle, style: const TextStyle(color: Colors.white60, fontSize: 13, height: 1.4)),
                    const SizedBox(height: 8),
                    Text(service.price, style: const TextStyle(color: aqua, fontWeight: FontWeight.w800, fontSize: 12)),
                  ])),
                ])
              : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(service.icon, style: const TextStyle(fontSize: 25)),
                  const SizedBox(height: 9),
                  Text(service.title, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 14)),
                  const SizedBox(height: 6),
                  Expanded(child: Text(service.subtitle, style: const TextStyle(color: Colors.white60, fontSize: 11.5, height: 1.35))),
                  const SizedBox(height: 7),
                  Text(service.price, style: const TextStyle(color: aqua, fontWeight: FontWeight.w800, fontSize: 10.5)),
                ]),
        ),
      );
}

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});
  @override
  Widget build(BuildContext context) => ListView(padding: const EdgeInsets.all(18), children: [
        const SectionHeading(eyebrow: 'PORTFOLIO', title: 'Ideas we can help bring to life', subtitle: 'These are example project concepts, not claims of completed client work. Add real screenshots and client projects as your portfolio grows.'),
        const SizedBox(height: 18),
        const PortfolioCard(icon: Icons.storefront_outlined, title: 'Online Store', category: 'WEBSITE', detail: 'A mobile-friendly product catalogue with product details, enquiry links and an admin-ready structure.'),
        const PortfolioCard(icon: Icons.school_outlined, title: 'Student Learning App', category: 'ANDROID APP', detail: 'A learning companion for study materials, practice questions, progress tracking and helpful AI features.'),
        const PortfolioCard(icon: Icons.auto_awesome, title: 'AI Business Assistant', category: 'AI SOLUTION', detail: 'A simple assistant concept for drafting content, answering common questions and organizing routine tasks.'),
        const SizedBox(height: 14),
        const Card(child: Padding(padding: EdgeInsets.all(18), child: Text('Portfolio tip: show real demos, screenshots and the problem each project solves. Never publish customer details without permission.', style: TextStyle(color: Colors.white70, height: 1.45)))),
      ]);
}

class PortfolioCard extends StatelessWidget {
  final IconData icon;
  final String title, category, detail;
  const PortfolioCard({super.key, required this.icon, required this.title, required this.category, required this.detail});
  @override
  Widget build(BuildContext context) => Card(
        margin: const EdgeInsets.only(bottom: 12),
        child: Padding(padding: const EdgeInsets.all(18), child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(width: 52, height: 52, decoration: BoxDecoration(color: const Color(0xFF193754), borderRadius: BorderRadius.circular(16)), child: Icon(icon, color: aqua, size: 27)),
          const SizedBox(width: 14),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(category, style: const TextStyle(color: aqua, fontSize: 10, fontWeight: FontWeight.w900, letterSpacing: 1.2)),
            const SizedBox(height: 4),
            Text(title, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w800)),
            const SizedBox(height: 6),
            Text(detail, style: const TextStyle(color: Colors.white60, height: 1.4, fontSize: 13)),
          ])),
        ])),
      );
}

class EnquiryPage extends StatefulWidget {
  const EnquiryPage({super.key});
  @override
  State<EnquiryPage> createState() => _EnquiryPageState();
}

class _EnquiryPageState extends State<EnquiryPage> {
  final formKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final contact = TextEditingController();
  final details = TextEditingController();
  String service = services.first.title;
  bool busy = false;

  @override
  void dispose() {
    name.dispose();
    contact.dispose();
    details.dispose();
    super.dispose();
  }

  Future<void> sendEnquiry() async {
    if (!formKey.currentState!.validate()) return;
    if (businessWhatsApp == '2340000000000') {
      await showDialog<void>(context: context, builder: (context) => AlertDialog(
        title: const Text('One setup step left'),
        content: const Text('Add your business WhatsApp number in lib/main.dart first. Use your international country code without + or spaces.'),
        actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK'))],
      ));
      return;
    }
    setState(() => busy = true);
    final message = 'Hello Netville Digital Hub!\nName: ${name.text.trim()}\nContact: ${contact.text.trim()}\nService: $service\nProject details: ${details.text.trim()}';
    final uri = Uri.https('wa.me', '/$businessWhatsApp', {'text': message});
    try {
      final launched = await launchUrl(uri, mode: LaunchMode.externalApplication);
      if (!launched && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Could not open WhatsApp. Please check that it is installed.')));
      }
    } catch (_) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Could not open WhatsApp. Please try again.')));
    } finally {
      if (mounted) setState(() => busy = false);
    }
  }

  @override
  Widget build(BuildContext context) => ListView(padding: const EdgeInsets.all(18), children: [
        const SectionHeading(eyebrow: 'CONTACT US', title: 'Let’s build something useful.', subtitle: 'Share your idea and send your project enquiry directly to our WhatsApp.'),
        const Card(child: Padding(padding: EdgeInsets.all(16), child: Row(children: [Icon(Icons.location_on_outlined, color: aqua), SizedBox(width: 10), Expanded(child: Text('Choba / UNIPORT, Rivers State, Nigeria\\nWhatsApp: +234 808 847 6779', style: TextStyle(color: Colors.white70, height: 1.5)))]))),
        const SizedBox(height: 20),
        Card(child: Padding(padding: const EdgeInsets.all(18), child: Form(key: formKey, child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          TextFormField(controller: name, textCapitalization: TextCapitalization.words, decoration: const InputDecoration(labelText: 'Your name', prefixIcon: Icon(Icons.person_outline)), validator: (v) => (v == null || v.trim().isEmpty) ? 'Enter your name' : null),
          const SizedBox(height: 13),
          TextFormField(controller: contact, keyboardType: TextInputType.emailAddress, decoration: const InputDecoration(labelText: 'Phone or email', prefixIcon: Icon(Icons.alternate_email)), validator: (v) => (v == null || v.trim().isEmpty) ? 'Enter a way to contact you' : null),
          const SizedBox(height: 13),
          DropdownButtonFormField<String>(
            value: service,
            decoration: const InputDecoration(labelText: 'Service needed', prefixIcon: Icon(Icons.design_services_outlined)),
            items: services.map((s) => DropdownMenuItem(value: s.title, child: Text(s.title))).toList(),
            onChanged: (v) { if (v != null) setState(() => service = v); },
          ),
          const SizedBox(height: 13),
          TextFormField(controller: details, minLines: 4, maxLines: 7, decoration: const InputDecoration(labelText: 'Project details', alignLabelWithHint: true, hintText: 'What do you want to build? What is your budget?')),
          const SizedBox(height: 18),
          FilledButton.icon(onPressed: busy ? null : sendEnquiry, icon: const Icon(Icons.chat), label: Padding(padding: const EdgeInsets.symmetric(vertical: 12), child: Text(busy ? 'Opening WhatsApp…' : 'Continue on WhatsApp'))),
        ]))),
        const SizedBox(height: 14),
        const Card(child: Padding(padding: EdgeInsets.all(17), child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Icon(Icons.shield_outlined, color: aqua),
          SizedBox(width: 12),
          Expanded(child: Text('Privacy note: this app demo does not upload enquiry details to a server. When configured, the message is handed to WhatsApp so you can review it before sending.', style: TextStyle(color: Colors.white60, height: 1.45, fontSize: 12))),
        ]))),
      ]);
}
