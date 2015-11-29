defmodule Takeanumber do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(Takeanumber.Stash, [1]),
      worker(Takeanumber.Workspace, [%{}]),
      worker(Takeanumber.NumberGen, [])
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Takeanumber.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def next(), do: Takeanumber.NumberGen.next()
end
