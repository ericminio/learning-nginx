const extractBody = (request, callback)=> {
    var body = ''
    request.on('data', (chunk)=>{
        body += chunk
    })
    request.on('end',()=>{
        callback(body)
    })
}

module.exports = {
    extractBody:extractBody
}
