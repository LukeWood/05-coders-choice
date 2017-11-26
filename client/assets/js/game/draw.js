const canvas = document.getElementById("game");
const ctx = canvas.getContext("2d");
const dummy_canvas = document.createElement("canvas");
dummy_canvas.width = canvas.width;
dummy_canvas.height = canvas.height;
const dummy_ctx = dummy_canvas.getContext("2d");

// Not my code btw
function invertColor(hexTripletColor) {
    var color = hexTripletColor;
    color = color.substring(1);           // remove #
    color = parseInt(color, 16);          // convert to integer
    color = 0xFFFFFF ^ color;             // invert three bytes
    color = color.toString(16);           // convert to hex
    color = ("000000" + color).slice(-6); // pad with leading zeros
    color = "#" + color;                  // prepend #
    return color;
}
// Ok the rest is my code

function drawPlayer({
    x: x,
    y: y,
    radius: radius,
    timestamp: t,
    color: color,
    direction: direction,
    speed: speed
  }, current_time) {

  const dx = speed;
  const dy = 0;
  dummy_ctx.fillStyle = color;
  dummy_ctx.beginPath();
  dummy_ctx.arc(x, y, radius, 0, 2 * Math.PI);
  dummy_ctx.fill();

  dummy_ctx.fillStyle = invertColor(color)
  switch(direction) {
    case "left":
      dummy_ctx.fillRect(x, y, -radius, 1)
      break;
    case "right":
      dummy_ctx.fillRect(x, y,  radius, 1)
      break;
    case "up":
      dummy_ctx.fillRect(x, y,  1, -radius)
      break;
    case "down":
      dummy_ctx.fillRect(x, y,  1,  radius)
      break;
  }
}

function drawBullet(bullet) {
    dummy_ctx.fillStyle = bullet.color;
    dummy_ctx.beginPath();
    dummy_ctx.arc(bullet.x, bullet.y, bullet.radius, 0, 2 * Math.PI);
    dummy_ctx.fill();
}

function draw({players: players, bullets: bullets}) {
  dummy_ctx.fillStyle = "#000000";
  dummy_ctx.fillRect(0, 0, 500, 500);
  const timestamp = new Date().getTime();
  console.log(timestamp)
  players.forEach((player) => drawPlayer(player, timestamp));
  bullets.forEach((bullet) => drawBullet(bullet, timestamp));
  ctx.drawImage(dummy_canvas, 0, 0);
}

export default draw;
