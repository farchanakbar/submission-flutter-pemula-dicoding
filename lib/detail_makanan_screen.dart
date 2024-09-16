import 'package:dicoding_pemula/data/makanan.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailMakananScreen extends StatefulWidget {
  final Makanan makanan;
  const DetailMakananScreen({required this.makanan, super.key});

  @override
  State<DetailMakananScreen> createState() => _DetailMakananScreenState();
}

class _DetailMakananScreenState extends State<DetailMakananScreen> {
  late Makanan data;
  int jumlah = 1;
  String convertHarga(int harga) {
    return NumberFormat("#,###", "id_ID").format(harga);
  }

  void increment() {
    setState(() {
      jumlah++;
    });
  }

  void decrement() {
    setState(() {
      if (jumlah <= 1) {
        jumlah = 1;
      } else {
        jumlah--;
      }
    });
  }

  @override
  void initState() {
    data = widget.makanan;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Handphone
            if (constraints.maxWidth < 600) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Row(
                        children: [
                          Icon(Icons.arrow_back_ios),
                          Text('Kembali'),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 300,
                              child: Image.asset(
                                data.img,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: Text(
                                data.title,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        decrement();
                                      },
                                      child: Container(
                                        margin:
                                            const EdgeInsets.only(right: 10),
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: Colors.white,
                                        ),
                                        child: const Icon(Icons.remove),
                                      ),
                                    ),
                                    Text(
                                      '$jumlah',
                                      style: const TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        increment();
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.only(left: 10),
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: Colors.black,
                                        ),
                                        child: const Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.timer),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(data.waktu)
                                  ],
                                ),
                                Container(
                                  height: 15,
                                  width: 1,
                                  color: Colors.black,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(data.rating.toString()),
                                  ],
                                ),
                                Container(
                                  height: 15,
                                  width: 1,
                                  color: Colors.black,
                                ),
                                Text(data.kalori)
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            const Text('Total Harga'),
                            Text('Rp ${convertHarga(data.harga * jumlah)}')
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                duration: const Duration(
                                  seconds: 1,
                                ),
                                content: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text('Pesanan Berhasil!'),
                                    Text(data.title),
                                    Text('$jumlah Porsi'),
                                    Text(
                                      'Rp${convertHarga(data.harga * jumlah)}',
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 18),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.green,
                            ),
                            child: const Text('Pesan Sekarang'),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );

              // Tablet dan Laptop
            } else {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Foto Makanan
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Row(
                              children: [
                                Icon(Icons.arrow_back_ios),
                                Text('Kembali'),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 300,
                            child: Image.asset(
                              data.img,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Deskripsi
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Center(
                          child: Text(
                            data.title,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.timer),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(data.waktu)
                                  ],
                                ),
                                Container(
                                  height: 15,
                                  width: 1,
                                  color: Colors.black,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(data.rating.toString()),
                                  ],
                                ),
                                Container(
                                  height: 15,
                                  width: 1,
                                  color: Colors.black,
                                ),
                                Text(data.kalori)
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    decrement();
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: Colors.white,
                                    ),
                                    child: const Icon(Icons.remove),
                                  ),
                                ),
                                Text(
                                  '$jumlah',
                                  style: const TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    increment();
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: Colors.black,
                                    ),
                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                const Text('Total Harga'),
                                Text('Rp ${convertHarga(data.harga * jumlah)}')
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    duration: const Duration(
                                      seconds: 1,
                                    ),
                                    content: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Text('Pesanan Berhasil!'),
                                        Text(data.title),
                                        Text('$jumlah Porsi'),
                                        Text(
                                          'Rp${convertHarga(data.harga * jumlah)}',
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 18),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.green,
                                ),
                                child: const Text('Pesan Sekarang'),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
