const { createServer } = require('http')
const port = 5015

const server = {
    start: function(done) {
        this.internal = createServer((incoming, response)=>{
            let answer = `you called ${incoming.url}`;
            response.write(answer)
            response.end()
        })
        this.internal.listen(port, done);
    },
    stop: function(done) {
        this.internal.close(done)
    }
}
server.start(()=>{
    console.log('listening on port', port)
})

module.exports = {
    port:port,
    server:server
}
