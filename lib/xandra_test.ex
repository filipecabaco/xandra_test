defmodule XandraTest do
  def conn_cluster do
    {:ok, conn} = Xandra.start_link([
      nodes: ["localhost:9042", "localhost:9142", "localhost:9242"],
      pool: Xandra.Cluster,
      underlying_pool: DBConnection.Poolboy,
      pool_size: 10,
    ])
    conn
  end

  def conn_single do
    {:ok, conn} = Xandra.start_link([
      nodes: ["localhost:9042"]
    ])
    conn
  end

  def query_cluster(conn) do
    {:ok, stm} = Xandra.prepare(conn, "USE system", [pool: Xandra.Cluster])
    Xandra.execute(conn, stm, [], [pool: Xandra.Cluster])
  end

  def query_single(conn) do
    {:ok, stm} = Xandra.prepare(conn, "USE system")
    Xandra.execute(conn, stm, [], [])
  end


  def run(:single), do: conn_single |> query_single
  def run(:cluster), do: conn_cluster |> query_cluster
end
