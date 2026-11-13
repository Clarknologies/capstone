-- +goose up

-- TODO: for all, set on delete params

CREATE TABLE IF NOT EXISTS users
(
    user_id    uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    first_name TEXT         NOT NULL,
    last_name  TEXT         NOT NULL,
    email      VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS clubs
(
    club_id      uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    display_name TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS event_status_type
(
    event_status_id VARCHAR(255) PRIMARY KEY -- EVENT_PLANNED?, EVENT_CANCELED, EVENT_RESCHEDULED
);

CREATE TABLE IF NOT EXISTS event_category
(
    id           INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    display_name VARCHAR(255) NOT NULL DEFAULT ''
);

CREATE TABLE IF NOT EXISTS event_tag
(
    id       INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    tag_name VARCHAR(255) NOT NULL
);

-- EVENTS
CREATE TABLE IF NOT EXISTS events
(
    event_id              UUID PRIMARY KEY      DEFAULT gen_random_uuid(),
    posted_by             UUID REFERENCES users (user_id),
    event_name            VARCHAR(255) NOT NULL,
    status                VARCHAR(255) NOT NULL REFERENCES event_status_type (event_status_id),
    location_display_name TEXT         NOT NULL DEFAULT '',
    longitude             DECIMAL      NOT NULL,
    latitude              DECIMAL      NOT NULL,
    event_time_start      DATE         NOT NULL DEFAULT NOW(),
    event_time_end        DATE         NOT NULL DEFAULT NOW() + '2 hours',
    created_at            timestamptz           DEFAULT NOW() NOT NULL,
    category              INT REFERENCES event_category (id),
    club_id               uuid REFERENCES clubs (club_id)
);


-- user_rsvp (table for users who RSVP'd to an event)
CREATE TABLE IF NOT EXISTS user_rsvp
(
    user_id  uuid REFERENCES users (user_id),
    event_id uuid REFERENCES events (event_id),
    PRIMARY KEY (user_id, event_id),
    status   INT NOT NULL -- TODO: types for rsvp status
);

-- user_saved_events (table for users who save an event)
CREATE TABLE IF NOT EXISTS user_saved_events
(
    user_id    uuid REFERENCES users (user_id),
    event_id   uuid REFERENCES events (event_id),
    PRIMARY KEY (user_id, event_id),
    created_at TIMESTAMP NOT NULL DEFAULT NOW()
);


INSERT INTO event_status_type(event_status_id)
VALUES ('EVENT_CANCELED'),
       ('EVENT_RESCHEDULED');


INSERT INTO events(event_name, status, location_display_name, longitude, latitude)
VALUES ('Water Taste Testing', 'EVENT_CANCELED', 'IDX Dining Hall', '-4.02', '4.02');


INSERT INTO event_category(display_name)
VALUES ('Art & Culture'),
       ('Study Group'),
       ('Fitness & Wellness'),
       ('Technology'),
       ('Food & Drink'),
       ('Outdoors'),
       ('Music'),
       ('Activism and Politics'),
       ('Educational'),
       ('Social Activities');

INSERT INTO event_tag(tag_name)
VALUES ('Virtual'),
       ('In-person'),
       ('Off campus');

-- +goose down
DROP TABLE IF EXISTS users, clubs, events, event_category, event_status_type, event_tag, user_rsvp, user_saved_events, user_rsvp_events CASCADE;