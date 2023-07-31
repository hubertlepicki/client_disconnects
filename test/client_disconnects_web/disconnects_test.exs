defmodule ClientDisconnectsWeb.DisconnectsTest do
  use ExUnit.Case, async: true

  test "keeps the request handler process alive while client maintains open connection" do
    task =
      Task.async(fn ->
        Finch.build(:get, "http://localhost:4002/api/infinity/abcd1234")
        |> Finch.request(HttpClient, receive_timeout: 1_000)
      end)

    :timer.sleep(500)

    [{pid, _}] = Registry.lookup(ClientDisconnectsWeb.Registry, "abcd1234")

    assert Process.alive?(pid)

    Task.await(task)
  end

  test "kills the request handler process, when the client closes connection" do
    task =
      Task.async(fn ->
        Finch.build(:get, "http://localhost:4002/api/infinity/efgh5679")
        |> Finch.request(HttpClient, receive_timeout: 1_000)
      end)

    :timer.sleep(500)

    [{pid, _}] = Registry.lookup(ClientDisconnectsWeb.Registry, "efgh5679")

    assert Process.alive?(pid)

    Task.await(task)

    # This is required for the Cowboy process to detect the client has closed the connection
    :timer.sleep(500)

    refute Process.alive?(pid)
  end
end
