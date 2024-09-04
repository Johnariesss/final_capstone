const mongoose = require('mongoose');

const userSchema = new mongoose.Schema({
    username: {type:String},
    email:{type:String, required:true},
    school:{type:String, required:true},
    strand:{type:String, required:true},
    password:{type:String, required:true, select:false}
},{timestamps:true})

const user = new mongoose.model('User', userSchema);

module.exports = user