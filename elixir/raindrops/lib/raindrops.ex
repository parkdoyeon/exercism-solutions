defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """

  @rain_sound %{ 3 => "Pling", 5 => "Plang", 7 => "Plong" }

  @spec convert(pos_integer) :: String.t()
  def convert(number) do
    sounds = @rain_sound |> Map.keys()
      |> Enum.filter(& rem(number, &1) == 0)
      |> Enum.map_join(& @rain_sound[&1])

      check_no_sounds(sounds) || Integer.to_string(number)
  end

  def check_no_sounds("") do
    nil
  end

  def check_no_sounds(str) do
    str
  end
end
