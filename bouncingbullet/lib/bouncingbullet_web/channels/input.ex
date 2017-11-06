defmodule BouncingbulletWeb.Input do

    use Phoenix.Channel

    def join("input", _message, socket) do
      { :ok, socket }
    end

    def handle_in("keypress", msg, socket) do
      broadcast! socket, "type" .....
    end

end
