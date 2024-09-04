const user = require('../../src/model/userModel')
const {generateUsername} = require('../../src/helper/randusername')
const bcrypt = require('bcrypt')

exports.register = async(req,res)=>{
   const {username, email, school, strand, password} = req.body;
      console.log(email, username, school, strand, password)
   try {
       let newUsername = username
        if(!email || !school || !strand || ! password){
            return res.status(400).json({error:"Fill up all fields!"})
        }

        if(!username){
            newUsername =  generateUsername();
        }

        const isEmailValid = await user.findOne({email})
        if(isEmailValid){
            return res.status(400).json({error:"Email is already used!"})
        }
       
        bcrypt.hash(password, 10, async(error, hashPassword)=>{
            if(error){
                return res.status(400).json({error:"Error while hashing your password!"})
            }

           const userData = {
            username:newUsername,
            email,
            school,
            strand,
            password:hashPassword
           }

           const User = new user(userData);

        
           await User.save();
            return res.status(201).json({valid:true, message:"Successfully Created!", newUser:User})
            

          
        })
        
     
    
   } catch (error) {
      return res.sendStatus(500)
   }

}

exports.login = async(req,res)=>{
   const {email, password} = req.body;
   try {
     if(!email || !password){
        return res.status(400).json({error:"Input all fields!"})
     }

     const isEmailValid = await user.findOne({email}).select('+password')
     if(!isEmailValid){
        return res.status(404).json({error:"User not found!"})
     }
     
    const userPassword = isEmailValid.password

    const isPasswordMatch = await bcrypt.compare(password, userPassword)

    if(!isPasswordMatch){
      return res.status(400).json({error:"Password didn't match!"})
     }

     return res.status(200).json({valid:true, message:"Success"})
   
   
   } catch (error) {
    return res.sendStatus(500);
   }


}