-- name: GetEventById :one
select * from events where event_id = $1;