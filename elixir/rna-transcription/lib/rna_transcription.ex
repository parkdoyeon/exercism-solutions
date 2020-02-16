defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    dna =
      Enum.to_list(dna)
      |> Enum.reduce([], fn (x, acc) ->
          case x do
            ?G -> [?C | acc]
            ?C -> [?G | acc]
            ?T -> [?A | acc]
            ?A -> [?U | acc]
          end
        end)
      |> Enum.reverse
  end
end
