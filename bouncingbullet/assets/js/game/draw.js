let canvas = document.getElementById("game");
let ctx = canvas.getContext("2d");

function inverse_color(color) {
  return "#000"
}

function drawPlayer(player) {
  ctx.fillStyle = player.color;
  ctx.beginPath();
  ctx.arc(player.x, player.y, player.radius, 0, 2 * Math.PI);
  ctx.fill();

  ctx.fillStyle = inverse_color(player.color)

  switch(player.direction) {
    case "left":
      ctx.fillRect(player.x, player.y, player.radius, 2)
      break;
    case "right":
      ctx.fillRect(player.x, player.y, -player.radius, 2)
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

}

function drawEdge(edge) {

}

function draw(players, bullets, edges) {
  players.forEach(drawPlayer);
  bullets.forEach(drawBullet);
  edges.forEach(drawEdge)
}

export default draw;
