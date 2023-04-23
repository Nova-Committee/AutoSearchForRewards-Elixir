defmodule Rewards do
  use Application
  @moduledoc """
  Documentation for `Rewards`.
  """

  def start(_type, _args) do
    IO.puts("Welcome to AutoSearchForRewards!")
    f = get_integer(String.trim(IO.gets("Please enter the number of searches: ")), 10)
    t = get_integer(String.trim(IO.gets("Please enter a search interval (milliseconds): ")), 100)
    IO.puts("Launching...")
    :timer.sleep(1000)
    for i <- 1..f do
      IO.puts("Execution in progress, No.#{i}...")
      r = :rand.uniform() * 100
      :os.cmd(:"start https://www.bing.com/search?q=#{r}")
      :timer.sleep(t)
    end
    IO.puts("Opening the rewards page...")
    :os.cmd(:"start https://rewards.bing.com")
  end

  defp get_integer(str, default) do
    case String.to_integer(str) do
      s when is_integer(s) -> s
      _ -> default
    end
  end
end