defmodule WordCountTest do
  use ExUnit.Case

  test "sequential implementation counts words correctly" do
    input = "words words should should appear appear twice twice"

    assert PBBS.Strings.WordCount.Sequential.word_count(input) == %{
             "words" => 2,
             "should" => 2,
             "appear" => 2,
             "twice" => 2
           }
  end

  test "parallel implementation counts words correctly" do
    input = "words words should should appear appear twice twice lol lol lol words test"

    assert PBBS.Strings.WordCount.Parallel.word_count(input, 2) == %{
             "words" => 3,
             "should" => 2,
             "appear" => 2,
             "twice" => 2,
             "lol" => 3,
             "test" => 1
           }
  end

  test "works on large file" do
    {:ok, input} = File.read("data/inputs/word_count/text.txt")
    assert PBBS.Strings.WordCount.Parallel.word_count(input, 6) == PBBS.Strings.WordCount.Sequential.word_count(input)
  end
end
