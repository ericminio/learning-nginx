import fs from 'fs';
const NJS_FOLDER = '/etc/nginx/njs';

function go(request, folder) {
    var __dirname = folder || NJS_FOLDER;
    var payload = request.requestText;
    if (!!payload && payload.indexOf('42') !== -1) {
        var data = fs.readFileSync(`${__dirname}/data.json`).toString();
        request.return(200, JSON.parse(data).value);
        return;
    }

    request.internalRedirect('@backend');
}

export default { go }