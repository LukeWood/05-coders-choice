import join_channel from './socket';

const valid_key_codes = new Set(
                        ['w', 'a', 's', 'd', 'W', 'A', 'S', 'D', ' ', '']
                        .map((x) => x.charCodeAt(0))
);
// Enter keycode
valid_key_codes.add(13)

class Controls {

  constructor() {
    this.channel = join_channel("input");
    window.addEventListener("keyup", this.keyhandler.bind(this), true);
  }
  keyhandler(e) {

    let valid = valid_key_codes.has(e.keyCode);
    if(!valid)
      return;

    this.channel.push(e.key);
    e.preventDefault();
  }
}

export default Controls
