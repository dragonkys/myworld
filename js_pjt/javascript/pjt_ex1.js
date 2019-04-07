var arr1 = [46,33,33,22,31,50];
var arr2 = [27,56,19,14,14,10];
var rows = 6;

// 배열을 파라메터로 받아서 비트 and 연산을 수행하여 결과값을 내는 함수
var calc = function (arr1, arr2, rows){
	var e1, e2, rem1=0, rem2=0;
	var r1, r2, f, t;
	var data = new Array(rows);
	for (var i = 0; i < rows ; i++) {
		for (var j = 0; j < rows; j++){
			if (j==0){
				// 배열에서 값을 앞에서 부터 하나씩 꺼내기
				e1 = arr1.shift();
				e2 = arr2.shift();
				rem1 = e1;
				rem2 = e2;

				data[i] = '';

				console.log(e1, e2);
			}

			// 이진수로 나누기 위한 값 구하기 (2 * 2 * 2 ...)
			f = 1;
			for(t=j+1; t < rows; t++){
				f = 2 * f;
			}

			// 해당 자리수의 값을 구하기 
			if ((rem1 - f) >= 0){
				r1 = 1;
				rem1 = rem1 - f;
			}
			else {
				r1 = 0;
			}

			if ((rem2 - f) >= 0){
				r2 = 1;
				rem2 = rem2 - f;
			}
			else {
				r2 = 0;
			}

			// 둘중에 1개라도 1이면 #으로 출력
			if (r1 == 1 || r2 == 1){
				data[i] = data[i] + '#';
			}
			else{
				data[i] = data[i] + '*';
			}

		}
		console.log(data[i])
	}
	return data	
}

calc(arr1, arr2, rows)