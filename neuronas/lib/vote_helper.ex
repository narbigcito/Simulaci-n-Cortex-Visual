defmodule VoteHelper do
  @moduledoc """
  Módulo que administra las votaciones.
  """

  @doc """
  Realiza las votaciones del estado.
  """
  @spec vote(list, list) :: boolean
  def vote(tissue, weights) do
    tissue_length = length(tissue)

    total_votes =
      Enum.reduce(1..tissue_length, 0, fn i, total_votes ->
        weigh = Enum.at(weights, i - 1)
        neuron_state = Enum.at(tissue, i - 1)

        if neuron_state do
          total_votes + weigh
        else
          total_votes + weigh * -1
        end
      end)

    total_votes > 0
  end
end
