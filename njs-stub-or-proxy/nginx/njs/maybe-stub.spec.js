import { expect } from 'chai';
import main from './maybe-stub.js';

describe('maybe-stub', () => {

    it('is available', () => {
        expect(main.go).not.to.equal(undefined);
        expect(main.go).not.to.equal(null);
    });

    it('redirects to backend by default', () => {
        let redirected;
        let request = {
            internalRedirect: uri => { redirected = uri; }
        };
        main.go(request);

        expect(redirected).to.equal('@backend');
    });

    it('redirects to backend a non matching request', () => {
        let redirected;
        let request = {
            requestText: 'not matching',
            internalRedirect: uri => { redirected = uri; }
        };
        main.go(request);
        
        expect(redirected).to.equal('@backend');
    });

    it('stubs response of matching request', () => {
        let sentAnswer;
        let request = {
            requestText: 'matching 42',
            'return': (statusCode, answer) => { sentAnswer = answer; }
        };
        main.go(request, '.');
        
        expect(sentAnswer).to.equal('42 I see u');
    });
});