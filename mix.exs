defmodule KillBill.Mixfile do
  use Mix.Project

  def project do
    [app: :kill_bill,
      version: "3.0.0",
      deps: deps(Mix.env()),
      description: "Erlang Web Application Server",
      package: package(),
      source_url: "https://github.com/aruki-delivery/kill-bill",
      homepage_url: "https://hex.pm/packages/kill-bill"]
  end

  def application do
    [mod: {KillBill.Application, [
      default_rest_port: 6666,
      default_webapp_config: {:webapp_config, :killme, [
        {:context, '/api'},
        {:action, [
            {'session', 'Elixir.KillBill.RestSession'},
        ]}
      ]}
    ]},
    extra_applications: [:logger, :columbo],]
  end


  defp deps(_) do
    [{:cowboy, "~> 1.0.3"},
      {:erlydtl, ">= 0.0.0"},
      {:gibreel, "~> 3.0"},
      {:columbo, "~> 0.1.0"},
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