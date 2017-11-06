defmodule Player.Agent do

  alias Player.Impl, as: Impl

  def create_event_handler(pid) do
    fn _ ->
      tick(pid)
    end
  end

  def tick(pid) do
    Agent.update(pid, &Impl.tick/1)
    pid
  end

  def peek(pid) do
    Agent.get(pid, &(&1))
  end

  def action(pid, action) do
    Agent.update(pid, &(Impl.action(&1, action)))
    pid
  end

end
