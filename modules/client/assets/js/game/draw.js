import game_time from './time_sync';
import config from './config';

console.log(config);

const canvas = document.getElementById("game");
const ctx = canvas.getContext("2d");
const dummy_canvas = document.createElement("canvas");
dummy_canvas.width = canvas.width;
dummy_canvas.height = canvas.height;
const dummy_ctx = dummy_canvas.getContext("2d");
const width = canvas.width;
const height = canvas.height;

function validate_x(x, radius) {
  return Math.min(width - radius, Math.max(x, radius))
}
function validate_y(y, radius) {
  return Math.min(height - radius, Math.max(y, radius))
}
function drawPlayer({
    "x": x,
    "y": y,
    "radius": radius,
    "timestamp": timestamp,
    "color": color,
    "direction": direction,
    "speed": speed,
    "clock_interval": clock_interval,
    "moving": moving,
    "age": age
  }, current_time) {
  const dx = speed * (current_time - timestamp) / clock_interval;
  if(moving) {
    switch(direction) {
      case "up":
        y-=dx
        break;
      case "down":
        y+=dx;
        break;
      case "left":
        x-=dx;
        break;
      case "right":
        x+=dx;
        break;
    }
  }
  x = validate_x(x, radius);
  y = validate_y(y, radius);

  const inner_age = age/200;

  dummy_ctx.strokeStyle = color;
  dummy_ctx.beginPath();
  dummy_ctx.arc(x, y, radius, 0, (age/200) * 2 * Math.PI);
  dummy_ctx.stroke();

  let rad = inner_age * radius

  dummy_ctx.fillStyle = color
  switch(direction) {
    case "left":
      dummy_ctx.fillRect(x, y-1, -rad,  2)
      break;
    case "right":
      dummy_ctx.fillRect(x, y-1,  rad,  2)
      break;
    case "up":
      dummy_ctx.fillRect(x-1, y,  2, -rad)
      break;
    case "down":
      dummy_ctx.fillRect(x-1, y,  2,  rad)
      break;
  }
}

function drawBullet(bullet) {
    dummy_ctx.fillStyle = bullet.color;
    dummy_ctx.beginPath();
    dummy_ctx.arc(bullet.x, bullet.y, bullet.radius, 0, 2 * Math.PI);
    dummy_ctx.fill();
}

function draw(players, bullets) {

  players = Object.keys(players).map((uuid) => players[uuid]);

  dummy_ctx.fillStyle = "#ffffff";
  dummy_ctx.fillRect(0, 0, width, height);

  const server_time = game_time();
  dummy_ctx.lineWidth = 2;
  players.forEach((player) => drawPlayer(player, server_time));
  bullets.forEach((bullet) => drawBullet(bullet, server_time));

  ctx.drawImage(dummy_canvas, 0, 0);
}

export default draw;
