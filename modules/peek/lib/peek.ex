defprotocol Peek do
  @fallback_to_any true
  def peek(pid)
end

defimpl Peek, for: Any do

  def peek(pid) do
    if Process.alive? pid do
      GenServer.call(pid, {:peek})
    else
      nil
    end
  end

end
