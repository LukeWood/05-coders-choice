import { updates, input } from './channels';
import game_time from './time_sync';

class StateHandler {
  constructor(render_function) {
    this.players = {};

    this.bullets = [];

    this.uuid = null;
    input.push("init")
    .receive("ok", ({uuid: uuid}) => {
      this.uuid = uuid;
    });

    this.listen();
    this.start_drawing(render_function);
  }

  listen() {
    updates.on("player", (player) => this.players[player.id] = player);

    let update_bullets = () => {
      updates.push("bullets")
      .receive("ok", ({bullets: bullets}) => {
        this.bullets = bullets;
      });
    }
    let update_players = () => {
      updates.push("players")
        .receive("ok", ({players: players}) => {
          this.players = players;
      })
    }

    setInterval(update_players, 50);
    setInterval(update_bullets, 50);
  }

  start_drawing(render_function) {
    setInterval(() => render_function(this.players, this.bullets), 30);
  }

  handle_action(key) {
    if(!(this.uuid)) {
      return
    }
    this.players[this.uuid].direction = key.toLowerCase().replace("arrow", "");
  }
}

export default StateHandler
