g = File.read!("g_catalog.json") |> Jason.decode!(keys: :atoms)

ChGenElixir.parse_general(g, :g)
|> dbg


