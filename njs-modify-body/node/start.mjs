import { payload } from "./yop/payload.js";
import { Server } from "./yop/server.js";

const server = new Server(process.env.PORT, async (request, response) => {
  const incoming = await payload(request);
  const answer = `echoing: ${incoming}`;
  console.log("answering with", answer);
  response.writeHead(200, { "content-type": "text/plain" });
  response.write(answer);
  response.end();
});

server.start(() => {
  console.log(`listening on port ${process.env.PORT}`);
});
