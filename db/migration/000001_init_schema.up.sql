CREATE TABLE "account" (
  "id" BIGSERIAL PRIMARY KEY,
  "owner" varchar NOT NULL,
  "balance" bigint NOT NULL,
  "currency" varchar NOT NULL,
  "created_at" timestamp NOT NULL DEFAULT 'now()'
);

CREATE TABLE "entries" (
  "id" BIGSERIAL PRIMARY KEY,
  "account_id" bigint NOT NULL,
  "amount" bigint NOT NULL,
  "created_at" timestamp NOT NULL DEFAULT 'now()'
);

CREATE TABLE "transfers" (
  "id" BIGSERIAL PRIMARY KEY,
  "from_account_id" bigint NOT NULL,
  "to_account_id" bigint NOT NULL,
  "amount" bigint NOT NULL,
  "created_at" timestamp NOT NULL DEFAULT 'now()'
);

CREATE INDEX ON "account" ("id");

CREATE INDEX ON "account" ("owner");

CREATE INDEX ON "entries" ("id");

CREATE INDEX ON "entries" ("amount");

CREATE INDEX ON "transfers" ("id");

CREATE INDEX ON "transfers" ("from_account_id");

CREATE INDEX ON "transfers" ("to_account_id");

CREATE INDEX ON "transfers" ("amount");

CREATE INDEX ON "transfers" ("created_at");

ALTER TABLE "entries" ADD FOREIGN KEY ("account_id") REFERENCES "account" ("id");

ALTER TABLE "transfers" ADD FOREIGN KEY ("from_account_id") REFERENCES "account" ("id");

ALTER TABLE "transfers" ADD FOREIGN KEY ("to_account_id") REFERENCES "account" ("id");