defmodule ChGenElixir do
  @moduledoc """
  Documentation for `ChGenElixir`.
  """

  @doc """
  Parses a string and returns a map of general threads.

  ## Examples
      iex> ChGenElixir.parse_general(g)
      %{
       "wdg" => "https://boards.4chan.org/g/thread/123456789",
      }

  """
  @general_re ~r/^\/(\w+)\//
  def parse_general(binary, board) do
    binary
    |> Enum.reduce([], &(&2 ++ &1.threads))
    |> Enum.map(&{&1[:sub], &1[:no]})
    |> Enum.filter(fn
      {nil, _no} -> false
      {sub, _no} -> String.match?(sub, @general_re)
    end)
    |> Enum.map(fn {sub, no} ->
      case Regex.run(@general_re, sub) do
        nil -> nil
        [_, general] -> {general, no}
      end
    end)
    |> Map.new(fn
      {general, no} ->
        {general |> String.downcase(), "https://boards.4chan.org/#{board}/thread/#{no}"}
    end)
  end

  def parse_general(board) do
    HTTPoison.get!("https://a.4cdn.org/#{board}/catalog.json", [], hackney: [pool: false])
    |> Map.get(:body)
    |> Jason.decode!(keys: :atoms)
    |> parse_general(board)
  end
end
