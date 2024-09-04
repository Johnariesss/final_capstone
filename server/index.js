const express = require('express')
const cors = require('cors')
require('dotenv').config();



const corsOptions = require('./src/config/corsOptions')
const mongoose = require('./src/config/db.js')
const router = require('./src/router/index.js')


const app = express();
app.use(express.json())
app.use(express.urlencoded({extended:true}))
app.use(cors(corsOptions))
app.use(router)



const PORT = process.env.PORT
app.listen(PORT,()=>console.log(`Server is running on ${PORT}. `))


