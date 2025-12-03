CREATE TABLE IF NOT EXISTS "users" (
    "id" UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    "first_name" VARCHAR(255) NOT NULL,
    "last_name" VARCHAR(255) NOT NULL,
    "email" VARCHAR(255) NOT NULL UNIQUE,
    "password" VARCHAR(255) NOT NULL,
    "document" VARCHAR(14) NOT NULL,
    "document_type" VARCHAR(3) NOT NULL,  -- Supondo que DocumentType seja um enum como VARCHAR
    "created_at" TIMESTAMP,
    "updated_at" TIMESTAMP
);

