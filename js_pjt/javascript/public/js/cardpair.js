var count;
var colorstorage = [];
var colorarray = []; 
var colorallocate = [];
var paircnt=0;
var collectcard = [];
var paircard = [];
var clickcnt=0;
var clickflag;
var settingflag=true;
var timediff;
var firsttime;
var lasttime;

//console.log(colorallocate);

function cardset(count){

	clickflag = false;
	paircnt = 0;
	clickcnt = 0;
	paircard = [];
	collectcard = [];
	colorallocate = [];
	colorarray = [];
	settingflag = true;
	firsttime = new Date();
	var k;

	colorstorage = ["red","red","orange","orange","grey","grey","blue","blue","white","white"
				 ,"yellow","yellow","brown","brown","magenta","magenta","beige","beige","pink","pink"];

	for(k=0; k < count; k++){
		var y = colorstorage.shift();
		colorarray.push(y);
	}
//console.log(colorarray);	
	for(k=0; k < count; k++){
		colorallocate = colorallocate.concat(colorarray.splice(Math.floor(Math.random() * colorarray.length),1));
	}

//console.log(colorallocate);

	document.querySelector('#game').innerHTML = '';

	var outer = document.querySelector('#game');
	for (var i =0; i < count; i++) {
		var card = document.createElement('div');
		card.className = 'card';
		var cardInner = document.createElement('div');
		cardInner.className = 'card-inner';
		var cardFront = document.createElement('div');
		cardFront.className = 'card-front';
		var cardBack = document.createElement('div');
		cardBack.className = 'card-back';
		cardBack.style.backgroundColor = colorallocate[i];
		cardInner.appendChild(cardFront);
		cardInner.appendChild(cardBack);
		card.appendChild(cardInner);
		(function(c){
			c.addEventListener('click', function(){
				if (settingflag == false){ 

					var opencard = false;
					clickcnt++;

					if(clickcnt <= 2) {
						paircard.push(c);

						//console.log(paircard[clickcnt-1])
						for(var i=0; i<collectcard.length; i++){
							if(paircard[clickcnt-1] === collectcard[i]){
								opencard = true;
								clickflag = false;	
							}
						}
					}
					else {
						clickflag = false;
					}

					if((clickcnt == 2 && paircard[0]===paircard[1]) || opencard == true){
						paircard.pop();
						clickcnt--;
					}
//					console.log(clickflag)

					if (clickflag){
						if(c.classList.contains('flipped'))
							c.classList.remove('flipped');
						else
							c.classList.add('flipped');
					}
					if(clickcnt == 2){
						if (paircard[0].querySelector('.card-back').style.backgroundColor ==
							paircard[1].querySelector('.card-back').style.backgroundColor){
							collectcard.push(paircard[0]);
							collectcard.push(paircard[1]);
							paircnt++;
							clickcnt = 0;
							paircard = [];
							if (paircnt == (count/2)){  // 모두 맞춘 경우
								setTimeout(function(){
									lasttime = new Date();
									timediff = (lasttime - firsttime) / 1000;
									alert("축하합니다. 카드를 모두 맞추었습니다. 시간은 ("+timediff+")초 걸렸습니다.");	
								}, 1000)
								
							}
							//console.log(paircnt,collectcard);
						}
						else{
							
							setTimeout(function(){
								paircard[0].classList.remove('flipped');
								paircard[1].classList.remove('flipped');
								paircard = [];
								clickflag = true;		
								clickcnt = 0;
							}, 1000)
						}
					}
					clickflag = true;
					if (clickcnt>=3)
							clickcnt--;
				}
				
			})
		})(card)
		outer.appendChild(card);
	}
//	document.body.appendChild(outer);

	document.querySelectorAll('.card').forEach(function(card, index){

		setTimeout(function(){
			card.classList.add('flipped');
		}, 1000 + 100*index);

		setTimeout(function(){
			card.classList.remove('flipped');
			settingflag = false;
			clickflag = true;
		}, 5000);
	});
}

//cardset(count);


