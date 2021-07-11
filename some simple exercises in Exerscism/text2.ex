defmodule Tedede do

  def err do

    err= try do
      5/0

    rescue
      ArithmeticError -> "Can't"
    end

    IO.puts err

  end


  def something do

    spawn(fn(x) -> loop(1..5) end)
    spawn(fn(x) -> loop(45..50) end)

  end

  def loop(list) do
    IO.put
  end

  def loop[] do
    nil
  end

end
