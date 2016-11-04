defmodule Filesize.Mixfile do
  use Mix.Project

  def project do
    [app: :filesize,
     version: "0.1.1",
     elixir: "~> 1.3",
     description: description(),
     package: package(),
     deps: deps()
   ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger]]
  end

  def description() do
    """
    Very small module to turn a bytes value into a human readable format
    """
  end

  def package() do
    [
      maintainers: ["Mario Behrendt"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/slickcoach/filesize"
      }
   ]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.14", only: :dev}
    ]
  end
end
