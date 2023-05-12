import { Server } from "./yop/server.js";

const server = new Server(process.env.PORT, async (incoming, response) => {
  let value = incoming.headers['x-answer'];
  let answer = `you called ${incoming.url} with header x-answer:${value}`;
  response.write(answer);
  response.end();
});

server.start(() => {
  console.log(`listening on port ${process.env.PORT}`);
});
