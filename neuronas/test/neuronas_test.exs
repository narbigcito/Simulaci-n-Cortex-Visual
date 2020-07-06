defmodule NeuronasTest do
  use ExUnit.Case
  doctest Neuronas

  test "greets the world" do
    assert Neuronas.hello() == :world
  end
end
