defmodule Arc.Mixfile do
  use Mix.Project

  @version "0.10.0"

  def project do
    [app: :arc,
     version: @version,
     elixir: "~> 1.4",
     deps: deps(),

    # Hex
     description: description(),
     package: package()]
  end

  defp description do
    """
    Flexible file upload and attachment library for Elixir.
    """
  end

  defp package do
    [maintainers: ["Sean Stavropoulos"],
     licenses: ["Apache 2.0"],
     links: %{"GitHub" => "https://github.com/stavro/arc"},
     files: ~w(mix.exs README.md CHANGELOG.md lib)]
  end

  def application do
    [
      applications: [
        :logger,
        :httpoison,
      ] ++ applications(Mix.env)
    ]
  end

  def applications(:test), do: [:ex_aws, :ex_aws_s3, :poison]
  def applications(_), do: []

  defp deps do
    [
      {:httpoison, "~> 0.13"}, # Required for downloading remote files

      # If using Amazon S3
      {:ex_aws, "~> 2.1", optional: true},
      {:ex_aws_s3, git: "https://github.com/OnceApp/ex_aws_s3.git", optional: true},
      {:poison, "~> 2.2 or ~> 3.1", optional: true},
      {:sweet_xml, "~> 0.6", optional: true},

      # Test
      {:mock, "~> 0.1", only: :test},

      # Dev
      {:ex_doc, "~> 0.14", only: :dev}
    ]
  end
end
