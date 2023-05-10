import { payload } from "./payload.js";
import { Server } from "./server.js";

const server = new Server(5015, async (request, response) => {
  const incoming = await payload(request);
  response.writeHead(200, { "content-type": "text/plain" });
  response.write(`${request.method}: ${incoming} I can see you`);
  response.end();
});

server.start(() => {
  console.log("waiting");
});
