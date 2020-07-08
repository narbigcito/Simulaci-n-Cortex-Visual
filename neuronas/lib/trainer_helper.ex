defmodule TrainerHelper do
  @moduledoc """
  Módulo que se encarga de entrenar la red.
  """

  alias TissueHelper

  @doc """
  Devuelve una lista de pesos inicializada en 0
  """
  @spec get_zero_weights(integer) :: list
  def get_zero_weights(size) do
    Enum.map(1..size, fn _i -> 0 end)
  end

  @doc """
  Entrena a una red de neuronas.
  """
  @spec train(map, integer) :: list
  def train(expected_tissue, number_of_tests) do
    expected_tissue
    |> length()
    |> get_zero_weights()
    |> train(expected_tissue, number_of_tests)
  end

  @spec train(map, map, integer) :: list
  def train(weights, expected_tissue, number_of_tests) when is_integer(number_of_tests) do
    Enum.reduce(1..number_of_tests, weights, fn _i, weights ->
      random_value = :rand.uniform(2)
      size = length(expected_tissue)

      tissue =
        if random_value == 1 do
          TissueHelper.get_default_tissue()
        else
          TissueHelper.generate_random_tissue(size)
        end

      train(weights, expected_tissue, tissue)
    end)
  end

  @spec train(map, map, map) :: list
  def train(weights, expected_tissue, tissue) do
    vote_result = VoteHelper.vote(tissue, weights)

    {weights, _i} =
      Enum.map_reduce(weights, 0, fn weight, i ->
        state_neuron = Enum.at(tissue, i)
        expected_state_neuron = Enum.at(expected_tissue, i)
        weight = calculate_weight(vote_result, state_neuron, expected_state_neuron, weight)
        {weight, i + 1}
      end)

    weights
  end

  # Compara dos estados neuronales y actualiza el valor del peso.
  @spec calculate_weight(boolean, boolean, boolean, integer) :: integer
  defp calculate_weight(
         vote_result,
         state_neuron,
         expected_state_neuron,
         weight
       ) do
    case {expected_state_neuron and state_neuron, vote_result} do
      {true, true} -> weight + 1
      {true, false} -> weight + 2
      {false, true} -> weight - 2
      {false, false} -> weight - 1
    end
  end
end
