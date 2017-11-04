defmodule BulletRegistry.StateMaintainer do

  @default_name StateMaintainer
  def start_link(name) do
    Agent.start_link(&BulletRegistry.new_registry/0, name: name)
  end
  def start_link do
    start_link(@default_name)
  end

  def get_state(name) do
    Agent.get(name, fn x -> x end)
  end
  def get_state do
    get_state(@default_name)
  end

  def update_state(state, name) do
    Agent.update(name, fn _ -> state end)
  end
  def update_state(state) do
    update_state(state, @default_name)
  end
end
