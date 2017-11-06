import join_channel from './socket';

class StateHandler {
  constructor() {
    this.players = [];
    this.bullets = [];
    this.channel = join_channel("updates")
  }
}

export default controls
