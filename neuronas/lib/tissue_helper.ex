defmodule TissueHelper do
  @moduledoc """
  Módulo que administra los tejidos neurolanes.
  """

  @doc """
  Genera el tejido por defecto.
  """
  @spec get_default_tissue() :: list
  def get_default_tissue() do
    [true, false, true, false, true, false, true, false, true]
  end

  @doc """
  Genera un tejido neuronal al azar.
  """
  @spec generate_random_tissue(integer) :: list
  def generate_random_tissue(size) do
    Enum.map(1..size, fn _i -> :rand.uniform(2) == 1 end)
  end

  @doc """
  Convierte un peso a un tejido
  """
  @spec weight_to_tissue(integer) :: list
  def weight_to_tissue(weights) do
    Enum.map(weights, fn weight -> weight > 0 end)
  end

  @doc """
  Imprime una red neuronal.
  """
  @spec print(map) :: list
  def print(tissue) do
    IO.inspect(tissue)
  end
end
