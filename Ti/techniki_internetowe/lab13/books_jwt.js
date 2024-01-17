const express = require('express');
const bodyParser = require('body-parser');//middleware to parse the JSON body from the HTTP request
const jwt = require('jsonwebtoken');//is used to generate and verify JWT tokens
const app = express();
  
const accessTokenSecret = 'somerandomaccesstoken';
const refreshTokenSecret = 'somerandomstringforrefreshtoken';
  
const users = [
    {
        username: 'john',
        password: 'password123admin',
        role: 'admin'
    }, {
        username: 'anna',
        password: 'password123member',
        role: 'member'
    }
]
  
const authenticateJWT = (req, res, next) => {
    const authHeader = req.headers.authorization;
  
    if (authHeader) {
        const token = authHeader.split(' ')[1];
        //const token = authHeader;
        //console.log(`${authHeader} \n`);
        //console.log(`${token} \n`);
        //console.log(`${accessTokenSecret} \n`);
        //console.log(jwt.verify(token, accessTokenSecret));
        jwt.verify(token, accessTokenSecret, (err, user) => {
            if (err) {
                console.log('Bledny token');
                return res.sendStatus(403);
            }
            console.log('Poprawny token');
            req.user = user;
            next();
        });
    } else {
        res.sendStatus(401);
    }
}
  
const books = [
    {
        "author": "Chinua Achebe",
        "country": "Nigeria",
        "language": "English",
        "pages": 209,
        "title": "Things Fall Apart",
        "year": 1958
    },
    {
        "author": "Hans Christian Andersen",
        "country": "Denmark",
        "language": "Danish",
        "pages": 784,
        "title": "Fairy tales",
        "year": 1836
    },
    {
        "author": "Dante Alighieri",
        "country": "Italy",
        "language": "Italian",
        "pages": 928,
        "title": "The Divine Comedy",
        "year": 1315
    },
]
  
var refreshTokens = [];
  
app.use(bodyParser.json());

var cors = require('cors')

app.use(cors())
  
app.post('/login', (req, res) => {
    // read username and password from request body
    const { username, password } = req.body;
  
    // filter user from the users array by username and password
    const user = users.find(u => { return u.username === username && u.password === password });
    console.log(`${user.username} \n`);
    if (user) {
        // generate an access token
        const accessToken = jwt.sign({ username: user.username, role: user.role }, accessTokenSecret, { expiresIn: '3m' });
        const refreshToken = jwt.sign({ username: user.username, role: user.role }, refreshTokenSecret);
  
        refreshTokens.push(refreshToken);
  
        res.json({
            accessToken,
            refreshToken
        });
    } else {
        res.send('Username or password incorrect');
    }
});
  
app.post('/token', (req, res) => {
    const { token } = req.body;
  
    if (!token) {
        return res.sendStatus(401);
    }
  
    if (!refreshTokens.includes(token)) {
        return res.sendStatus(403);
    }
  
    jwt.verify(token, refreshTokenSecret, (err, user) => {
        if (err) {
            return res.sendStatus(403);
        }
  
        const accessToken = jwt.sign({ username: user.username, role: user.role }, accessTokenSecret, { expiresIn: '3m' });
  
        res.json({
            accessToken
        });
    });
});
  
app.post('/logout', (req, res) => {
    const { token } = req.body;
    refreshTokens = refreshTokens.filter(t => t !== token);
  
    res.send("Logout successful");
});
  
app.get('/books', authenticateJWT, (req, res) => {
    res.json(books);
});
  
app.post('/books', authenticateJWT, (req, res) => {
    const { role } = req.user;
  
    if (role !== 'admin') {
        return res.sendStatus(403);
    }
  
  
    const book = req.body;
    books.push(book);
  
    res.send('book added successfully');
});
  
app.listen(1111, () => {
    console.log('Books service started on port 1111');
});
