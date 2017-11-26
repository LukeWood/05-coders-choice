import join_channel from './socket';

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
      this.channel.push("update")
        .receive("ok", ({bullets: bullets}) => {
          this.bullets = bullets;
      })
    }
    setInterval(update_bullets, 50);
  }
  start_drawing(render_function) {
    setInterval(() => render_function(this.players, this.bullets), 30);
  }
}

export default StateHandler
