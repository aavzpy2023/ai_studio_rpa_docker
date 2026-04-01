--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5 (Debian 17.5-1.pgdg120+1)
-- Dumped by pg_dump version 17.5 (Debian 17.5-1.pgdg120+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE IF EXISTS ONLY public.workflows_tags DROP CONSTRAINT IF EXISTS fk_workflows_tags_workflow_id;
ALTER TABLE IF EXISTS ONLY public.workflows_tags DROP CONSTRAINT IF EXISTS fk_workflows_tags_tag_id;
ALTER TABLE IF EXISTS ONLY public.workflow_statistics DROP CONSTRAINT IF EXISTS fk_workflow_statistics_workflow_id;
ALTER TABLE IF EXISTS ONLY public.workflow_entity DROP CONSTRAINT IF EXISTS fk_workflow_parent_folder;
ALTER TABLE IF EXISTS ONLY public.webhook_entity DROP CONSTRAINT IF EXISTS fk_webhook_entity_workflow_id;
ALTER TABLE IF EXISTS ONLY public.bff_vendor DROP CONSTRAINT IF EXISTS fk_vendor_representative;
ALTER TABLE IF EXISTS ONLY public.execution_entity DROP CONSTRAINT IF EXISTS fk_execution_entity_workflow_id;
ALTER TABLE IF EXISTS ONLY public.execution_data DROP CONSTRAINT IF EXISTS execution_data_fk;
ALTER TABLE IF EXISTS ONLY public.dff_role_permission DROP CONSTRAINT IF EXISTS dff_role_permission_id_role_fkey;
ALTER TABLE IF EXISTS ONLY public.dff_role_permission DROP CONSTRAINT IF EXISTS dff_role_permission_id_permission_fkey;
ALTER TABLE IF EXISTS ONLY public.bff_vendor_products DROP CONSTRAINT IF EXISTS bff_vendor_products_idum_fkey;
ALTER TABLE IF EXISTS ONLY public.bff_vendor_prices DROP CONSTRAINT IF EXISTS bff_vendor_prices_idvendor_fkey;
ALTER TABLE IF EXISTS ONLY public.bff_vendor_prices DROP CONSTRAINT IF EXISTS bff_vendor_prices_idproduct_fkey;
ALTER TABLE IF EXISTS ONLY public.bff_vendor DROP CONSTRAINT IF EXISTS bff_vendor_idstate_fkey;
ALTER TABLE IF EXISTS ONLY public.bff_vendor DROP CONSTRAINT IF EXISTS bff_vendor_idcontry_fkey;
ALTER TABLE IF EXISTS ONLY public.bff_vendor_customers_price DROP CONSTRAINT IF EXISTS bff_vendor_customers_price_idvendorcustomers_fkey;
ALTER TABLE IF EXISTS ONLY public.bff_vendor_customers_price DROP CONSTRAINT IF EXISTS bff_vendor_customers_price_idproduct_fkey;
ALTER TABLE IF EXISTS ONLY public.bff_vendor_customers DROP CONSTRAINT IF EXISTS bff_vendor_customers_idvendor_fkey;
ALTER TABLE IF EXISTS ONLY public.bff_vendor_customers DROP CONSTRAINT IF EXISTS bff_vendor_customers_idcustomers_fkey;
ALTER TABLE IF EXISTS ONLY public.bff_vendor_representative DROP CONSTRAINT IF EXISTS bff_vender_representative_idvendor_fkey;
ALTER TABLE IF EXISTS ONLY public.bff_vendor_representative DROP CONSTRAINT IF EXISTS bff_vender_representative_idtype_fkey;
ALTER TABLE IF EXISTS ONLY public.bff_state DROP CONSTRAINT IF EXISTS bff_state_idcontry_fkey;
ALTER TABLE IF EXISTS ONLY public.bff_relation_product_competence DROP CONSTRAINT IF EXISTS bff_relation_product_competence_idproduct_fkey;
ALTER TABLE IF EXISTS ONLY public.bff_relation_product_competence DROP CONSTRAINT IF EXISTS bff_relation_product_competence_idcompetenceprod_fkey;
ALTER TABLE IF EXISTS ONLY public.bff_products_vendor_products DROP CONSTRAINT IF EXISTS bff_products_vendor_products_idproductvendor_fkey;
ALTER TABLE IF EXISTS ONLY public.bff_products_vendor_products DROP CONSTRAINT IF EXISTS bff_products_vendor_products_idproduct_fkey;
ALTER TABLE IF EXISTS ONLY public.bff_products_prop DROP CONSTRAINT IF EXISTS bff_products_prop_idproduct_fkey;
ALTER TABLE IF EXISTS ONLY public.bff_products DROP CONSTRAINT IF EXISTS bff_products_idum_fkey;
ALTER TABLE IF EXISTS ONLY public.bff_products DROP CONSTRAINT IF EXISTS bff_products_idcategory_fkey;
ALTER TABLE IF EXISTS ONLY public."bff_products_MP" DROP CONSTRAINT IF EXISTS "bff_products_MP_idum_fkey";
ALTER TABLE IF EXISTS ONLY public.bff_messages DROP CONSTRAINT IF EXISTS bff_messages_conversation_id_fkey;
ALTER TABLE IF EXISTS ONLY public.bff_customers DROP CONSTRAINT IF EXISTS bff_customers_idtype_fkey;
ALTER TABLE IF EXISTS ONLY public.bff_customers DROP CONSTRAINT IF EXISTS bff_customers_idstate_fkey;
ALTER TABLE IF EXISTS ONLY public.bff_customers DROP CONSTRAINT IF EXISTS bff_customers_idcontry_fkey;
ALTER TABLE IF EXISTS ONLY public.bff_contact DROP CONSTRAINT IF EXISTS bff_contact_idtype_fkey;
ALTER TABLE IF EXISTS ONLY public.bff_contact DROP CONSTRAINT IF EXISTS bff_contact_idstate_fkey;
ALTER TABLE IF EXISTS ONLY public.bff_contact DROP CONSTRAINT IF EXISTS bff_contact_idresponsability_fkey;
ALTER TABLE IF EXISTS ONLY public.bff_contact DROP CONSTRAINT IF EXISTS bff_contact_idcontry_fkey;
ALTER TABLE IF EXISTS ONLY public.bff_competence_products DROP CONSTRAINT IF EXISTS bff_competence_products_idcompetence_fkey;
ALTER TABLE IF EXISTS ONLY public.bff_competence DROP CONSTRAINT IF EXISTS bff_competence_idstate_fkey;
ALTER TABLE IF EXISTS ONLY public.bff_competence DROP CONSTRAINT IF EXISTS bff_competence_idcontry_fkey;
ALTER TABLE IF EXISTS ONLY public."bff_Questions_Answers" DROP CONSTRAINT IF EXISTS "bff_Questions_Answers_idusser_fkey";
ALTER TABLE IF EXISTS ONLY public.auth_identity DROP CONSTRAINT IF EXISTS "auth_identity_userId_fkey";
ALTER TABLE IF EXISTS ONLY public.test_case_execution DROP CONSTRAINT IF EXISTS "FK_e48965fac35d0f5b9e7f51d8c44";
ALTER TABLE IF EXISTS ONLY public.user_api_keys DROP CONSTRAINT IF EXISTS "FK_e131705cbbc8fb589889b02d457";
ALTER TABLE IF EXISTS ONLY public.test_case_execution DROP CONSTRAINT IF EXISTS "FK_dfbe194e3ebdfe49a87bc4692ca";
ALTER TABLE IF EXISTS ONLY public.folder_tag DROP CONSTRAINT IF EXISTS "FK_dc88164176283de80af47621746";
ALTER TABLE IF EXISTS ONLY public.shared_workflow DROP CONSTRAINT IF EXISTS "FK_daa206a04983d47d0a9c34649ce";
ALTER TABLE IF EXISTS ONLY public.test_definition DROP CONSTRAINT IF EXISTS "FK_d5d7ea64662dbc62f5e266fbeb0";
ALTER TABLE IF EXISTS ONLY public.execution_annotation_tags DROP CONSTRAINT IF EXISTS "FK_c1519757391996eb06064f0e7c8";
ALTER TABLE IF EXISTS ONLY public.test_definition DROP CONSTRAINT IF EXISTS "FK_b0dd0087fe3da02b0ffa4b9c5bb";
ALTER TABLE IF EXISTS ONLY public.folder DROP CONSTRAINT IF EXISTS "FK_a8260b0b36939c6247f385b8221";
ALTER TABLE IF EXISTS ONLY public.shared_workflow DROP CONSTRAINT IF EXISTS "FK_a45ea5f27bcfdc21af9b4188560";
ALTER TABLE IF EXISTS ONLY public.execution_annotation_tags DROP CONSTRAINT IF EXISTS "FK_a3697779b366e131b2bbdae2976";
ALTER TABLE IF EXISTS ONLY public.test_definition DROP CONSTRAINT IF EXISTS "FK_9ec1ce6fbf82305f489adb971d3";
ALTER TABLE IF EXISTS ONLY public.execution_annotations DROP CONSTRAINT IF EXISTS "FK_97f863fa83c4786f19565084960";
ALTER TABLE IF EXISTS ONLY public.folder_tag DROP CONSTRAINT IF EXISTS "FK_94a60854e06f2897b2e0d39edba";
ALTER TABLE IF EXISTS ONLY public.test_case_execution DROP CONSTRAINT IF EXISTS "FK_8e4b4774db42f1e6dda3452b2af";
ALTER TABLE IF EXISTS ONLY public.shared_credentials DROP CONSTRAINT IF EXISTS "FK_812c2852270da1247756e77f5a4";
ALTER TABLE IF EXISTS ONLY public.folder DROP CONSTRAINT IF EXISTS "FK_804ea52f6729e3940498bd54d78";
ALTER TABLE IF EXISTS ONLY public.installed_nodes DROP CONSTRAINT IF EXISTS "FK_73f857fc5dce682cef8a99c11dbddbc969618951";
ALTER TABLE IF EXISTS ONLY public.insights_raw DROP CONSTRAINT IF EXISTS "FK_6e2e33741adef2a7c5d66befa4e";
ALTER TABLE IF EXISTS ONLY public.insights_by_period DROP CONSTRAINT IF EXISTS "FK_6414cfed98daabbfdd61a1cfbc0";
ALTER TABLE IF EXISTS ONLY public.project_relation DROP CONSTRAINT IF EXISTS "FK_61448d56d61802b5dfde5cdb002";
ALTER TABLE IF EXISTS ONLY public.project_relation DROP CONSTRAINT IF EXISTS "FK_5f0643f6717905a05164090dde7";
ALTER TABLE IF EXISTS ONLY public.shared_credentials DROP CONSTRAINT IF EXISTS "FK_416f66fc846c7c442970c094ccf";
ALTER TABLE IF EXISTS ONLY public.test_run DROP CONSTRAINT IF EXISTS "FK_3a81713a76f2295b12b46cdfcab";
ALTER TABLE IF EXISTS ONLY public.test_metric DROP CONSTRAINT IF EXISTS "FK_3a4e9cf37111ac3270e2469b475";
ALTER TABLE IF EXISTS ONLY public.execution_metadata DROP CONSTRAINT IF EXISTS "FK_31d0b4c93fb85ced26f6005cda3";
ALTER TABLE IF EXISTS ONLY public.test_case_execution DROP CONSTRAINT IF EXISTS "FK_258d954733841d51edd826a562b";
ALTER TABLE IF EXISTS ONLY public.insights_metadata DROP CONSTRAINT IF EXISTS "FK_2375a1eda085adb16b24615b69c";
ALTER TABLE IF EXISTS ONLY public.workflow_history DROP CONSTRAINT IF EXISTS "FK_1e31657f5fe46816c34be7c1b4b";
ALTER TABLE IF EXISTS ONLY public.insights_metadata DROP CONSTRAINT IF EXISTS "FK_1d8ab99d5861c9388d2dc1cf733";
ALTER TABLE IF EXISTS ONLY public.processed_data DROP CONSTRAINT IF EXISTS "FK_06a69a7032c97a763c2c7599464";
DROP TRIGGER IF EXISTS update_responsibility_modtime ON public.bff_responsibility;
DROP TRIGGER IF EXISTS update_contact_modtime ON public.bff_contact;
DROP INDEX IF EXISTS public.pk_workflow_entity_id;
DROP INDEX IF EXISTS public.pk_variables_id;
DROP INDEX IF EXISTS public.pk_test_definition_id;
DROP INDEX IF EXISTS public.pk_tag_entity_id;
DROP INDEX IF EXISTS public.pk_credentials_entity_id;
DROP INDEX IF EXISTS public.ix_messages_user_id;
DROP INDEX IF EXISTS public.ix_messages_section_id;
DROP INDEX IF EXISTS public.ix_messages_id;
DROP INDEX IF EXISTS public.ix_dff_users_username;
DROP INDEX IF EXISTS public.ix_dff_users_email;
DROP INDEX IF EXISTS public.ix_dff_permission_name;
DROP INDEX IF EXISTS public.idx_workflows_tags_workflow_id;
DROP INDEX IF EXISTS public.idx_execution_entity_workflow_id_started_at;
DROP INDEX IF EXISTS public.idx_execution_entity_wait_till_status_deleted_at;
DROP INDEX IF EXISTS public.idx_execution_entity_stopped_at_status_deleted_at;
DROP INDEX IF EXISTS public.idx_812eb05f7451ca757fb98444ce;
DROP INDEX IF EXISTS public.idx_16f4436789e804e3e1c9eeb240;
DROP INDEX IF EXISTS public.idx_07fde106c0b471d8cc80a64fc8;
DROP INDEX IF EXISTS public."IDX_workflow_entity_name";
DROP INDEX IF EXISTS public."IDX_execution_entity_deletedAt";
DROP INDEX IF EXISTS public."IDX_cec8eea3bf49551482ccb4933e";
DROP INDEX IF EXISTS public."IDX_c1519757391996eb06064f0e7c";
DROP INDEX IF EXISTS public."IDX_b0dd0087fe3da02b0ffa4b9c5b";
DROP INDEX IF EXISTS public."IDX_ae51b54c4bb430cf92f48b623f";
DROP INDEX IF EXISTS public."IDX_a3697779b366e131b2bbdae297";
DROP INDEX IF EXISTS public."IDX_9ec1ce6fbf82305f489adb971d";
DROP INDEX IF EXISTS public."IDX_97f863fa83c4786f1956508496";
DROP INDEX IF EXISTS public."IDX_8e4b4774db42f1e6dda3452b2a";
DROP INDEX IF EXISTS public."IDX_63d7bbae72c767cf162d459fcc";
DROP INDEX IF EXISTS public."IDX_61448d56d61802b5dfde5cdb00";
DROP INDEX IF EXISTS public."IDX_60b6a84299eeb3f671dfec7693";
DROP INDEX IF EXISTS public."IDX_5f0643f6717905a05164090dde";
DROP INDEX IF EXISTS public."IDX_3a81713a76f2295b12b46cdfca";
DROP INDEX IF EXISTS public."IDX_3a4e9cf37111ac3270e2469b47";
DROP INDEX IF EXISTS public."IDX_1ef35bac35d20bdae979d917a3";
DROP INDEX IF EXISTS public."IDX_1e31657f5fe46816c34be7c1b4";
DROP INDEX IF EXISTS public."IDX_1d8ab99d5861c9388d2dc1cf73";
DROP INDEX IF EXISTS public."IDX_14f68deffaf858465715995508";
ALTER TABLE IF EXISTS ONLY public.workflow_entity DROP CONSTRAINT IF EXISTS workflow_entity_pkey;
ALTER TABLE IF EXISTS ONLY public.variables DROP CONSTRAINT IF EXISTS variables_pkey;
ALTER TABLE IF EXISTS ONLY public.variables DROP CONSTRAINT IF EXISTS variables_key_key;
ALTER TABLE IF EXISTS ONLY public.test_definition DROP CONSTRAINT IF EXISTS test_definition_pkey;
ALTER TABLE IF EXISTS ONLY public.tag_entity DROP CONSTRAINT IF EXISTS tag_entity_pkey;
ALTER TABLE IF EXISTS ONLY public.workflows_tags DROP CONSTRAINT IF EXISTS pk_workflows_tags;
ALTER TABLE IF EXISTS ONLY public.workflow_statistics DROP CONSTRAINT IF EXISTS pk_workflow_statistics;
ALTER TABLE IF EXISTS ONLY public.execution_entity DROP CONSTRAINT IF EXISTS pk_e3e63bbf986767844bbe1166d4e;
ALTER TABLE IF EXISTS ONLY public.messages DROP CONSTRAINT IF EXISTS messages_pkey;
ALTER TABLE IF EXISTS ONLY public.execution_data DROP CONSTRAINT IF EXISTS execution_data_pkey;
ALTER TABLE IF EXISTS ONLY public.event_destinations DROP CONSTRAINT IF EXISTS event_destinations_pkey;
ALTER TABLE IF EXISTS ONLY public.dff_users DROP CONSTRAINT IF EXISTS dff_users_pkey;
ALTER TABLE IF EXISTS ONLY public.dff_role DROP CONSTRAINT IF EXISTS dff_role_role_key;
ALTER TABLE IF EXISTS ONLY public.dff_role DROP CONSTRAINT IF EXISTS dff_role_pkey;
ALTER TABLE IF EXISTS ONLY public.dff_role_permission DROP CONSTRAINT IF EXISTS dff_role_permission_pkey;
ALTER TABLE IF EXISTS ONLY public.dff_permission DROP CONSTRAINT IF EXISTS dff_permission_pkey;
ALTER TABLE IF EXISTS ONLY public.credentials_entity DROP CONSTRAINT IF EXISTS credentials_entity_pkey;
ALTER TABLE IF EXISTS ONLY public.bff_vendor_products DROP CONSTRAINT IF EXISTS bff_vendor_products_sku_key;
ALTER TABLE IF EXISTS ONLY public.bff_vendor_products DROP CONSTRAINT IF EXISTS bff_vendor_products_pkey;
ALTER TABLE IF EXISTS ONLY public.bff_vendor_prices DROP CONSTRAINT IF EXISTS bff_vendor_prices_pkey;
ALTER TABLE IF EXISTS ONLY public.bff_vendor DROP CONSTRAINT IF EXISTS bff_vendor_pkey;
ALTER TABLE IF EXISTS ONLY public.bff_vendor_customers_price DROP CONSTRAINT IF EXISTS bff_vendor_customers_price_pkey;
ALTER TABLE IF EXISTS ONLY public.bff_vendor_customers DROP CONSTRAINT IF EXISTS bff_vendor_customers_pkey;
ALTER TABLE IF EXISTS ONLY public.bff_vendor_customers DROP CONSTRAINT IF EXISTS bff_vendor_customers_idvendor_idcustomers_key;
ALTER TABLE IF EXISTS ONLY public.bff_vendor_representative DROP CONSTRAINT IF EXISTS bff_vender_representative_pkey;
ALTER TABLE IF EXISTS ONLY public.bff_um DROP CONSTRAINT IF EXISTS bff_um_pkey;
ALTER TABLE IF EXISTS ONLY public.bff_type_representative DROP CONSTRAINT IF EXISTS bff_type_representative_pkey;
ALTER TABLE IF EXISTS ONLY public.bff_state DROP CONSTRAINT IF EXISTS bff_state_pkey;
ALTER TABLE IF EXISTS ONLY public.bff_responsibility DROP CONSTRAINT IF EXISTS bff_responsability_pkey;
ALTER TABLE IF EXISTS ONLY public.bff_representative DROP CONSTRAINT IF EXISTS bff_representative_pkey;
ALTER TABLE IF EXISTS ONLY public.bff_relation_product_competence DROP CONSTRAINT IF EXISTS bff_relation_product_competence_pkey;
ALTER TABLE IF EXISTS ONLY public.bff_products_vendor_products DROP CONSTRAINT IF EXISTS bff_products_vendor_products_pkey;
ALTER TABLE IF EXISTS ONLY public.bff_products DROP CONSTRAINT IF EXISTS bff_products_sku_key;
ALTER TABLE IF EXISTS ONLY public.bff_products_prop DROP CONSTRAINT IF EXISTS bff_products_prop_pkey;
ALTER TABLE IF EXISTS ONLY public.bff_products_prop DROP CONSTRAINT IF EXISTS bff_products_prop_idproduct_key;
ALTER TABLE IF EXISTS ONLY public.bff_products DROP CONSTRAINT IF EXISTS bff_products_pkey;
ALTER TABLE IF EXISTS ONLY public."bff_products_MP" DROP CONSTRAINT IF EXISTS "bff_products_MP_sku_key";
ALTER TABLE IF EXISTS ONLY public."bff_products_MP" DROP CONSTRAINT IF EXISTS "bff_products_MP_pkey";
ALTER TABLE IF EXISTS ONLY public.bff_messages DROP CONSTRAINT IF EXISTS bff_messages_pkey;
ALTER TABLE IF EXISTS ONLY public.bff_log_trace DROP CONSTRAINT IF EXISTS bff_log_trace_pkey;
ALTER TABLE IF EXISTS ONLY public.bff_customers_type DROP CONSTRAINT IF EXISTS bff_customers_type_pkey;
ALTER TABLE IF EXISTS ONLY public.bff_customers DROP CONSTRAINT IF EXISTS bff_customers_pkey;
ALTER TABLE IF EXISTS ONLY public.bff_conversations DROP CONSTRAINT IF EXISTS bff_conversations_pkey;
ALTER TABLE IF EXISTS ONLY public.bff_contry DROP CONSTRAINT IF EXISTS bff_contry_pkey1;
ALTER TABLE IF EXISTS ONLY public.bff_country DROP CONSTRAINT IF EXISTS bff_contry_pkey;
ALTER TABLE IF EXISTS ONLY public.bff_contact_type DROP CONSTRAINT IF EXISTS bff_contact_type_pkey;
ALTER TABLE IF EXISTS ONLY public.bff_contact DROP CONSTRAINT IF EXISTS bff_contact_pkey;
ALTER TABLE IF EXISTS ONLY public.bff_competence_products DROP CONSTRAINT IF EXISTS bff_competence_products_pkey;
ALTER TABLE IF EXISTS ONLY public.bff_competence DROP CONSTRAINT IF EXISTS bff_competence_pkey;
ALTER TABLE IF EXISTS ONLY public.bff_category DROP CONSTRAINT IF EXISTS bff_category_pkey;
ALTER TABLE IF EXISTS ONLY public."bff_Questions_Answers" DROP CONSTRAINT IF EXISTS "bff_Questions_Answers_pkey";
ALTER TABLE IF EXISTS ONLY public."bff_Model_Natural" DROP CONSTRAINT IF EXISTS "bff_Model_Natural_pkey";
ALTER TABLE IF EXISTS ONLY public.auth_provider_sync_history DROP CONSTRAINT IF EXISTS auth_provider_sync_history_pkey;
ALTER TABLE IF EXISTS ONLY public.auth_identity DROP CONSTRAINT IF EXISTS auth_identity_pkey;
ALTER TABLE IF EXISTS ONLY public."__EFMigrationsHistory" DROP CONSTRAINT IF EXISTS "__EFMigrationsHistory_pkey";
ALTER TABLE IF EXISTS ONLY public."user" DROP CONSTRAINT IF EXISTS "UQ_e12875dfb3b1d92d7d7c5377e2";
ALTER TABLE IF EXISTS ONLY public.role DROP CONSTRAINT IF EXISTS "UQ_5b49d0f504f7ef31045a1fb2eb8";
ALTER TABLE IF EXISTS ONLY public.insights_metadata DROP CONSTRAINT IF EXISTS "PK_f448a94c35218b6208ce20cf5a1";
ALTER TABLE IF EXISTS ONLY public.insights_raw DROP CONSTRAINT IF EXISTS "PK_ec15125755151e3a7e00e00014f";
ALTER TABLE IF EXISTS ONLY public."user" DROP CONSTRAINT IF EXISTS "PK_ea8f538c94b6e352418254ed6474a81f";
ALTER TABLE IF EXISTS ONLY public.role DROP CONSTRAINT IF EXISTS "PK_e853ce24e8200abe5721d2c6ac552b73";
ALTER TABLE IF EXISTS ONLY public.settings DROP CONSTRAINT IF EXISTS "PK_dc0fe14e6d9943f268e7b119f69ab8bd";
ALTER TABLE IF EXISTS ONLY public.processed_data DROP CONSTRAINT IF EXISTS "PK_ca04b9d8dc72de268fe07a65773";
ALTER TABLE IF EXISTS ONLY public.workflow_history DROP CONSTRAINT IF EXISTS "PK_b6572dd6173e4cd06fe79937b58";
ALTER TABLE IF EXISTS ONLY public.insights_by_period DROP CONSTRAINT IF EXISTS "PK_b606942249b90cc39b0265f0575";
ALTER TABLE IF EXISTS ONLY public.webhook_entity DROP CONSTRAINT IF EXISTS "PK_b21ace2e13596ccd87dc9bf4ea6";
ALTER TABLE IF EXISTS ONLY public.execution_annotation_tags DROP CONSTRAINT IF EXISTS "PK_979ec03d31294cca484be65d11f";
ALTER TABLE IF EXISTS ONLY public.user_api_keys DROP CONSTRAINT IF EXISTS "PK_978fa5caa3468f463dac9d92e69";
ALTER TABLE IF EXISTS ONLY public.test_case_execution DROP CONSTRAINT IF EXISTS "PK_90c121f77a78a6580e94b794bce";
ALTER TABLE IF EXISTS ONLY public.shared_credentials DROP CONSTRAINT IF EXISTS "PK_8ef3a59796a228913f251779cff";
ALTER TABLE IF EXISTS ONLY public.installed_nodes DROP CONSTRAINT IF EXISTS "PK_8ebd28194e4f792f96b5933423fc439df97d9689";
ALTER TABLE IF EXISTS ONLY public.migrations DROP CONSTRAINT IF EXISTS "PK_8c82d7f526340ab734260ea46be";
ALTER TABLE IF EXISTS ONLY public.execution_annotations DROP CONSTRAINT IF EXISTS "PK_7afcf93ffa20c4252869a7c6a23";
ALTER TABLE IF EXISTS ONLY public.annotation_tag_entity DROP CONSTRAINT IF EXISTS "PK_69dfa041592c30bbc0d4b84aa00";
ALTER TABLE IF EXISTS ONLY public.folder DROP CONSTRAINT IF EXISTS "PK_6278a41a706740c94c02e288df8";
ALTER TABLE IF EXISTS ONLY public.shared_workflow DROP CONSTRAINT IF EXISTS "PK_5ba87620386b847201c9531c58f";
ALTER TABLE IF EXISTS ONLY public.invalid_auth_token DROP CONSTRAINT IF EXISTS "PK_5779069b7235b256d91f7af1a15";
ALTER TABLE IF EXISTS ONLY public.project DROP CONSTRAINT IF EXISTS "PK_4d68b1358bb5b766d3e78f32f57";
ALTER TABLE IF EXISTS ONLY public.test_metric DROP CONSTRAINT IF EXISTS "PK_3e98b8e20acc19c5030a8644142";
ALTER TABLE IF EXISTS ONLY public.folder_tag DROP CONSTRAINT IF EXISTS "PK_27e4e00852f6b06a925a4d83a3e";
ALTER TABLE IF EXISTS ONLY public.project_relation DROP CONSTRAINT IF EXISTS "PK_1caaa312a5d7184a003be0f0cb6";
ALTER TABLE IF EXISTS ONLY public.execution_metadata DROP CONSTRAINT IF EXISTS "PK_17a0b6284f8d626aae88e1c16e4";
ALTER TABLE IF EXISTS ONLY public.installed_packages DROP CONSTRAINT IF EXISTS "PK_08cc9197c39b028c1e9beca225940576fd1a5804";
ALTER TABLE IF EXISTS ONLY public.test_run DROP CONSTRAINT IF EXISTS "PK_011c050f566e9db509a0fadb9b9";
ALTER TABLE IF EXISTS public.role ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.migrations ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.execution_metadata ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.execution_entity ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.execution_annotations ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.dff_users ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.dff_role ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.dff_permission ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.bff_vendor_prices ALTER COLUMN idprice DROP DEFAULT;
ALTER TABLE IF EXISTS public.bff_vendor_customers_price ALTER COLUMN idprice DROP DEFAULT;
ALTER TABLE IF EXISTS public.bff_representative ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.bff_contry ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.auth_provider_sync_history ALTER COLUMN id DROP DEFAULT;
DROP TABLE IF EXISTS public.workflows_tags;
DROP TABLE IF EXISTS public.workflow_statistics;
DROP TABLE IF EXISTS public.workflow_history;
DROP TABLE IF EXISTS public.workflow_entity;
DROP TABLE IF EXISTS public.webhook_entity;
DROP TABLE IF EXISTS public.variables;
DROP TABLE IF EXISTS public.user_api_keys;
DROP TABLE IF EXISTS public."user";
DROP TABLE IF EXISTS public.test_run;
DROP TABLE IF EXISTS public.test_metric;
DROP TABLE IF EXISTS public.test_definition;
DROP TABLE IF EXISTS public.test_case_execution;
DROP TABLE IF EXISTS public.tag_entity;
DROP TABLE IF EXISTS public.shared_workflow;
DROP TABLE IF EXISTS public.shared_credentials;
DROP TABLE IF EXISTS public.settings;
DROP SEQUENCE IF EXISTS public.role_id_seq;
DROP TABLE IF EXISTS public.role;
DROP TABLE IF EXISTS public.project_relation;
DROP TABLE IF EXISTS public.project;
DROP TABLE IF EXISTS public.processed_data;
DROP SEQUENCE IF EXISTS public.migrations_id_seq;
DROP TABLE IF EXISTS public.migrations;
DROP TABLE IF EXISTS public.messages;
DROP TABLE IF EXISTS public.invalid_auth_token;
DROP TABLE IF EXISTS public.installed_packages;
DROP TABLE IF EXISTS public.installed_nodes;
DROP TABLE IF EXISTS public.insights_raw;
DROP TABLE IF EXISTS public.insights_metadata;
DROP TABLE IF EXISTS public.insights_by_period;
DROP TABLE IF EXISTS public.folder_tag;
DROP TABLE IF EXISTS public.folder;
DROP SEQUENCE IF EXISTS public.execution_metadata_temp_id_seq;
DROP TABLE IF EXISTS public.execution_metadata;
DROP SEQUENCE IF EXISTS public.execution_entity_id_seq;
DROP TABLE IF EXISTS public.execution_entity;
DROP TABLE IF EXISTS public.execution_data;
DROP SEQUENCE IF EXISTS public.execution_annotations_id_seq;
DROP TABLE IF EXISTS public.execution_annotations;
DROP TABLE IF EXISTS public.execution_annotation_tags;
DROP TABLE IF EXISTS public.event_destinations;
DROP SEQUENCE IF EXISTS public.dff_users_id_seq;
DROP TABLE IF EXISTS public.dff_users;
DROP TABLE IF EXISTS public.dff_role_permission;
DROP SEQUENCE IF EXISTS public.dff_role_id_seq;
DROP TABLE IF EXISTS public.dff_role;
DROP SEQUENCE IF EXISTS public.dff_permission_id_seq;
DROP TABLE IF EXISTS public.dff_permission;
DROP TABLE IF EXISTS public.credentials_entity;
DROP TABLE IF EXISTS public.bff_vendor_products;
DROP SEQUENCE IF EXISTS public.bff_vendor_prices_idprice_seq;
DROP TABLE IF EXISTS public.bff_vendor_prices;
DROP SEQUENCE IF EXISTS public.bff_vendor_customers_price_idprice_seq;
DROP TABLE IF EXISTS public.bff_vendor_customers_price;
DROP TABLE IF EXISTS public.bff_vendor_customers;
DROP TABLE IF EXISTS public.bff_vendor;
DROP TABLE IF EXISTS public.bff_vendor_representative;
DROP TABLE IF EXISTS public.bff_um;
DROP TABLE IF EXISTS public.bff_type_representative;
DROP TABLE IF EXISTS public.bff_state;
DROP TABLE IF EXISTS public.bff_responsibility;
DROP SEQUENCE IF EXISTS public.bff_representative_id_seq;
DROP TABLE IF EXISTS public.bff_representative;
DROP TABLE IF EXISTS public.bff_relation_product_competence;
DROP TABLE IF EXISTS public.bff_products_vendor_products;
DROP TABLE IF EXISTS public.bff_products_prop;
DROP TABLE IF EXISTS public."bff_products_MP";
DROP TABLE IF EXISTS public.bff_products;
DROP TABLE IF EXISTS public.bff_messages;
DROP TABLE IF EXISTS public.bff_log_trace;
DROP TABLE IF EXISTS public.bff_customers_type;
DROP TABLE IF EXISTS public.bff_customers;
DROP TABLE IF EXISTS public.bff_conversations;
DROP SEQUENCE IF EXISTS public.bff_contry_id_seq1;
DROP TABLE IF EXISTS public.bff_country;
DROP TABLE IF EXISTS public.bff_contry;
DROP TABLE IF EXISTS public.bff_contact_type;
DROP TABLE IF EXISTS public.bff_contact;
DROP TABLE IF EXISTS public.bff_competence_products;
DROP TABLE IF EXISTS public.bff_competence;
DROP TABLE IF EXISTS public.bff_category;
DROP TABLE IF EXISTS public."bff_Questions_Answers";
DROP TABLE IF EXISTS public."bff_Model_Natural";
DROP SEQUENCE IF EXISTS public.auth_provider_sync_history_id_seq;
DROP TABLE IF EXISTS public.auth_provider_sync_history;
DROP TABLE IF EXISTS public.auth_identity;
DROP TABLE IF EXISTS public.annotation_tag_entity;
DROP TABLE IF EXISTS public."__EFMigrationsHistory";
DROP FUNCTION IF EXISTS public.update_updated_at_column();
DROP EXTENSION IF EXISTS "uuid-ossp";
--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: __EFMigrationsHistory; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."__EFMigrationsHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ProductVersion" character varying(32) NOT NULL
);


