const mongoose = require ("mongoose");
const objectId = mongoose.Types.ObjectId

const barangScheme = new mongoose.Schema({
    namaBarang: {
        type: String
    },
    harga: {
        type: Number
    },
    stok: {
        type: Number
    },
    idKategori: {
        type: objectId
    },
    gambar: {
        type: String
    }
})

module.exports = mongoose.model("barang", barangScheme);