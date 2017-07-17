# XandraTest

To setup run the cluster in Docker:
`sh cassandra.sh`

And then run it with:
1. `iex -S mix`
2. `XandraTest.run(:cluster)` to test connection to cluster
3. `XandraTest.run(:single)` to test connection to single node
