defmodule Player.Agent do

  alias Player.Impl, as: Impl

  def tick(pid) do
    Agent.update(pid, &Impl.tick/1)
    pid
  end

  def peek(pid) do
    Agent.get(pid, &(&1))
  end

  def action(pid, action) do
    Agent.update(pid, &(Impl.action(&1, action)))
  end

end
