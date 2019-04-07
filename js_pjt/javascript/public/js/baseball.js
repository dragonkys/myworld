window.onload = function(){

	var answer = function(){
		var data = [1,2,3,4,5,6,7,8,9];
		var x;
		var result = [];
		for (var a = 0; a < 4; a++){
			x = data.splice(Math.floor(data.length * Math.random()),1)[0];
			//console.log(x);
			result.push(x);
		}
		 return result.join('');
	}

	var execnt = 10;
	var cnt = 0;
	var ret = answer();
//	console.log(ret);

	var outer = document.createElement('div');
	document.body.appendChild(outer);
	var inner = document.createElement('div');
	outer.appendChild(inner);
	var mesg = document.createElement('h1');
	var text = document.createTextNode('숫자 4자리를 입력하세요!!!');
	mesg.appendChild(text);
	inner.appendChild(mesg);

	var cont = document.createElement('div');
	outer.appendChild(cont);
	var form = document.createElement('form');
	var input = document.createElement('input');
	input.type = 'text';
	input.maxLength = 4;
	var btn = document.createElement('button');
	btn.textContent = '입력';
	cont.appendChild(form);
	form.appendChild(input);
	form.appendChild(btn);
	input.focus();

	form.addEventListener('submit', function(e){
		e.preventDefault();
//		console.log(input.value);

		var ins = input.value;
		var strike = 0, ball = 0;
		if (ins == ret){
			mesg.textContent = '홈런!!! 다시 시작하세요'
			ret = answer();
			input.value = '';
			input.focus();
			cnt = 0;
		}
		else {
			for (var k=0; k < ret.length; k++){
				if (ins[k] === ret[k]) {
					strike = strike + 1;
				}
				else if(ins.indexOf(ret[k]) >= 0){
					ball = ball + 1;
				}	
			}
			if (cnt == execnt) {
				mesg.innerHTML = '정답은 (' + ret + ')입니다. <br>' + cnt + '회가 지났습니다. 다시 하기 바랍니다.'
				ret = answer();
				input.value = '';
				input.focus();
				cnt = 0;
			}
			else {
				cnt = cnt + 1;
				mesg.textContent = '(' + cnt + ') 회 - ' + strike + ' 스트라이크 ' + ball + ' 볼 입니다.';
				input.focus();
			}
		}

	});

	var initbtn = document.getElementById('init');
	var init = initbtn.addEventListener('click', function(){
		execnt = document.getElementById('count').value;
		cnt = 0;
		ret = answer();
		mesg.textContent = '다시 시작합니다. 4자리를 입력하세요!!!'

	})

}
