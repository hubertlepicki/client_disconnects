defmodule ClientDisconnectsWeb.InfinityController do
  use ClientDisconnectsWeb, :controller

  def sleep(conn, %{"token" => token}) do
    {:ok, _} = Registry.register(ClientDisconnectsWeb.Registry, token, nil)

    :timer.sleep(:infinity)
    send_resp(conn, 200, "OK")
  end
end
