import "phoenix_html"

import socket         from "./socket"
import draw           from './game/draw';
import controls       from './game/controls';

draw([
  {
    x: 25,
    y: 25,
    color: '#ccc',
    radius: 25,
    direction: "left"
  }
], [], [])
