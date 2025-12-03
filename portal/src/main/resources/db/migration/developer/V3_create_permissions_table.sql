CREATE DATABASE lume_panel_developer
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.utf8'
    LC_CTYPE = 'en_US.utf8'
    TEMPLATE = template0;

-- Migration para criar a tabela 'Users' no banco de dados

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




CREATE TABLE IF NOT EXISTS "permission" (
    "id" UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    "name" VARCHAR(255) NOT NULL,
    "description" VARCHAR(255) NOT NULL,
    "created_at" TIMESTAMP,
    "updated_at" TIMESTAMP
);

-- Se a tabela de permissões também for necessária e o relacionamento ManyToMany for implementado com tabela de junção
-- Criando a tabela de junção, caso necessário, entre 'Users' e 'Permissions'

CREATE TABLE IF NOT EXISTS "user_permissions" (
    "user_id" UUID NOT NULL,
    "permission_id" UUID NOT NULL,
    PRIMARY KEY ("user_id", "permission_id"),
    FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE CASCADE,
    FOREIGN KEY ("permission_id") REFERENCES "permissions" ("id") ON DELETE CASCADE,
    "created_at" TIMESTAMP,
    "updated_at" TIMESTAMP
);