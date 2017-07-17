defmodule XandraTest do
  def run_cluster do
    Application.ensure_all_started(:xandra)
    {:ok, conn} = Xandra.start_link([
      nodes: ["localhost:9042", "localhost:9043", "localhost:9044"],
      pool: Xandra.Cluster,
      underlying_pool: DBConnection.Poolboy,
      pool_size: 10,
    ])
    Xandra.execute(conn, "CREATE KEYSPACE IF NOT EXISTS potatoes WITH REPLICATION = {'class': 'SimpleStrategy', 'replication_factor' : 1}", [], [pool: Xandra.Cluster])
  end

  def run_single do
    Application.ensure_all_started(:xandra)
    {:ok, conn} = Xandra.start_link([
      nodes: ["localhost:9042"]
    ])

    Xandra.execute(conn, "CREATE KEYSPACE IF NOT EXISTS potatoes WITH REPLICATION = {'class': 'SimpleStrategy', 'replication_factor' : 1}")
  end
end
