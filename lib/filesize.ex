defmodule Filesize do
  @symbols ~w(B KB MB GB TB PB EB ZB YB)

  @doc ~S"""
  Given a bytes value it returns a human readable format

  ## Examples
      iex> Filesize.pretty(1020)
      "1020 B"

      iex> Filesize.pretty(1024)
      "1 KB"

      iex> Filesize.pretty(1024, round: 1)
      "1.0 KB"

      iex> Filesize.pretty(124000027)
      "118 MB"

      iex> Filesize.pretty(124000027, round: 2)
      "118.26 MB"

      iex> Filesize.pretty(265318, round: 0)
      "259 KB"

      iex> Filesize.pretty(265318, round: 1)
      "259.1 KB"
  """
  def pretty(bytes, opts \\ [])
  def pretty(0, _opts), do: "0 B"
  def pretty(bytes, opts) do
    round_factor = Keyword.get(opts, :round, 0)

    e = calculate_exponent(bytes)

    bytes / :math.pow(2, e * 10)
    |> zero_round(e)
    |> user_round(round_factor)
    |> add_symbol(e)
  end

  defp calculate_exponent(bytes) do
    e = Float.floor(:math.log(bytes) / :math.log(1024))

    cond do
      e < 0 -> 0
      e > 8 -> 8
      true -> e
    end
  end

  defp zero_round(number, 0.0), do: round(number)
  defp zero_round(number, _e) do
    # Drop trailing .0
    if number == Float.floor(number) do
      round(number)
    else
      number
    end
  end

  defp user_round(number, nil), do: number
  defp user_round(number, 0), do: round(number)
  defp user_round(number, e) when is_integer(number) do
    # Convert to float
    user_round(number / 1, e)
  end
  defp user_round(number, factor), do: Float.round(number, factor)

  defp add_symbol(number, e) do
    to_string(number) <> " " <> Enum.at(@symbols, round(e))
  end
end
