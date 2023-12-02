CREATE TABLE
    "users" (
        "username" varchar PRIMARY KEY,
        "hashed_password" varchar NOT NULL,
        "full_name" varchar NOT NULL,
        "email" varchar UNIQUE NOT NULL,
        "password_changed_at" timestamptz NOT NULL DEFAULT '0001-01-01 00:00:00Z',
        "created_at" timestamptz NOT NULL DEFAULT (now())
    );

CREATE TABLE
    "accounts" (
        "id" bigserial PRIMARY KEY,
        "owner" varchar NOT NULL,
        "balance" bigint NOT NULL,
        "currency" varchar NOT NULL,
        "created_at" timestamptz NOT NULL DEFAULT (now())
    );

CREATE TABLE
    "entries" (
        "id" bigserial PRIMARY KEY,
        "account_id" bigint NOT NULL,
        "amount" bigint NOT NULL,
        "created_at" timestamptz NOT NULL DEFAULT (now())
    );

CREATE TABLE
    "transfer" (
        "id" bigserial PRIMARY KEY,
        "from_account_id" bigint NOT NULL,
        "to_account_id" bigint NOT NULL,
        "amount" bigint NOT NULL,
        "created_at" timestamptz NOT NULL DEFAULT (now())
    );

ALTER TABLE "accounts"
ADD
    FOREIGN KEY ("owner") REFERENCES "users" ("username");

-- CREATE UNIQUE INDEX ON "accounts" ("owner", "currency");

ALTER TABLE "accounts"
ADD
    CONSTRAINT "owner_currency_key" UNIQUE ("owner", "currency");