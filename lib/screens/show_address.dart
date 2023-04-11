    import 'package:flutter/material.dart';
import 'package:flutter_testnew/screens/form_address_web.dart';

import '../database/db_helper.dart';
import '../model/address.dart';

    class ListaddressPage extends StatefulWidget {
      const ListaddressPage({
        Key ? key
      }): super(key: key);
      @override
      // ignore: library_private_types_in_public_api
      _ListaddressPageState createState() => _ListaddressPageState();
    }

    class _ListaddressPageState extends State < ListaddressPage > {
      List < Address > listaddress = [];
      DbHelper db = DbHelper();

      @override
      void initState() {
        //menjalankan fungsi getalladdress saat pertama kali dimuat
        _getAlladdress();
        super.initState();
      }

      @override
      Widget build(BuildContext context) {
        return Scaffold(

          appBar: AppBar(
            title: const Center(
              child: Text("Address Testing"),
            ),
          ),
          body:
          ListView.builder(
            itemCount: listaddress.length,
            itemBuilder: (context, index) {
              Address address = listaddress[index];
              return SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: 
                    [Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Card(
                        elevation: 2.0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                                SizedBox(
                                      width: 120,
                                      child: Text("${address.namajalan}",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                SizedBox(
                                      width: 100,
                                      child: Text("${address.kecamatan}",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                     SizedBox(
                                      width: 120,
                                      child: Text("${address.kelurahan}",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                     SizedBox(
                                      width: 100,
                                      child: Text("${address.kota}",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                     SizedBox(
                                      width: 100,
                                      child: Text("${address.provinsi}",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                     SizedBox(
                                      width: 100,
                                      child: Text("${address.negara}",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                     SizedBox(
                                      width: 100,
                                      child: Text("${address.kategori}",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                     SizedBox(
                                      width: 100,
                                      child: Text("${(address.status=="true")?"Active":"Non Active"}",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          _openFormEdit(address);
                                        },
                                        icon: const Icon(Icons.edit)
                                      ),
                                             IconButton(
                                        icon: const Icon(Icons.delete),
                                          onPressed: () {
                                            //membuat dialog konfirmasi hapus
                                            AlertDialog hapus = AlertDialog(
                                              title: const Text("Information"),
                                                content: SizedBox(
                                                  height: 100,
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        "Yakin ingin Menghapus Data ${address.kota}"
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                //terdapat 2 button.
                                                //jika ya maka jalankan _deleteaddress() dan tutup dialog
                                                //jika tidak maka tutup dialog
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      _deleteaddress(address, index);
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text("Ya")
                                                  ),
                                                  TextButton(
                                                    child: const Text('Tidak'),
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                  ),
                                                ],
                                            );
                                            showDialog(context: context, builder: (context) => hapus);
                                          },
                                      )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );

              // return Padding(
              //   padding: const EdgeInsets.only(
              //       top: 20
              //     ),
              //     child: ListTile(
              //       title: Text(
              //         '${address.kategori}'
              //       ),
              //       subtitle: Column(
              //         mainAxisAlignment: MainAxisAlignment.start,
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Padding(
              //             padding: const EdgeInsets.only(
              //                 top: 8,
              //               ),
              //               child: Text("Provinsi: ${address.provinsi}"),
              //           ),
              //           Padding(
              //             padding: const EdgeInsets.only(
              //                 top: 8,
              //               ),
              //               child: Text("Kota: ${address.kota}"),
              //           ),
              //           Padding(
              //             padding: const EdgeInsets.only(
              //                 top: 8,
              //               ),
              //               child: Text("Kecamatan: ${address.kecamatan}"),
              //           )
              //         ],
              //       ),
              //       trailing:
              //       FittedBox(
              //         fit: BoxFit.fill,
              //         child: Row(
              //           children: [
              //             // button edit 
              //             IconButton(
              //               onPressed: () {
              //                 _openFormEdit(address);
              //               },
              //               icon: const Icon(Icons.edit)
              //             ),
              //             // button hapus
                          // IconButton(
                          //   icon: const Icon(Icons.delete),
                          //     onPressed: () {
                          //       //membuat dialog konfirmasi hapus
                          //       AlertDialog hapus = AlertDialog(
                          //         title: const Text("Information"),
                          //           content: SizedBox(
                          //             height: 100,
                          //             child: Column(
                          //               children: [
                          //                 Text(
                          //                   "Yakin ingin Menghapus Data ${address.kota}"
                          //                 )
                          //               ],
                          //             ),
                          //           ),
                          //           //terdapat 2 button.
                          //           //jika ya maka jalankan _deleteaddress() dan tutup dialog
                          //           //jika tidak maka tutup dialog
                          //           actions: [
                          //             TextButton(
                          //               onPressed: () {
                          //                 _deleteaddress(address, index);
                          //                 Navigator.pop(context);
                          //               },
                          //               child: const Text("Ya")
                          //             ),
                          //             TextButton(
                          //               child: const Text('Tidak'),
                          //                 onPressed: () {
                          //                   Navigator.pop(context);
                          //                 },
                          //             ),
                          //           ],
                          //       );
                          //       showDialog(context: context, builder: (context) => hapus);
                          //     },
                          // )
              //           ],
              //         ),
              //       ),
              //     ),
              // );
            }),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
              onPressed: () {
                _openFormCreate();
              },
          ),

          // ListView(
          //   scrollDirection: Axis.horizontal,
          //   children: [
          //     Column(
          //       children: [
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.start,
          //           children: const [
          //             Padding(
          //               padding: EdgeInsets.all(8.0),
          //               child: SizedBox(
          //                     width: 100,
          //                     height: 60,
          //                     child: Text("Nama Jalan",
          //                       style: TextStyle(
          //                         fontWeight: FontWeight.bold,
          //                         fontSize: 16,
          //                       ),
          //                     ),
          //                   ),
          //             ),
          //             SizedBox(
          //                   width: 100,
          //                   height: 60,
          //                   child: Text("Kecamatan",
          //                     style: TextStyle(
          //                       fontWeight: FontWeight.bold,
          //                       fontSize: 16,
          //                     ),
          //                   ),
          //                 ),
          //             SizedBox(
          //                   width: 100,
          //                   height: 60,
          //                   child: Text("Kelurahan",
          //                     style: TextStyle(
          //                       fontWeight: FontWeight.bold,
          //                       fontSize: 16,
          //                     ),
          //                   ),
          //                 ),
          //                 SizedBox(
          //                   width: 100,
          //                   height: 60,
          //                   child: Text("Kota",
          //                     style: TextStyle(
          //                       fontWeight: FontWeight.bold,
          //                       fontSize: 16,
          //                     ),
          //                   ),
          //                 ),
          //                 SizedBox(
          //                   width: 100,
          //                   height: 60,
          //                   child: Text("Provinsi",
          //                     style: TextStyle(
          //                       fontWeight: FontWeight.bold,
          //                       fontSize: 16,
          //                     ),
          //                   ),
          //                 ),
          //                 SizedBox(
          //                   width: 100,
          //                   height: 60,
          //                   child: Text("Negara",
          //                     style: TextStyle(
          //                       fontWeight: FontWeight.bold,
          //                       fontSize: 16,
          //                     ),
          //                   ),
          //                 ),
          //                 SizedBox(
          //                   width: 100,
          //                   height: 60,
          //                   child: Text("Kategori",
          //                     style: TextStyle(
          //                       fontWeight: FontWeight.bold,
          //                       fontSize: 16,
          //                     ),
          //                   ),
          //                 ),
          //                 SizedBox(
          //                   width: 100,
          //                   height: 60,
          //                   child: Text("Status",
          //                     style: TextStyle(
          //                       fontWeight: FontWeight.bold,
          //                       fontSize: 16,
          //                     ),
          //                   ),
          //                 ),
          //                 SizedBox(
          //                   width: 100,
          //                   height: 60,
          //                   child: Text("Detail",
          //                     style: TextStyle(
          //                       fontWeight: FontWeight.bold,
          //                       fontSize: 16,
          //                     ),
          //                   ),
          //                 ),
          //           ],
          //         ),
          //       ],
          //     ),
          //   ],
          // )
        );
      }
      //mengambil semua data address
      Future < void > _getAlladdress() async {
        //list menampung data dari database
        var list = await db.getAllAddress();
        //ada perubahanan state
        setState(() {
          //hapus data pada listaddress
          listaddress.clear();
          //lakukan perulangan pada variabel list
          for (var address in list!) {
            //masukan data ke listaddress
            listaddress.add(Address.fromMap(address));
          }
        });
      }

      //menghapus data address
      Future < void > _deleteaddress(Address address, int position) async {
        await db.deleteAddress(address.id!);
        setState(() {
          listaddress.removeAt(position);
        });
      }

      // membuka halaman tambah address
      Future < void > _openFormCreate() async {
        var result = await Navigator.push(
          context, MaterialPageRoute(builder: (context) =>
            const FormAddressWeb()));
        if (result == 'save') {
          await _getAlladdress();
        }
      }

      //membuka halaman edit address
      Future < void > _openFormEdit(Address address) async {
        var result = await Navigator.push(context,
          MaterialPageRoute(builder: (context) => FormAddressWeb(address: address)));
        if (result == 'update') {
          await _getAlladdress();
        }
      }
    }