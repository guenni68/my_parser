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

  test "boolean" do
    parser = from_rule_name("boolean") |> finalize()

    succeed = succeed_parse(parser)
    fail = fail_parse(parser)

    succeed.("True")
    succeed.("FaLse")
    fail.("someThingElse")
  end

  test "number" do
    parser = from_rule_name("number") |> finalize()

    succeed = succeed_parse(parser)
    fail = fail_parse(parser)

    succeed.("12345")
    succeed.("12345.6789")
    fail.("someThingElse")
  end

  test "date" do
    parser = from_rule_name("date") |> finalize()

    succeed = succeed_parse(parser)
    fail = fail_parse(parser)

    succeed.("2022-01-01")
    succeed.("-1999-12-01")
    fail.("1-1-1")
  end
end
