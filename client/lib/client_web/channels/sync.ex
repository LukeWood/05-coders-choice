defmodule Client.Sync do
  use Phoenix.Channel

  def join("sync", _message, socket) do
    { :ok, socket }
  end

  def handle_in("time", _options, socket) do
    {:reply, {:ok, %{time: :erlang.system_time(:millisecond)}}, socket}
  end

end
