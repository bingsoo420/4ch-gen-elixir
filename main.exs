generals = [:fit, :g, :biz]

HTTPoison.start()

generals 
|> Enum.map(& {&1, ChGenElixir.parse_general(&1)}) 
|> Map.new()
|> Jason.encode!(pretty: true) 
|> IO.puts
