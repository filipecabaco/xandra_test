defmodule XandraTest do
  def run_cluster do
    Application.ensure_all_started(:xandra)
    {:ok, conn} = Xandra.start_link([
      nodes: ["localhost:9042"],
      pool: Xandra.Cluster,
      underlying_pool: DBConnection.Connection,
      pool_size: 10,
    ])

    Xandra.execute!(conn, "CREATE KEYSPACE IF NOT EXISTS potatoes WITH REPLICATION = {'class': 'SimpleStrategy', 'replication_factor' : 1}")
  end

  def run_single do
    Application.ensure_all_started(:xandra)
    {:ok, conn} = Xandra.start_link([
      nodes: ["localhost:9042"],
    ])

    Xandra.execute!(conn, "CREATE KEYSPACE IF NOT EXISTS potatoes WITH REPLICATION = {'class': 'SimpleStrategy', 'replication_factor' : 1}")
  end
end
