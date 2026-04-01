-- backend/data/migration_dff.sql

-- 1. Añadir columnas de seguridad (Bloqueo y Auditoría)
ALTER TABLE public.dff_users
ADD COLUMN IF NOT EXISTS failed_attempts integer DEFAULT 0 NOT NULL;

ALTER TABLE public.dff_users
ADD COLUMN IF NOT EXISTS lockout_until timestamp with time zone;

ALTER TABLE public.dff_users
ADD COLUMN IF NOT EXISTS updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP;

-- 2. Asegurar longitud de contraseña para Hash (255 caracteres)
ALTER TABLE public.dff_users
ALTER COLUMN password TYPE character varying(255);

-- 3. (Opcional) Limpieza de roles nulos para evitar errores futuros
UPDATE public.dff_users SET idrol = 2 WHERE idrol IS NULL;