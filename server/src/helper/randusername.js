const { generateUsername} = require('unique-username-generator');

exports.generateUsername=()=>{
    const username = generateUsername("", 3);

return username
}



