defmodule BouncingbulletWeb do

  def controller do
    quote do
      use Phoenix.Controller, namespace: BouncingbulletWeb
      import Plug.Conn
      import BouncingbulletWeb.Router.Helpers
      import BouncingbulletWeb.Gettext
    end
  end

  def view do
    quote do
      use Phoenix.View, root: "lib/bouncingbullet_web/templates",
                        namespace: BouncingbulletWeb

      import Phoenix.Controller, only: [get_flash: 2, view_module: 1]

      use Phoenix.HTML

      import BouncingbulletWeb.Router.Helpers
      import BouncingbulletWeb.ErrorHelpers
      import BouncingbulletWeb.Gettext
    end
  end

  def router do
    quote do
      use Phoenix.Router
      import Plug.Conn
      import Phoenix.Controller
    end
  end

  def channel do
    quote do
      use Phoenix.Channel
      import BouncingbulletWeb.Gettext
    end
  end

  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
