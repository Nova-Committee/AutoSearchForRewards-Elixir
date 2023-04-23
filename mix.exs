defmodule Rewards.MixProject do
  use Mix.Project

  def project do
    [
      app: :rewards,
      name: "autosearchforrewards",
      version: "0.1.0",
      elixir: "~> 1.14",
      description: description(),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      source_url: "https://github.com/Nova-Committee/AutoSearchForRewards-Elixir"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Rewards, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:distillery, "~> 2.0"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end

  defp description do
    "This application automatically opens bing search pages to help you win microsoft rewards."
  end

  defp package do
    [
      name: "autosearchforrewards",
      licenses: ["AGPL-3.0-or-later"],
      links: %{
        "GitHub" => "https://github.com/Nova-Committee/AutoSearchForRewards-Elixir"
      }
    ]
  end

end
