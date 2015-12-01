defmodule Takeanumber.Workspace do
  use GenServer

  def get(key), do: GenServer.call(__MODULE__, {:get, key})
  def get(key, default) do
    unless get(key), do: set(key, default)
    get(key)
  end

  def set(key, value), do: GenServer.cast(__MODULE__, {:set, key, value})

  def start_link(initial_state), do: GenServer.start_link(__MODULE__, initial_state,  [name: __MODULE__])

  def init(initial_state), do: {:ok, initial_state}

  def handle_call({:get, key}, _from, state), do: {:reply, Map.get(state, key), state}
  def handle_cast({:set, key, value}, state), do: {:noreply, Map.put(state, key, value)}

end
