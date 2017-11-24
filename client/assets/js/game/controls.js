import join_channel from './socket';

class Controls {
  constructor() {
    this.channel = join_channel("input");
    window.addEventListener("keyup", this.keyhandler.bind(this), true);
  }
  keyhandler(e) {
    let valid = [32, 37, 38, 39, 40, 13].includes(e.keyCode);
    if(!valid) {
      return;
    }
    else {
      console.log(e.key);
      this.channel.push(e.key);
    }
    e.preventDefault();
  }
}

export default Controls
