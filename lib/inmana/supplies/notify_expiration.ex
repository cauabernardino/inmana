defmodule Inmana.Supplies.NotifyExpiration do
  alias Inmana.Mailer
  alias Inmana.Supplies.{ExpirationEmail, GetByExpiration}

  def send do
    supplies_about_to_expire = GetByExpiration.call()

    Enum.each(supplies_about_to_expire, fn {to_mail, supplies} ->
      to_mail
      |> ExpirationEmail.create(supplies)
      |> Mailer.deliver_later!()
    end)
  end
end
