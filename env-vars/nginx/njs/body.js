function body(r) {
  r.return(200, `hello ${process.env.NGINX_BODY}`);
}

export default { body };
