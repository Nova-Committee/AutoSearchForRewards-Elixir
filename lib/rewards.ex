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
      open_url("https://www.bing.com/search?q=#{r}")
      :timer.sleep(t)
    end
    IO.puts("Opening the rewards page...")
    open_url("https://rewards.bing.com")
  end

  defp get_integer(str, default) do
    case String.to_integer(str) do
      s when is_integer(s) -> s
      _ -> default
    end
  end

  defp open_url(url) do
    case :os.type() do
      {:unix, :darwin} -> :os.cmd(:"open #{url}")
      {:unix, :linux} -> :os.cmd(:"xdg-open #{url}")
      {:win32, :nt} -> :os.cmd(:"start #{url}")
      _ -> IO.puts("Operating System Unsupported!")
    end
  end
end