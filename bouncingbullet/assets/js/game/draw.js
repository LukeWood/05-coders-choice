//let canvas = document.getElementById("game");
//let ctx = canvas.getContext("2d");

const PLAYER_RADIUS = 20;

function drawPlayer(player) {
    ctx.fillStyle = player.color;
    ctx.beginPath();
    ctx.arc(player.x + PLAYER_RADIUS/2, player.y + PLAYER_RADIUS/2, PLAYER_RADIUS, 0, 2 * Math.PI);
    ctx.fill();
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