--
-- Name: annotation_tag_entity; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.annotation_tag_entity (
    id character varying(16) NOT NULL,
    name character varying(24) NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


--
-- Name: auth_identity; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_identity (
    "userId" uuid,
    "providerId" character varying(64) NOT NULL,
    "providerType" character varying(32) NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


--
-- Name: auth_provider_sync_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_provider_sync_history (
    id integer NOT NULL,
    "providerType" character varying(32) NOT NULL,
    "runMode" text NOT NULL,
    status text NOT NULL,
    "startedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "endedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    scanned integer NOT NULL,
    created integer NOT NULL,
    updated integer NOT NULL,
    disabled integer NOT NULL,
    error text
);


--
-- Name: auth_provider_sync_history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_provider_sync_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_provider_sync_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_provider_sync_history_id_seq OWNED BY public.auth_provider_sync_history.id;


--
-- Name: bff_Model_Natural; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."bff_Model_Natural" (
    id integer NOT NULL,
    model character varying(150),
    apikey character varying(250),
    create_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: bff_Questions_Answers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."bff_Questions_Answers" (
    id integer NOT NULL,
    idusser integer,
    questiondate timestamp without time zone,
    questions character varying(500),
    answers character varying(1000),
    rating integer DEFAULT 0,
    create_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: bff_Questions_Answers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public."bff_Questions_Answers" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."bff_Questions_Answers_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: bff_category; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bff_category (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    body text,
    active boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: bff_category_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.bff_category ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.bff_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: bff_competence; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bff_competence (
    id integer NOT NULL,
    company character varying(150),
    address character varying(200),
    city character varying(100),
    idstate integer NOT NULL,
    zipcode character(8) NOT NULL,
    idcontry integer
);


--
-- Name: bff_competence_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.bff_competence ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.bff_competence_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: bff_competence_products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bff_competence_products (
    id integer NOT NULL,
    idcompetence integer,
    sku character varying(50),
    descript character varying(150),
    price numeric(10,2)
);


--
-- Name: bff_competence_products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.bff_competence_products ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.bff_competence_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: bff_contact; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bff_contact (
    id integer NOT NULL,
    type_id integer,
    responsibility_id integer,
    first_name character varying(100),
    second_name character varying(100),
    line1 character varying(150) NOT NULL,
    line2 character varying(150),
    city character varying(100),
    county character varying(100),
    state_id integer,
    country_id integer,
    phone character varying(11),
    mobile character varying(11),
    email character varying(200),
    is_owner boolean DEFAULT false,
    is_active boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: bff_contact_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.bff_contact ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.bff_contact_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: bff_contact_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bff_contact_type (
    id integer NOT NULL,
    name character varying(150),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: bff_contact_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.bff_contact_type ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.bff_contact_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: bff_contry; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bff_contry (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


--
-- Name: bff_country; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bff_country (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


--
-- Name: bff_contry_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.bff_country ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.bff_contry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: bff_contry_id_seq1; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bff_contry_id_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bff_contry_id_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bff_contry_id_seq1 OWNED BY public.bff_contry.id;


--
-- Name: bff_conversations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bff_conversations (
    id uuid NOT NULL
);


--
-- Name: bff_customers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bff_customers (
    id integer NOT NULL,
    idtype integer NOT NULL,
    company character varying(150),
    address character varying(200),
    city character varying(100),
    idstate integer NOT NULL,
    zipcode character(8) NOT NULL,
    idcontry integer
);


--
-- Name: bff_customers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.bff_customers ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.bff_customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: bff_customers_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bff_customers_type (
    id integer NOT NULL,
    description character varying(50) NOT NULL
);


--
-- Name: bff_customers_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.bff_customers_type ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.bff_customers_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: bff_log_trace; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bff_log_trace (
    idtrace integer NOT NULL,
    date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    trace character varying(1000),
    location bytea
);


--
-- Name: bff_log_trace_idtrace_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.bff_log_trace ALTER COLUMN idtrace ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.bff_log_trace_idtrace_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: bff_messages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bff_messages (
    id uuid NOT NULL,
    role character varying(32) NOT NULL,
    content text NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    conversation_id uuid
);


--
-- Name: bff_products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bff_products (
    id integer NOT NULL,
    idcategory integer,
    sku character varying(50) NOT NULL,
    description character varying(250),
    idum integer NOT NULL,
    islot boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone
);


--
-- Name: bff_products_MP; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."bff_products_MP" (
    id integer NOT NULL,
    sku character varying(50) NOT NULL,
    description character varying(250),
    idum integer NOT NULL,
    price numeric(10,2),
    create_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    update_at timestamp without time zone
);


--
-- Name: bff_products_MP_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public."bff_products_MP" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."bff_products_MP_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: bff_products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.bff_products ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.bff_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: bff_products_prop; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bff_products_prop (
    id integer NOT NULL,
    idproduct integer,
    pack_case integer,
    qty_pack integer,
    size_pack numeric(10,4) DEFAULT 1,
    size_case numeric(10,4),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone
);


--
-- Name: bff_products_prop_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.bff_products_prop ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.bff_products_prop_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: bff_products_vendor_products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bff_products_vendor_products (
    idproduct integer NOT NULL,
    idproductvendor integer NOT NULL
);


--
-- Name: bff_relation_product_competence; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bff_relation_product_competence (
    idproduct integer NOT NULL,
    idcompetenceprod integer NOT NULL
);


--
-- Name: bff_representative; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bff_representative (
    id integer NOT NULL,
    name character varying(150) NOT NULL,
    email character varying(255),
    phone character varying(20),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone
);


--
-- Name: bff_representative_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bff_representative_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bff_representative_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bff_representative_id_seq OWNED BY public.bff_representative.id;


--
-- Name: bff_responsibility; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bff_responsibility (
    id integer NOT NULL,
    name character varying(100),
    is_final_customer boolean,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: bff_responsability_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.bff_responsibility ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.bff_responsability_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: bff_state; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bff_state (
    id integer NOT NULL,
    country_id integer,
    name character varying(50) NOT NULL
);


--
-- Name: bff_state_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.bff_state ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.bff_state_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: bff_type_representative; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bff_type_representative (
    id integer NOT NULL,
    type character varying(50)
);


--
-- Name: bff_type_representative_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.bff_type_representative ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.bff_type_representative_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: bff_um; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bff_um (
    id integer NOT NULL,
    description character(5)
);


--
-- Name: bff_um_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.bff_um ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.bff_um_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: bff_vendor_representative; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bff_vendor_representative (
    id integer NOT NULL,
    idvendor integer,
    idtype integer
);


--
-- Name: bff_vender_representative_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.bff_vendor_representative ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.bff_vender_representative_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: bff_vendor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bff_vendor (
    id integer NOT NULL,
    idrepresentative integer,
    company character varying(150),
    address character varying(200),
    city character varying(100),
    idstate integer NOT NULL,
    zipcode character(8) NOT NULL,
    idcontry integer
);


--
-- Name: bff_vendor_customers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bff_vendor_customers (
    id integer NOT NULL,
    idvendor integer,
    idcustomers integer
);


--
-- Name: bff_vendor_customers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.bff_vendor_customers ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.bff_vendor_customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: bff_vendor_customers_price; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bff_vendor_customers_price (
    idprice integer NOT NULL,
    idvendorcustomers integer,
    idproduct integer,
    price numeric(10,2)
);


--
-- Name: bff_vendor_customers_price_idprice_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bff_vendor_customers_price_idprice_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bff_vendor_customers_price_idprice_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bff_vendor_customers_price_idprice_seq OWNED BY public.bff_vendor_customers_price.idprice;


--
-- Name: bff_vendor_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.bff_vendor ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.bff_vendor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: bff_vendor_prices; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bff_vendor_prices (
    idprice integer NOT NULL,
    idvendor integer,
    idproduct integer,
    price numeric(10,2)
);


--
-- Name: bff_vendor_prices_idprice_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bff_vendor_prices_idprice_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bff_vendor_prices_idprice_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bff_vendor_prices_idprice_seq OWNED BY public.bff_vendor_prices.idprice;


--
-- Name: bff_vendor_products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bff_vendor_products (
    id integer NOT NULL,
    sku character varying(50) NOT NULL,
    description character varying(250),
    idum integer NOT NULL
);


--
-- Name: bff_vendor_products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.bff_vendor_products ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.bff_vendor_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: credentials_entity; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.credentials_entity (
    name character varying(128) NOT NULL,
    data text NOT NULL,
    type character varying(128) NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    id character varying(36) NOT NULL,
    "isManaged" boolean DEFAULT false NOT NULL
);


--
-- Name: dff_permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dff_permission (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(255),
    resource character varying(50) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone
);


--
-- Name: dff_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dff_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dff_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dff_permission_id_seq OWNED BY public.dff_permission.id;


--
-- Name: dff_role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dff_role (
    id integer NOT NULL,
    role character varying(50) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone
);


--
-- Name: dff_role_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dff_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dff_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dff_role_id_seq OWNED BY public.dff_role.id;


--
-- Name: dff_role_permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dff_role_permission (
    id_role integer NOT NULL,
    id_permission integer NOT NULL
);


--
-- Name: dff_users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dff_users (
    id integer NOT NULL,
    username character varying(50) NOT NULL,
    email character varying(250) NOT NULL,
    password character varying(255) NOT NULL,
    firstname character varying(100) NOT NULL,
    lastname character varying(150) NOT NULL,
    middname character varying(100),
    movil character varying(11),
    "Phone" character varying(11),
    id_role integer,
    active boolean NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp with time zone,
    failed_attempts integer NOT NULL,
    lockout_until timestamp with time zone
);


--
-- Name: dff_users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dff_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dff_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dff_users_id_seq OWNED BY public.dff_users.id;


--
-- Name: event_destinations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.event_destinations (
    id uuid NOT NULL,
    destination jsonb NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


--
-- Name: execution_annotation_tags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.execution_annotation_tags (
    "annotationId" integer NOT NULL,
    "tagId" character varying(24) NOT NULL
);


--
-- Name: execution_annotations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.execution_annotations (
    id integer NOT NULL,
    "executionId" integer NOT NULL,
    vote character varying(6),
    note text,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


--
-- Name: execution_annotations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.execution_annotations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: execution_annotations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.execution_annotations_id_seq OWNED BY public.execution_annotations.id;


--
-- Name: execution_data; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.execution_data (
    "executionId" integer NOT NULL,
    "workflowData" json NOT NULL,
    data text NOT NULL
);


--
-- Name: execution_entity; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.execution_entity (
    id integer NOT NULL,
    finished boolean NOT NULL,
    mode character varying NOT NULL,
    "retryOf" character varying,
    "retrySuccessId" character varying,
    "startedAt" timestamp(3) with time zone,
    "stoppedAt" timestamp(3) with time zone,
    "waitTill" timestamp(3) with time zone,
    status character varying NOT NULL,
    "workflowId" character varying(36) NOT NULL,
    "deletedAt" timestamp(3) with time zone,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


--
-- Name: execution_entity_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.execution_entity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: execution_entity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.execution_entity_id_seq OWNED BY public.execution_entity.id;


--
-- Name: execution_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.execution_metadata (
    id integer NOT NULL,
    "executionId" integer NOT NULL,
    key character varying(255) NOT NULL,
    value text NOT NULL
);


--
-- Name: execution_metadata_temp_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.execution_metadata_temp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: execution_metadata_temp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.execution_metadata_temp_id_seq OWNED BY public.execution_metadata.id;


--
-- Name: folder; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.folder (
    id character varying(36) NOT NULL,
    name character varying(128) NOT NULL,
    "parentFolderId" character varying(36),
    "projectId" character varying(36) NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


--
-- Name: folder_tag; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.folder_tag (
    "folderId" character varying(36) NOT NULL,
    "tagId" character varying(36) NOT NULL
);


--
-- Name: insights_by_period; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.insights_by_period (
    id integer NOT NULL,
    "metaId" integer NOT NULL,
    type integer NOT NULL,
    value integer NOT NULL,
    "periodUnit" integer NOT NULL,
    "periodStart" timestamp(0) with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: COLUMN insights_by_period.type; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.insights_by_period.type IS '0: time_saved_minutes, 1: runtime_milliseconds, 2: success, 3: failure';


--
-- Name: COLUMN insights_by_period."periodUnit"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.insights_by_period."periodUnit" IS '0: hour, 1: day, 2: week';


--
-- Name: insights_by_period_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.insights_by_period ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.insights_by_period_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: insights_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.insights_metadata (
    "metaId" integer NOT NULL,
    "workflowId" character varying(16),
    "projectId" character varying(36),
    "workflowName" character varying(128) NOT NULL,
    "projectName" character varying(255) NOT NULL
);


--
-- Name: insights_metadata_metaId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.insights_metadata ALTER COLUMN "metaId" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."insights_metadata_metaId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: insights_raw; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.insights_raw (
    id integer NOT NULL,
    "metaId" integer NOT NULL,
    type integer NOT NULL,
    value integer NOT NULL,
    "timestamp" timestamp(0) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: COLUMN insights_raw.type; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.insights_raw.type IS '0: time_saved_minutes, 1: runtime_milliseconds, 2: success, 3: failure';


--
-- Name: insights_raw_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.insights_raw ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.insights_raw_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: installed_nodes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.installed_nodes (
    name character varying(200) NOT NULL,
    type character varying(200) NOT NULL,
    "latestVersion" integer DEFAULT 1 NOT NULL,
    package character varying(241) NOT NULL
);


--
-- Name: installed_packages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.installed_packages (
    "packageName" character varying(214) NOT NULL,
    "installedVersion" character varying(50) NOT NULL,
    "authorName" character varying(70),
    "authorEmail" character varying(70),
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


--
-- Name: invalid_auth_token; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.invalid_auth_token (
    token character varying(512) NOT NULL,
    "expiresAt" timestamp(3) with time zone NOT NULL
);


--
-- Name: messages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.messages (
    id character varying NOT NULL,
    content character varying NOT NULL,
    user_id character varying NOT NULL,
    role character varying NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    section_id character varying NOT NULL
);


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    "timestamp" bigint NOT NULL,
    name character varying NOT NULL
);


--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: processed_data; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.processed_data (
    "workflowId" character varying(36) NOT NULL,
    context character varying(255) NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    value text NOT NULL
);


--
-- Name: project; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.project (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(36) NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    icon json
);


--
-- Name: project_relation; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.project_relation (
    "projectId" character varying(36) NOT NULL,
    "userId" uuid NOT NULL,
    role character varying NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


--
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.role (
    id integer NOT NULL,
    name character varying(32) NOT NULL,
    scope character varying(255) NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


--
-- Name: role_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.role_id_seq OWNED BY public.role.id;


--
-- Name: settings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.settings (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    "loadOnStartup" boolean DEFAULT false NOT NULL
);


--
-- Name: shared_credentials; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.shared_credentials (
    "credentialsId" character varying(36) NOT NULL,
    "projectId" character varying(36) NOT NULL,
    role text NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


--
-- Name: shared_workflow; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.shared_workflow (
    "workflowId" character varying(36) NOT NULL,
    "projectId" character varying(36) NOT NULL,
    role text NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


--
-- Name: tag_entity; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tag_entity (
    name character varying(24) NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    id character varying(36) NOT NULL
);


--
-- Name: test_case_execution; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.test_case_execution (
    id character varying(36) NOT NULL,
    "testRunId" character varying(36) NOT NULL,
    "pastExecutionId" integer,
    "executionId" integer,
    "evaluationExecutionId" integer,
    status character varying NOT NULL,
    "runAt" timestamp(3) with time zone,
    "completedAt" timestamp(3) with time zone,
    "errorCode" character varying,
    "errorDetails" json,
    metrics json,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


--
-- Name: test_definition; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.test_definition (
    name character varying(255) NOT NULL,
    "workflowId" character varying(36) NOT NULL,
    "evaluationWorkflowId" character varying(36),
    "annotationTagId" character varying(16),
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    description text,
    id character varying(36) NOT NULL,
    "mockedNodes" json DEFAULT '[]'::json NOT NULL
);


--
-- Name: test_metric; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.test_metric (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    "testDefinitionId" character varying(36) NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


--
-- Name: test_run; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.test_run (
    id character varying(36) NOT NULL,
    "testDefinitionId" character varying(36) NOT NULL,
    status character varying NOT NULL,
    "runAt" timestamp(3) with time zone,
    "completedAt" timestamp(3) with time zone,
    metrics json,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "totalCases" integer,
    "passedCases" integer,
    "failedCases" integer,
    "errorCode" character varying(255),
    "errorDetails" text,
    CONSTRAINT test_run_check CHECK (
CASE
    WHEN ((status)::text = 'new'::text) THEN ("totalCases" IS NULL)
    WHEN ((status)::text = ANY (ARRAY[('cancelled'::character varying)::text, ('error'::character varying)::text])) THEN (("totalCases" IS NULL) OR ("totalCases" >= 0))
    ELSE ("totalCases" >= 0)
END),
    CONSTRAINT test_run_check1 CHECK (
CASE
    WHEN ((status)::text = 'new'::text) THEN ("passedCases" IS NULL)
    WHEN ((status)::text = ANY (ARRAY[('cancelled'::character varying)::text, ('error'::character varying)::text])) THEN (("passedCases" IS NULL) OR ("passedCases" >= 0))
    ELSE ("passedCases" >= 0)
END),
    CONSTRAINT test_run_check2 CHECK (
CASE
    WHEN ((status)::text = 'new'::text) THEN ("failedCases" IS NULL)
    WHEN ((status)::text = ANY (ARRAY[('cancelled'::character varying)::text, ('error'::character varying)::text])) THEN (("failedCases" IS NULL) OR ("failedCases" >= 0))
    ELSE ("failedCases" >= 0)
END)
);


--
-- Name: user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."user" (
    id uuid DEFAULT uuid_in((OVERLAY(OVERLAY(md5((((random())::text || ':'::text) || (clock_timestamp())::text)) PLACING '4'::text FROM 13) PLACING to_hex((floor(((random() * (((11 - 8) + 1))::double precision) + (8)::double precision)))::integer) FROM 17))::cstring) NOT NULL,
    email character varying(255),
    "firstName" character varying(32),
    "lastName" character varying(32),
    password character varying(255),
    "personalizationAnswers" json,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    settings json,
    disabled boolean DEFAULT false NOT NULL,
    "mfaEnabled" boolean DEFAULT false NOT NULL,
    "mfaSecret" text,
    "mfaRecoveryCodes" text,
    role text NOT NULL
);


--
-- Name: user_api_keys; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_api_keys (
    id character varying(36) NOT NULL,
    "userId" uuid NOT NULL,
    label character varying(100) NOT NULL,
    "apiKey" character varying NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    scopes json
);


--
-- Name: variables; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.variables (
    key character varying(50) NOT NULL,
    type character varying(50) DEFAULT 'string'::character varying NOT NULL,
    value character varying(255),
    id character varying(36) NOT NULL
);


--
-- Name: webhook_entity; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.webhook_entity (
    "webhookPath" character varying NOT NULL,
    method character varying NOT NULL,
    node character varying NOT NULL,
    "webhookId" character varying,
    "pathLength" integer,
    "workflowId" character varying(36) NOT NULL
);


--
-- Name: workflow_entity; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.workflow_entity (
    name character varying(128) NOT NULL,
    active boolean NOT NULL,
    nodes json NOT NULL,
    connections json NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    settings json,
    "staticData" json,
    "pinData" json,
    "versionId" character(36),
    "triggerCount" integer DEFAULT 0 NOT NULL,
    id character varying(36) NOT NULL,
    meta json,
    "parentFolderId" character varying(36) DEFAULT NULL::character varying
);


--
-- Name: workflow_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.workflow_history (
    "versionId" character varying(36) NOT NULL,
    "workflowId" character varying(36) NOT NULL,
    authors character varying(255) NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    nodes json NOT NULL,
    connections json NOT NULL
);


--
-- Name: workflow_statistics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.workflow_statistics (
    count integer DEFAULT 0,
    "latestEvent" timestamp(3) with time zone,
    name character varying(128) NOT NULL,
    "workflowId" character varying(36) NOT NULL,
    "rootCount" integer DEFAULT 0
);


--
-- Name: workflows_tags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.workflows_tags (
    "workflowId" character varying(36) NOT NULL,
    "tagId" character varying(36) NOT NULL
);


--
-- Name: auth_provider_sync_history id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_provider_sync_history ALTER COLUMN id SET DEFAULT nextval('public.auth_provider_sync_history_id_seq'::regclass);


--
-- Name: bff_contry id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bff_contry ALTER COLUMN id SET DEFAULT nextval('public.bff_contry_id_seq1'::regclass);


--
-- Name: bff_representative id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bff_representative ALTER COLUMN id SET DEFAULT nextval('public.bff_representative_id_seq'::regclass);


--
-- Name: bff_vendor_customers_price idprice; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bff_vendor_customers_price ALTER COLUMN idprice SET DEFAULT nextval('public.bff_vendor_customers_price_idprice_seq'::regclass);


--
-- Name: bff_vendor_prices idprice; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bff_vendor_prices ALTER COLUMN idprice SET DEFAULT nextval('public.bff_vendor_prices_idprice_seq'::regclass);


--
-- Name: dff_permission id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dff_permission ALTER COLUMN id SET DEFAULT nextval('public.dff_permission_id_seq'::regclass);


--
-- Name: dff_role id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dff_role ALTER COLUMN id SET DEFAULT nextval('public.dff_role_id_seq'::regclass);


--
-- Name: dff_users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dff_users ALTER COLUMN id SET DEFAULT nextval('public.dff_users_id_seq'::regclass);


--
-- Name: execution_annotations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.execution_annotations ALTER COLUMN id SET DEFAULT nextval('public.execution_annotations_id_seq'::regclass);


--
-- Name: execution_entity id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.execution_entity ALTER COLUMN id SET DEFAULT nextval('public.execution_entity_id_seq'::regclass);


--
-- Name: execution_metadata id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.execution_metadata ALTER COLUMN id SET DEFAULT nextval('public.execution_metadata_temp_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: role id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.role ALTER COLUMN id SET DEFAULT nextval('public.role_id_seq'::regclass);


--
-- Data for Name: __EFMigrationsHistory; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."__EFMigrationsHistory" ("MigrationId", "ProductVersion") FROM stdin;
\.


--
-- Data for Name: annotation_tag_entity; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.annotation_tag_entity (id, name, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: auth_identity; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_identity ("userId", "providerId", "providerType", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: auth_provider_sync_history; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_provider_sync_history (id, "providerType", "runMode", status, "startedAt", "endedAt", scanned, created, updated, disabled, error) FROM stdin;
\.


--
-- Data for Name: bff_Model_Natural; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."bff_Model_Natural" (id, model, apikey, create_at) FROM stdin;
\.


--
-- Data for Name: bff_Questions_Answers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."bff_Questions_Answers" (id, idusser, questiondate, questions, answers, rating, create_at) FROM stdin;
\.


--
-- Data for Name: bff_category; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bff_category (id, title, body, active, created_at) FROM stdin;
1	Raw materials	materials used to produce	t	2026-01-23 20:36:54.637406
\.


--
-- Data for Name: bff_competence; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bff_competence (id, company, address, city, idstate, zipcode, idcontry) FROM stdin;
\.


--
-- Data for Name: bff_competence_products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bff_competence_products (id, idcompetence, sku, descript, price) FROM stdin;
\.


--
-- Data for Name: bff_contact; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bff_contact (id, type_id, responsibility_id, first_name, second_name, line1, line2, city, county, state_id, country_id, phone, mobile, email, is_owner, is_active, created_at, updated_at) FROM stdin;
1	4	2	Andrey	\N	Cardoso # 6	\N	Santa Clara	FL	9	1	053777668		avinajera2011@gmail.com	t	t	2026-02-03 19:49:59.335957+00	2026-02-03 19:49:59.33598+00
\.


--
-- Data for Name: bff_contact_type; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bff_contact_type (id, name, created_at, updated_at) FROM stdin;
1	Customer	2026-02-03 02:08:20.964381+00	2026-02-03 02:08:20.964381+00
2	Vendor	2026-02-03 02:08:20.964381+00	2026-02-03 02:08:20.964381+00
3	Internal/Employee	2026-02-03 02:08:20.964381+00	2026-02-03 02:08:20.964381+00
4	Partner/Lead	2026-02-03 02:08:20.964381+00	2026-02-03 02:08:20.964381+00
\.


--
-- Data for Name: bff_contry; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bff_contry (id, name) FROM stdin;
\.


--
-- Data for Name: bff_conversations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bff_conversations (id) FROM stdin;
\.


--
-- Data for Name: bff_country; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bff_country (id, name) FROM stdin;
1	United States
\.


--
-- Data for Name: bff_customers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bff_customers (id, idtype, company, address, city, idstate, zipcode, idcontry) FROM stdin;
1	1	sdsd	sdasd rwgfewr 	dddd	1	33695   	1
\.


--
-- Data for Name: bff_customers_type; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bff_customers_type (id, description) FROM stdin;
1	Wholesale
2	Retail
\.


--
-- Data for Name: bff_log_trace; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bff_log_trace (idtrace, date, trace, location) FROM stdin;
\.


--
-- Data for Name: bff_messages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bff_messages (id, role, content, created_at, conversation_id) FROM stdin;
\.


--
-- Data for Name: bff_products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bff_products (id, idcategory, sku, description, idum, islot, created_at, updated_at) FROM stdin;
1	1	safda	Apple	1	f	2026-01-23 20:37:07.072151	\N
2	1	ghhjy	hjjjjj	1	t	2026-01-23 21:41:03.805243	\N
\.


--
-- Data for Name: bff_products_MP; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."bff_products_MP" (id, sku, description, idum, price, create_at, update_at) FROM stdin;
\.


--
-- Data for Name: bff_products_prop; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bff_products_prop (id, idproduct, pack_case, qty_pack, size_pack, size_case, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: bff_products_vendor_products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bff_products_vendor_products (idproduct, idproductvendor) FROM stdin;
\.


--
-- Data for Name: bff_relation_product_competence; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bff_relation_product_competence (idproduct, idcompetenceprod) FROM stdin;
\.


--
-- Data for Name: bff_representative; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bff_representative (id, name, email, phone, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: bff_responsibility; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bff_responsibility (id, name, is_final_customer, created_at, updated_at) FROM stdin;
1	Legal Representative	f	2026-02-03 02:08:20.964381+00	2026-02-03 02:08:20.964381+00
2	Purchasing/Sales Agent	f	2026-02-03 02:08:20.964381+00	2026-02-03 02:08:20.964381+00
3	Finance & Accounting	f	2026-02-03 02:08:20.964381+00	2026-02-03 02:08:20.964381+00
4	Technical Support	f	2026-02-03 02:08:20.964381+00	2026-02-03 02:08:20.964381+00
5	Logistics/Delivery	f	2026-02-03 02:08:20.964381+00	2026-02-03 02:08:20.964381+00
6	Final Consumer	t	2026-02-03 02:08:20.964381+00	2026-02-03 02:08:20.964381+00
\.


--
-- Data for Name: bff_state; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bff_state (id, country_id, name) FROM stdin;
1	1	Alabama
2	1	Alaska
3	1	Arizona
4	1	Arkansas
5	1	California
6	1	Colorado
7	1	Connecticut
8	1	Delaware
9	1	Florida
10	1	Georgia
11	1	Hawaii
12	1	Idaho
13	1	Illinois
14	1	Indiana
15	1	Iowa
16	1	Kansas
17	1	Kentucky
18	1	Louisiana
19	1	Maine
20	1	Maryland
21	1	Massachusetts
22	1	Michigan
23	1	Minnesota
24	1	Mississippi
25	1	Missouri
26	1	Montana
27	1	Nebraska
28	1	Nevada
29	1	New Hampshire
30	1	New Jersey
31	1	New Mexico
32	1	New York
33	1	North Carolina
34	1	North Dakota
35	1	Ohio
36	1	Oklahoma
37	1	Oregon
38	1	Pennsylvania
39	1	Rhode Island
40	1	South Carolina
41	1	South Dakota
42	1	Tennessee
43	1	Texas
44	1	Utah
45	1	Vermont
46	1	Virginia
47	1	Washington
48	1	West Virginia
49	1	Wisconsin
50	1	Wyoming
\.


--
-- Data for Name: bff_type_representative; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bff_type_representative (id, type) FROM stdin;
\.


--
-- Data for Name: bff_um; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bff_um (id, description) FROM stdin;
1	KG   
\.


--
-- Data for Name: bff_vendor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bff_vendor (id, idrepresentative, company, address, city, idstate, zipcode, idcontry) FROM stdin;
\.


--
-- Data for Name: bff_vendor_customers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bff_vendor_customers (id, idvendor, idcustomers) FROM stdin;
\.


--
-- Data for Name: bff_vendor_customers_price; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bff_vendor_customers_price (idprice, idvendorcustomers, idproduct, price) FROM stdin;
\.


--
-- Data for Name: bff_vendor_prices; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bff_vendor_prices (idprice, idvendor, idproduct, price) FROM stdin;
\.


--
-- Data for Name: bff_vendor_products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bff_vendor_products (id, sku, description, idum) FROM stdin;
\.


--
-- Data for Name: bff_vendor_representative; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bff_vendor_representative (id, idvendor, idtype) FROM stdin;
\.


--
-- Data for Name: credentials_entity; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.credentials_entity (name, data, type, "createdAt", "updatedAt", id, "isManaged") FROM stdin;
\.


--
-- Data for Name: dff_permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dff_permission (id, name, description, resource, created_at, updated_at) FROM stdin;
1	SALES_READ	View sales data	sales	2026-02-03 02:10:14.238388+00	\N
2	SALES_WRITE	Modify sales data	sales	2026-02-03 02:10:14.238388+00	\N
3	INVENTORY_READ	View inventory	inventory	2026-02-03 02:10:14.238388+00	\N
4	INVENTORY_WRITE	Modify inventory	inventory	2026-02-03 02:10:14.238388+00	\N
5	USERS_READ	View users	users	2026-02-03 02:10:14.238388+00	\N
6	USERS_WRITE	Modify users	users	2026-02-03 02:10:14.238388+00	\N
7	CONTACTS_READ	View contact directory	contacts	2026-02-03 02:10:14.238388+00	\N
8	CONTACTS_WRITE	Modify contacts	contacts	2026-02-03 02:10:14.238388+00	\N
9	PURCHASING_READ	View vendors and POs	purchasing	2026-02-03 02:10:14.238388+00	\N
10	PURCHASING_WRITE	Manage procurement	purchasing	2026-02-03 02:10:14.238388+00	\N
\.


--
-- Data for Name: dff_role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dff_role (id, role, created_at, updated_at) FROM stdin;
1	admin	2026-01-23 20:30:04.703675+00	\N
2	viewer	2026-01-23 20:30:04.703675+00	\N
3	sales_rep	2026-01-23 20:30:04.703675+00	\N
4	sales_manager	2026-01-23 20:30:04.703675+00	\N
5	buyer	2026-01-23 20:30:04.703675+00	\N
6	purchasing_manager	2026-01-23 20:30:04.703675+00	\N
7	inventory_manager	2026-01-23 20:30:04.703675+00	\N
8	customer_support	2026-01-23 20:30:04.703675+00	\N
\.


--
-- Data for Name: dff_role_permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dff_role_permission (id_role, id_permission) FROM stdin;
2	5
2	7
2	9
3	2
3	1
4	1
4	2
3	8
3	7
5	10
5	9
5	3
5	4
6	10
6	9
6	3
6	4
7	3
7	4
8	1
8	2
8	7
8	8
2	1
2	3
1	1
1	2
1	3
1	4
1	5
1	6
1	7
1	8
1	9
1	10
\.


--
-- Data for Name: dff_users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dff_users (id, username, email, password, firstname, lastname, middname, movil, "Phone", id_role, active, created_at, updated_at, failed_attempts, lockout_until) FROM stdin;
2	avz	avinajera2011@gmail.com	$2b$12$45ilRC93BAhnxfetactpKeyRfN9MIrl9ua9J3nit1Lp2XtGAj9dhi	Andrey	Vinajera-Zamora		\N	05353777668	2	t	2026-01-23 20:37:29.018993	2026-01-23 20:37:29.018996+00	0	\N
3	one	aaaaa@gmail.com	$2b$12$Wk7DJqnfznYGZehvxx5beu/Y28Lx2MPCKdpe1BYTBL7qH.rwWp6Tq	One	user		\N	05353777668	2	t	2026-02-03 02:20:20.783763	2026-02-03 13:04:25.452311+00	0	\N
1	admin	admin@dfgchatai.com	$2b$12$z1r0BtMaqIvrY.VBVcM29u9SWtxsrqpIb.cgOyVCeYrS5cUGAuCA6	System	Administrator	Root	\N	00000000000	1	t	2026-01-21 13:28:37.149478	2026-02-03 19:46:50.71864+00	0	\N
\.


--
-- Data for Name: event_destinations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.event_destinations (id, destination, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: execution_annotation_tags; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.execution_annotation_tags ("annotationId", "tagId") FROM stdin;
\.


--
-- Data for Name: execution_annotations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.execution_annotations (id, "executionId", vote, note, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: execution_data; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.execution_data ("executionId", "workflowData", data) FROM stdin;
\.


--
-- Data for Name: execution_entity; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.execution_entity (id, finished, mode, "retryOf", "retrySuccessId", "startedAt", "stoppedAt", "waitTill", status, "workflowId", "deletedAt", "createdAt") FROM stdin;
\.


--
-- Data for Name: execution_metadata; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.execution_metadata (id, "executionId", key, value) FROM stdin;
\.


--
-- Data for Name: folder; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.folder (id, name, "parentFolderId", "projectId", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: folder_tag; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.folder_tag ("folderId", "tagId") FROM stdin;
\.


--
-- Data for Name: insights_by_period; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.insights_by_period (id, "metaId", type, value, "periodUnit", "periodStart") FROM stdin;
\.


--
-- Data for Name: insights_metadata; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.insights_metadata ("metaId", "workflowId", "projectId", "workflowName", "projectName") FROM stdin;
\.


--
-- Data for Name: insights_raw; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.insights_raw (id, "metaId", type, value, "timestamp") FROM stdin;
\.


--
-- Data for Name: installed_nodes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.installed_nodes (name, type, "latestVersion", package) FROM stdin;
\.


--
-- Data for Name: installed_packages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.installed_packages ("packageName", "installedVersion", "authorName", "authorEmail", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: invalid_auth_token; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.invalid_auth_token (token, "expiresAt") FROM stdin;
\.


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.messages (id, content, user_id, role, created_at, updated_at, section_id) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.migrations (id, "timestamp", name) FROM stdin;
1	1587669153312	InitialMigration1587669153312
2	1589476000887	WebhookModel1589476000887
3	1594828256133	CreateIndexStoppedAt1594828256133
4	1607431743768	MakeStoppedAtNullable1607431743768
5	1611144599516	AddWebhookId1611144599516
6	1617270242566	CreateTagEntity1617270242566
7	1620824779533	UniqueWorkflowNames1620824779533
8	1626176912946	AddwaitTill1626176912946
9	1630419189837	UpdateWorkflowCredentials1630419189837
10	1644422880309	AddExecutionEntityIndexes1644422880309
11	1646834195327	IncreaseTypeVarcharLimit1646834195327
12	1646992772331	CreateUserManagement1646992772331
13	1648740597343	LowerCaseUserEmail1648740597343
14	1652254514002	CommunityNodes1652254514002
15	1652367743993	AddUserSettings1652367743993
16	1652905585850	AddAPIKeyColumn1652905585850
17	1654090467022	IntroducePinData1654090467022
18	1658932090381	AddNodeIds1658932090381
19	1659902242948	AddJsonKeyPinData1659902242948
20	1660062385367	CreateCredentialsUserRole1660062385367
21	1663755770893	CreateWorkflowsEditorRole1663755770893
22	1664196174001	WorkflowStatistics1664196174001
23	1665484192212	CreateCredentialUsageTable1665484192212
24	1665754637025	RemoveCredentialUsageTable1665754637025
25	1669739707126	AddWorkflowVersionIdColumn1669739707126
26	1669823906995	AddTriggerCountColumn1669823906995
27	1671535397530	MessageEventBusDestinations1671535397530
28	1671726148421	RemoveWorkflowDataLoadedFlag1671726148421
29	1673268682475	DeleteExecutionsWithWorkflows1673268682475
30	1674138566000	AddStatusToExecutions1674138566000
31	1674509946020	CreateLdapEntities1674509946020
32	1675940580449	PurgeInvalidWorkflowConnections1675940580449
33	1676996103000	MigrateExecutionStatus1676996103000
34	1677236854063	UpdateRunningExecutionStatus1677236854063
35	1677501636754	CreateVariables1677501636754
36	1679416281778	CreateExecutionMetadataTable1679416281778
37	1681134145996	AddUserActivatedProperty1681134145996
38	1681134145997	RemoveSkipOwnerSetup1681134145997
39	1690000000000	MigrateIntegerKeysToString1690000000000
40	1690000000020	SeparateExecutionData1690000000020
41	1690000000030	RemoveResetPasswordColumns1690000000030
42	1690000000030	AddMfaColumns1690000000030
43	1690787606731	AddMissingPrimaryKeyOnExecutionData1690787606731
44	1691088862123	CreateWorkflowNameIndex1691088862123
45	1692967111175	CreateWorkflowHistoryTable1692967111175
46	1693491613982	ExecutionSoftDelete1693491613982
47	1693554410387	DisallowOrphanExecutions1693554410387
48	1694091729095	MigrateToTimestampTz1694091729095
49	1695128658538	AddWorkflowMetadata1695128658538
50	1695829275184	ModifyWorkflowHistoryNodesAndConnections1695829275184
51	1700571993961	AddGlobalAdminRole1700571993961
52	1705429061930	DropRoleMapping1705429061930
53	1711018413374	RemoveFailedExecutionStatus1711018413374
54	1711390882123	MoveSshKeysToDatabase1711390882123
55	1712044305787	RemoveNodesAccess1712044305787
56	1714133768519	CreateProject1714133768519
57	1714133768521	MakeExecutionStatusNonNullable1714133768521
58	1717498465931	AddActivatedAtUserSetting1717498465931
59	1720101653148	AddConstraintToExecutionMetadata1720101653148
60	1721377157740	FixExecutionMetadataSequence1721377157740
61	1723627610222	CreateInvalidAuthTokenTable1723627610222
62	1723796243146	RefactorExecutionIndices1723796243146
63	1724753530828	CreateAnnotationTables1724753530828
64	1724951148974	AddApiKeysTable1724951148974
65	1726606152711	CreateProcessedDataTable1726606152711
66	1727427440136	SeparateExecutionCreationFromStart1727427440136
67	1728659839644	AddMissingPrimaryKeyOnAnnotationTagMapping1728659839644
68	1729607673464	UpdateProcessedDataValueColumnToText1729607673464
69	1729607673469	AddProjectIcons1729607673469
70	1730386903556	CreateTestDefinitionTable1730386903556
71	1731404028106	AddDescriptionToTestDefinition1731404028106
72	1731582748663	MigrateTestDefinitionKeyToString1731582748663
73	1732271325258	CreateTestMetricTable1732271325258
74	1732549866705	CreateTestRun1732549866705
75	1733133775640	AddMockedNodesColumnToTestDefinition1733133775640
76	1734479635324	AddManagedColumnToCredentialsTable1734479635324
77	1736172058779	AddStatsColumnsToTestRun1736172058779
78	1736947513045	CreateTestCaseExecutionTable1736947513045
79	1737715421462	AddErrorColumnsToTestRuns1737715421462
80	1738709609940	CreateFolderTable1738709609940
81	1739549398681	CreateAnalyticsTables1739549398681
82	1740445074052	UpdateParentFolderIdColumn1740445074052
83	1741167584277	RenameAnalyticsToInsights1741167584277
84	1742918400000	AddScopesColumnToApiKeys1742918400000
85	1745587087521	AddWorkflowStatisticsRootCount1745587087521
\.


--
-- Data for Name: processed_data; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.processed_data ("workflowId", context, "createdAt", "updatedAt", value) FROM stdin;
\.


--
-- Data for Name: project; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.project (id, name, type, "createdAt", "updatedAt", icon) FROM stdin;
hwXSmrNQVA8l2oUp	Andrey Vinajera-Zamora <avinajera2011@gmail.com>	personal	2026-01-21 13:28:39.751+00	2026-02-03 13:15:54.184+00	\N
\.


--
-- Data for Name: project_relation; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.project_relation ("projectId", "userId", role, "createdAt", "updatedAt") FROM stdin;
hwXSmrNQVA8l2oUp	4eeb4321-ca35-4f58-b3c3-8443dda322b4	project:personalOwner	2026-01-21 13:28:39.751+00	2026-01-21 13:28:39.751+00
\.


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.role (id, name, scope, "createdAt", "updatedAt") FROM stdin;
1	owner	global	2026-01-21 13:28:39.221+00	2026-01-21 13:28:39.221+00
2	member	global	2026-01-21 13:28:39.221+00	2026-01-21 13:28:39.221+00
3	owner	workflow	2026-01-21 13:28:39.221+00	2026-01-21 13:28:39.221+00
4	owner	credential	2026-01-21 13:28:39.221+00	2026-01-21 13:28:39.221+00
5	user	credential	2026-01-21 13:28:39.273+00	2026-01-21 13:28:39.273+00
6	editor	workflow	2026-01-21 13:28:39.276+00	2026-01-21 13:28:39.276+00
7	admin	global	2026-01-21 13:28:39.642+00	2026-01-21 13:28:39.642+00
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.settings (key, value, "loadOnStartup") FROM stdin;
ui.banners.dismissed	["V1"]	t
features.ldap	{"loginEnabled":false,"loginLabel":"","connectionUrl":"","allowUnauthorizedCerts":false,"connectionSecurity":"none","connectionPort":389,"baseDn":"","bindingAdminDn":"","bindingAdminPassword":"","firstNameAttribute":"","lastNameAttribute":"","emailAttribute":"","loginIdAttribute":"","ldapIdAttribute":"","userFilter":"","synchronizationEnabled":false,"synchronizationInterval":60,"searchPageSize":0,"searchTimeout":60}	t
features.sourceControl.sshKeys	{"encryptedPrivateKey":"U2FsdGVkX183Qdyi/T4etvCUCmYiqr0K9rzBB6MzWjgKop2OshlTFgt1ICPgzpVvUpKoNTqzwtTPvbHNAsulJP35TOVOUO9t4OEk9lxkrmeYmjGML+Z/hlLdzVmzr1gUqgfvHlbvZKkUWqTJk/Feyn4HskFgiCj3tmXI6xjPnJHWmQq6H336IKCvY1FveOYXRh9MGgOTPT8mjhqFKe3uwigE9CQljUMg848bmXMyb69N4QeaPM3CzhAm77dd2IOmcToBGXN9imOZO2tDkUM3EdHIDL4uzJvdckpbDFCAKlbAedchnwbkPTpsovIv8QeQWc1kwFzaOyrLrOfsKovIkFxrKskaWp9zs47ojlqnvQm27Im7lAlOz+lwKiVb7Ai3n3AqqHBCWW8zhMssuy9Sb1OUaxiFbvG9RArhQYcVVufxfcKjeUSZnoz+Yrm2j0KxoHOrvzcnXLhznrH0p23hAj8rb7C/WzWrwo3hOcWbW/my/fQ/fSOGDXsad2uvfz36t8oeFjFtMu6jS9NMP8Qmr50X791AyxVSsAS9EAXMY6ikdt6KaGiPEKughRDh5i/y","publicKey":"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDXTwMw2lNr28RKGfJKvPP0py/uX0JfThJ9pn7UD5Ke3 n8n deploy key"}	t
features.sourceControl	{"branchName":"main","keyGeneratorType":"ed25519"}	t
userManagement.isInstanceOwnerSetUp	true	t
\.


--
-- Data for Name: shared_credentials; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.shared_credentials ("credentialsId", "projectId", role, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: shared_workflow; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.shared_workflow ("workflowId", "projectId", role, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: tag_entity; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tag_entity (name, "createdAt", "updatedAt", id) FROM stdin;
\.


--
-- Data for Name: test_case_execution; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.test_case_execution (id, "testRunId", "pastExecutionId", "executionId", "evaluationExecutionId", status, "runAt", "completedAt", "errorCode", "errorDetails", metrics, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: test_definition; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.test_definition (name, "workflowId", "evaluationWorkflowId", "annotationTagId", "createdAt", "updatedAt", description, id, "mockedNodes") FROM stdin;
\.


--
-- Data for Name: test_metric; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.test_metric (id, name, "testDefinitionId", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: test_run; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.test_run (id, "testDefinitionId", status, "runAt", "completedAt", metrics, "createdAt", "updatedAt", "totalCases", "passedCases", "failedCases", "errorCode", "errorDetails") FROM stdin;
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."user" (id, email, "firstName", "lastName", password, "personalizationAnswers", "createdAt", "updatedAt", settings, disabled, "mfaEnabled", "mfaSecret", "mfaRecoveryCodes", role) FROM stdin;
4eeb4321-ca35-4f58-b3c3-8443dda322b4	avinajera2011@gmail.com	Andrey	Vinajera-Zamora	$2a$10$B./65SgRMbGW9e5WKcuBZuT3W9vmckPe44wzi297lTcQ3l/o6TxOK	{"version":"v4","personalization_survey_submitted_at":"2026-02-03T13:16:17.465Z","personalization_survey_n8n_version":"1.92.2","automationGoalDevops":["data-syncing"],"companySize":"<20","companyType":"ecommerce","role":"it","reportedSource":"youtube"}	2026-01-21 13:28:39.221+00	2026-02-03 13:16:17.483+00	{"userActivated": false}	f	f	\N	\N	global:owner
\.


--
-- Data for Name: user_api_keys; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_api_keys (id, "userId", label, "apiKey", "createdAt", "updatedAt", scopes) FROM stdin;
\.


--
-- Data for Name: variables; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.variables (key, type, value, id) FROM stdin;
\.


--
-- Data for Name: webhook_entity; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.webhook_entity ("webhookPath", method, node, "webhookId", "pathLength", "workflowId") FROM stdin;
\.


--
-- Data for Name: workflow_entity; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.workflow_entity (name, active, nodes, connections, "createdAt", "updatedAt", settings, "staticData", "pinData", "versionId", "triggerCount", id, meta, "parentFolderId") FROM stdin;
\.


--
-- Data for Name: workflow_history; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.workflow_history ("versionId", "workflowId", authors, "createdAt", "updatedAt", nodes, connections) FROM stdin;
\.


--
-- Data for Name: workflow_statistics; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.workflow_statistics (count, "latestEvent", name, "workflowId", "rootCount") FROM stdin;
\.


--
-- Data for Name: workflows_tags; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.workflows_tags ("workflowId", "tagId") FROM stdin;
\.


--
-- Name: auth_provider_sync_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_provider_sync_history_id_seq', 1, false);


--
-- Name: bff_Questions_Answers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."bff_Questions_Answers_id_seq"', 1, false);


--
-- Name: bff_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bff_category_id_seq', 1, true);


--
-- Name: bff_competence_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bff_competence_id_seq', 1, false);


--
-- Name: bff_competence_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bff_competence_products_id_seq', 1, false);


--
-- Name: bff_contact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bff_contact_id_seq', 1, true);


--
-- Name: bff_contact_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bff_contact_type_id_seq', 5, false);


--
-- Name: bff_contry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bff_contry_id_seq', 2, false);


--
-- Name: bff_contry_id_seq1; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bff_contry_id_seq1', 2, false);


--
-- Name: bff_customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bff_customers_id_seq', 1, true);


--
-- Name: bff_customers_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bff_customers_type_id_seq', 3, false);


--
-- Name: bff_log_trace_idtrace_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bff_log_trace_idtrace_seq', 1, false);


--
-- Name: bff_products_MP_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."bff_products_MP_id_seq"', 1, false);


--
-- Name: bff_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bff_products_id_seq', 2, true);


--
-- Name: bff_products_prop_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bff_products_prop_id_seq', 1, false);


--
-- Name: bff_representative_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bff_representative_id_seq', 1, false);


--
-- Name: bff_responsability_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bff_responsability_id_seq', 7, false);


--
-- Name: bff_state_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bff_state_id_seq', 51, false);


--
-- Name: bff_type_representative_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bff_type_representative_id_seq', 1, false);


--
-- Name: bff_um_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bff_um_id_seq', 1, true);


--
-- Name: bff_vender_representative_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bff_vender_representative_id_seq', 1, false);


--
-- Name: bff_vendor_customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bff_vendor_customers_id_seq', 1, false);


--
-- Name: bff_vendor_customers_price_idprice_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bff_vendor_customers_price_idprice_seq', 1, false);


--
-- Name: bff_vendor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bff_vendor_id_seq', 1, false);


--
-- Name: bff_vendor_prices_idprice_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bff_vendor_prices_idprice_seq', 1, false);


--
-- Name: bff_vendor_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bff_vendor_products_id_seq', 1, false);


--
-- Name: dff_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dff_permission_id_seq', 450, true);


--
-- Name: dff_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dff_role_id_seq', 10, true);


--
-- Name: dff_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dff_users_id_seq', 3, true);


--
-- Name: execution_annotations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.execution_annotations_id_seq', 1, false);


--
-- Name: execution_entity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.execution_entity_id_seq', 1, false);


--
-- Name: execution_metadata_temp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.execution_metadata_temp_id_seq', 1, false);


--
-- Name: insights_by_period_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.insights_by_period_id_seq', 1, false);


--
-- Name: insights_metadata_metaId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."insights_metadata_metaId_seq"', 1, false);


--
-- Name: insights_raw_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.insights_raw_id_seq', 1, false);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.migrations_id_seq', 85, true);


--
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.role_id_seq', 7, true);


--
-- Name: test_run PK_011c050f566e9db509a0fadb9b9; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.test_run
    ADD CONSTRAINT "PK_011c050f566e9db509a0fadb9b9" PRIMARY KEY (id);


--
-- Name: installed_packages PK_08cc9197c39b028c1e9beca225940576fd1a5804; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.installed_packages
    ADD CONSTRAINT "PK_08cc9197c39b028c1e9beca225940576fd1a5804" PRIMARY KEY ("packageName");


--
-- Name: execution_metadata PK_17a0b6284f8d626aae88e1c16e4; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.execution_metadata
    ADD CONSTRAINT "PK_17a0b6284f8d626aae88e1c16e4" PRIMARY KEY (id);


--
-- Name: project_relation PK_1caaa312a5d7184a003be0f0cb6; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_relation
    ADD CONSTRAINT "PK_1caaa312a5d7184a003be0f0cb6" PRIMARY KEY ("projectId", "userId");


--
-- Name: folder_tag PK_27e4e00852f6b06a925a4d83a3e; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.folder_tag
    ADD CONSTRAINT "PK_27e4e00852f6b06a925a4d83a3e" PRIMARY KEY ("folderId", "tagId");


--
-- Name: test_metric PK_3e98b8e20acc19c5030a8644142; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.test_metric
    ADD CONSTRAINT "PK_3e98b8e20acc19c5030a8644142" PRIMARY KEY (id);


--
-- Name: project PK_4d68b1358bb5b766d3e78f32f57; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project
    ADD CONSTRAINT "PK_4d68b1358bb5b766d3e78f32f57" PRIMARY KEY (id);


--
-- Name: invalid_auth_token PK_5779069b7235b256d91f7af1a15; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.invalid_auth_token
    ADD CONSTRAINT "PK_5779069b7235b256d91f7af1a15" PRIMARY KEY (token);


--
-- Name: shared_workflow PK_5ba87620386b847201c9531c58f; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shared_workflow
    ADD CONSTRAINT "PK_5ba87620386b847201c9531c58f" PRIMARY KEY ("workflowId", "projectId");


--
-- Name: folder PK_6278a41a706740c94c02e288df8; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.folder
    ADD CONSTRAINT "PK_6278a41a706740c94c02e288df8" PRIMARY KEY (id);


--
-- Name: annotation_tag_entity PK_69dfa041592c30bbc0d4b84aa00; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.annotation_tag_entity
    ADD CONSTRAINT "PK_69dfa041592c30bbc0d4b84aa00" PRIMARY KEY (id);


--
-- Name: execution_annotations PK_7afcf93ffa20c4252869a7c6a23; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.execution_annotations
    ADD CONSTRAINT "PK_7afcf93ffa20c4252869a7c6a23" PRIMARY KEY (id);


--
-- Name: migrations PK_8c82d7f526340ab734260ea46be; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT "PK_8c82d7f526340ab734260ea46be" PRIMARY KEY (id);


--
-- Name: installed_nodes PK_8ebd28194e4f792f96b5933423fc439df97d9689; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.installed_nodes
    ADD CONSTRAINT "PK_8ebd28194e4f792f96b5933423fc439df97d9689" PRIMARY KEY (name);


--
-- Name: shared_credentials PK_8ef3a59796a228913f251779cff; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shared_credentials
    ADD CONSTRAINT "PK_8ef3a59796a228913f251779cff" PRIMARY KEY ("credentialsId", "projectId");


--
-- Name: test_case_execution PK_90c121f77a78a6580e94b794bce; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.test_case_execution
    ADD CONSTRAINT "PK_90c121f77a78a6580e94b794bce" PRIMARY KEY (id);


--
-- Name: user_api_keys PK_978fa5caa3468f463dac9d92e69; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_api_keys
    ADD CONSTRAINT "PK_978fa5caa3468f463dac9d92e69" PRIMARY KEY (id);


--
-- Name: execution_annotation_tags PK_979ec03d31294cca484be65d11f; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.execution_annotation_tags
    ADD CONSTRAINT "PK_979ec03d31294cca484be65d11f" PRIMARY KEY ("annotationId", "tagId");


--
-- Name: webhook_entity PK_b21ace2e13596ccd87dc9bf4ea6; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.webhook_entity
    ADD CONSTRAINT "PK_b21ace2e13596ccd87dc9bf4ea6" PRIMARY KEY ("webhookPath", method);


--
-- Name: insights_by_period PK_b606942249b90cc39b0265f0575; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.insights_by_period
    ADD CONSTRAINT "PK_b606942249b90cc39b0265f0575" PRIMARY KEY (id);


--
-- Name: workflow_history PK_b6572dd6173e4cd06fe79937b58; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.workflow_history
    ADD CONSTRAINT "PK_b6572dd6173e4cd06fe79937b58" PRIMARY KEY ("versionId");


--
-- Name: processed_data PK_ca04b9d8dc72de268fe07a65773; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.processed_data
    ADD CONSTRAINT "PK_ca04b9d8dc72de268fe07a65773" PRIMARY KEY ("workflowId", context);


--
-- Name: settings PK_dc0fe14e6d9943f268e7b119f69ab8bd; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.settings
    ADD CONSTRAINT "PK_dc0fe14e6d9943f268e7b119f69ab8bd" PRIMARY KEY (key);


--
-- Name: role PK_e853ce24e8200abe5721d2c6ac552b73; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT "PK_e853ce24e8200abe5721d2c6ac552b73" PRIMARY KEY (id);


--
-- Name: user PK_ea8f538c94b6e352418254ed6474a81f; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT "PK_ea8f538c94b6e352418254ed6474a81f" PRIMARY KEY (id);


--
-- Name: insights_raw PK_ec15125755151e3a7e00e00014f; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.insights_raw
    ADD CONSTRAINT "PK_ec15125755151e3a7e00e00014f" PRIMARY KEY (id);


--
-- Name: insights_metadata PK_f448a94c35218b6208ce20cf5a1; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.insights_metadata
    ADD CONSTRAINT "PK_f448a94c35218b6208ce20cf5a1" PRIMARY KEY ("metaId");


--
-- Name: role UQ_5b49d0f504f7ef31045a1fb2eb8; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT "UQ_5b49d0f504f7ef31045a1fb2eb8" UNIQUE (scope, name);


--
-- Name: user UQ_e12875dfb3b1d92d7d7c5377e2; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT "UQ_e12875dfb3b1d92d7d7c5377e2" UNIQUE (email);


--
-- Name: __EFMigrationsHistory __EFMigrationsHistory_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."__EFMigrationsHistory"
    ADD CONSTRAINT "__EFMigrationsHistory_pkey" PRIMARY KEY ("MigrationId");


--
-- Name: auth_identity auth_identity_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_identity
    ADD CONSTRAINT auth_identity_pkey PRIMARY KEY ("providerId", "providerType");


--
-- Name: auth_provider_sync_history auth_provider_sync_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_provider_sync_history
    ADD CONSTRAINT auth_provider_sync_history_pkey PRIMARY KEY (id);


--
-- Name: bff_Model_Natural bff_Model_Natural_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."bff_Model_Natural"
    ADD CONSTRAINT "bff_Model_Natural_pkey" PRIMARY KEY (id);


--
-- Name: bff_Questions_Answers bff_Questions_Answers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."bff_Questions_Answers"
    ADD CONSTRAINT "bff_Questions_Answers_pkey" PRIMARY KEY (id);


--
-- Name: bff_category bff_category_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bff_category
    ADD CONSTRAINT bff_category_pkey PRIMARY KEY (id);


--
-- Name: bff_competence bff_competence_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bff_competence
    ADD CONSTRAINT bff_competence_pkey PRIMARY KEY (id);


--
-- Name: bff_competence_products bff_competence_products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bff_competence_products
    ADD CONSTRAINT bff_competence_products_pkey PRIMARY KEY (id);


--
-- Name: bff_contact bff_contact_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bff_contact
    ADD CONSTRAINT bff_contact_pkey PRIMARY KEY (id);


--
-- Name: bff_contact_type bff_contact_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bff_contact_type
    ADD CONSTRAINT bff_contact_type_pkey PRIMARY KEY (id);


--
-- Name: bff_country bff_contry_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bff_country
    ADD CONSTRAINT bff_contry_pkey PRIMARY KEY (id);


--
-- Name: bff_contry bff_contry_pkey1; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bff_contry
    ADD CONSTRAINT bff_contry_pkey1 PRIMARY KEY (id);


--
-- Name: bff_conversations bff_conversations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bff_conversations
    ADD CONSTRAINT bff_conversations_pkey PRIMARY KEY (id);


--
-- Name: bff_customers bff_customers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bff_customers
    ADD CONSTRAINT bff_customers_pkey PRIMARY KEY (id);


--
-- Name: bff_customers_type bff_customers_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bff_customers_type
    ADD CONSTRAINT bff_customers_type_pkey PRIMARY KEY (id);


--
-- Name: bff_log_trace bff_log_trace_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bff_log_trace
    ADD CONSTRAINT bff_log_trace_pkey PRIMARY KEY (idtrace);


--
-- Name: bff_messages bff_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bff_messages
    ADD CONSTRAINT bff_messages_pkey PRIMARY KEY (id);


--
-- Name: bff_products_MP bff_products_MP_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."bff_products_MP"
    ADD CONSTRAINT "bff_products_MP_pkey" PRIMARY KEY (id);


--
-- Name: bff_products_MP bff_products_MP_sku_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."bff_products_MP"
    ADD CONSTRAINT "bff_products_MP_sku_key" UNIQUE (sku);


--
-- Name: bff_products bff_products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bff_products
    ADD CONSTRAINT bff_products_pkey PRIMARY KEY (id);


--
-- Name: bff_products_prop bff_products_prop_idproduct_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bff_products_prop
    ADD CONSTRAINT bff_products_prop_idproduct_key UNIQUE (idproduct);


--
-- Name: bff_products_prop bff_products_prop_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bff_products_prop
    ADD CONSTRAINT bff_products_prop_pkey PRIMARY KEY (id);


--
-- Name: bff_products bff_products_sku_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bff_products
    ADD CONSTRAINT bff_products_sku_key UNIQUE (sku);


--
-- Name: bff_products_vendor_products bff_products_vendor_products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bff_products_vendor_products
    ADD CONSTRAINT bff_products_vendor_products_pkey PRIMARY KEY (idproduct, idproductvendor);


--
-- Name: bff_relation_product_competence bff_relation_product_competence_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bff_relation_product_competence
    ADD CONSTRAINT bff_relation_product_competence_pkey PRIMARY KEY (idproduct, idcompetenceprod);


--
-- Name: bff_representative bff_representative_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bff_representative
    ADD CONSTRAINT bff_representative_pkey PRIMARY KEY (id);


--
-- Name: bff_responsibility bff_responsability_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bff_responsibility
    ADD CONSTRAINT bff_responsability_pkey PRIMARY KEY (id);


--
-- Name: bff_state bff_state_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bff_state
    ADD CONSTRAINT bff_state_pkey PRIMARY KEY (id);


--
-- Name: bff_type_representative bff_type_representative_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bff_type_representative
    ADD CONSTRAINT bff_type_representative_pkey PRIMARY KEY (id);


--
-- Name: bff_um bff_um_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bff_um
    ADD CONSTRAINT bff_um_pkey PRIMARY KEY (id);


--
-- Name: bff_vendor_representative bff_vender_representative_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bff_vendor_representative
    ADD CONSTRAINT bff_vender_representative_pkey PRIMARY KEY (id);


--
-- Name: bff_vendor_customers bff_vendor_customers_idvendor_idcustomers_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bff_vendor_customers
    ADD CONSTRAINT bff_vendor_customers_idvendor_idcustomers_key UNIQUE (idvendor, idcustomers);


--
-- Name: bff_vendor_customers bff_vendor_customers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bff_vendor_customers
    ADD CONSTRAINT bff_vendor_customers_pkey PRIMARY KEY (id);


--
-- Name: bff_vendor_customers_price bff_vendor_customers_price_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bff_vendor_customers_price
    ADD CONSTRAINT bff_vendor_customers_price_pkey PRIMARY KEY (idprice);


--
-- Name: bff_vendor bff_vendor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bff_vendor
    ADD CONSTRAINT bff_vendor_pkey PRIMARY KEY (id);


--
-- Name: bff_vendor_prices bff_vendor_prices_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bff_vendor_prices
    ADD CONSTRAINT bff_vendor_prices_pkey PRIMARY KEY (idprice);


--
-- Name: bff_vendor_products bff_vendor_products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bff_vendor_products
    ADD CONSTRAINT bff_vendor_products_pkey PRIMARY KEY (id);


--
-- Name: bff_vendor_products bff_vendor_products_sku_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bff_vendor_products
    ADD CONSTRAINT bff_vendor_products_sku_key UNIQUE (sku);


--
-- Name: credentials_entity credentials_entity_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.credentials_entity
    ADD CONSTRAINT credentials_entity_pkey PRIMARY KEY (id);


--
-- Name: dff_permission dff_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dff_permission
    ADD CONSTRAINT dff_permission_pkey PRIMARY KEY (id);


--
-- Name: dff_role_permission dff_role_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dff_role_permission
    ADD CONSTRAINT dff_role_permission_pkey PRIMARY KEY (id_role, id_permission);


--
-- Name: dff_role dff_role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dff_role
    ADD CONSTRAINT dff_role_pkey PRIMARY KEY (id);


--
-- Name: dff_role dff_role_role_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dff_role
    ADD CONSTRAINT dff_role_role_key UNIQUE (role);


--
-- Name: dff_users dff_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dff_users
    ADD CONSTRAINT dff_users_pkey PRIMARY KEY (id);


--
-- Name: event_destinations event_destinations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_destinations
    ADD CONSTRAINT event_destinations_pkey PRIMARY KEY (id);


--
-- Name: execution_data execution_data_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.execution_data
    ADD CONSTRAINT execution_data_pkey PRIMARY KEY ("executionId");


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: execution_entity pk_e3e63bbf986767844bbe1166d4e; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.execution_entity
    ADD CONSTRAINT pk_e3e63bbf986767844bbe1166d4e PRIMARY KEY (id);


--
-- Name: workflow_statistics pk_workflow_statistics; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.workflow_statistics
    ADD CONSTRAINT pk_workflow_statistics PRIMARY KEY ("workflowId", name);


--
-- Name: workflows_tags pk_workflows_tags; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.workflows_tags
    ADD CONSTRAINT pk_workflows_tags PRIMARY KEY ("workflowId", "tagId");


--
-- Name: tag_entity tag_entity_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tag_entity
    ADD CONSTRAINT tag_entity_pkey PRIMARY KEY (id);


--
-- Name: test_definition test_definition_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.test_definition
    ADD CONSTRAINT test_definition_pkey PRIMARY KEY (id);


--
-- Name: variables variables_key_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.variables
    ADD CONSTRAINT variables_key_key UNIQUE (key);


--
-- Name: variables variables_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.variables
    ADD CONSTRAINT variables_pkey PRIMARY KEY (id);


--
-- Name: workflow_entity workflow_entity_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.workflow_entity
    ADD CONSTRAINT workflow_entity_pkey PRIMARY KEY (id);


--
-- Name: IDX_14f68deffaf858465715995508; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IDX_14f68deffaf858465715995508" ON public.folder USING btree ("projectId", id);


--
-- Name: IDX_1d8ab99d5861c9388d2dc1cf73; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IDX_1d8ab99d5861c9388d2dc1cf73" ON public.insights_metadata USING btree ("workflowId");


--
-- Name: IDX_1e31657f5fe46816c34be7c1b4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_1e31657f5fe46816c34be7c1b4" ON public.workflow_history USING btree ("workflowId");


--
-- Name: IDX_1ef35bac35d20bdae979d917a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IDX_1ef35bac35d20bdae979d917a3" ON public.user_api_keys USING btree ("apiKey");


--
-- Name: IDX_3a4e9cf37111ac3270e2469b47; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_3a4e9cf37111ac3270e2469b47" ON public.test_metric USING btree ("testDefinitionId");


--
-- Name: IDX_3a81713a76f2295b12b46cdfca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_3a81713a76f2295b12b46cdfca" ON public.test_run USING btree ("testDefinitionId");


--
-- Name: IDX_5f0643f6717905a05164090dde; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_5f0643f6717905a05164090dde" ON public.project_relation USING btree ("userId");


--
-- Name: IDX_60b6a84299eeb3f671dfec7693; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IDX_60b6a84299eeb3f671dfec7693" ON public.insights_by_period USING btree ("periodStart", type, "periodUnit", "metaId");


--
-- Name: IDX_61448d56d61802b5dfde5cdb00; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_61448d56d61802b5dfde5cdb00" ON public.project_relation USING btree ("projectId");


--
-- Name: IDX_63d7bbae72c767cf162d459fcc; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IDX_63d7bbae72c767cf162d459fcc" ON public.user_api_keys USING btree ("userId", label);


--
-- Name: IDX_8e4b4774db42f1e6dda3452b2a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_8e4b4774db42f1e6dda3452b2a" ON public.test_case_execution USING btree ("testRunId");


--
-- Name: IDX_97f863fa83c4786f1956508496; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IDX_97f863fa83c4786f1956508496" ON public.execution_annotations USING btree ("executionId");


--
-- Name: IDX_9ec1ce6fbf82305f489adb971d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_9ec1ce6fbf82305f489adb971d" ON public.test_definition USING btree ("evaluationWorkflowId");


--
-- Name: IDX_a3697779b366e131b2bbdae297; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_a3697779b366e131b2bbdae297" ON public.execution_annotation_tags USING btree ("tagId");


--
-- Name: IDX_ae51b54c4bb430cf92f48b623f; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IDX_ae51b54c4bb430cf92f48b623f" ON public.annotation_tag_entity USING btree (name);


--
-- Name: IDX_b0dd0087fe3da02b0ffa4b9c5b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_b0dd0087fe3da02b0ffa4b9c5b" ON public.test_definition USING btree ("workflowId");


--
-- Name: IDX_c1519757391996eb06064f0e7c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_c1519757391996eb06064f0e7c" ON public.execution_annotation_tags USING btree ("annotationId");


--
-- Name: IDX_cec8eea3bf49551482ccb4933e; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IDX_cec8eea3bf49551482ccb4933e" ON public.execution_metadata USING btree ("executionId", key);


--
-- Name: IDX_execution_entity_deletedAt; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_execution_entity_deletedAt" ON public.execution_entity USING btree ("deletedAt");


--
-- Name: IDX_workflow_entity_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_workflow_entity_name" ON public.workflow_entity USING btree (name);


--
-- Name: idx_07fde106c0b471d8cc80a64fc8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_07fde106c0b471d8cc80a64fc8 ON public.credentials_entity USING btree (type);


--
-- Name: idx_16f4436789e804e3e1c9eeb240; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_16f4436789e804e3e1c9eeb240 ON public.webhook_entity USING btree ("webhookId", method, "pathLength");


--
-- Name: idx_812eb05f7451ca757fb98444ce; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX idx_812eb05f7451ca757fb98444ce ON public.tag_entity USING btree (name);


--
-- Name: idx_execution_entity_stopped_at_status_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_execution_entity_stopped_at_status_deleted_at ON public.execution_entity USING btree ("stoppedAt", status, "deletedAt") WHERE (("stoppedAt" IS NOT NULL) AND ("deletedAt" IS NULL));


--
-- Name: idx_execution_entity_wait_till_status_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_execution_entity_wait_till_status_deleted_at ON public.execution_entity USING btree ("waitTill", status, "deletedAt") WHERE (("waitTill" IS NOT NULL) AND ("deletedAt" IS NULL));


--
-- Name: idx_execution_entity_workflow_id_started_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_execution_entity_workflow_id_started_at ON public.execution_entity USING btree ("workflowId", "startedAt") WHERE (("startedAt" IS NOT NULL) AND ("deletedAt" IS NULL));


--
-- Name: idx_workflows_tags_workflow_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_workflows_tags_workflow_id ON public.workflows_tags USING btree ("workflowId");


--
-- Name: ix_dff_permission_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX ix_dff_permission_name ON public.dff_permission USING btree (name);


--
-- Name: ix_dff_users_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX ix_dff_users_email ON public.dff_users USING btree (email);


--
-- Name: ix_dff_users_username; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX ix_dff_users_username ON public.dff_users USING btree (username);


--
-- Name: ix_messages_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_messages_id ON public.messages USING btree (id);


--
-- Name: ix_messages_section_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_messages_section_id ON public.messages USING btree (section_id);


--
-- Name: ix_messages_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_messages_user_id ON public.messages USING btree (user_id);


--
-- Name: pk_credentials_entity_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX pk_credentials_entity_id ON public.credentials_entity USING btree (id);


--
-- Name: pk_tag_entity_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX pk_tag_entity_id ON public.tag_entity USING btree (id);


--
-- Name: pk_test_definition_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX pk_test_definition_id ON public.test_definition USING btree (id);


--
-- Name: pk_variables_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX pk_variables_id ON public.variables USING btree (id);


--
-- Name: pk_workflow_entity_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX pk_workflow_entity_id ON public.workflow_entity USING btree (id);


--
-- Name: bff_contact update_contact_modtime; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_contact_modtime BEFORE UPDATE ON public.bff_contact FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: bff_responsibility update_responsibility_modtime; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_responsibility_modtime BEFORE UPDATE ON public.bff_responsibility FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: processed_data FK_06a69a7032c97a763c2c7599464; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.processed_data
    ADD CONSTRAINT "FK_06a69a7032c97a763c2c7599464" FOREIGN KEY ("workflowId") REFERENCES public.workflow_entity(id) ON DELETE CASCADE;


--
-- Name: insights_metadata FK_1d8ab99d5861c9388d2dc1cf733; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.insights_metadata
    ADD CONSTRAINT "FK_1d8ab99d5861c9388d2dc1cf733" FOREIGN KEY ("workflowId") REFERENCES public.workflow_entity(id) ON DELETE SET NULL;


--
-- Name: workflow_history FK_1e31657f5fe46816c34be7c1b4b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.workflow_history
    ADD CONSTRAINT "FK_1e31657f5fe46816c34be7c1b4b" FOREIGN KEY ("workflowId") REFERENCES public.workflow_entity(id) ON DELETE CASCADE;


--
-- Name: insights_metadata FK_2375a1eda085adb16b24615b69c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.insights_metadata
    ADD CONSTRAINT "FK_2375a1eda085adb16b24615b69c" FOREIGN KEY ("projectId") REFERENCES public.project(id) ON DELETE SET NULL;


--
-- Name: test_case_execution FK_258d954733841d51edd826a562b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.test_case_execution
    ADD CONSTRAINT "FK_258d954733841d51edd826a562b" FOREIGN KEY ("pastExecutionId") REFERENCES public.execution_entity(id) ON DELETE SET NULL;


--
-- Name: execution_metadata FK_31d0b4c93fb85ced26f6005cda3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.execution_metadata
    ADD CONSTRAINT "FK_31d0b4c93fb85ced26f6005cda3" FOREIGN KEY ("executionId") REFERENCES public.execution_entity(id) ON DELETE CASCADE;


--
-- Name: test_metric FK_3a4e9cf37111ac3270e2469b475; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.test_metric
    ADD CONSTRAINT "FK_3a4e9cf37111ac3270e2469b475" FOREIGN KEY ("testDefinitionId") REFERENCES public.test_definition(id) ON DELETE CASCADE;


--
-- Name: test_run FK_3a81713a76f2295b12b46cdfcab; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.test_run
    ADD CONSTRAINT "FK_3a81713a76f2295b12b46cdfcab" FOREIGN KEY ("testDefinitionId") REFERENCES public.test_definition(id) ON DELETE CASCADE;


--
-- Name: shared_credentials FK_416f66fc846c7c442970c094ccf; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shared_credentials
    ADD CONSTRAINT "FK_416f66fc846c7c442970c094ccf" FOREIGN KEY ("credentialsId") REFERENCES public.credentials_entity(id) ON DELETE CASCADE;


--
-- Name: project_relation FK_5f0643f6717905a05164090dde7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_relation
    ADD CONSTRAINT "FK_5f0643f6717905a05164090dde7" FOREIGN KEY ("userId") REFERENCES public."user"(id) ON DELETE CASCADE;


--
-- Name: project_relation FK_61448d56d61802b5dfde5cdb002; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_relation
    ADD CONSTRAINT "FK_61448d56d61802b5dfde5cdb002" FOREIGN KEY ("projectId") REFERENCES public.project(id) ON DELETE CASCADE;


--
-- Name: insights_by_period FK_6414cfed98daabbfdd61a1cfbc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.insights_by_period
    ADD CONSTRAINT "FK_6414cfed98daabbfdd61a1cfbc0" FOREIGN KEY ("metaId") REFERENCES public.insights_metadata("metaId") ON DELETE CASCADE;


--
-- Name: insights_raw FK_6e2e33741adef2a7c5d66befa4e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.insights_raw
    ADD CONSTRAINT "FK_6e2e33741adef2a7c5d66befa4e" FOREIGN KEY ("metaId") REFERENCES public.insights_metadata("metaId") ON DELETE CASCADE;


--
-- Name: installed_nodes FK_73f857fc5dce682cef8a99c11dbddbc969618951; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.installed_nodes
    ADD CONSTRAINT "FK_73f857fc5dce682cef8a99c11dbddbc969618951" FOREIGN KEY (package) REFERENCES public.installed_packages("packageName") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: folder FK_804ea52f6729e3940498bd54d78; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.folder
    ADD CONSTRAINT "FK_804ea52f6729e3940498bd54d78" FOREIGN KEY ("parentFolderId") REFERENCES public.folder(id) ON DELETE CASCADE;


--
-- Name: shared_credentials FK_812c2852270da1247756e77f5a4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shared_credentials
    ADD CONSTRAINT "FK_812c2852270da1247756e77f5a4" FOREIGN KEY ("projectId") REFERENCES public.project(id) ON DELETE CASCADE;


--
-- Name: test_case_execution FK_8e4b4774db42f1e6dda3452b2af; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.test_case_execution
    ADD CONSTRAINT "FK_8e4b4774db42f1e6dda3452b2af" FOREIGN KEY ("testRunId") REFERENCES public.test_run(id) ON DELETE CASCADE;


--
-- Name: folder_tag FK_94a60854e06f2897b2e0d39edba; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.folder_tag
    ADD CONSTRAINT "FK_94a60854e06f2897b2e0d39edba" FOREIGN KEY ("folderId") REFERENCES public.folder(id) ON DELETE CASCADE;


--
-- Name: execution_annotations FK_97f863fa83c4786f19565084960; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.execution_annotations
    ADD CONSTRAINT "FK_97f863fa83c4786f19565084960" FOREIGN KEY ("executionId") REFERENCES public.execution_entity(id) ON DELETE CASCADE;


--
-- Name: test_definition FK_9ec1ce6fbf82305f489adb971d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.test_definition
    ADD CONSTRAINT "FK_9ec1ce6fbf82305f489adb971d3" FOREIGN KEY ("evaluationWorkflowId") REFERENCES public.workflow_entity(id) ON DELETE SET NULL;


--
-- Name: execution_annotation_tags FK_a3697779b366e131b2bbdae2976; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.execution_annotation_tags
    ADD CONSTRAINT "FK_a3697779b366e131b2bbdae2976" FOREIGN KEY ("tagId") REFERENCES public.annotation_tag_entity(id) ON DELETE CASCADE;


--
-- Name: shared_workflow FK_a45ea5f27bcfdc21af9b4188560; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shared_workflow
    ADD CONSTRAINT "FK_a45ea5f27bcfdc21af9b4188560" FOREIGN KEY ("projectId") REFERENCES public.project(id) ON DELETE CASCADE;


--
-- Name: folder FK_a8260b0b36939c6247f385b8221; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.folder
    ADD CONSTRAINT "FK_a8260b0b36939c6247f385b8221" FOREIGN KEY ("projectId") REFERENCES public.project(id) ON DELETE CASCADE;


--
-- Name: test_definition FK_b0dd0087fe3da02b0ffa4b9c5bb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.test_definition
    ADD CONSTRAINT "FK_b0dd0087fe3da02b0ffa4b9c5bb" FOREIGN KEY ("workflowId") REFERENCES public.workflow_entity(id) ON DELETE CASCADE;


--
-- Name: execution_annotation_tags FK_c1519757391996eb06064f0e7c8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.execution_annotation_tags
    ADD CONSTRAINT "FK_c1519757391996eb06064f0e7c8" FOREIGN KEY ("annotationId") REFERENCES public.execution_annotations(id) ON DELETE CASCADE;


--
-- Name: test_definition FK_d5d7ea64662dbc62f5e266fbeb0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.test_definition
    ADD CONSTRAINT "FK_d5d7ea64662dbc62f5e266fbeb0" FOREIGN KEY ("annotationTagId") REFERENCES public.annotation_tag_entity(id) ON DELETE SET NULL;


--
-- Name: shared_workflow FK_daa206a04983d47d0a9c34649ce; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shared_workflow
    ADD CONSTRAINT "FK_daa206a04983d47d0a9c34649ce" FOREIGN KEY ("workflowId") REFERENCES public.workflow_entity(id) ON DELETE CASCADE;


--
-- Name: folder_tag FK_dc88164176283de80af47621746; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.folder_tag
    ADD CONSTRAINT "FK_dc88164176283de80af47621746" FOREIGN KEY ("tagId") REFERENCES public.tag_entity(id) ON DELETE CASCADE;


--
-- Name: test_case_execution FK_dfbe194e3ebdfe49a87bc4692ca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.test_case_execution
    ADD CONSTRAINT "FK_dfbe194e3ebdfe49a87bc4692ca" FOREIGN KEY ("evaluationExecutionId") REFERENCES public.execution_entity(id) ON DELETE SET NULL;


--
-- Name: user_api_keys FK_e131705cbbc8fb589889b02d457; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_api_keys
    ADD CONSTRAINT "FK_e131705cbbc8fb589889b02d457" FOREIGN KEY ("userId") REFERENCES public."user"(id) ON DELETE CASCADE;


--
-- Name: test_case_execution FK_e48965fac35d0f5b9e7f51d8c44; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.test_case_execution
    ADD CONSTRAINT "FK_e48965fac35d0f5b9e7f51d8c44" FOREIGN KEY ("executionId") REFERENCES public.execution_entity(id) ON DELETE SET NULL;


--
-- Name: auth_identity auth_identity_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_identity
    ADD CONSTRAINT "auth_identity_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."user"(id);


--
-- Name: bff_Questions_Answers bff_Questions_Answers_idusser_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."bff_Questions_Answers"
    ADD CONSTRAINT "bff_Questions_Answers_idusser_fkey" FOREIGN KEY (idusser) REFERENCES public.dff_users(id);


--
-- Name: bff_competence bff_competence_idcontry_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bff_competence
    ADD CONSTRAINT bff_competence_idcontry_fkey FOREIGN KEY (idcontry) REFERENCES public.bff_country(id);


--
-- Name: bff_competence bff_competence_idstate_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bff_competence
    ADD CONSTRAINT bff_competence_idstate_fkey FOREIGN KEY (idstate) REFERENCES public.bff_state(id);


--
-- Name: bff_competence_products bff_competence_products_idcompetence_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bff_competence_products
    ADD CONSTRAINT bff_competence_products_idcompetence_fkey FOREIGN KEY (idcompetence) REFERENCES public.bff_competence(id);


--
-- Name: bff_contact bff_contact_idcontry_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bff_contact
    ADD CONSTRAINT bff_contact_idcontry_fkey FOREIGN KEY (country_id) REFERENCES public.bff_country(id);


--
-- Name: bff_contact bff_contact_idresponsability_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bff_contact
    ADD CONSTRAINT bff_contact_idresponsability_fkey FOREIGN KEY (responsibility_id) REFERENCES public.bff_responsibility(id);


--
-- Name: bff_contact bff_contact_idstate_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bff_contact
    ADD CONSTRAINT bff_contact_idstate_fkey FOREIGN KEY (state_id) REFERENCES public.bff_state(id);


--
-- Name: bff_contact bff_contact_idtype_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bff_contact
    ADD CONSTRAINT bff_contact_idtype_fkey FOREIGN KEY (type_id) REFERENCES public.bff_contact_type(id);


--
-- Name: bff_customers bff_customers_idcontry_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bff_customers
    ADD CONSTRAINT bff_customers_idcontry_fkey FOREIGN KEY (idcontry) REFERENCES public.bff_country(id);


--
-- Name: bff_customers bff_customers_idstate_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bff_customers
    ADD CONSTRAINT bff_customers_idstate_fkey FOREIGN KEY (idstate) REFERENCES public.bff_state(id);


--
-- Name: bff_customers bff_customers_idtype_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bff_customers
    ADD CONSTRAINT bff_customers_idtype_fkey FOREIGN KEY (idtype) REFERENCES public.bff_customers_type(id);


--
-- Name: bff_messages bff_messages_conversation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bff_messages
    ADD CONSTRAINT bff_messages_conversation_id_fkey FOREIGN KEY (conversation_id) REFERENCES public.bff_conversations(id) ON DELETE CASCADE;


--
-- Name: bff_products_MP bff_products_MP_idum_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."bff_products_MP"
    ADD CONSTRAINT "bff_products_MP_idum_fkey" FOREIGN KEY (idum) REFERENCES public.bff_um(id);


--
-- Name: bff_products bff_products_idcategory_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bff_products
    ADD CONSTRAINT bff_products_idcategory_fkey FOREIGN KEY (idcategory) REFERENCES public.bff_category(id);


--
-- Name: bff_products bff_products_idum_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bff_products
    ADD CONSTRAINT bff_products_idum_fkey FOREIGN KEY (idum) REFERENCES public.bff_um(id);


--
-- Name: bff_products_prop bff_products_prop_idproduct_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bff_products_prop
    ADD CONSTRAINT bff_products_prop_idproduct_fkey FOREIGN KEY (idproduct) REFERENCES public.bff_products(id);


--
-- Name: bff_products_vendor_products bff_products_vendor_products_idproduct_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bff_products_vendor_products
    ADD CONSTRAINT bff_products_vendor_products_idproduct_fkey FOREIGN KEY (idproduct) REFERENCES public.bff_products(id);


--
-- Name: bff_products_vendor_products bff_products_vendor_products_idproductvendor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bff_products_vendor_products
    ADD CONSTRAINT bff_products_vendor_products_idproductvendor_fkey FOREIGN KEY (idproductvendor) REFERENCES public.bff_vendor_products(id);


--
-- Name: bff_relation_product_competence bff_relation_product_competence_idcompetenceprod_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bff_relation_product_competence
    ADD CONSTRAINT bff_relation_product_competence_idcompetenceprod_fkey FOREIGN KEY (idcompetenceprod) REFERENCES public.bff_competence_products(id);


--
-- Name: bff_relation_product_competence bff_relation_product_competence_idproduct_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bff_relation_product_competence
    ADD CONSTRAINT bff_relation_product_competence_idproduct_fkey FOREIGN KEY (idproduct) REFERENCES public.bff_products(id);


--
-- Name: bff_state bff_state_idcontry_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bff_state
    ADD CONSTRAINT bff_state_idcontry_fkey FOREIGN KEY (country_id) REFERENCES public.bff_country(id);


--
-- Name: bff_vendor_representative bff_vender_representative_idtype_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bff_vendor_representative
    ADD CONSTRAINT bff_vender_representative_idtype_fkey FOREIGN KEY (idtype) REFERENCES public.bff_type_representative(id);


--
-- Name: bff_vendor_representative bff_vender_representative_idvendor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bff_vendor_representative
    ADD CONSTRAINT bff_vender_representative_idvendor_fkey FOREIGN KEY (idvendor) REFERENCES public.bff_vendor(id);


--
-- Name: bff_vendor_customers bff_vendor_customers_idcustomers_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bff_vendor_customers
    ADD CONSTRAINT bff_vendor_customers_idcustomers_fkey FOREIGN KEY (idcustomers) REFERENCES public.bff_customers(id);


--
-- Name: bff_vendor_customers bff_vendor_customers_idvendor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bff_vendor_customers
    ADD CONSTRAINT bff_vendor_customers_idvendor_fkey FOREIGN KEY (idvendor) REFERENCES public.bff_vendor(id);


--
-- Name: bff_vendor_customers_price bff_vendor_customers_price_idproduct_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bff_vendor_customers_price
    ADD CONSTRAINT bff_vendor_customers_price_idproduct_fkey FOREIGN KEY (idproduct) REFERENCES public.bff_products(id);


--
-- Name: bff_vendor_customers_price bff_vendor_customers_price_idvendorcustomers_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bff_vendor_customers_price
    ADD CONSTRAINT bff_vendor_customers_price_idvendorcustomers_fkey FOREIGN KEY (idvendorcustomers) REFERENCES public.bff_vendor_customers(id);


--
-- Name: bff_vendor bff_vendor_idcontry_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bff_vendor
    ADD CONSTRAINT bff_vendor_idcontry_fkey FOREIGN KEY (idcontry) REFERENCES public.bff_country(id);


--
-- Name: bff_vendor bff_vendor_idstate_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bff_vendor
    ADD CONSTRAINT bff_vendor_idstate_fkey FOREIGN KEY (idstate) REFERENCES public.bff_state(id);


--
-- Name: bff_vendor_prices bff_vendor_prices_idproduct_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bff_vendor_prices
    ADD CONSTRAINT bff_vendor_prices_idproduct_fkey FOREIGN KEY (idproduct) REFERENCES public.bff_products(id);


--
-- Name: bff_vendor_prices bff_vendor_prices_idvendor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bff_vendor_prices
    ADD CONSTRAINT bff_vendor_prices_idvendor_fkey FOREIGN KEY (idvendor) REFERENCES public.bff_vendor(id);


--
-- Name: bff_vendor_products bff_vendor_products_idum_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bff_vendor_products
    ADD CONSTRAINT bff_vendor_products_idum_fkey FOREIGN KEY (idum) REFERENCES public.bff_um(id);


--
-- Name: dff_role_permission dff_role_permission_id_permission_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dff_role_permission
    ADD CONSTRAINT dff_role_permission_id_permission_fkey FOREIGN KEY (id_permission) REFERENCES public.dff_permission(id);


--
-- Name: dff_role_permission dff_role_permission_id_role_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dff_role_permission
    ADD CONSTRAINT dff_role_permission_id_role_fkey FOREIGN KEY (id_role) REFERENCES public.dff_role(id);


--
-- Name: execution_data execution_data_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.execution_data
    ADD CONSTRAINT execution_data_fk FOREIGN KEY ("executionId") REFERENCES public.execution_entity(id) ON DELETE CASCADE;


--
-- Name: execution_entity fk_execution_entity_workflow_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.execution_entity
    ADD CONSTRAINT fk_execution_entity_workflow_id FOREIGN KEY ("workflowId") REFERENCES public.workflow_entity(id) ON DELETE CASCADE;


--
-- Name: bff_vendor fk_vendor_representative; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bff_vendor
    ADD CONSTRAINT fk_vendor_representative FOREIGN KEY (idrepresentative) REFERENCES public.bff_representative(id);


--
-- Name: webhook_entity fk_webhook_entity_workflow_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.webhook_entity
    ADD CONSTRAINT fk_webhook_entity_workflow_id FOREIGN KEY ("workflowId") REFERENCES public.workflow_entity(id) ON DELETE CASCADE;


--
-- Name: workflow_entity fk_workflow_parent_folder; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.workflow_entity
    ADD CONSTRAINT fk_workflow_parent_folder FOREIGN KEY ("parentFolderId") REFERENCES public.folder(id) ON DELETE CASCADE;


--
-- Name: workflow_statistics fk_workflow_statistics_workflow_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.workflow_statistics
    ADD CONSTRAINT fk_workflow_statistics_workflow_id FOREIGN KEY ("workflowId") REFERENCES public.workflow_entity(id) ON DELETE CASCADE;


--
-- Name: workflows_tags fk_workflows_tags_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.workflows_tags
    ADD CONSTRAINT fk_workflows_tags_tag_id FOREIGN KEY ("tagId") REFERENCES public.tag_entity(id) ON DELETE CASCADE;


--
-- Name: workflows_tags fk_workflows_tags_workflow_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.workflows_tags
    ADD CONSTRAINT fk_workflows_tags_workflow_id FOREIGN KEY ("workflowId") REFERENCES public.workflow_entity(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

