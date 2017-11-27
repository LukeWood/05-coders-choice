use Mix.Config

config :bullet,
  speed: 3,
  radius: 2

config :player,
  speed: 2,
  radius: 25,
  reload: 10

config :world,
  width:  1000,
  height: 1000,
  interval: 10

import_config("../modules/client/config/config.exs")
