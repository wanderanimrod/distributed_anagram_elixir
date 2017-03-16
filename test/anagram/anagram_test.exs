defmodule Anagram.Test do
  use ExUnit.Case

  doctest Anagram

  test "should find all anagrams of a word that are in a given dictionary" do
    dictionary = ["boy", "tar", "art"]
    anagrams = Anagram.find("rat", dictionary)
    assert anagrams == ["tar", "art"]
  end

  test "should return no anagrams for word not in dictionary" do
    dictionary = ["boy"]
    anagrams = Anagram.find("word_not_in_dict", dictionary)
    assert anagrams == []
  end
end