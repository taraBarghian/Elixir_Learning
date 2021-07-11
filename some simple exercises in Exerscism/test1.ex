defmodule GuessingGame do

  def game() do

  r = :rand.uniform(10)
  IO.puts (r)
  check(r)

  end

  def input(what), do: what |> IO.gets() |> String.trim() |>  String.to_integer()

  def check(r) do
    g = input("guess")

    cond do
      g<r ->
        IO.puts "smaller"
        check(r)
      g>r ->
        IO.puts  "bigger"
        check(r)
      g==r ->
        IO.puts "yesss dude !"

    end
  end
  end
