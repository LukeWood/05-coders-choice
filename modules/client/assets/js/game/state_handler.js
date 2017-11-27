import { updates } from './channels';
import game_time from './time_sync';

class StateHandler {
  constructor(render_function) {
    this.players = {};

    this.bullets = [];

    updates

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
