# Filesize

Very small module to turn a bytes value into a human readable format.

## Installation

Install via hex by adding the following to your `mix.exs` file:

```elixir
def deps do
  [{:filesize, "~> 0.1.0"}]
end
```

## Usage

```elixir
iex> Filesize.pretty(1020)
"1020 B"

iex> Filesize.pretty(1024)
"1 KB"

iex> Filesize.pretty(124000027)
"118.26 MB"

iex> Filesize.pretty(265318, round: 0)
"259 KB"

iex> Filesize.pretty(265318, round: 1)
"259.1 KB"
```
