defmodule Bob do
  def hey(input) when is_binary(input) do
    cond do
      _noWord(input) -> "Fine. Be that way!"
      _question(input) -> "Sure."
      _yellQuestion(input) -> "Calm down, I know what I'm doing!"
      _yell(input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end

  defp _hasChar(raw) do
    Regex.match?(~r/[[:alpha:]]/, raw)
  end

  defp _noWord(raw) do
    String.trim(raw) == ""
  end

  defp _yell(raw) do
    _hasChar(raw) and String.upcase(raw) == raw
  end

  defp _yellQuestion(raw) do
    _hasChar(raw) and String.trim(raw) |> String.ends_with?("?")
  end

  defp _question(raw) do
    cond do
      String.upcase(raw) != raw and String.trim(raw) |> String.ends_with?("?") ->
        true
      !_hasChar(raw) and String.trim(raw) |> String.ends_with?("?") ->
        true
      true ->
        false
    end
  end
end
