# Use repo in custom mix task

https://stackoverflow.com/questions/38225406/how-to-get-data-from-ecto-in-a-custom-mix-task

```
  import Mix.Ecto
  alias Pm.Repo

  def run(args) do
    ensure_started(Pm.Repo, [])

    Repo.get(Pm.Config, 1)
    |> IO.inspect()
  end
```
