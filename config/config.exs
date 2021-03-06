use Mix.Config

config :bullet,
  speed: 3,
  radius: 2

config :player,
  speed: 2,
  radius: 25,
  reload: 10

config :world,
  width:  750,
  height: 750,
  interval: 10

import_config("../modules/client/config/config.exs")
