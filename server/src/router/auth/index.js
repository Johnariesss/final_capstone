const { login, register } = require('../../controller/auth');

const auth = require('express').Router();

auth.post('/auth/login',login)
auth.post('/auth/register', register)

module.exports = auth