defmodule BeerSong do
  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t()
  def verse(number) do
    """
    #{_bottle(number) |> String.capitalize()} of beer on the wall, #{_bottle(number)} of beer.
    #{_takeOrGo(number)}, #{_bottle(number-1)} of beer on the wall.
    """
  end

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t()) :: String.t()
  def lyrics(range \\ 99..0) do
    Enum.map(range, &(verse &1)) |> Enum.join("\n")
  end

  defp _bottle(n) do
    cond do
      n == 1 -> "1 bottle"
      n == 0 -> "no more bottles"
      n < 0 -> "99 bottles"
      true -> "#{n} bottles"
    end
  end

  defp _takeOrGo(n) do
    cond do
      n == 0 -> "Go to the store and buy some more"
      n == 1 -> "Take it down and pass it around"
      true -> "Take one down and pass it around"
    end
  end

end
