defmodule MyParserAstTest do
  use MyParserTestSupport

  test "boolean AST" do
    parser = from_rule_name("boolean") |> finalize()

    assert {:done, {:ok, [{:True, []}], ""}} = parser.("true")
    assert {:done, {:ok, [{:False, []}], ""}} = parser.("false")
  end

  test "number AST" do
    parser = from_rule_name("number") |> finalize()

    assert {:done, {:ok, [{:integer, ["12345"]}], ""}} = parser.("12345")
    assert {:done, {:ok, [{:double, ["12345.67890"]}], ""}} = parser.("12345.67890")
  end
end
