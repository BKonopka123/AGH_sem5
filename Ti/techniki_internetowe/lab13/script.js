let accessToken = "";
let refreshToken = "";

function login() {
    const username = document.getElementById('username').value;
    const password = document.getElementById('password').value;

    var xhr = new XMLHttpRequest();
    xhr.open('POST', 'http://pascal.fis.agh.edu.pl:1111/login', true);
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
            var data = JSON.parse(xhr.responseText);
            console.log(data);
            accessToken = data.accessToken;
            refreshToken = data.refreshToken;
            document.getElementById('loginPage').style.display = 'none';
            document.getElementById('authenticatedPage').style.display = 'block';
            document.getElementById('tokens').style.display = 'block';
            document.getElementById('accessToken').innerHTML = accessToken;
            document.getElementById('refreshToken').innerHTML = refreshToken;
        } else if (xhr.readyState === 4) {
            console.error('Error:', xhr.status);
        }
    };
    xhr.send(JSON.stringify({ username, password }));
}

function getBooks() {
    var xhr = new XMLHttpRequest();
    xhr.open('GET', 'http://pascal.fis.agh.edu.pl:1111/books', true);
    xhr.setRequestHeader('Authorization', 'Bearer ' + accessToken);
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4) {
            if (xhr.status === 200) {
                var data = JSON.parse(xhr.responseText);
                console.log('Books:', data);
                document.getElementById('books').style.display = 'block';
                var books = document.getElementById('booksList');
                books.innerHTML = data.map(book => `<p>${book.title}</p>`).join('');
            } else {
                console.error('Error:', xhr.status);
            }
        }
    };
    xhr.send();
}

function logout() {
    var xhr = new XMLHttpRequest();
    xhr.open('POST', 'http://pascal.fis.agh.edu.pl:1111/logout', true);
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4) {
            if (xhr.status === 200) {
                console.log('Logout:', xhr.responseText);
                accessToken = "";
                refreshToken = "";
                document.getElementById('loginPage').style.display = 'block';
                document.getElementById('tokens').style.display = 'none';
                document.getElementById('authenticatedPage').style.display = 'none';
                document.getElementById('books').style.display = 'none';
            } else {
                console.error('Error:', xhr.status);
            }
        }
    };
    xhr.send(JSON.stringify({ token: accessToken }));
}

function refreshhToken() {
    var xhr = new XMLHttpRequest();
    xhr.open('POST', 'http://pascal.fis.agh.edu.pl:1111/token', true);
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4) {
            if (xhr.status === 200) {
                var data = JSON.parse(xhr.responseText);
                console.log('Refresh:', data);
                accessToken = data.accessToken;
                document.getElementById('accessToken').innerHTML = accessToken;
                document.getElementById('refreshToken').innerHTML = refreshToken;
            } else {
                console.error('Error:', xhr.status);
            }
        }
    };
    xhr.send(JSON.stringify({ token: refreshToken }));

}