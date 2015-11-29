defmodule WorkspaceTest do
  use ExUnit.Case
  doctest Takeanumber.Workspace
  alias Takeanumber.Workspace

  test "can add element to workspace" do
    Workspace.set(:foo, 1)
    assert Workspace.get(:foo) == 1
  end

  test "can add multiple elements" do
    Workspace.set(:bar, 1)
    Workspace.set(:foo, 2)
    assert Workspace.get(:bar) == 1
    assert Workspace.get(:foo) == 2
  end

  test "can modify the value of an existing element" do
    Workspace.set(:bar, 1)
    assert Workspace.get(:bar) == 1
    Workspace.set(:bar, 2)
    assert Workspace.get(:bar) == 2
  end
end
