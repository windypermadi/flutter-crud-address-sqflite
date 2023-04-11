class Address{
    int? id;
    String? kategori;
    String? negara;
    String? provinsi;
    String? kota;
    String? kecamatan;
    String? kelurahan;
    String? kodepos;
    String? rt;
    String? rw;
    String? namajalan;
    String? notelp;
    String? status;
    
    Address({this.id, this.kategori, this.negara, this.provinsi, this.kota, this.kecamatan, this.kelurahan, this.kodepos, this.rt, this.rw, this.namajalan, this.notelp, this.status});
    
    Map<String, dynamic> toMap() {
        var map = <String, dynamic>{};
    
        if (id != null) {
          map['id'] = id;
        }
        map['kategori'] = kategori;
        map['negara'] = negara;
        map['provinsi'] = provinsi;
        map['kota'] = kota;
        map['kecamatan'] = kecamatan;
        map['kelurahan'] = kelurahan;
        map['kodepos'] = kodepos;
        map['rt'] = rt;
        map['rw'] = rw;
        map['jalan'] = namajalan;
        map['notelp'] = notelp;
        map['status'] = status;
        
        return map;
    }
    
    Address.fromMap(Map<String, dynamic> map) {
        id = map['id'];
        kategori = map['kategori'];
        negara = map['negara'];
        provinsi = map['provinsi'];
        kota = map['kota'];
        kecamatan = map['kecamatan'];
        kelurahan = map['kelurahan'];
        kodepos = map['kodepos'];
        rt = map['rt'];
        rw = map['rw'];
        namajalan = map['jalan'];
        notelp = map['notelp'];
        status = map['status'];
    }
}