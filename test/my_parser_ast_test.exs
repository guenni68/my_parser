defmodule MyParserAstTest do
  use MyParserTestSupport

  test "boolean1" do
    parser = from_rule_name("boolean1") |> finalize()

    assert {:done, {:ok, [{:True, []}], ""}} = parser.("true")
    assert {:done, {:ok, [{:False, []}], ""}} = parser.("false")
  end
end
