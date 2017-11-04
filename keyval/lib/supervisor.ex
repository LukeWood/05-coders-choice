defmodule KeyVal.Supervisor do
  def start_link do
    import Supervisor.Spec
    children =  [
      worker(KeyVal, [])
    ]
    opts = [
      strategy: :one_for_one,
      restart: :permanent,
      name: KeyVal
    ]
    {:ok, _pid} = Supervisor.start_link(children, opts)
  end
end
