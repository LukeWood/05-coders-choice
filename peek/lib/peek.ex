defprotocol Peek do
  @fallback_to_any true
  def peek(pid)
end

defimpl Peek, for: Any do

  def peek(pid) do
    try do
      GenServer.call(pid, {:peek})
    catch
      Any -> nil
    end
  end

end
