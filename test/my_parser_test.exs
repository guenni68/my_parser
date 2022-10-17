defmodule MyParserTest do
  use ExUnit.Case
  doctest MyParser

  test "greets the world" do
    assert MyParser.hello() == :world
  end
end
