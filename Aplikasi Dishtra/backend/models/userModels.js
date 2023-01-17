const mongoose = require('mongoose')

const userModel = mongoose.Schema({
    userName: {
        type: String
    },
    namaLengkap: {
        type: String 
    },
    email: {
        type: String
    },
    alamat: {
        type: String
    },
    password: {
        type: String
    },
    role: {
        type: String
    }
})

module.exports = mongoose.model('users', userModel)
