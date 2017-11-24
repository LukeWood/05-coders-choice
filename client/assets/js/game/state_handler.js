import join_channel from './socket';

class StateHandler {
  constructor(change_handler) {
    this.players = [];
    this.bullets = [];
    this.channel = join_channel("updates")
    this.register_updates()
  }

  register_updates() {
    this.channel.on("bullet", player => {

    });
    this.channel.on("player", player => {
      console.log(msg);
    });
  }
}

export default StateHandler
