defmodule Anagram do

  @doc """
    Finds anagrams of a word from a dictionary

    ## Examples
        iex> Anagram.find("rat", ["act", "rat", "art", "tar"])
        ["art", "tar"]
  """
  def find(word, dictionary) do
    normalise_dictionary(dictionary)
    |> Map.get(normalise(word), [])
    |> Enum.reject(fn(anagram) -> anagram == word end)
  end

  defp normalise_dictionary(dict) do
    Enum.reduce(dict, %{}, fn(word, normalised_dict) ->
      normalised_word = normalise(word)
      matching_words = Map.get(normalised_dict, normalised_word, [])
      Map.put(normalised_dict, normalised_word, matching_words ++ [word])
    end)
  end

  defp normalise(word) do
    word
    |> String.strip
    |> String.downcase
    |> String.graphemes
    |> Enum.sort
    |> Enum.join
  end
end