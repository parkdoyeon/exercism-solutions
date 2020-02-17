defmodule ListOps do
  # Please don't use any external modules (especially List or Enum) in your
  # implementation. The point of this exercise is to create these basic
  # functions yourself. You may use basic Kernel functions (like `Kernel.+/2`
  # for adding numbers), but please do not use Kernel functions for Lists like
  # `++`, `--`, `hd`, `tl`, `in`, and `length`.

  @spec count(list) :: non_neg_integer
  def count(l) do
    _len(l)
  end

  defp _len([h | t]) do
    1+_len(t)
  end

  defp _len([]) do
    0
  end

  @spec reverse(list) :: list
  def reverse(l) do
    _reverse(l, [])
  end

  #head를 l에 옮기고 파이프 연산자를 통해 항상 l앞에 원본 배열의 head를 삽입해주는 구조
  defp _reverse([h | t], l) do
    _reverse(t, [h | l])
  end

  defp _reverse([], acc) do
    acc
  end

  @spec map(list, (any -> any)) :: list
  def map(l, f) do
    for x <- l, do: f.(x)
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do
    _filter(l, f, [])
  end

  defp _filter([h | t], f, l) do
    if f.(h) do
      [h | _filter(t, f, l)]
    else
      _filter(t, f, l)
    end
  end

  defp _filter([], f, l) do
    l
  end

  @type acc :: any
  @spec reduce(list, acc, (any, acc -> acc)) :: acc
  def reduce(l, acc, f) do
    _reduce(l, acc, f)
  end

  defp _reduce([h | t], acc, f) do
    _reduce(t, f.(h, acc), f)
  end

  defp _reduce([], acc, f) do
    acc
  end

  @spec append(list, list) :: list
  def append(a, b) do
    _append(a, b)
  end

  defp _append([h | t], b) do
    [ h | _append(t, b)]
  end

  defp _append([], b) do
    b
  end

  @spec concat([[any]]) :: [any]
  def concat(ll) do
    _concat(ll, [])
  end

  defp _concat([h | t], l) do
    append(h, _concat(t, l))
  end

  defp _concat([], l) do
    l
  end
end
