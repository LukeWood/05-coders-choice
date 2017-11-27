defprotocol Peek do
  @fallback_to_any true
  def peek(pid)
end

defimpl Peek, for: Any do

  defp sanitize(state) do
    Map.drop(state, [:world])
  end

  def peek(pid) do
    if Process.alive? pid do
      GenServer.call(pid, {:peek}) |> sanitize()
    else
      nil
    end
  end

end
