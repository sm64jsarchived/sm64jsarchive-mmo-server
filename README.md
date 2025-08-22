# sm64jsarchive-mmo-server

## Links

[Main Website: sm64jsarchive.com](https://sm64jsarchive.com)

[Discord Server](https://discord.gg/eA5hkV4nnU)

## Prerequisites

- copy and rename the file `.env.template` to `.env` and insert your environment variables.
- Postgres database, e.g. via [Docker](https://hub.docker.com/_/postgres/).
  - for convenience there is a Docker Compose file,
    that you can start via `docker compose up` or `docker compose up -d`
  - if you want to change the `topsecretpassword`, you will have to do this in the
    `docker-compose.yml` file and `.env` file
- `libpq-dev` for Debian based distros.
- install [Diesel CLI](https://diesel.rs/) via
`cargo install --version ^1 diesel_cli --no-default-features --features postgres`
- navigate to `crates/sm64js-db` and run `diesel migration run`

## Development

Run `git clone https://github.com/sm64jsarchived/sm64jsarchive.git client` to get the client.

The server will also serve client assets, so they first need to be compiled.
You will have to navigate to the `client` folder and run `npm run build` once after installing dependencies
via `npm install`.
For development you can instead run `npm run build:dev`
or use webpack-dev-server (WIP).

In your `.env` file, you don't have to insert all variables for local development.
It is only mandatory to have a running Postgres database, thus you need to set the `DATABASE_URL` variable.
Currently only Google sign-in is mocked, so you will have to use this,
if you cannot set up the Discord environment variables.

You can then start the server via `cargo run`.
Then navigate to `http://localhost:3060`.
Every time you make changes to the client, you will have to rebuild client assets via `npm run build:dev`.
Restarting the server is not required.

### Adding new levels

To add a new level for the MMO server, you need to do these tasks:

- Define a good levelId. If it is a custom level, you should be using a levelId >= 1000.
  Otherwise use the levelId that is also internally used by Super Mario 64
- Add the name and levelId to [./client/src/utils.js]() `levelIdToName` constant.
- Add the name and levelId to [./client/src/index.html]() `#mapSelect` selection.
