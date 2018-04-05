defmodule KillBill.Mixfile do
  use Mix.Project

  def project do
    [app: :kill_bill,
      version: "0.1.0",
      language: :erlang,
      deps: deps(Mix.env()),
      description: "Erlang service discovery and tracking system for clusters",
      package: package(),
      source_url: "https://github.com/aruki-delivery/columbo",
      homepage_url: "https://hex.pm/packages/columbo"]
  end

  defp deps(_) do
    [{:cowboy, "~> 1.0.3"},
      {:erlydtl, ">= 0.0.0"},
      {:columbo, "~> 0.1.0"},
      {:jsondoc, "~> 0.7.0"},
      {:gibreel, "~> 0.1.0"},
      {:narciso, "~> 0.1.0"},
      {:ex_doc, ">= 0.0.0", only: :dev}]
  end

  def package do
    [ maintainers: ["cblage"],
      licenses: ["Apache License 2.0"],
      links: %{"GitHub" => "https://github.com/aruki-delivery/columbo" } ]
  end
end