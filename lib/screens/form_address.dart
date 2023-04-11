import 'package:flutter/material.dart';
import '../database/db_helper.dart';
import '../model/address.dart';


class FormAddress extends StatefulWidget {
  final Address ? address;

  const FormAddress({
    super.key,
    this.address
  });

  @override
  // ignore: library_private_types_in_public_api
  _FormAddressState createState() => _FormAddressState();
}

class _FormAddressState extends State < FormAddress > {
  DbHelper db = DbHelper();

  TextEditingController ? kategori;
  TextEditingController ? negara;
  TextEditingController ? provinsi;
  TextEditingController ? kota;
  TextEditingController ? kecamatan;
  TextEditingController ? kelurahan;
  TextEditingController ? kodepos;
  TextEditingController ? rt;
  TextEditingController ? rw;
  TextEditingController ? namajalan;
  TextEditingController ? notelp;
  TextEditingController ? status;

  final List _dataNegara = ["Indonesia"];
  final List _dataKategori = ["Rumah", "Kos", "Kantor"];
  final List _dataProvince = ["DKI Jakarta",
    "Jawa Barat",
    "Jawa Tengah",
    "Jawa Timur",
    "Daerah Istimewa Yogyakarta"
  ];

  final List _dataKota = ["Bantul",
    "Gunung Kidul",
    "Kulon Progo",
    "Sleman",
    "Yogyakarta Kota"
  ];

  final List _dataKecamatan = ["Kotagede",
    "Mantrijeron",
    "Berbah",
    "Depok",
    "Gamping",
    "Playen",
    "Patuk"
  ];

  final List _dataKelurahan = ["Rejowinangun",
    "Prenggan",
    "Caturtunggal",
    "Maguwoharjo",
    "Condongcatur"
  ];

  final List _dataKodePos = ["55281",
    "55282",
    "55283"
  ];

  late String negaraValue = _dataNegara.first;
  late String kategoriValue = _dataKategori.first;
  late String provinceValue = _dataProvince.first;
  late String kotaValue = _dataKota.first;
  late String kecamatanValue = _dataKecamatan.first;
  late String kelurahanValue = _dataKelurahan.first;
  late String kodeposValue = _dataKodePos.first;


