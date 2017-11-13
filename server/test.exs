{:ok, world} = World.new
{:ok, p1} = Player.new world
{:ok, p2} = Player.new world
import Player
action(p1, :left)
:timer.sleep(1000)
action(p1, :right)
action(p1, :stop)
action(p1, :shoot)
:timer.sleep(1300)

IO.puts "P1 Alive: #{Process.alive?(p1)}"

IO.puts "P2 Alive: #{Process.alive?(p2)}"
