const express = require('express')
const app = express()
const mongoose=require ('mongoose')
const mongoUrl = 'mongodb://localhost:27017/toko'
const cors =require ('cors')
const path =require('path')

mongoose.connect(mongoUrl,{
    useNewUrlParser:true,
    useUnifiedTopology:true,
}).then(()=>{
    console.log('Berhasil Connect ke Database')
}).catch((e)=>{
    consolw.log('Gagal Connect ke Database')
})
app.use(express.json())
app.use(express.urlencoded({extended: true}))
app.use(cors())

const directory = path.join(__dirname,'/static/')
app.use(express.static(directory))

app.use('/user', require('./routes/user'))
app.use('/barang', require('./routes/barang'))
app.use('/transaksi',require('./routes/transaksi'))

app.get('/test',(req,res)=>{
    const nama = 'tri wahyuningsih'
    let prodi =''
    if (nama ==='tri wahyuningsih'){
        prodi = 'sistem informasi'
    
    } else{ 
        prodi ='informatika'
    }

     const mahasiswa ={
        nama : 'tri wahyuningsih',
        npm : 20411051,
        prodi: 'sistem informasi',
        hobi:'nyanyi',
        keluarga :{
            adik:1
        }


     }

    res.json({
        test:'Berhasil',
        nama:nama ,
        prodi:prodi,
        coba:mahasiswa.keluarga.adik,
        biodata:mahasiswa
        
    })

})

app.get('/mahasiswa/:npm',(req,res)=>{
    res.json({
        npm :req.params.npm
    })

})

app.listen(5000,()=>{
    console.log('Berhasil Jalan')
})