import { Socket } from "phoenix"

function logger(kind, msg, data) {
  console.log(`Socket event: ${kind}, ${message}, ${data}`)
}

let socket = new Socket("/socket");
socket.connect()

function join_channel(channel_name) {
  let channel = socket.channel(channel_name, { logger: logger });
  channel.join();
  return channel;
}

export default join_channel;
