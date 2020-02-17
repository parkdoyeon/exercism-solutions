defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.downcase
    |> String.replace(~r/[,_!&:@$%^]/, " ")
    |> String.split(" ", trim: true)
    |> Enum.reduce(
      %{},
      fn (x, acc) ->
        count = acc
          |> Map.get(x, 0)
        Map.put(acc, x, count+1)
      end
    )
  end
end
