defmodule RaindropsFirstTrial do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t()
  def convert(number) do
    number
    |> get_prime_factors(number, [])
    |> make_rain_sound()
    |> check_completion(number)
  end

  def get_prime_factors(number, n, acc) when n == 1 do
    [1 | acc]
  end

  def get_prime_factors(number, n, acc) do
    if rem(number, n) == 0 do
      get_prime_factors(number, n-1, [n | acc])
    else
      get_prime_factors(number, n-1, acc)
    end
  end

  def make_rain_sound(prime_factors) do
    prime_factors
    |> Enum.reduce("", fn n, acc ->
      case n do
        3 -> acc <> "Pling"
        5 -> acc <> "Plang"
        7 -> acc <> "Plong"
        _ -> acc
      end
    end)
  end

  def check_completion(rain_sound, number) do
    if rain_sound == "" do
      "#{number}"
    else
      rain_sound
    end
  end

end
