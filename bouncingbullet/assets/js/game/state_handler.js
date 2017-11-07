import join_channel from './socket';

class StateHandler {
  constructor(player_listener, bullets_listener) {
    this.players = [];
    this.bullets = [];
    this.channel = join_channel("updates")
    this.register_updates()
  }

  register_updates() {
    
  }
}

export default StateHandler
