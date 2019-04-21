var req = new XMLHttpRequest();

req.onreadystatechange = function(state){
	console.log(state);
}

req.open('GET', 'http://naver.com');

req.send();

