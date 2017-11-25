import join_channel from './socket';

class StateHandler {
  constructor(render_function) {
    this.players = [];
    this.bullets = [];
    this.channel = join_channel("updates");
    this.start_rendering(render_function);
  }

  start_rendering(render_function) {
    let channel = this.channel;
    function loop_function() {
      channel.push("update")
        .receive("ok", (state) => {
          render_function(state);
          setTimeout(loop_function, 100);
        });
    }
    loop_function();
  }
}

export default StateHandler
