defmodule BobTrial do
  def hey(input) when is_binary(input) do
    cond do
      String.trim(input) == "" ->
        "Fine. Be that way!"
      String.upcase(input) != input and String.trim(input) |> String.ends_with?("?") ->
          "Sure."
      !_hasChar(input) and String.trim(input) |> String.ends_with?("?") ->
        "Sure."
      _hasChar(input) and input =~ "?" and input =~ "!" ->
        "Calm down, I know what I'm doing!"
      _hasChar(input) and String.trim(input) |> String.ends_with?("?") ->
        "Calm down, I know what I'm doing!"
      _hasChar(input) and String.upcase(input) == input ->
        "Whoa, chill out!"
      _hasChar(input) and String.upcase(input) == input and input =~ "!" ->
        "Whoa, chill out!"
      true ->
        "Whatever."
    end
  end

  defp _hasChar(raw) do
    Regex.match?(~r/[[:alpha:]]/, raw)
  end
end
