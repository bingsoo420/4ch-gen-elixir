defmodule Main do
  @generals [:fit, :g, :biz]

  alias ChGenElixir, as: Gen

  def main(_argv) do
    @generals
    |> Enum.map(&{&1, Gen.parse_general(&1)})
    |> Map.new()
    |> Jason.encode!(pretty: true)
    |> IO.puts()
  end
end
