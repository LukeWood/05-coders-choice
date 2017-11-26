import join_channel from './socket';

let sync_time = 0;
let server_time = 0;

function game_time() {
  return server_time + (new Date.getTime() - sync_time);
}

let channel = join_channel('sync')
channel.push('time').receive('ok', (response) => {
    const time = response.time;
    server_time = time;
    sync_time = (new Date).getTime();
});

export default game_time;
