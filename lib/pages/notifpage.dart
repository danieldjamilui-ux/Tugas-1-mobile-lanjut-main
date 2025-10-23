import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> notifications = [
      {
        "title": "Promo Spesial!",
        "message": "Diskon 50% untuk semua produk laptop hari ini",
        "time": "2 menit yang lalu",
        "icon": Icons.local_offer,
        "color": Colors.orange,
      },
      {
        "title": "Pesanan Dikirim",
        "message": "Pesanan #12345 sedang dalam perjalanan",
        "time": "1 jam yang lalu",
        "icon": Icons.local_shipping,
        "color": Colors.blue,
      },
      {
        "title": "Pembayaran Berhasil",
        "message": "Pembayaran untuk pesanan #12344 telah dikonfirmasi",
        "time": "3 jam yang lalu",
        "icon": Icons.check_circle,
        "color": Colors.green,
      },
      {
        "title": "Produk Favorit Tersedia",
        "message": "Mouse Gaming yang Anda favoritkan sudah tersedia kembali",
        "time": "5 jam yang lalu",
        "icon": Icons.favorite,
        "color": Colors.red,
      },
      {
        "title": "Flash Sale Dimulai!",
        "message": "Flash sale dimulai dalam 1 jam. Jangan sampai ketinggalan!",
        "time": "1 hari yang lalu",
        "icon": Icons.flash_on,
        "color": Colors.amber,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Notifikasi",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 67, 1, 83),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Semua notifikasi telah ditandai sebagai dibaca"),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            child: const Text(
              "Tandai Semua",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: notifications.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.notifications_off_outlined,
                    size: 100,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Tidak Ada Notifikasi",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notif = notifications[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    leading: CircleAvatar(
                      backgroundColor: (notif["color"] as Color).withOpacity(0.2),
                      child: Icon(
                        notif["icon"] as IconData,
                        color: notif["color"] as Color,
                      ),
                    ),
                    title: Text(
                      notif["title"],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        Text(
                          notif["message"],
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          notif["time"],
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.more_vert),
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => Container(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  leading: const Icon(Icons.check),
                                  title: const Text("Tandai sebagai dibaca"),
                                  onTap: () {
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("Ditandai sebagai dibaca"),
                                      ),
                                    );
                                  },
                                ),
                                ListTile(
                                  leading: const Icon(Icons.delete, color: Colors.red),
                                  title: const Text(
                                    "Hapus notifikasi",
                                    style: TextStyle(color: Colors.red),
                                  ),
                                  onTap: () {
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("Notifikasi dihapus"),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}