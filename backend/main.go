package main

import (
	"context"
	"fmt"
	"log"
	"net/http"
	"os"
	"time"

	database "github.com/clarknologies/capstone/database/models"
	"github.com/jackc/pgx/v5"
	"github.com/joho/godotenv"
)

type Server struct {
	q *database.Queries
}

func main() {
	_ = godotenv.Load()

	log.SetFlags(log.LstdFlags | log.Lshortfile)

	mux := http.NewServeMux()
	ctx := context.Background()
	connectionString := os.Getenv("POSTGRES_CONNECTION_STRING")
	conn, err := pgx.Connect(ctx, connectionString)
	if err != nil {
		fmt.Println(err)
	}
	defer conn.Close(ctx)

	srv := Server{q: database.New(conn)}

	mux.HandleFunc("GET /events", srv.getAllEvents)
	mux.HandleFunc("GET /events/{eventId}", srv.getEventById)

	httpSrv := http.Server{
		Addr:         ":8080",
		ReadTimeout:  15 * time.Second,
		WriteTimeout: 15 * time.Second,
		Handler:      mux,
	}
	fmt.Println("Running on :8080")
	log.Fatal(httpSrv.ListenAndServe())
}
