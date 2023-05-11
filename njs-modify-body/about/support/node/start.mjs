import { payload } from "./payload.js";
import { Server } from "./server.js";

const server = new Server(5015, async (request, response) => {
  const incoming = await payload(request);
  const answer = `echoing: ${incoming}`;
  console.log("answering with", answer);
  response.writeHead(200, { "content-type": "text/plain" });
  response.write(answer);
  response.end();
});

server.start(() => {
  console.log("waiting");
});
