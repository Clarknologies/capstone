package main

import (
	"errors"
	"log"
	"net/http"
	"uuid"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
)

func (s *Server) getAllEvents(w http.ResponseWriter, r *http.Request) {
	events, eventsError := s.q.GetAllEvents(r.Context())
	if eventsError != nil {
		log.Println(eventsError)
		return
	}

	writeJSON(w, events)
}

func (s *Server) getEventById(w http.ResponseWriter, r *http.Request) {
	eventId := r.PathValue("eventId")
	eventUuid, err := uuid.Parse(eventId)
	if err != nil {
		log.Printf("getEventById: uuid parse error: %v\n", err)
		w.WriteHeader(http.StatusBadRequest)
		writeJSON(w, map[string]any{"error": "invalid event id"})
		return
	}

	event, err := s.q.GetEventById(r.Context(), pgtype.UUID{Bytes: eventUuid, Valid: true})
	if err != nil {
		if errors.Is(err, pgx.ErrNoRows) {
			w.WriteHeader(http.StatusNotFound)
			writeJSON(w, map[string]any{"error": "event not found"})
			return
		}
		log.Println(err)
		w.WriteHeader(http.StatusInternalServerError)
		writeJSON(w, map[string]any{"error": "error getting event"})
		return
	}
	writeJSON(w, event)
}
