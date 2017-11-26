use Mix.Config

config :bullet,
  speed: 3,
  radius: 2

config :player,
  speed: 3,
  radius: 25,
  reload: 10

config :world,
  width:  500,
  height: 500,
  interval: 10

config :plug,
  bullet_speed: 3,
  bullet_radius: 2,
  player_speed: 2,
  player_radius: 25,
  game_width: 500,
  game_height: 500,
  clock_interval: 10,
  reload_time: 10
