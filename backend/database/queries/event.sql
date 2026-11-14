-- name: GetAllEvents :many
SELECT *
FROM events
ORDER BY created_at;

-- name: GetEventById :one
SELECT *
FROM events
WHERE event_id = $1;