const { expect } = require('chai')
const { get } = require('http')
const { server, port } = require('./lib/server')
const { extractBody } = require('./support/body')

describe('PING', ()=>{

    after((done)=>{
        server.stop(done)
    })
    it('is available', (done)=>{
        get('http://localhost:' + port + '/ping', (response)=>{
            expect(response.statusCode).to.equal(200);
            done()
        })
    })
    it('returns expected data', (done)=>{
        get('http://localhost:' + port + '/ping', (response)=>{
            expect(response.statusCode).to.equal(200);
            extractBody(response, (body)=>{
                expect(body).to.equal('you called /ping')
                done()    
            })
        })
    })

})
