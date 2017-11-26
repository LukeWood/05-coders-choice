import join_channel from './socket';
import game_time from './time_sync';

class StateHandler {
  constructor(render_function) {
    this.players = {};

    this.bullets = [];

    this.channel = join_channel("updates");

    this.listen();
    this.start_drawing(render_function);
  }

  listen() {
    this.channel.on("player", (player) => this.players[player.id] = player);

    let update_bullets = () => {
      this.channel.push("bullets")
        .receive("ok", ({bullets: bullets}) => {
          this.bullets = bullets;
      })
    }
    let update_players = () => {
      this.channel.push("players")
        .receive("ok", ({players: players}) => {
          this.players = players;
      })
    }

    setInterval(update_players, 100);
    setInterval(update_bullets, 50);
  }

  start_drawing(render_function) {
    setInterval(() => render_function(this.players, this.bullets), 30);
  }

  handle_action() {

  }
}

export default StateHandler
