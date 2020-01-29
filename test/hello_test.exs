defmodule HelloWorldTest do
  use ExUnit.Case
  doctest HelloWorld

  def hello, do: IO.puts "Hello, World!"

  test "greets the world" do
    assert hello
  end
end