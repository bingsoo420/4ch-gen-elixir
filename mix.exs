defmodule ChGenElixir.MixProject do
  use Mix.Project

  def project do
    [
      app: :ch_gen_elixir,
      escript: escript_config(),
      version: "0.1.0",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:jason, "~> 1.4"},
      {:httpoison, "~> 1.8"}
    ]
  end

  defp escript_config do
    [main_module: Main]
  end
end
