import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mondial_gp_test/app/Modules/annonces/controllers.dart';
import 'package:mondial_gp_test/app/Modules/annonces/models.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final HomeController c;
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    c = Get.put(HomeController());
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color primary = const Color(0xFF2444D6);
    final Color lightBlue = const Color(0xFFE9EEFF);
    final Color cardBg = Colors.white;
    final EdgeInsets pagePad = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 8,
    );

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: _buildIOSStatusBar(),
            ),
            Padding(padding: pagePad, child: _buildHeader(primary)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _buildHero(primary, lightBlue, cardBg),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _buildTabs(primary),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  _buildAnnouncementsList(primary, cardBg),
                  _buildEmptyState("Voyage en cours"),
                  _buildEmptyState("Historique"),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: c.bottomIndex.value,
          onTap: (i) => c.bottomIndex.value = i,
          selectedItemColor: primary,
          unselectedItemColor: const Color(0xFF9AA3B2),
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: "Accueil",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_rounded),
              label: "Message",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_rounded),
              label: "Notification",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded),
              label: "Profil",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(Color primary) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Bonjour",
                style: TextStyle(fontSize: 18, color: Color(0xFF778198)),
              ),
              const SizedBox(height: 2),
              Row(
                children: const [
                  Text(
                    "Christian",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(width: 6),
                  Text("👋", style: TextStyle(fontSize: 22)),
                ],
              ),
            ],
          ),
        ),
        FilledButton.icon(
          onPressed: () {},
          style: FilledButton.styleFrom(
            backgroundColor: primary,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          icon: const Icon(Icons.add, size: 18),
          label: const Text("Créer une\nannonce", textAlign: TextAlign.center),
        ),
      ],
    );
  }

  Widget _buildHero(Color primary, Color lightBlue, Color cardBg) {
    return Row(
      children: [
        Expanded(
          child: _statCardNew(
            title: "Colis en cours de\nvoyage",
            value: Obx(() => Text("${c.travelingParcels.value}")),
            bg: const Color(0xFFE9EEFF),
            accent: const Color(0xFF081A4D),
            imageAsset: "assets/images/valise.png",
          ),
        ),

        const SizedBox(width: 12),
        Expanded(
          child: _statCardNew(
            title: "Colis livrés",
            value: Obx(() => Text("${c.deliveredParcels.value}")),
            bg: const Color(0xFFE9EEFF),
            accent: const Color(0xFF081A4D),
            imageAsset: null,
          ),
        ),
      ],
    );
  }

  Widget _smallStatCard({
    required String title,
    required Widget value,
    required Color bg,
    required IconData icon,
    required Color iconBg,
    required Color primary,
  }) {
    return Container(
      height: 94,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x11000000),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: 34,
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: primary, size: 20),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF778198),
                    ),
                  ),
                ),
                value,
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabs(Color primary) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border(
              bottom: BorderSide(color: Colors.black.withOpacity(0.06)),
            ),
          ),
          child: TabBar(
            controller: tabController,
            indicatorColor: primary,
            labelColor: primary,
            unselectedLabelColor: const Color(0xFF9AA3B2),
            labelStyle: const TextStyle(fontWeight: FontWeight.w700),
            tabs: const [
              Tab(text: "Annonces actives"),
              Tab(text: "Voyage en cours"),
              Tab(text: "Historique"),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAnnouncementsList(Color primary, Color cardBg) {
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      itemCount: c.announcements.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final a = c.announcements[index];
        return _announcementCard(a, primary, cardBg);
      },
    );
  }

  Widget _announcementCard(Announcement a, Color primary, Color cardBg) {
    return Container(
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Color(0x11000000),
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 14, 14, 10),
            child: Row(
              children: [
                Expanded(
                  child: _cityDateColumn(
                    a.fromCity,
                    a.fromDate,
                    a.fromCountryFlag,
                  ),
                ),
                _routePlane(),
                Expanded(
                  child: _cityDateColumn(
                    a.toCity,
                    a.toDate,
                    a.toCountryFlag,
                    alignEnd: true,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _pill(
                  text: "${a.receivedKg} Kg reçus",
                  bg: const Color(0xFFEFFAF0),
                  fg: const Color(0xFF2FA34F),
                  dot: const Color(0xFF2FA34F),
                ),
                _pill(
                  text: "${a.availableKg} Kg disponible",
                  bg: const Color(0xFFFFF3E6),
                  fg: const Color(0xFFEC8A2E),
                  dot: const Color(0xFFEC8A2E),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: _capacityBar(
              received: a.receivedKg,
              available: a.availableKg,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Row(
              children: [
                const Text(
                  "Tarif:",
                  style: TextStyle(color: Color(0xFF778198)),
                ),
                const SizedBox(width: 6),
                Text(
                  a.pricePerKg,
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Row(
              children: [
                Expanded(
                  child: _miniStat(
                    value: a.senders.toString(),
                    title: "Envoyeurs",
                    labelFirst: true,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _miniStat(
                    value: a.requests.toString(),
                    title: "Demandeurs",
                    labelFirst: true,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {},
                style: FilledButton.styleFrom(
                  backgroundColor: primary,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22),
                  ),
                ),
                child: const Text("Plus de détails"),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFFF7F8FC),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(18)),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.access_time_rounded,
                  size: 18,
                  color: Colors.grey.shade600,
                ),
                const SizedBox(width: 6),
                Text(
                  "Expire dans : ${a.expiresIn}",
                  style: const TextStyle(
                    color: Color.fromARGB(255, 25, 167, 120),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _cityDateColumn(
    String city,
    String date,
    String flag, {
    bool alignEnd = false, // conservé mais non utilisé ici
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(flag, style: const TextStyle(fontSize: 16)),
        const SizedBox(height: 6),
        Text(
          city,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 2),
        Text(
          date,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12, color: Color(0xFF9AA3B2)),
        ),
      ],
    );
  }

  Widget _routePlane() {
    return SizedBox(
      width: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: _dash()),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 6),
            child: Icon(
              Icons.flight_rounded,
              size: 18,
              color: Color(0xFF2444D6),
            ),
          ),
          Expanded(child: _dash()),
        ],
      ),
    );
  }

  Widget _dash() => Container(height: 1, color: const Color(0xFFE1E5EE));

  Widget _pill({
    required String text,
    required Color bg,
    required Color fg,
    required Color dot,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(color: dot, shape: BoxShape.circle),
          ),
          const SizedBox(width: 6),
          Text(
            text,
            style: TextStyle(
              color: fg,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _capacityBar({required int received, required int available}) {
    final int total = received + available;
    if (total <= 0) {
      return Container(
        height: 8,
        decoration: BoxDecoration(
          color: const Color(0xFFF0F2F6),
          borderRadius: BorderRadius.circular(8),
        ),
      );
    }
    final int greenFlex = (received * 1000 ~/ total).clamp(0, 1000);
    final int orangeFlex = 1000 - greenFlex;

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: SizedBox(
        height: 8,
        child: Row(
          children: [
            if (greenFlex > 0)
              Expanded(
                flex: greenFlex,
                child: Container(color: const Color(0xFF2FA34F)),
              ),
            if (orangeFlex > 0)
              Expanded(
                flex: orangeFlex,
                child: Container(color: const Color(0xFFEC8A2E)),
              ),
          ],
        ),
      ),
    );
  }

  Widget _miniStat({
    required String title,
    required String value,
    bool labelFirst = false,
  }) {
    final titleText = Text(
      title,
      style: const TextStyle(fontSize: 12, color: Color(0xFF778198)),
      textAlign: TextAlign.center,
    );
    final valueText = Text(
      value,
      style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
      textAlign: TextAlign.center,
    );

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8FC),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children:
              labelFirst
                  ? [titleText, const SizedBox(height: 4), valueText]
                  : [valueText, const SizedBox(height: 4), titleText],
        ),
      ),
    );
  }

  Widget _buildEmptyState(String title) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.inbox_rounded, size: 64, color: Color(0xFFCFD6E5)),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(fontSize: 16, color: Color(0xFF9AA3B2)),
          ),
        ],
      ),
    );
  }

  Widget _statCardNew({
    required String title,
    required Widget value,
    required Color bg,
    required Color accent,
    String? imageAsset,
  }) {
    return SizedBox(
      height: 112,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              color: bg,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF1A1D29),
                  ),
                ),
                const Spacer(),
                DefaultTextStyle.merge(
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF1A1D29),
                  ),
                  child: value,
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: 92,
              height: 92,
              decoration: BoxDecoration(
                color: accent,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(92),
                  bottomRight: Radius.circular(20),
                ),
              ),
            ),
          ),
          if (imageAsset != null)
            Positioned(
              right: -20,
              bottom: 0,
              child: Image.asset(imageAsset, width: 86, fit: BoxFit.contain),
            ),
        ],
      ),
    );
  }

  Widget _buildIOSStatusBar({
    Color fg = const Color(0xFF1A1D29),
    int battery = 76,
  }) {
    final t = TimeOfDay.now();
    final String timeText =
        "${t.hour.toString().padLeft(2, '0')}:${t.minute.toString().padLeft(2, '0')}";

    return SizedBox(
      height: 22,
      child: Row(
        children: [
          Text(
            timeText,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: fg,
            ),
          ),
          const Spacer(),
          _iosCellularBars(fg),
          const SizedBox(width: 8),
          Icon(Icons.wifi_rounded, size: 18, color: fg),
          const SizedBox(width: 8),
          _iosBattery(percent: battery, fg: fg),
        ],
      ),
    );
  }

  Widget _iosCellularBars(Color fg) {
    const int bars = 4;
    return Row(
      children: List.generate(bars, (i) {
        final double h = 6 + i * 3.0;
        return Container(
          width: 3,
          height: h,
          margin: EdgeInsets.only(left: i == 0 ? 0 : 2),
          decoration: BoxDecoration(
            color: fg,
            borderRadius: BorderRadius.circular(1.5),
          ),
        );
      }),
    );
  }

  Widget _iosBattery({required int percent, required Color fg}) {
    final double w = 24;
    final double h = 12;
    final double inset = 1.2;
    final double fill = (percent.clamp(0, 100)) / 100.0;

    return Row(
      children: [
        Stack(
          children: [
            Container(
              width: w,
              height: h,
              decoration: BoxDecoration(
                border: Border.all(color: fg, width: 1.2),
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            Positioned(
              left: inset,
              top: inset,
              child: Container(
                width: (w - inset * 2) * fill,
                height: h - inset * 2,
                decoration: BoxDecoration(
                  color: percent <= 20 ? const Color(0xFFE53935) : fg,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          ],
        ),
        Container(
          width: 2.5,
          height: h - 6,
          margin: const EdgeInsets.only(left: 1.5),
          decoration: BoxDecoration(
            color: fg,
            borderRadius: BorderRadius.circular(1),
          ),
        ),
      ],
    );
  }
}
