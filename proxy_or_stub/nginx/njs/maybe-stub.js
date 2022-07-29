function go(r) {
    var payload = r.requestText;
    if (!!payload && payload.indexOf('42') !== -1) {
        r.return(200, '42 I see u');
        return;
    }

    r.internalRedirect('@backend');
}

export default { go }