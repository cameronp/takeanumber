defmodule Takeanumber.NumberGen do
  use GenServer

  def next(), do: GenServer.call(__MODULE__, :get)

  def start_link() do
     GenServer.start_link(__MODULE__, {}, [name: __MODULE__])
  end

  def init(_) do
    {:ok, Takeanumber.Stash.get()}
  end

  def handle_call(:get, _from, state), do: {:reply, state, state+1}

  def terminate(_reason, state) do
    Takeanumber.Stash.set(state)
  end

end
