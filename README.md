1. Clone this repository and run `mix deps.get` to install dependencies.

2. Run the tests against Cowboy

```
» mix test
....
Finished in 2.5 seconds (2.5s async, 0.00s sync)
4 tests, 0 failures

Randomized with seed 23470
```

3. Run the tests against Bandit

```
» SERVER=bandit mix test
...

  1) test kills the request handler process, when the client closes connection (ClientDisconnectsWeb.DisconnectsTest)
     test/client_disconnects_web/disconnects_test.exs:20
     Expected false or nil, got true
     code: refute Process.alive?(pid)
     arguments:

         # 1
         #PID<0.693.0>

     stacktrace:
       test/client_disconnects_web/disconnects_test.exs:38: (test)


Finished in 2.6 seconds (2.6s async, 0.00s sync)
4 tests, 1 failure

Randomized with seed 621033
```

