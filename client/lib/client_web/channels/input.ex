defmodule Client.Input do

    use Phoenix.Channel

    def join("input", _message, socket) do
      world = Client.world
      {:ok, player} = Player.new(world)

      socket = Map.put_new(socket, :player, player)
      { :ok, socket }
    end

    def handle_in("key_up", _msg, socket = %{player: player}) do
      Player.action(player, :stop)
      {:noreply, socket}
    end

    def handle_in("w", _msg, socket = %{player: player}) do
      Player.action(player, :up)
      {:noreply, socket}
    end

    def handle_in("a", _msg, socket = %{player: player}) do
      Player.action(player, :left)
      {:noreply, socket}
    end

    def handle_in("s", _msg, socket = %{player: player}) do
      Player.action(player, :down)
      {:noreply, socket}
    end

    def handle_in("d", _msg, socket = %{player: player}) do
      Player.action(player, :right)
      {:noreply, socket}
    end

    def handle_in(" ", _msg, socket = %{player: player}) do
      Player.action(player, :shoot)
      {:noreply, socket}
    end

    def handle_in("Enter", _msg, socket = %{player: player}) do
      Player.action(player, :shoot)
      {:noreply, socket}
    end

    def handle_in(_, _ ,socket) do
      {:noreply, socket}
    end

    #def handle_in("keypress", msg, socket) do
    #  broadcast! socket, "type" .....
    #end

end
