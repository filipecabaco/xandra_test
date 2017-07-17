defmodule XandraTest do
  Application.ensure_all_started(:xandra)
  {:ok, conn} = Xandra.start_link([
    nodes: ["localhost:9042", "localhost:9043", "localhost:9044"],
    pool: Xandra.Cluster,
    underlying_pool: DBConnection.Connection,
    pool_size: 1,
  ])

  stm = Xandra.prepare(conn, "CREATE KEYSPACE IF NOT EXISTS tests WITH REPLICATION = {'class': 'SimpleStrategy', 'replication_factor' : 1}")

  Xandra.execute(conn, stm)
end
