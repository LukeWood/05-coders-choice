import join_channel from './socket';

class StateHandler {
  constructor(change_handler) {
    this.players = [];
    this.bullets = [];
    this.channel = join_channel("updates")
    this.register_updates()
    window.update = this.channel.push("update")
  }

  register_updates() {
    this.channel.on("update", state => {
      console.log(state)
    });
  }
}

export default StateHandler
