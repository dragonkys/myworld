console.log('srart!!!')

var outer = document.createElement('div');
document.body.appendChild(outer);

var inner = document.createElement('div');
outer.appendChild(inner);

inner.id = 'inner';
inner.classList.add('ready');
inner.textContent = '클릭을 하세요!!!'

var starttm;
var endtm;
var diff;
var time;
var result = [];
var avg;
var cur;
var cnt = 0;

var tm = function (){
	time = setTimeout(function(){
		starttm = new Date();
		inner.classList.remove('click');
		inner.classList.add('start');
		//console.log('time : ' , (endtm - starttm) / 1000 );
	}, 1000*Math.random() + 2000);
}

var startgame = inner.addEventListener('click', function(){

	cur = document.getElementById('inner');
	if(cur.className === 'ready'){
		inner.classList.remove('ready');
		inner.classList.add('click');
		inner.textContent = '바탕이 녹색으로 바뀌면 클릭을 하세요';
		tm();
	}else if(cur.className === 'click'){
		inner.textContent = '너무 빨리 클릭을 했습니다. 다시 준비가 되면 클릭하세요';
		clearTimeout(time);
		starttm = '';
		inner.classList.remove('click');
		inner.classList.add('ready');
	}else if(cur.className === 'start'){
		cnt++;
		endtm = new Date();
		diff = (endtm - starttm);
		result.push(diff);
		inner.classList.remove('start');
		inner.classList.add('ready');
		starttm = '';
		endtm = '';
		if (cnt == 3) {
			avg = ((result[0] + result[1] + result[2]) / 3) / 1000 ;
			inner.innerHTML = '당신의 평균 반응 속도는 <br> (' + avg + ')초 입니다. '
			cnt = 0;
			avg = 0;
			result = [];
		} else {
			inner.textContent = '클릭을 하세요!!!';	
		}

		console.log(diff);

	}

})