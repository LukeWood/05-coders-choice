let canvas = document.getElementById("game");
let ctx = canvas.getContext("2d");

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

function drawPlayer(player) {
  ctx.fillStyle = player.color;
  ctx.beginPath();
  ctx.arc(player.x, player.y, player.radius, 0, 2 * Math.PI);
  ctx.fill();

  ctx.fillStyle = invertColor(player.color)
  switch(player.direction) {
    case "left":
      ctx.fillRect(player.x, player.y, -player.radius, 2)
      break;
    case "right":
      ctx.fillRect(player.x, player.y, player.radius, 2)
      break;
    case "up":
      ctx.fillRect(player.x, player.y, 2, -player.radius)
      break;
    case "down":
      ctx.fillRect(player.x, player.y, 2, player.radius)
      break;
  }
}

function drawBullet(bullet) {
    ctx.fillStyle = bullet.color;
    ctx.beginPath();
    ctx.arc(bullet.x, bullet.y, bullet.radius, 0, 2 * Math.PI);
    ctx.fill();
}

function draw(players, bullets) {
  players.forEach(drawPlayer);
  bullets.forEach(drawBullet);
}

export default draw;
