defmodule Dictionary do
  use GenServer

  @dictionary_path "/Users/nwandera/three_letter_words"

  def start_link do
    state = %{anagrams_map: load_dict()}
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  defp load_dict() do
    File.stream!(@dictionary_path)
    |> Stream.map(&normalise_word/1)
    |> Enum.reduce(%{}, &build_anagrams_map/2)
  end

  defp build_anagrams_map(word, anagrams_map) do
    normalised_word = normalise_word(word)
    already_existing_words = Map.get(anagrams_map, normalised_word, [])
    Map.put(anagrams_map, normalised_word, already_existing_words ++ [word])
  end

  def normalise_word(word) do
    word
    |> String.strip
    |> String.downcase
    |> String.graphemes
    |> Enum.sort
    |> Enum.join
  end
end