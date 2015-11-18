defmodule Takeanumber.Stash do
  use GenServer

  def get(), do: GenServer.call(__MODULE__, :get)
  def set(value), do: GenServer.cast(__MODULE__, {:set, value})

  def start_link(initial_state), do: GenServer.start_link(__MODULE__, initial_state,  [name: __MODULE__])

  def init(initial_state), do: {:ok, initial_state}

  def handle_call(:get, _from, state), do: {:reply, state, state}
  def handle_cast({:set, new_state}, state), do: {:noreply, new_state}

end
