defmodule Anagram do
  @doc """
    Finds anagrams of a word from a dictionary

    ## Examples
        iex> Anagram.find("rat", ["act", "rat", "art", "tar"])
        ["art", "tar"]
  """
  def find(word) do
    word
    |> Dictionary.normalise_word
    |> Dictionary.find_anagrams
    |> Enum.reject(fn(anagram) -> anagram == word end)
  end
end