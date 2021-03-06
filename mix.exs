defmodule KillBill.Mixfile do
  use Mix.Project

  def project do
    [app: :kill_bill,
      version: "6.0.0",
      deps: deps(Mix.env()),
      description: "Erlang Web Application Server",
      package: package(),
      source_url: "https://github.com/aruki-delivery/kill-bill",
      homepage_url: "https://hex.pm/packages/kill-bill"]
  end

  defp deps(_) do
    [{:cowboy, "~> 1.0.3"},
      {:erlydtl, ">= 0.0.0"},
      {:gibreel, "~> 6.0"},
      {:columbo, "~> 2.0"},
      {:jsondoc, "~> 0.7.0"},
      {:narciso, "~> 0.1.0"},
      {:ex_doc, ">= 0.0.0", only: :dev}]
  end

  def package do
    [ maintainers: ["cblage"],
      licenses: ["Apache License 2.0"],
      links: %{"GitHub" => "https://github.com/aruki-delivery/kill-bill" } ]
  end
end