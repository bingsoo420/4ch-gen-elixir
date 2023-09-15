defmodule ChGenElixir do
  @moduledoc """
  Documentation for `ChGenElixir`.
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

  @doc """
  Parses a string and returns a map of general threads.

  ## Examples
      iex> ChGenElixir.parse_general(:g)
      %{
       "wdg" => "https://boards.4chan.org/g/thread/123456789",
      }

  """
  def parse_general(board) do
    case HTTPoison.get("https://a.4cdn.org/#{board}/catalog.json", [], hackney: [pool: false]) do
      {:ok, %{body: body}} ->
        Jason.decode!(body, keys: :atoms) |> parse_general(board)

      {:error, %{reason: reason}} ->
        IO.puts("Error: #{reason}")

      _ ->
        IO.puts("Unknown error")
    end
  end
end
