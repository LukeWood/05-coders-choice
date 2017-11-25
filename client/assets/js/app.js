import "phoenix_html"

import draw           from './game/draw';
import Controls       from './game/controls';
import StateHandler   from './game/state_handler';

new Controls()
new StateHandler(draw)
