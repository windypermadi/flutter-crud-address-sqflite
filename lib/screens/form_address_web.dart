import 'package:flutter/material.dart';
import '../database/db_helper.dart';
import '../model/address.dart';


class FormAddressWeb extends StatefulWidget {
  final Address ? address;

  const FormAddressWeb({
    super.key,
    this.address
  });

  @override
  // ignore: library_private_types_in_public_api
  _FormAddressWebState createState() => _FormAddressWebState();
}

class _FormAddressWebState extends State < FormAddressWeb > {
  bool isChecked = false;

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
  TextEditingController ? search;

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
    status = TextEditingController(
      text: widget.address == null ? '' : widget.address!.status);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Address'),
      ),
      body:
      ListView(
        children: 
          [SizedBox(
            height: 510,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 900,
                              height: 60,
                              child: TextFormField(
                                controller: search,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.search),
                                  labelText: 'Search',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            const SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                height: 60,
                                child: OutlinedButton(onPressed: () {},
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: const [
                                      Text("Filter"),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Icon(
                                        Icons.filter_list_alt,
                                        size: 24.0,
                                      )
                                    ],
                                  )
                                ),
                              ),
                              const SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                  height: 60,
                                  child: ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.add), label: const Text("Tambah Alamat")))
                          ],
                        ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: Row(
                            children: const [
                              SizedBox(
                                width: 100,
                                height: 60,
                                child: Text("Nama Jalan",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 100,
                                height: 60,
                                child: Text("Kecamatan",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 100,
                                height: 60,
                                child: Text("Kelurahan",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 100,
                                height: 60,
                                child: Text("Kota",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 100,
                                height: 60,
                                child: Text("Provinsi",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 100,
                                height: 60,
                                child: Text("Negara",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 100,
                                height: 60,
                                child: Text("Kategori",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 100,
                                height: 60,
                                child: Text("Status",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 100,
                                height: 60,
                                child: Text("Detail",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 350,
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 10, ),
                                        const SizedBox(
                                            width: 200,
                                            child: Text("Kategori",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontSize: 16),
                                            ), ),
                                          const SizedBox(height: 10, ),
                                            SizedBox(
                                              width: 200,
                                              height: 60,
                                              child: InputDecorator(decoration: const InputDecoration(border: OutlineInputBorder()),
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
                                            ),
                                            const SizedBox(height: 10, ),
                                              const SizedBox(
                                                  width: 200,
                                                  child: Text("Negara",
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                      fontSize: 16),
                                                  ), ),
                                                const SizedBox(height: 10, ),
                                                  SizedBox(
                                                    width: 200,
                                                    height: 60,
                                                    child: InputDecorator(decoration: const InputDecoration(border: OutlineInputBorder()),
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
                                                  ),
                                                  SizedBox(
                                                    width: 200,
                                                    child: CheckboxListTile(
                                                      checkColor: Colors.white,
                                                      value: isChecked,
                                                      onChanged: (bool ? value) {
                                                        setState(() {
                                                          isChecked = value!;
                                                        });
                                                      },
                                                      title: const Text("Active"),
                                                      controlAffinity: ListTileControlAffinity.leading,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                      height: 20,
                                                    ),
                                                    SizedBox(
                                                      width: 200,
                                                      height: 50,
                                                      child: OutlinedButton(onPressed: () {
                                                        Navigator.pop(context);
                                                      }, child: const Text("Cancel"))),
                                    ],
                                  ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 10, ),
                                        const SizedBox(
                                            width: 300,
                                            child: Text("Provinsi",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontSize: 16),
                                            ), ),
                                          const SizedBox(height: 10, ),
                                            SizedBox(
                                              width: 300,
                                              height: 60,
                                              child: InputDecorator(decoration: const InputDecoration(border: OutlineInputBorder()),
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
                                            ),
                                            const SizedBox(height: 10, ),
                                              const SizedBox(
                                                  width: 300,
                                                  child: Text("Kota",
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                      fontSize: 16),
                                                  ), ),
                                                const SizedBox(height: 10, ),
                                                  SizedBox(
                                                    width: 300,
                                                    height: 60,
                                                    child: InputDecorator(decoration: const InputDecoration(border: OutlineInputBorder()),
                                                      child: DropdownButtonHideUnderline(child: DropdownButton( // hint: const Text("Select Your Friends"),
                                                        value: kotaValue,
                                                        items: _dataKota.map((value) {
                                                            return DropdownMenuItem(value: value,
                                                              child: Text(value),
                                                            );
                                                          }
                
                                                        ).toList(),
                                                        onChanged: (value) => setState(() {
                                                          kotaValue = value.toString();
                                                        }),
                                                      ), ), ),
                                                  ),
                                    ],
                                  ),
                
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 10, ),
                                        const SizedBox(
                                            width: 200,
                                            child: Text("Kecamatan",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontSize: 16),
                                            ), ),
                                          const SizedBox(height: 10, ),
                                            SizedBox(
                                              width: 200,
                                              height: 60,
                                              child: InputDecorator(decoration: const InputDecoration(border: OutlineInputBorder()),
                                                child: DropdownButtonHideUnderline(child: DropdownButton( // hint: const Text("Select Your Friends"),
                                                  value: kecamatanValue,
                                                  items: _dataKecamatan.map((value) {
                                                      return DropdownMenuItem(value: value,
                                                        child: Text(value),
                                                      );
                                                    }
                
                                                  ).toList(),
                                                  onChanged: (value) => setState(() {
                                                    kecamatanValue = value.toString();
                                                  }),
                                                ), ), ),
                                            ),
                                            const SizedBox(height: 10, ),
                                              const SizedBox(
                                                  width: 200,
                                                  child: Text("Kelurahan",
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                      fontSize: 16),
                                                  ), ),
                                                const SizedBox(height: 10, ),
                                                  SizedBox(
                                                    width: 200,
                                                    height: 60,
                                                    child: InputDecorator(decoration: const InputDecoration(border: OutlineInputBorder()),
                                                      child: DropdownButtonHideUnderline(child: DropdownButton( // hint: const Text("Select Your Friends"),
                                                        value: kelurahanValue,
                                                        items: _dataKelurahan.map((value) {
                                                            return DropdownMenuItem(value: value,
                                                              child: Text(value),
                                                            );
                                                          }
                
                                                        ).toList(),
                                                        onChanged: (value) => setState(() {
                                                          kelurahanValue = value.toString();
                                                        }),
                                                      ), ), ),
                                                  ),
                                    ],
                                  ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 10, ),
                                        const SizedBox(
                                            width: 200,
                                            child: Text("Kode Pos",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontSize: 16),
                                            ), ),
                                          const SizedBox(height: 10, ),
                                            SizedBox(
                                              width: 200,
                                              height: 60,
                                              child: InputDecorator(decoration: const InputDecoration(border: OutlineInputBorder()),
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
                                            ),
                                            const SizedBox(
                                                width: 200,
                                                height: 10, ),
                                              const SizedBox(
                                                  width: 200,
                                                  height: 20,
                                                  child: Text("Nama Jalan",
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(fontSize: 16),
                                                  ), ),
                                                const SizedBox(height: 10, ),
                                                  SizedBox(
                                                    width: 200,
                                                    height: 60,
                                                    child: TextFormField(controller: namajalan,
                                                      decoration: const InputDecoration(
                                                        labelText: 'Nama Jalan',
                                                        border: OutlineInputBorder(),
                                                      ),
                                                    ),
                                                  ),
                                    ],
                                  ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 10, ),
                                        Row(
                                          children: const [
                                            SizedBox(
                                              width: 100,
                                              height: 20,
                                              child: Text("RT",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(fontSize: 16),
                                              ), ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            SizedBox(
                                              width: 100,
                                              height: 20,
                                              child: Text("RW",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(fontSize: 16),
                                              ), ),
                                          ],
                                        ),
                                        const SizedBox(height: 10, ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 100,
                                                height: 60,
                                                child: TextFormField(controller: rt,
                                                  decoration: const InputDecoration(
                                                    labelText: 'RT',
                                                    border: OutlineInputBorder(),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                  width: 20,
                                                ),
                                                SizedBox(
                                                  width: 100,
                                                  height: 60,
                                                  child: TextFormField(controller: rw,
                                                    decoration: const InputDecoration(
                                                      labelText: 'RW',
                                                      border: OutlineInputBorder(),
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                          const SizedBox(height: 10, ),
                                            const SizedBox(
                                                width: 200,
                                                child: Text("Nomor Telepon",
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    fontSize: 16),
                                                ), ),
                                              const SizedBox(height: 10, ),
                                                SizedBox(
                                                  width: 200,
                                                  height: 60,
                                                  child: TextFormField(controller: notelp,
                                                    decoration: const InputDecoration(
                                                      labelText: 'Nomor Telepon',
                                                      border: OutlineInputBorder(),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                    height: 50,
                                                  ),
                                                  SizedBox(
                                                    width: 200,
                                                    height: 50,
                                                    child: ElevatedButton(onPressed: () {
                                                      upsertAddress();
                                                    }, child: const Text("Save")))
                
                                    ],
                                  ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      )
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
        'jalan': namajalan!.text,
        'notelp': notelp!.text,
        'status': isChecked.toString()
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
        status: isChecked.toString()
      ));
      // ignore: use_build_context_synchronously
      Navigator.pop(context, 'save');
    }
  }
}