  @override
  void initState() {
    kategori = TextEditingController(
      text: widget.address == null ? '' : widget.address!.kategori);

    negara = TextEditingController(
      text: widget.address == null ? '' : widget.address!.negara);

    provinsi = TextEditingController(
      text: widget.address == null ? '' : widget.address!.provinsi);

    kota = TextEditingController(
      text: widget.address == null ? '' : widget.address!.kota);
    kecamatan = TextEditingController(
      text: widget.address == null ? '' : widget.address!.kecamatan);
    kelurahan = TextEditingController(
      text: widget.address == null ? '' : widget.address!.kelurahan);
    kodepos = TextEditingController(
      text: widget.address == null ? '' : widget.address!.kodepos);
    rt = TextEditingController(
      text: widget.address == null ? '' : widget.address!.rt);
    rw = TextEditingController(
      text: widget.address == null ? '' : widget.address!.rw);
    namajalan = TextEditingController(
      text: widget.address == null ? '' : widget.address!.namajalan);
    notelp = TextEditingController(
      text: widget.address == null ? '' : widget.address!.notelp);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Address'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
          children: [
            const SizedBox(height: 10, ),
              const SizedBox(child: Text("Kategori",
                  style: TextStyle(fontSize: 16),
                ), ),
                const SizedBox(height: 10, ),
                  InputDecorator(decoration: const InputDecoration(border: OutlineInputBorder()),
                    child: DropdownButtonHideUnderline(child: DropdownButton( // hint: const Text("Select Your Friends"),

                      value: kategoriValue,
                      items: _dataKategori.map((value) {
                          return DropdownMenuItem(value: value,
                            child: Text(value),
                          );
                        }

                      ).toList(),
                      onChanged: (value) => setState(() {
                        kategoriValue = value.toString();
                      }),
                    ), ), ),
                  const SizedBox(height: 10, ),
                    const SizedBox(child: Text("Negara",
                        style: TextStyle(fontSize: 16),
                      ), ),
                      const SizedBox(height: 10, ),
                        InputDecorator(decoration: const InputDecoration(border: OutlineInputBorder()),
                          child: DropdownButtonHideUnderline(child: DropdownButton( // hint: const Text("Select Your Friends"),

                            value: negaraValue,
                            items: _dataNegara.map((value) {
                                return DropdownMenuItem(value: value,
                                  child: Text(value),
                                );
                              }

                            ).toList(),
                            onChanged: (value) => setState(() {
                              negaraValue = value.toString();
                            }),
                          ), ), ),
                        const SizedBox(height: 10, ),
                          const SizedBox(child: Text("Provinsi",
                              style: TextStyle(fontSize: 16),
                            ), ),
                            const SizedBox(height: 10, ),
                              InputDecorator(decoration: const InputDecoration(border: OutlineInputBorder()),
                                child: DropdownButtonHideUnderline(child: DropdownButton( // hint: const Text("Select Your Friends"),

                                  value: provinceValue,
                                  items: _dataProvince.map((value) {
                                      return DropdownMenuItem(value: value,
                                        child: Text(value),
                                      );
                                    }

                                  ).toList(),
                                  onChanged: (value) => setState(() {
                                    provinceValue = value.toString();
                                  }),
                                ), ), ),
                              const SizedBox(height: 10, ),
                                const SizedBox(child: Text("Kota",
                                    style: TextStyle(fontSize: 16),
                                  ), ),
                                  const SizedBox(height: 10, ),
                                    InputDecorator(decoration: const InputDecoration(border: OutlineInputBorder()),
                                      child: DropdownButtonHideUnderline(child: DropdownButton( // hint: const Text("Select Your Friends"),

                                        value: kotaValue,
                                        items: _dataKota.map((value) {
                                          return DropdownMenuItem(value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                        onChanged: (value) => setState(() {
                                          kotaValue = value.toString();
                                        }),
                                      ), ), ),
                                    const SizedBox(height: 10, ),
                                      const SizedBox(child: Text("Kecamatan",
                                          style: TextStyle(fontSize: 16),
                                        ), ),
                                        const SizedBox(height: 10, ),
                                          InputDecorator(decoration: const InputDecoration(border: OutlineInputBorder()),
                                            child: DropdownButtonHideUnderline(child: DropdownButton( // hint: const Text("Select Your Friends"),

                                              value: kecamatanValue,
                                              items: _dataKecamatan.map((value) {
                                                return DropdownMenuItem(value: value,
                                                  child: Text(value),
                                                );
                                              }).toList(),
                                              onChanged: (value) => setState(() {
                                                kecamatanValue = value.toString();
                                              }),
                                            ), ), ),
                                          const SizedBox(height: 10, ),
                                            const SizedBox(child: Text("Kelurahan",
                                                style: TextStyle(fontSize: 16),
                                              ), ),
                                              const SizedBox(height: 10, ),
                                                InputDecorator(decoration: const InputDecoration(border: OutlineInputBorder()),
                                                  child: DropdownButtonHideUnderline(child: DropdownButton( // hint: const Text("Select Your Friends"),

                                                    value: kelurahanValue,
                                                    items: _dataKelurahan.map((value) {
                                                      return DropdownMenuItem(value: value,
                                                        child: Text(value),
                                                      );
                                                    }).toList(),
                                                    onChanged: (value) => setState(() {
                                                      kelurahanValue = value.toString();
                                                    }),
                                                  ), ), ),
                                                const SizedBox(height: 10, ),

                                                  Row(children: [Expanded(flex: 2,
                                                      child: TextFormField(controller: rt,
                                                        decoration: const InputDecoration(labelText: 'RT',
                                                          border: OutlineInputBorder(),
                                                        ),
                                                      )),
                                                    const SizedBox(width: 10, ),
                                                      Expanded(flex: 2,
                                                        child: TextFormField(controller: rw,
                                                          decoration: const InputDecoration(labelText: 'RW',
                                                            border: OutlineInputBorder(),
                                                          ),
                                                        )),
                                                      const SizedBox(height: 20, ),
                                                  ], ),
                                                  const SizedBox(height: 10, ),
                                                    const SizedBox(height: 10, ),
                                                      const SizedBox(child: Text("Kode Pos",
                                                          style: TextStyle(fontSize: 16),
                                                        ), ),
                                                        const SizedBox(height: 10, ),
                                                          InputDecorator(decoration: const InputDecoration(border: OutlineInputBorder()),
                                                            child: DropdownButtonHideUnderline(child: DropdownButton( // hint: const Text("Select Your Friends"),

                                                              value: kodeposValue,
                                                              items: _dataKodePos.map((value) {
                                                                return DropdownMenuItem(value: value,
                                                                  child: Text(value),
                                                                );
                                                              }).toList(),
                                                              onChanged: (value) => setState(() {
                                                                kodeposValue = value.toString();
                                                              }),
                                                            ), ), ),
                                                    
                                                          const SizedBox(height: 10, ),
                                                            const SizedBox(child: Text("Nomor Telepon",
                                                                style: TextStyle(fontSize: 16),
                                                              ), ),
                                                              const SizedBox(height: 10, ),
                                                              TextFormField(controller: notelp,
                                                                decoration: const InputDecoration(labelText: 'Nomor Telepon',
                                                                  border: OutlineInputBorder(),
                                                                ),
                                                              ),
                                                          
                                                              Padding(
                                                                padding: const EdgeInsets.only(
                                                                    top: 20
                                                                  ),
                                                                  child: ElevatedButton(
                                                                    child: (widget.address == null) ?
                                                                    const Text(
                                                                      'Add',
                                                                      style: TextStyle(color: Colors.white),
                                                                    ): const Text(
                                                                        'Update',
                                                                        style: TextStyle(color: Colors.white),
                                                                      ),
                                                                      onPressed: () {
                                                                        upsertAddress();
                                                                      },
                                                                  ),
                                                              )
          ],
      ),
    );
  }

  Future < void > upsertAddress() async {
    if (widget.address != null) {
      //update
      await db.updateAddress(Address.fromMap({
        'id': widget.address!.id,
        'kategori': kategoriValue,
        'negara': negaraValue,
        'provinsi': provinceValue,
        'kota': kotaValue,
        'kecamatan': kecamatanValue,
        'kelurahan': kelurahanValue,
        'kodepos': kodeposValue,
        'rt': rt!.text,
        'rw': rw!.text,
        'namajalan': namajalan!.text,
        'notelp': notelp!.text,
      }));
      // ignore: use_build_context_synchronously
      Navigator.pop(context, 'update');
    } else {
      //insert
      await db.saveAddress(Address(
        kategori: kategoriValue,
        negara: negaraValue,
        provinsi: provinceValue,
        kota: kotaValue,
        kecamatan: kecamatanValue,
        kelurahan: kelurahanValue,
        kodepos: kodeposValue,
        rt: rt!.text,
        rw: rw!.text,
        namajalan: namajalan!.text,
        notelp: notelp!.text,
      ));
      // ignore: use_build_context_synchronously
      Navigator.pop(context, 'save');
    }
  }
}