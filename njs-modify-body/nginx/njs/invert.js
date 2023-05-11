async function invert(r) {
  let body = r.requestText;
  let inverted = body.split("").reverse().join("");
  let res = await r.subrequest("/api", { body: inverted });
  r.return(res.status, res.responseBody);
}

export default { invert };
