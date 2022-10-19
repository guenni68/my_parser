defmodule MyParserTest do
  use MyParserTestSupport

  test "rule1" do
    parser = from_rule_name("rule1")

    assert {:done, {:ok, _result, ""}} = parser.("1234567890")

    assert {:continue, cont1} = parser.("12345")
    assert {:done, {:ok, _result, ""}} = cont1.("67890")
  end

  test "rule2" do
    parser = from_rule_name("rule2")

    assert {:continue, cont1} = parser.("one")
    assert {:done, {:ok, _result, ""}} = cont1.("")
    assert {:done, {:ok, _result, ""}} = cont1.("four")

    assert {:continue, cont2} = cont1.("two")
    assert {:continue, cont3} = cont2.("three")

    assert {:done, {:ok, _result, ""}} = cont2.("")
    assert {:done, {:ok, _result, ""}} = cont3.("four")
  end
end
