defmodule ProteinTranslation do
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: {atom, list(String.t())}
  def of_rna(rna) do
    codons = rna
    |> String.codepoints
    |> Enum.chunk_every(3)
    |> Enum.map(&Enum.join/1)
    |> Enum.map(&codon_match/1)
    |> Enum.reduce_while({:ok, []}, fn (c, {_, acc}) ->
      case c do
        "STOP" -> {:halt, {:ok, acc }}
        "INVALID" -> {:halt, {:error, "invalid RNA"}}
        _ -> {:cont, {:ok, acc ++ [c] }}
      end
    end)
  end


  @doc """
  Given a codon, return the corresponding protein

  "UGU" -> "Cysteine"
  "UGC" -> "Cysteine"
  "UUA" -> "Leucine"
  "UUG" -> "Leucine"
  "AUG" -> "Methionine"
  "UUU" -> "Phenylalanine"
  "UUC" -> "Phenylalanine"
  "UCU" -> "Serine"
  "UCC" -> "Serine"
  "UCA" -> "Serine"
  "UCG" -> "Serine"
  "UGG" -> "Tryptophan"
  "UAU" -> "Tyrosine"
  "UAC" -> "Tyrosine"
  "UAA" -> "STOP"
  "UAG" -> "STOP"
  "UGA" -> "STOP"
  """
  @spec of_codon(String.t()) :: {atom, String.t()}
  def of_codon(codon) do
    result = codon_match(codon)
    cond do
      result == "INVALID" -> {:error, "invalid codon"}
      true -> {:ok, result}
    end
  end

  defp codon_match(codon) do
    case codon do
      "UGU" -> "Cysteine"
      "UGC" -> "Cysteine"
      "UUA" -> "Leucine"
      "UUG" -> "Leucine"
      "AUG" -> "Methionine"
      "UUU" -> "Phenylalanine"
      "UUC" -> "Phenylalanine"
      "UCU" -> "Serine"
      "UCC" -> "Serine"
      "UCA" -> "Serine"
      "UCG" -> "Serine"
      "UGG" -> "Tryptophan"
      "UAU" -> "Tyrosine"
      "UAC" -> "Tyrosine"
      "UAA" -> "STOP"
      "UAG" -> "STOP"
      "UGA" -> "STOP"
      _ -> "INVALID"
    end
  end
end
