defmodule Inmana.Supplies.NotifyExpiration do
  alias Inmana.Mailer
  alias Inmana.Supplies.{ExpirationEmail, GetByExpiration}

  def send do
    supplies_about_to_expire = GetByExpiration.call()

    supplies_about_to_expire
    |> Task.async_stream(fn {to_email, supplies} -> send_email(to_email, supplies) end)
    |> Stream.run()
  end

  defp send_email(to_email, supplies) do
    to_email
    |> ExpirationEmail.create(supplies)
    |> Mailer.deliver_later!()
  end
end
