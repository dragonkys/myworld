
var dtd = document.querySelectorAll('td');

console.log(dtd);

var data = [];
var turn = 'O';
var currow, curcol;
var rows = 3;
var mesg = document.querySelector('.mesg');
var k = 0;
var firstcheck = 'first';

function init(firstcheck){
	turn = 'O';
	for (var i=0; i < rows; i++){
		for(var j=0; j < rows; j++){
			if (j == 0){
				if(firstcheck == 'first'){
					data[i] = [];
					data[i][j] = dtd[k];
					addclick(i,j);

				}
				else{
					data[i][j].textContent = '';
				}
			}
			else{
				if(firstcheck == 'first'){
					data[i][j] = dtd[k];	
					addclick(i,j);
				}
				else {
					data[i][j].textContent = '';
				}
			}
			k++;
		}
	}
}

var addclick = function(row, col){
	data[row][col].addEventListener('click',function(e){
		var wincheck;

		if(!data[row][col].textContent) {
			data[row][col].textContent = turn;
			wincheck = victorycheck(row, col, turn);
			if (wincheck == 'victory'){
				mesg.textContent = turn + '이 승리했습니다.';
				init(firstcheck);
			}
			else if (wincheck == 'end'){
				mesg.textContent = '비겼습니다. 게임을 다시 시작합니다.'
				init(firstcheck);
			}
			else{
				if (turn === 'O'){
					turn = 'X';
				}else{
					turn = 'O';
				}
				mesg.textContent = '';	
			}
		}
		else {
			mesg.textContent = '이미 선택되었습니다. 다른 곳을 선택하기 바랍니다.'
		}

	})
}

function victorycheck(row, col, curturn){
	var status = 'fail';
	var endcnt = 0;

	// row check
	if(data[row][0].textContent == curturn &&
	   data[row][1].textContent == curturn &&
	   data[row][2].textContent == curturn ){
		status = 'victory';
	}

	// col check
	if(data[0][col].textContent == curturn &&
	   data[1][col].textContent == curturn &&
	   data[2][col].textContent == curturn ){
		status = 'victory';
	}

	// 대각 체크
	if (row == col &&
		data[0][0].textContent == curturn &&
		data[1][1].textContent == curturn &&
		data[2][2].textContent == curturn ){
		 status = 'victory';
	}

	// 반대 대각 체크
	if ((row + col) == 2 &&
		data[0][2].textContent == curturn &&
		data[1][1].textContent == curturn &&
		data[2][0].textContent == curturn ){
		 status = 'victory';
	}

	// 칸이 모두 채워졌는지 체크
	if (status != 'victory') {
		for(var i=0; i<rows; i++){
			for(var j=0; j<rows; j++){
				if (data[i][j].textContent != '') {
					endcnt++;
				}
			}
		}
	}

	if (endcnt >= rows*rows){
		status = 'end';
	}

	return status;
}

init(firstcheck);
firstcheck = 'secend';

console.log(data)

