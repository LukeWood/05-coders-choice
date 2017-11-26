import join_channel from './socket';

const valid_key_codes = new Set(
  ['w', 'a', 's', 'd', 'W', 'A', 'S', 'D', ' ', '']
  .map((x) => x.charCodeAt(0))
);
const movement_keys = new Set(
  ['w', 'a', 's', 'd']
  .map((x) => x.charCodeAt(0))
);

let last_pressed = null;

const ENTER_KEY = 13;
valid_key_codes.add(ENTER_KEY);

class Controls {
  constructor(state_handler) {
    this.channel = join_channel("input");
    this.state_handler = state_handler;
    window.addEventListener("keydown", this.keyHandler.bind(this), true);
    window.addEventListener("keyup", this.keyUpHandler.bind(this), true);
  }

  keyHandler(e) {
    let valid = valid_key_codes.has(e.keyCode);
    if(!valid)
      return;
    if(movement_keys.has(e.keyCode)) {
      last_pressed = e.key;
    }
    this.trigger_send(e.key)
    e.preventDefault();
  }

  keyUpHandler(e) {
    let valid = movement_keys.has(e.keyCode);
    if(!valid)
      return;
    if(e.key == last_pressed) {
      this.channel.push("key_up");
      last_pressed = null;
    }
    e.preventDefault();
  }

  trigger_send(key) {
    this.channel.push(key);
    this.state_handler.handle_action(key);
  }
}

export default Controls
