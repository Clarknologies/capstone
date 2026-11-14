package main

import (
	"encoding/json"
	"log"
	"net/http"
)

func writeJSON(w http.ResponseWriter, v any) {
	jsonBody, err := json.Marshal(v)
	if err != nil {
		log.Printf("writeJSON marshal error: %+v\n", err)
		http.Error(w, "internal error", 500)
		return
	}
	w.Header().Set("Content-Type", "application/json")
	w.Write(jsonBody)
}
