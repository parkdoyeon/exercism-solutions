defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"

  should i crack the case that already has acronym like GNU?
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    ~w/#{string}/
    |> Enum.map(& get_acronym(&1))
    |> Enum.join("")
  end

  def get_acronym(word) do
    with only_letters when only_letters != "" <- word |> String.replace(~r/[^a-zA-Z]/, "") do
      if only_letters == String.upcase(only_letters) do
        only_letters |> String.at(0)
      else
        [h_letter | t_letters] = only_letters |> String.split("", trim: true)
        tail_abbreviate = find_upper(t_letters, []) |> Enum.join("")
        "#{h_letter}#{tail_abbreviate}" |> String.upcase()
      end
    else
      _ -> nil
    end
  end

  def find_upper([head | tail], acc) do
    if String.upcase(head) == head do
      find_upper(tail, [head | acc])
    else
      find_upper(tail, acc)
    end
  end

  def find_upper([], acc) do
    acc |> Enum.reverse()
  end
end
