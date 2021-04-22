# Inmana

Inventory Management (InMana) application done within NLW#5 by Rocketseat in Elixir trail.

The app should:

- Be able to register restaurants and supplies;

- Be able to visualize information about the supplies;

- Generate a list of supplies that are about to expire weekly for each restaurant;

- The list should be sent to the restaurant email.


## Techs

- Elixir
- Phoenix Framework
- PostgreSQL
- Docker and Docker Compose

## How to run

1. Clone the repo and enter into it:

```bash
git clone https://github.com/cauabernardino/inmana.git`
cd inmana
```

2. To handle the database:

```bash
# Download the image (first time) and (re)create the container
docker-compose up -d

# Start and stop the container without deleting
docker-compose start
docker-compose stop

# Delete/restart the container 
docker-compose down -v
```

3. To start the Phoenix server:

```bash
# Install dependencies 
mix deps.get
# Create and migrate your database
mix ecto.setup
# Start Phoenix endpoint
mix phx.server
```

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
