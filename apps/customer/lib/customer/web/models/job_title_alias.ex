defmodule Customer.Web.JobTitleAlias do
  use Customer.Web, :model

  schema "job_title_aliases" do
    field :name, :string
    timestamps

    belongs_to :job_title, JobTitle
  end

  @required_fields ~w(name job_title_id)a

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct \\ %__MODULE__{}, params \\ %{}) do
    struct
    |> cast(params, @required_fields)
    |> validate_required(@required_fields)
    |> unique_constraint(:name)
  end

  def build(params) do
    changeset(%__MODULE__{}, params)
  end

#  def get_or_find_approximate_job_title(job_title) do
#    case Repo.get_by(__MODULE__, name: job_title) do
#      %__MODULE__{job_title_id: job_title_id} -> {:ok, job_title_id}
#      _ -> find_approximate_job_title(Repo.all(__MODULE__), transform_to_string(job_title))
#    end
#  end
#
#  defp find_approximate_job_title([], job_title) do
#    {:error, job_title}
#  end
#
#  defp find_approximate_job_title([%__MODULE__{name: name, job_title_id: job_title_id}| remaining], job_title) do
#    if approximate_word?(transform_to_string(name), job_title) do
#       {:ok, job_title_id}
#    else
#       find_approximate_job_title(remaining, job_title)
#     end
#  end
#
#  defp transform_to_string(word) do
#    word
#    |> String.replace(~r/[\s,\.-_]/, "", global: true)
#    |> String.downcase
#  end
#
#  defp approximate_word?(word1, word2) do
#    String.jaro_distance(word1, word2) >= @approximate_word_threshold
#  end

end
