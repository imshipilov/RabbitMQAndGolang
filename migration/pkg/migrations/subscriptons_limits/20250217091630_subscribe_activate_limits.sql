-- +goose Up
-- +goose StatementBegin
CREATE SCHEMA IF NOT EXISTS migrations;
CREATE SCHEMA IF NOT EXISTS main;
-- +goose StatementEnd

-- +goose StatementBegin
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
-- +goose StatementEnd

-- +goose StatementBegin
CREATE TABLE IF NOT EXISTS main.subscriptions
(
    id                 uuid primary key default uuid_generate_v4(),
    supplier_id        int                      not null,
    limit_id           int,
    price              int                       not null,
    created_at         timestamptz default now() not null
);
-- +goose StatementEnd

-- +goose StatementBegin
CREATE TABLE IF NOT EXISTS main.limits
(
    id                 uuid primary key default uuid_generate_v4(),
    limit_id           int,
    count              int                       not null,
    describe           text
);
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP TABLE IF EXISTS main.subscriptions;
DROP TABLE IF EXISTS main.limits;
DROP SCHEMA IF EXISTS main;
DROP SCHEMA IF EXISTS migrations;
-- +goose StatementEnd
