require('dotenv').config()
const mongoose = require('mongoose')

DB_URI = process.env.DB_URI;

if(!DB_URI){
    throw new Error('Database is not defined in my environment variables')
}
mongoose.connect(DB_URI)
.then(()=>{
    console.log(`Connected to Database`)
}).catch((err)=>{
    throw new Error(err)
})


module.exports = mongoose