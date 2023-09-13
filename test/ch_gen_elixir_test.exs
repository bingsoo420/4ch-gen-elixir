defmodule ChGenElixirTest do
  use ExUnit.Case
  doctest ChGenElixir

  test "greets the world" do
    assert ChGenElixir.hello() == :world
  end
end
