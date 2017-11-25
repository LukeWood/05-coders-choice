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

function drawPlayer(player) {
  dummy_ctx.fillStyle = player.color;
  dummy_ctx.beginPath();
  dummy_ctx.arc(player.x, player.y, player.radius, 0, 2 * Math.PI);
  dummy_ctx.fill();

  dummy_ctx.fillStyle = invertColor(player.color)
  switch(player.direction) {
    case "left":
      dummy_ctx.fillRect(player.x, player.y, -player.radius, 2)
      break;
    case "right":
      dummy_ctx.fillRect(player.x, player.y, player.radius, 2)
      break;
    case "up":
      dummy_ctx.fillRect(player.x, player.y, 2, -player.radius)
      break;
    case "down":
      dummy_ctx.fillRect(player.x, player.y, 2, player.radius)
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
  players.forEach(drawPlayer);
  bullets.forEach(drawBullet);
  ctx.drawImage(dummy_canvas, 0, 0);
}

export default draw;
