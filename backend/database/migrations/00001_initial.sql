-- +goose up

-- TODO: for all, set on delete params

CREATE TABLE IF NOT EXISTS users
(
    user_id    uuid PRIMARY KEY      DEFAULT gen_random_uuid(),
    first_name TEXT         NOT NULL,
    last_name  TEXT         NOT NULL,
    email      VARCHAR(255) NOT NULL UNIQUE,
    created_at timestamptz  NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS clubs
(
    club_id      uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    display_name VARCHAR(120) NOT NULL,
    description  TEXT
);

CREATE TYPE event_status AS ENUM ('PLANNED','RESCHEDULED','CANCELED');
CREATE TYPE rsvp_status AS ENUM ('ACCEPTED','DECLINED');

CREATE TABLE IF NOT EXISTS event_categories
(
    id           INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    display_name VARCHAR(255) NOT NULL DEFAULT ''
);

CREATE TABLE IF NOT EXISTS event_tags
(
    id       INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    tag_name VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS events
(
    event_id                     UUID PRIMARY KEY      DEFAULT gen_random_uuid(),
    event_name                   VARCHAR(255) NOT NULL,
    status                       event_status NOT NULL,
    description                  TEXT,
    location_display_name        TEXT         NOT NULL DEFAULT '',
    longitude                    DECIMAL      NOT NULL,
    latitude                     DECIMAL      NOT NULL,
    event_time_start             timestamptz  NOT NULL DEFAULT NOW(),
    rescheduled_event_time_start timestamptz           DEFAULT NULL,
    event_time_end               timestamptz  NOT NULL DEFAULT NOW() + '2 hours',
    CHECK (event_time_end > event_time_start),
    posted_by_user               UUID         REFERENCES users (user_id) ON DELETE SET NULL,
    category                     INT          REFERENCES event_categories (id) ON DELETE SET NULL,
    hosted_by_club               uuid REFERENCES clubs (club_id) ON DELETE CASCADE,
    metadata                     jsonb        NOT NULL DEFAULT '{}',
    created_at                   timestamptz           DEFAULT NOW() NOT NULL,
    updated_at                   timestamptz           DEFAULT NOW() NOT NULL
);

CREATE TABLE IF NOT EXISTS user_rsvp
(
    user_id  uuid REFERENCES users (user_id) ON DELETE CASCADE,
    event_id uuid REFERENCES events (event_id) ON DELETE CASCADE,
    PRIMARY KEY (user_id, event_id),
    status   rsvp_status NOT NULL
);

CREATE TABLE IF NOT EXISTS user_saved_events
(
    user_id    uuid REFERENCES users (user_id) ON DELETE CASCADE,
    event_id   uuid REFERENCES events (event_id) ON DELETE CASCADE,
    PRIMARY KEY (user_id, event_id),
    created_at TIMESTAMP NOT NULL DEFAULT NOW()
);


-- for notifications
CREATE TABLE IF NOT EXISTS user_club_follows
(
    user_id uuid REFERENCES users (user_id) ON DELETE CASCADE,
    club_id uuid REFERENCES clubs (club_id) ON DELETE CASCADE,
    PRIMARY KEY (user_id, club_id)
);

CREATE TABLE user_category_follows
(
    user_id     uuid REFERENCES users (user_id) ON DELETE CASCADE,
    category_id INT REFERENCES event_categories (id) ON DELETE CASCADE,
    PRIMARY KEY (user_id, category_id)
);


INSERT INTO events(event_name, status, location_display_name, longitude, latitude)
VALUES ('Water Taste Testing', 'CANCELED', 'IDX Dining Hall', '-4.02', '4.02');


INSERT INTO event_categories(display_name)
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

INSERT INTO event_tags(tag_name)
VALUES ('Virtual'),
       ('In-person'),
       ('Off campus');

-- +goose down
DROP TABLE clubs, event_categories, event_tags, events, user_category_follows, user_club_follows, user_rsvp, user_saved_events, users CASCADE;
DROP TYPE event_status, rsvp_status CASCADE;

