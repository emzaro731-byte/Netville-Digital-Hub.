import 'package:flutter/material.dart';

void main() => runApp(const NetvilleApp());

const ink = Color(0xFF07111F);
const panel = Color(0xFF102139);
const blue = Color(0xFF55A7FF);
const aqua = Color(0xFF6CF0E2);

class NetvilleApp extends StatelessWidget {
  const NetvilleApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Netville Digital Hub',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: ink,
      colorScheme: ColorScheme.fromSeed(seedColor: blue, brightness: Brightness.dark),
      useMaterial3: true,
      cardTheme: CardThemeData(color: panel, elevation: 0, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22), side: const BorderSide(color: Color(0xFF233C59)))),
      inputDecorationTheme: InputDecorationTheme(filled: true, fillColor: panel, border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none)),
    ),
    home: const HomeShell(),
  );
}

class Service {
  final String title, subtitle, icon, price;
  const Service(this.title, this.subtitle, this.icon, this.price);
}
const services = [
  Service('Website Design', 'Business sites, landing pages and product catalogues', '🌐', 'Custom quote'),
  Service('Android Apps', 'Mobile app ideas, prototypes and APK builds', '📱', 'Custom quote'),
  Service('AI Solutions', 'AI assistants, content tools and smart workflows', '✦', 'Scope-based'),
  Service('Digital Products', 'Templates, guides and downloadable resources', '🛍️', 'Coming soon'),
  Service('Digital Consulting', 'Plan your idea, features and launch roadmap', '🧭', 'Ask us'),
  Service('Maintenance', 'Updates, improvements and ongoing support', '🔧', 'Monthly plans'),
];

class HomeShell extends StatefulWidget {
  const HomeShell({super.key});
  @override State<HomeShell> createState() => _HomeShellState();
}
class _HomeShellState extends State<HomeShell> {
  int tab = 0;
  @override
  Widget build(BuildContext context) {
    final pages = [const DashboardPage(), const ServicesPage(), const EnquiryPage()];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ink,
        title: const Row(children: [CircleAvatar(backgroundColor: blue, child: Text('N', style: TextStyle(color: ink, fontWeight: FontWeight.w900))), SizedBox(width: 10), Expanded(child: Text('NETVILLE  DIGITAL HUB', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900, letterSpacing: .4)))]),
      ),
      body: IndexedStack(index: tab, children: pages),
      bottomNavigationBar: NavigationBar(
        selectedIndex: tab,
        onDestinationSelected: (v) => setState(() => tab = v),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.dashboard_outlined), selectedIcon: Icon(Icons.dashboard), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.grid_view_rounded), label: 'Services'),
          NavigationDestination(icon: Icon(Icons.chat_bubble_outline), label: 'Enquiry'),
        ],
      ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});
  @override Widget build(BuildContext context) => ListView(padding: const EdgeInsets.all(20), children: [
    Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(26), gradient: const LinearGradient(colors: [Color(0xFF153A60), Color(0xFF0B1A2B)], begin: Alignment.topLeft, end: Alignment.bottomRight), border: Border.all(color: const Color(0xFF2B5276))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('DIGITAL IDEAS. REAL-WORLD IMPACT.', style: TextStyle(color: aqua, fontSize: 11, fontWeight: FontWeight.w900, letterSpacing: 1.2)),
        const SizedBox(height: 16),
        const Text('Build your next\ndigital advantage.', style: TextStyle(fontSize: 34, height: 1.08, fontWeight: FontWeight.w900, letterSpacing: -1)),
        const SizedBox(height: 12),
        const Text('Websites, Android apps, AI solutions and digital products for your next big idea.', style: TextStyle(color: Color(0xFFB4C6DB), height: 1.5)),
        const SizedBox(height: 20),
        FilledButton.icon(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const EnquiryPage())), icon: const Icon(Icons.arrow_forward), label: const Text('Start a project')),
      ]),
    ),
    const SizedBox(height: 28),
    const Text('What we do', style: TextStyle(fontSize: 23, fontWeight: FontWeight.w800)),
    const SizedBox(height: 5),
    const Text('Digital services designed around your goals.', style: TextStyle(color: Colors.white60)),
    const SizedBox(height: 14),
    GridView.builder(shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), itemCount: services.length, gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 12, crossAxisSpacing: 12, childAspectRatio: .92), itemBuilder: (context, i) => ServiceCard(service: services[i])),
    const SizedBox(height: 16),
    const Card(child: Padding(padding: EdgeInsets.all(20), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('How it works', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)), SizedBox(height: 14), ProcessLine(number: '01', title: 'Tell us your idea', detail: 'Explain the problem you want to solve.'), ProcessLine(number: '02', title: 'Agree on the plan', detail: 'Discuss scope, budget and timeline.'), ProcessLine(number: '03', title: 'Build and improve', detail: 'Create the solution and refine it with feedback.')]))),
    const SizedBox(height: 20),
  ]);
}

