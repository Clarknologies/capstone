1. Copy `.env.example` to `.env` and change `POSTGRES_CONNECTION_STRING`
2. Run `goose postgres $POSTGRES_CONNECTION_STRING up --dir database/migrations/
