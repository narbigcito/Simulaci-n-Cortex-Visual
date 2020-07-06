defmodule Neuronas do
  @moduledoc """
  Documentation for `Neuronas`.
  """

  alias TissueHelper
  alias TrainerHelper
  alias VoteHelper

  @doc """
  Foo
  """
  def run_individual(tissue, weights) do
    TissueHelper.print(tissue)
    IO.inspect(weights, label: "Pesos finales")
    new_tissue = TissueHelper.weight_to_tissue(weights)

    tissue == new_tissue
  end

  @doc """
  Foo
  """
  def run_global(tissue, weights) do
    TissueHelper.print(tissue)
    IO.inspect(weights, label: "Pesos finales")
    VoteHelper.vote(tissue, weights)
  end
end
