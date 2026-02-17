defmodule Blueprint.Test.Blueprints.BehaviourStruct do
  @behaviour Blueprint

  defstruct [:value]

  @impl true
  def __blueprint__(value) do
    {:ok, %__MODULE__{value: value}}
  end
end

schema = [
  number: [type: :integer, required: true],
  string: [type: :string],
  anything: [type: :any]
]

defmodule Blueprint.Test.Blueprints.UsingStruct do
  use Blueprint,
    schema: schema

  def schema, do: unquote(schema)
end

defmodule Blueprint.Test.Blueprints.UsingStructWithTypespecForAnything do
  use Blueprint,
    schema: schema,
    typespecs_for: [:anything]

  def schema, do: unquote(schema)
end
