defmodule MyParserTestSupport do
  @moduledoc false

  defmacro __using__(_opts) do
    quote do
      use ExUnit.Case

      import MyParser

      defp succeed_parse(parser) do
        final_parser = parser |> finalize()

        fn input ->
          assert {:done, {:ok, _result, ""}} = final_parser.(input)
        end
      end

      defp fail_parse(parser) do
        final_parser = parser |> finalize()

        fn input ->
          assert {:done, {:error, _reason}} = final_parser.(input)
        end
      end
    end
  end
end
