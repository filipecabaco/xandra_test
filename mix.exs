defmodule XandraTest.Mixfile do
  use Mix.Project

  def project do
    [app: :xandra_test,
     version: "0.1.0",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [extra_applications: [:logger, :xandra]]
  end

  defp deps do
    [{:xandra, "~> 0.8.0"},
     {:poolboy, "~> 1.5"}]
  end
end
