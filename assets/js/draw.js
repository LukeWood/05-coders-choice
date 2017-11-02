let canvas = document.getElementById("game");
let ctx = canvas.getContext("2d");

const PLAYER_RADIUS = 25;

function draw(players, bullets, edges) {
  players.forEach(
    (player) => {
      ctx.fillStyle = player.color;
      ctx.beginPath();
      ctx.arc(player.x, player.y, PLAYER_RADIUS, 0, 2 * Math.PI);
      ctx.fill();
    }
  );
}

export default draw;
