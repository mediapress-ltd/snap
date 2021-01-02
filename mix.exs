defmodule Snap.MixProject do
  use Mix.Project

  @github_url "https://github.com/tomtaylor/snap"

  def project do
    [
      app: :snap,
      version: "0.1.1",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      elixirc_paths: elixirc_paths(Mix.env()),
      deps: deps(),
      name: "Snap",
      description: "A modern Elasticsearch client",
      source_url: @github_url,
      homepage_url: @github_url,
      files: ~w(mix.exs lib LICENSE.md README.md CHANGELOG.md),
      docs: [
        main: "Snap",
        groups_for_modules: [
          Authentication: [
            Snap.Auth,
            Snap.Auth.Plain
          ],
          "Bulk operations": [
            Snap.Bulk.Action.Create,
            Snap.Bulk.Action.Index,
            Snap.Bulk.Action.Update,
            Snap.Bulk.Action.Delete
          ]
        ]
      ],
      package: [
        maintainers: ["Tom Taylor"],
        licenses: ["MIT"],
        links: %{
          "GitHub" => @github_url
        }
      ],
      dialyzer: dialyzer()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp elixirc_paths(env) when env in ~w(test)a, do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp dialyzer do
    [
      plt_core_path: "priv/plts",
      plt_file: {:no_warn, "priv/plts/dialyzer.plt"}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:finch, "~> 0.6"},
      {:castore, "~> 0.1.0"},
      {:jason, "~> 1.0"},
      {:telemetry, "~> 0.4"},
      {:ex_doc, "~> 0.23", only: :dev, runtime: false},
      {:dialyxir, "~> 1.0", only: :dev, runtime: false}
    ]
  end
end
