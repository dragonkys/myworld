//
const express = require('express')
const app = express()

// 변수 선언
const items = [{
        name: '우유',
        price: '2000'
    },{
        name: '홍차',
        price: '3000'
    },{
        name: '커피',
        price: '5000'
    }];

app.use(express.static('public'))

app.get('/',(request, response) =>{
    response.send('<h1>Hello world!!!</h1>')
})

app.get('/data.html',(request, response) =>{
    var output = ''
    output += '<!Doctype html>'
    output += '<html>'
    output += '<head>'
    output += '</head>'
    output += '<body>'
    items.forEach(function(item){
        output += '<div>'
        output += '<h1>' + item.name + '</h1>'
        output += '<h2>' + item.price + '</h2>'
        output += '</div>'
    })
    output += '</body>'
    output += '</html>'

    response.send(output)
})

app.get('/data.json',(request, response) =>{
    response.send(items)
})

app.get('/data.xml',(request, response) =>{
    var output = ''
    output += '<?xml version="1.0" encoding="utf-8" ?>'
    output += '<products>'
    items.forEach(function(item){
        output += '<product>'
        output += ' <name>' + item.name + '</name>'
        output += ' <price>' + item.price + '</price>'
        output += '</product>'
    })
    output += '</products>'

    // xml인 경우 content type을 지정해 주어야 함
    response.type('text/xml')
    response.send(output)

})


app.listen(52200, () =>{
    console.log('Server Running at http://127.0.0.1:52200')
})
