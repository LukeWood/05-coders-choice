
function render_lobby(lobby) {
  return `<li>${lobby.name}</li>`
}

function render_lobbies(lobbies) {
  let container = document.getElementById("lobby-container")
  let elements = lobbies.map( render_lobby );
  container.innerHTML = elements.join('');
}

export default render_lobbies;