class ProcessLine extends StatelessWidget {
  final String number, title, detail;
  const ProcessLine({super.key, required this.number, required this.title, required this.detail});
  @override Widget build(BuildContext context) => Padding(padding: const EdgeInsets.only(bottom: 14), child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(number, style: const TextStyle(color: aqua, fontWeight: FontWeight.w900)), const SizedBox(width: 14), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(fontWeight: FontWeight.w700)), Text(detail, style: const TextStyle(color: Colors.white60, fontSize: 13))]))]));
}

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});
  @override Widget build(BuildContext context) => ListView(padding: const EdgeInsets.all(16), children: [
    const Text('Our services', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900)),
    const Padding(padding: EdgeInsets.only(top: 6, bottom: 18), child: Text('Choose what you need. We will help you plan the right first step.', style: TextStyle(color: Colors.white60))),
    ...services.map((s) => Padding(padding: const EdgeInsets.only(bottom: 12), child: ServiceCard(service: s, wide: true))),
    const SizedBox(height: 12),
    const Text('Prices depend on project scope. Ask for a quote before committing.', style: TextStyle(color: Colors.white54, fontSize: 12)),
  ]);
}

class ServiceCard extends StatelessWidget {
  final Service service;
  final bool wide;
  const ServiceCard({super.key, required this.service, this.wide = false});
  @override Widget build(BuildContext context) => Card(child: Padding(padding: const EdgeInsets.all(16), child: wide ? Row(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(service.icon, style: const TextStyle(fontSize: 26)), const SizedBox(width: 14), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(service.title, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16)), const SizedBox(height: 5), Text(service.subtitle, style: const TextStyle(color: Colors.white60, fontSize: 13)), const SizedBox(height: 9), Text(service.price, style: const TextStyle(color: aqua, fontWeight: FontWeight.w800, fontSize: 12))]))]) : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(service.icon, style: const TextStyle(fontSize: 25)), const SizedBox(height: 10), Text(service.title, style: const TextStyle(fontWeight: FontWeight.w800)), const SizedBox(height: 6), Expanded(child: Text(service.subtitle, style: const TextStyle(color: Colors.white60, fontSize: 12))), const SizedBox(height: 8), Text(service.price, style: const TextStyle(color: aqua, fontWeight: FontWeight.w800, fontSize: 11))])));
}

class EnquiryPage extends StatefulWidget {
  const EnquiryPage({super.key});
  @override State<EnquiryPage> createState() => _EnquiryPageState();
}
class _EnquiryPageState extends State<EnquiryPage> {
  final name = TextEditingController();
  final contact = TextEditingController();
  final details = TextEditingController();
  String service = services.first.title;
  @override void dispose() { name.dispose(); contact.dispose(); details.dispose(); super.dispose(); }
  @override Widget build(BuildContext context) => ListView(padding: const EdgeInsets.all(20), children: [
    const Text('Start a project', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900)),
    const SizedBox(height: 6),
    const Text('Tell us what you want to build. This demo form prepares your enquiry; a live submission service still needs to be connected.', style: TextStyle(color: Colors.white60, height: 1.5)),
    const SizedBox(height: 22),
    TextField(controller: name, decoration: const InputDecoration(labelText: 'Your name', prefixIcon: Icon(Icons.person_outline))),
    const SizedBox(height: 14),
    TextField(controller: contact, keyboardType: TextInputType.emailAddress, decoration: const InputDecoration(labelText: 'Phone or email', prefixIcon: Icon(Icons.alternate_email))),
    const SizedBox(height: 14),
    DropdownButtonFormField<String>(value: service, decoration: const InputDecoration(labelText: 'Service needed'), items: services.map((s) => DropdownMenuItem(value: s.title, child: Text(s.title))).toList(), onChanged: (v) { if (v != null) setState(() => service = v); }),
    const SizedBox(height: 14),
    TextField(controller: details, maxLines: 5, decoration: const InputDecoration(labelText: 'Project details', alignLabelWithHint: true, hintText: 'What do you want to build? What is your budget?')),
    const SizedBox(height: 20),
    FilledButton.icon(onPressed: () {
      if (name.text.trim().isEmpty || contact.text.trim().isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please enter your name and contact details.')));
        return;
      }
      showDialog(context: context, builder: (_) => AlertDialog(title: const Text('Enquiry prepared'), content: SelectableText('Name: ${name.text}\nContact: ${contact.text}\nService: $service\nDetails: ${details.text}\n\nThis is saved only in this screen for now. Connect a backend or WhatsApp number to receive enquiries.'), actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('Close'))]));
    }, icon: const Icon(Icons.send_rounded), label: const Padding(padding: EdgeInsets.all(12), child: Text('Prepare enquiry'))),
    const SizedBox(height: 20),
    const Card(child: Padding(padding: EdgeInsets.all(16), child: Text('Business tip: always confirm the deliverables, price and timeline with the customer before starting paid work.', style: TextStyle(color: Colors.white70)))),
  ]);
}
