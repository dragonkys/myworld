//window.onload = function(){

var target, shuffle, bonus, select;

function lotto(){

	target = Array(45).fill().map(function(a, index){
		return index + 1;
	});

	//console.log(target);

	shuffle = [];
	while (target.length > 0){
		var a = target.splice(Math.floor(Math.random() * target.length),1)[0];
		shuffle.push(a);
	}

	//console.log(shuffle);
	
	bonus = shuffle[shuffle.length - 1];
	select = shuffle.slice(0,6);

	//console.log(select, bonus);

}

var cont = document.createElement('div');
document.body.appendChild(cont);
var title = document.createElement('h1');
cont.appendChild(title);
title.textContent = '버튼을 누르시기 바랍니다.';

var incont = document.createElement('div');
cont.appendChild(incont);
var btnstart = document.createElement('button');
incont.appendChild(btnstart);
btnstart.textContent = '추첨';
var btnreset = document.createElement('button');
incont.appendChild(btnreset);
btnreset.textContent = '재시작';
var viscont = document.createElement('div');
cont.appendChild(viscont);
var ballcont, ball;

for(var i=0; i < 7; i++){
	ballcont = document.createElement('div');
	viscont.appendChild(ballcont);
	ballcont.classList.add('initball');
}

var startclick = btnstart.addEventListener('click',function(){
	lotto();
	ball = document.getElementsByClassName('initball');

	//console.log(ball)

	var i;
	for(i=0; i < 7; i++){
		if (i === 6){
			ball[i].classList.add('bonusball');
			ball[i].textContent = bonus;
		}else{
			ball[i].classList.add('ball');
			ball[i].textContent = select[i];
		}

		if(i === 6 && Number(bonus) <= 10){
			ball[i].style.backgroundColor = '#ffcd12';  // 노란색
		}else if(i === 6 && Number(bonus) <= 20){
			ball[i].style.backgroundColor = '#4948ff';  // 파란색 
		}else if(i === 6 && Number(bonus) <= 30){
			ball[i].style.backgroundColor = '#ff2424';  // 빨간색
		}else if(i === 6 && Number(bonus) <= 40){
			ball[i].style.backgroundColor = '#242424';  // 검정색
		}else if(i === 6 && Number(bonus) <= 45){
			ball[i].style.backgroundColor = '#1ddb16';  // 녹색
		}

		if(Number(select[i]) <= 10) {
			ball[i].style.backgroundColor = '#ffcd12';  // 노란색
		}else if(Number(select[i]) <= 20){
			ball[i].style.backgroundColor = '#4948ff';  // 파란색
		}else if(Number(select[i]) <= 30){
			ball[i].style.backgroundColor = '#ff2424';  // 빨간색
		}else if(Number(select[i]) <= 40){
			ball[i].style.backgroundColor = '#242424';  // 검정색
		}else{
			ball[i].style.backgroundColor = '#1ddb16';  // 녹색
		}
	}

})

var resetclick = btnreset.addEventListener('click', function(){
	ball = document.getElementsByClassName('initball');

	//console.log(ball)

	var i;
	for(i=0; i < ball.length; i++){
		ball[i].classList.remove('ball');
		ball[i].classList.remove('bonusball');
		ball[i].textContent = '';
	}
	
})
	

//}