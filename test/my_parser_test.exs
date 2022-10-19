defmodule MyParserTest do
  use MyParserTestSupport

  test "rule1" do
    parser = from_rule_name("rule1")

    assert {:done, {:ok, _result, ""}} = parser.("1234567890")

    assert {:continue, cont1} = parser.("12345")
    assert {:done, {:ok, _result, ""}} = cont1.("67890")
  end
end
