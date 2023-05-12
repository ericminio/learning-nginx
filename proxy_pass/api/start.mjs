import { Server } from "./yop/server.js";

const server = new Server(process.env.PORT, async (incoming, response) => {
  let answer = 'you called ' + incoming.url
  response.write(answer)
  response.end()
});

server.start(() => {
  console.log(`listening on port ${process.env.PORT}`);
});
