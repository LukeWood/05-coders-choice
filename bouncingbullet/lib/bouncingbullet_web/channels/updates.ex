defmodule BouncingbulletWeb.Updates do

  use Phoenix.Channel

  def join("updates", _message, socket) do
    { :ok, socket }
  end

end
