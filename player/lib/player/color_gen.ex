defmodule Player.ColorGen do

  def color_list do
    [
      "#FB8C00",
      "#00E676",
      "#00BFA5",
      "#00E5FF",
      "#00B0FF",
      "#2979FF",
      "#651FFF",
      "#3D5AFE",
      "#D500F9",
      "#FF1744",
      "#F50057"
    ]
  end

  def color do
    Enum.random(color_list())
  end

end
