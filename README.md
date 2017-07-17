# XandraTest

To setup run the cluster in Docker:
`sh cassandra.sh`

And then run it with:
1. `iex -S mix`
2. `XandraTest.run`

The current output is:

```
** (EXIT from #PID<0.175.0>) an exception was raised:                                                                                                                                    ** (FunctionClauseError) no function clause matching in Xandra.Cluster.handle_call/3                                                                                                     (xandra) lib/xandra/cluster.ex:162: Xandra.Cluster.handle_call({:checkout, #Reference<0.4287448014.3069706241.44570>, true, 15000}, {#PID<0.175.0>, #Reference<0.4287448014.3069706241.44571>}, %Xandra.Cluster{load_balancing: :random, node_refs: [{#Reference<0.4287448014.3069706241.44561>, nil}, {#Reference<0.4287448014.3069706241.44564>, nil}, {#Reference<0.4287448014.3069706241.44567>, nil}], options: [prepared_cache: #Reference<0.4287448014.3069837313.44560>, idle_timeout: 30000, pool_size: 1], pool_module: DBConnection.Connection, pool_supervisor: #PID<0.196.0>, pools: %{}})
        (stdlib) gen_server.erl:636: :gen_server.try_handle_call/4
        (stdlib) gen_server.erl:665: :gen_server.handle_msg/6
        (stdlib) proc_lib.erl:247: :proc_lib.init_p_do_apply/3

Interactive Elixir (1.4.5) - press Ctrl+C to exit (type h() ENTER for help)

12:24:57.046 [error] GenServer #PID<0.195.0> terminating
** (FunctionClauseError) no function clause matching in Xandra.Cluster.handle_call/3
    (xandra) lib/xandra/cluster.ex:162: Xandra.Cluster.handle_call({:checkout, #Reference<0.4287448014.3069706241.44570>, true, 15000}, {#PID<0.175.0>, #Reference<0.4287448014.3069706241.44571>}, %Xandra.Cluster{load_balancing: :random, node_refs: [{#Reference<0.4287448014.3069706241.44561>, nil}, {#Reference<0.4287448014.3069706241.44564>, nil}, {#Reference<0.4287448014.3069706241.44567>, nil}], options: [prepared_cache: #Reference<0.4287448014.3069837313.44560>, idle_timeout: 30000, pool_size: 1], pool_module: DBConnection.Connection, pool_supervisor: #PID<0.196.0>, pools: %{}})
    (stdlib) gen_server.erl:636: :gen_server.try_handle_call/4
    (stdlib) gen_server.erl:665: :gen_server.handle_msg/6
    (stdlib) proc_lib.erl:247: :proc_lib.init_p_do_apply/3
Last message (from #PID<0.175.0>): {:checkout, #Reference<0.4287448014.3069706241.44570>, true, 15000}
State: %Xandra.Cluster{load_balancing: :random, node_refs: [{#Reference<0.4287448014.3069706241.44561>, nil}, {#Reference<0.4287448014.3069706241.44564>, nil}, {#Reference<0.4287448014.3069706241.44567>, nil}], options: [prepared_cache: #Reference<0.4287448014.3069837313.44560>, idle_timeout: 30000, pool_size: 1], pool_module: DBConnection.Connection, pool_supervisor: #PID<0.196.0>, pools: %{}}
Client #PID<0.175.0> is alive
    (stdlib) gen.erl:169: :gen.do_call/4
    (stdlib) gen_server.erl:210: :gen_server.call/3
    (db_connection) lib/db_connection/connection.ex:50: DBConnection.Connection.checkout/2
    (db_connection) lib/db_connection.ex:920: DBConnection.checkout/2
    (db_connection) lib/db_connection.ex:742: DBConnection.run/3
    (db_connection) lib/db_connection.ex:1133: DBConnection.run_meter/3
    (db_connection) lib/db_connection.ex:636: DBConnection.execute/4
    (xandra) lib/xandra.ex:773: Xandra.execute_without_retrying/4

iex(1)>
12:24:57.047 [error] GenServer #PID<0.196.0> terminating
** (FunctionClauseError) no function clause matching in Xandra.Cluster.handle_call/3
    (xandra) lib/xandra/cluster.ex:162: Xandra.Cluster.handle_call({:checkout, #Reference<0.4287448014.3069706241.44570>, true, 15000}, {#PID<0.175.0>, #Reference<0.4287448014.3069706241.44571>}, %Xandra.Cluster{load_balancing: :random, node_refs: [{#Reference<0.4287448014.3069706241.44561>, nil}, {#Reference<0.4287448014.3069706241.44564>, nil}, {#Reference<0.4287448014.3069706241.44567>, nil}], options: [prepared_cache: #Reference<0.4287448014.3069837313.44560>, idle_timeout: 30000, pool_size: 1], pool_module: DBConnection.Connection, pool_supervisor: #PID<0.196.0>, pools: %{}})
    (stdlib) gen_server.erl:636: :gen_server.try_handle_call/4
    (stdlib) gen_server.erl:665: :gen_server.handle_msg/6
    (stdlib) proc_lib.erl:247: :proc_lib.init_p_do_apply/3
Last message: {:EXIT, #PID<0.195.0>, {:function_clause, [{Xandra.Cluster, :handle_call, [{:checkout, #Reference<0.4287448014.3069706241.44570>, true, 15000}, {#PID<0.175.0>, #Reference<0.4287448014.3069706241.44571>}, %Xandra.Cluster{load_balancing: :random, node_refs: [{#Reference<0.4287448014.3069706241.44561>, nil}, {#Reference<0.4287448014.3069706241.44564>, nil}, {#Reference<0.4287448014.3069706241.44567>, nil}], options: [prepared_cache: #Reference<0.4287448014.3069837313.44560>, idle_timeout: 30000, pool_size: 1], pool_module: DBConnection.Connection, pool_supervisor: #PID<0.196.0>, pools: %{}}], [file: 'lib/xandra/cluster.ex', line: 162]}, {:gen_server, :try_handle_call, 4, [file: 'gen_server.erl', line: 636]}, {:gen_server, :handle_msg, 6, [file: 'gen_server.erl', line: 665]}, {:proc_lib, :init_p_do_apply, 3, [file: 'proc_lib.erl', line: 247]}]}}
State: {:state, {#PID<0.196.0>, Supervisor.Default}, :one_for_one, [], :undefined, 0, 5, [], 0, Supervisor.Default, {:ok, {{:one_for_one, 0, 5}, []}}}
```
