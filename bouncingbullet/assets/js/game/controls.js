import join_channel from './socket';

class Controls {
  constructor() {
    this.channel = join_channel("input")
  }
}

export default Controls
