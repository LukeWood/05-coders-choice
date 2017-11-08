defmodule Observable do

  defmacro __using__(_) do
    quote do
      emit(__MODULE__, arg)
    end
  end

  @observer_registry :ObserverRegistry

  def start(_type, _args) do
    Agent.start(fn -> %{} end, name: @observer_registry)
  end

  defp observers(pid) do
    Agent.get(@observer_registry, fn state -> Map.get(state, pid) end)
  end

  def unsubscribe(emitter_pid, pid) do
    Agent.update(@observer_registry, fn state ->
      Map.update(state, emitter_pid, [], fn children ->
        Enum.filter(children, fn child -> child != pid end)
      end)
    end)
  end

  def register(emitter_pid) do
    Agent.update(@observer_registry, fn state ->
       Map.put(state, emitter_pid, [])
    end)
  end

  def emit(emitter_pid, arg) do
    observers(emitter_pid) |>
    Enum.map(fn pid ->
      GenServer.cast(pid, {arg})
    end)
  end

  def subscribe(emitter_pid, observer_pid) do
    Agent.update(@observer_registry, fn state ->
        Map.update(state,
        emitter_pid,
        [],
        fn children ->
           [observer_pid | children]
        end)
    end)
  end

end
