import "phoenix_html"

import draw           from './game/draw';
import StateHandler   from './game/state_handler';
import Controls       from './game/controls';
let state_handler = new StateHandler(draw)
new Controls(state_handler);
