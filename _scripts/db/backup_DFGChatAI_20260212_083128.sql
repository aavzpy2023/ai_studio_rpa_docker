--
-- PostgreSQL database dump
--

\restrict pEQz2yDpz74UNlx6KtwcCikFnVSz8jbgOw8UxLxmQuCRylpYvagLNGVtoFKadt8

-- Dumped from database version 17.7 (Debian 17.7-3.pgdg12+1)
-- Dumped by pg_dump version 17.7 (Debian 17.7-3.pgdg12+1)

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
DROP INDEX IF EXISTS public.ix_source_unique;
DROP INDEX IF EXISTS public.ix_messages_user_id;
DROP INDEX IF EXISTS public.ix_messages_section_id;
DROP INDEX IF EXISTS public.ix_messages_id;
DROP INDEX IF EXISTS public.ix_knowledge_embedding;
DROP INDEX IF EXISTS public.ix_dff_users_username;
DROP INDEX IF EXISTS public.ix_dff_users_email;
DROP INDEX IF EXISTS public.ix_dff_permission_name;
DROP INDEX IF EXISTS public.ix_ai_messages_user_id;
DROP INDEX IF EXISTS public.ix_ai_messages_section_id;
DROP INDEX IF EXISTS public.ix_ai_messages_id;
DROP INDEX IF EXISTS public.ix_ai_knowledge_store_security_scope;
DROP INDEX IF EXISTS public.ix_ai_knowledge_store_content_hash;
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
ALTER TABLE IF EXISTS ONLY public.ai_messages DROP CONSTRAINT IF EXISTS ai_messages_pkey;
ALTER TABLE IF EXISTS ONLY public.ai_knowledge_store DROP CONSTRAINT IF EXISTS ai_knowledge_store_pkey;
ALTER TABLE IF EXISTS ONLY public.ai_external_source_config DROP CONSTRAINT IF EXISTS ai_external_source_config_pkey;
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
ALTER TABLE IF EXISTS public.auth_provider_sync_history ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.ai_knowledge_store ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.ai_external_source_config ALTER COLUMN id DROP DEFAULT;
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
DROP TABLE IF EXISTS public.bff_country;
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
DROP TABLE IF EXISTS public.ai_messages;
DROP SEQUENCE IF EXISTS public.ai_knowledge_store_id_seq;
DROP TABLE IF EXISTS public.ai_knowledge_store;
DROP SEQUENCE IF EXISTS public.ai_external_source_config_id_seq;
DROP TABLE IF EXISTS public.ai_external_source_config;
DROP TABLE IF EXISTS public."__EFMigrationsHistory";
DROP FUNCTION IF EXISTS public.update_updated_at_column();
DROP EXTENSION IF EXISTS vector;
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
-- Name: vector; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS vector WITH SCHEMA public;


--
-- Name: EXTENSION vector; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION vector IS 'vector data type and ivfflat and hnsw access methods';


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
-- Name: ai_external_source_config; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ai_external_source_config (
    id integer NOT NULL,
    connection_url text NOT NULL,
    mappings jsonb NOT NULL,
    sync_interval_minutes integer NOT NULL,
    is_active boolean NOT NULL
);


--
-- Name: ai_external_source_config_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ai_external_source_config_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ai_external_source_config_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ai_external_source_config_id_seq OWNED BY public.ai_external_source_config.id;


--
-- Name: ai_knowledge_store; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ai_knowledge_store (
    id integer NOT NULL,
    source_type character varying(100) NOT NULL,
    source_id character varying(100) NOT NULL,
    security_scope character varying(50) NOT NULL,
    content text NOT NULL,
    embedding public.vector(768) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    prev_chunk_id integer,
    next_chunk_id integer,
    content_hash character varying(64),
    metadata jsonb DEFAULT '{}'::jsonb,
    last_synced_at timestamp without time zone
);


--
-- Name: ai_knowledge_store_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ai_knowledge_store_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ai_knowledge_store_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ai_knowledge_store_id_seq OWNED BY public.ai_knowledge_store.id;


--
-- Name: ai_messages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ai_messages (
    id character varying NOT NULL,
    content character varying NOT NULL,
    user_id character varying NOT NULL,
    role character varying NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    section_id character varying NOT NULL
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
    lockout_until timestamp with time zone,
    session_id character varying(36) DEFAULT NULL::character varying
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
-- Name: ai_external_source_config id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ai_external_source_config ALTER COLUMN id SET DEFAULT nextval('public.ai_external_source_config_id_seq'::regclass);


--
-- Name: ai_knowledge_store id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ai_knowledge_store ALTER COLUMN id SET DEFAULT nextval('public.ai_knowledge_store_id_seq'::regclass);


--
-- Name: auth_provider_sync_history id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_provider_sync_history ALTER COLUMN id SET DEFAULT nextval('public.auth_provider_sync_history_id_seq'::regclass);


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
-- Data for Name: ai_external_source_config; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ai_external_source_config (id, connection_url, mappings, sync_interval_minutes, is_active) FROM stdin;
1	local://system	[{"columns": ["id", "email", "username", "lastname", "password", "firstname", "middname", "movil", "lockout_until", "updated_at", "active", "Phone", "id_role", "failed_attempts", "created_at", "session_id"], "table_name": "dff_users"}]	60	t
2	local://system	[{"columns": [{"name": "id", "path": "root", "alias": "id", "destination": "vector"}, {"name": "email", "path": "root", "alias": "email", "destination": "vector"}, {"name": "username", "path": "root", "alias": "username", "destination": "vector"}, {"name": "lastname", "path": "root", "alias": "lastname", "destination": "vector"}, {"name": "password", "path": "root", "alias": "password", "destination": "vector"}, {"name": "firstname", "path": "root", "alias": "firstname", "destination": "vector"}, {"name": "middname", "path": "root", "alias": "middname", "destination": "vector"}, {"name": "movil", "path": "root", "alias": "movil", "destination": "vector"}, {"name": "lockout_until", "path": "root", "alias": "lockout_until", "destination": "vector"}, {"name": "updated_at", "path": "root", "alias": "updated_at", "destination": "vector"}, {"name": "active", "path": "root", "alias": "active", "destination": "vector"}, {"name": "Phone", "path": "root", "alias": "Phone", "destination": "vector"}, {"name": "id_role", "path": "root", "alias": "id_role", "destination": "vector"}, {"name": "failed_attempts", "path": "root", "alias": "failed_attempts", "destination": "vector"}, {"name": "created_at", "path": "root", "alias": "created_at", "destination": "vector"}, {"name": "session_id", "path": "root", "alias": "session_id", "destination": "vector"}], "table_name": "dff_users"}, {"columns": [{"name": "title", "path": "idcategory->bff_category", "alias": "bff_category_title", "destination": "vector"}, {"name": "idcategory", "path": "root", "alias": "idcategory", "destination": "vector"}, {"name": "description", "path": "idum->bff_um", "alias": "bff_um_description", "destination": "vector"}, {"name": "idum", "path": "root", "alias": "idum", "destination": "vector"}, {"name": "description", "path": "root", "alias": "description", "destination": "vector"}, {"name": "sku", "path": "root", "alias": "sku", "destination": "vector"}, {"name": "islot", "path": "root", "alias": "islot", "destination": "vector"}], "table_name": "bff_products"}]	60	t
\.


--
-- Data for Name: ai_knowledge_store; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ai_knowledge_store (id, source_type, source_id, security_scope, content, embedding, created_at, prev_chunk_id, next_chunk_id, content_hash, metadata, last_synced_at) FROM stdin;
1	external.dff_users	4	public	Record from database table 'dff_users': id: 4 | email: avinajera2011@gmail.com | username: one | lastname: user | password: $2b$12$9NMLV7Tj9w0L71Y.TG7Gou8cJ0/K/wmW4.nsUJOYrNOP1NGFoaqWC | firstname: one | updated_at: 2026-02-04 21:06:48.553796+00:00 | active: True | Phone: 06146491554 | id_role: 9 | created_at: 2026-02-03 20:06:08.451404	[-0.6421211,1.2973183,-3.4623127,-0.65726686,1.8070612,-0.94070315,0.27436268,-0.67215174,-0.049272876,0.2662244,-1.8851165,0.25706214,1.0647168,-0.59499407,0.38338634,-0.5493575,-0.6307434,-1.6757088,-0.12771715,-0.06822049,-0.873973,-1.2885991,-1.1462734,-0.409814,1.9328221,-0.19493674,0.3525918,0.4934328,-1.0159706,0.19247863,-0.00051496946,0.4411543,0.02112868,-0.67683166,0.14908688,-0.36784893,-0.35964182,1.0491248,0.30063882,-0.40088326,1.4934926,-0.21985893,-0.5611968,0.30479914,0.0446672,-0.16128118,1.2413327,0.5618518,1.8194273,0.10701635,0.06895761,0.33911407,0.09795194,-0.47254756,0.10580713,0.5495151,-0.80317754,0.107482895,0.024437858,-0.9575723,2.4114108,1.2124038,-0.69907856,2.038307,0.5468568,0.07419042,-0.6330852,0.8503398,-0.02679856,-1.3931347,0.5451107,0.6310278,0.81003505,0.9254301,-0.09205162,0.13463746,-0.84907335,-1.2347078,0.38160628,0.20191586,1.079921,0.19984151,0.35127938,-0.7298696,0.9050515,-0.339044,0.41692185,1.101233,0.032161232,0.64141154,-0.3211513,0.44662195,0.7165407,0.31702596,-0.22438338,1.2396623,-0.45569408,0.25977686,-0.8887793,-0.43432283,-0.11020674,-0.49460852,0.5456615,0.069401525,0.4601818,0.46317095,-0.5705226,-0.35389996,-0.49889162,-0.21930079,-1.6160767,0.96523905,-0.31270844,-0.31227228,0.45318046,-0.16691574,1.51214,-1.3706102,0.35244444,0.38480014,-0.52759767,-0.21862279,-0.2819219,1.0530689,-0.27259085,0.24319133,-0.21739954,0.1921817,0.17212807,-0.63632923,-1.0085831,-0.80577123,-0.24985932,-0.26296324,0.17776202,0.94038504,-0.6304166,-0.10670369,-0.001105126,0.07660336,1.0202327,-0.03738373,-0.49637455,-1.5939579,0.4741013,-1.0030749,1.3186032,-0.3823846,-0.6473673,0.5019757,1.0880312,-0.47581849,-0.35165688,0.31022358,0.028952578,-1.1805948,-0.4672975,0.03623835,0.24472739,1.2374762,0.39964637,-0.48436034,-0.56467247,0.9679213,-0.41105637,-1.2211667,-0.122625306,0.82480794,-0.09170838,0.6683524,-0.504592,-1.3558966,-0.029478697,-0.64463115,0.27789733,-0.6616854,-0.18332568,-0.23018828,0.6328141,-0.63604,1.4510447,-0.7635003,1.8328847,0.5925117,-0.30333483,-0.8534087,0.28045908,0.011679177,-0.39158732,-0.7652047,-0.23440373,0.72988886,-0.980471,-0.593406,-0.72940266,-0.65464485,1.1782048,-0.07077136,-0.21459036,-0.6405717,-0.99711275,0.010432523,-0.11169267,0.8342645,-0.34470934,0.6561321,0.09387736,0.07409003,-0.19903585,0.34426847,0.5797562,-0.70480955,-0.4764703,0.1432638,0.26788068,-0.6830143,0.45627394,-0.35996786,-0.28544375,0.6948382,0.6650899,0.15466653,0.59901243,0.17416896,1.0987774,-0.37498143,-0.5150677,-0.23887387,-1.0399816,-0.3526766,-0.3661806,-1.1829816,0.45957005,-0.4493937,-0.2543039,0.6384356,-0.50441825,0.9164207,-0.3435633,0.34228438,-0.25406373,0.6126841,-0.17585887,0.34495363,-0.7880218,0.27869245,-0.5325127,-0.21766832,0.8008375,1.5719228,-0.46309087,-0.15537046,0.7875237,0.8524606,0.055358067,-0.7016956,-1.1175952,0.01466361,1.1841635,-0.6020086,0.26907295,-0.7402484,0.4549926,-0.73106074,-0.22967298,-1.5340686,-0.8912584,-0.53219247,-0.11879927,-0.31746987,0.39949578,0.885124,-0.67678475,0.5731186,-0.32077205,0.112978145,0.38590056,-0.35577777,-0.31835192,1.214824,-0.3973523,-0.9257038,-0.51998955,0.6135603,-0.07359148,0.69136727,1.2786158,0.2250499,-0.16561545,0.1077986,0.4164368,0.08366081,-0.8435985,0.22023697,-0.24761222,0.36751482,1.4996306,0.24733898,0.32215285,-0.017230403,-0.00010155258,0.12291104,0.6574752,0.42609093,0.26765254,-0.46616352,0.7522876,0.062642634,0.929257,0.17873132,-0.38995564,0.29864213,-0.18001038,1.0547862,-1.0756266,0.36396685,0.16062747,0.25544852,0.36754587,0.16292837,0.3260338,-1.041396,-0.16704763,-0.540421,0.5489322,1.4566128,-0.758031,1.6842285,0.43634826,-0.89285374,0.74369574,0.31201568,-0.22057159,-0.70876765,0.3238482,0.13760538,-0.097723134,-0.27628484,-0.3624322,1.4369124,0.5524674,0.3212554,0.00071815215,-1.2897226,-0.44071215,0.01633337,-0.5285464,0.46022075,0.086010955,0.75510615,-1.9964131,0.5603926,-0.10392374,-0.04959443,0.42603728,-0.123187535,0.14557849,0.88526636,-0.18240823,-0.20596449,0.9478547,0.23000386,0.62935936,0.030303802,0.63763857,0.8352694,0.5255387,-0.80796003,1.4074494,-0.03959237,-0.5580671,-0.5264855,1.0906616,0.70473695,0.35151792,0.25255063,-1.5310638,-0.34852105,-0.2856988,0.86275774,0.64952606,-0.35379222,0.44597623,0.57931536,0.12804724,-0.83790815,0.25871617,-0.0817047,0.0013041912,0.41676602,-0.46858063,-0.7512485,-0.21653673,1.2006506,0.48012742,-0.877765,0.48016584,0.36558938,0.57896996,1.6333869,-0.6463189,-0.4126835,0.14144067,-0.08614888,0.39929706,1.2461877,-0.38349235,-0.7988324,0.43278542,-0.1499895,-0.38577312,1.1419413,0.024648793,-0.79212916,0.12709157,0.8257133,0.7858911,-0.48695514,0.13475308,-1.0938783,2.3501053,0.42014107,0.5575954,-0.4279447,-0.42423102,0.3624627,0.49027273,0.42863262,-0.30865464,-1.2609673,0.23065953,0.7701321,0.7766506,0.3090157,-0.85440576,0.45672715,1.6609037,-0.10058667,0.98548627,0.71704775,0.9118365,-1.1360813,0.18790682,-0.10858859,0.7705213,1.3803735,0.59592366,-0.55778396,-0.2053401,0.94902456,0.18464512,0.40620762,0.6492581,0.47115844,1.6646544,-0.3833423,1.3784257,-0.18169247,0.64781296,0.93367046,-0.13856886,0.15121335,-0.22976512,0.6851606,-0.42737252,-1.065819,0.46128628,-0.40297437,0.35752055,0.7253084,-0.5669703,-0.39941147,0.50303155,-0.19663352,-0.49734348,-0.26205567,0.007309271,-0.63427454,0.16461405,0.65438265,0.11469129,0.41977775,-1.0120709,-0.9553586,-0.5575098,-0.15544794,1.3265711,-0.7546348,0.22108291,0.22320274,-0.44636878,-0.5867682,0.44778705,-0.6581791,-0.3501872,-0.8953971,-1.0463709,0.049668625,0.35157672,-0.36718458,-0.80357665,1.1351633,-0.90190864,-0.5835453,0.36036393,-0.6373132,0.21015343,-1.1318431,-0.5269293,-0.69592,-1.0295423,-0.7174622,0.52005917,0.3320573,0.34057882,-0.2814839,0.8845882,0.7206162,-0.7269551,0.9037105,-0.40313137,-0.38530913,-0.35225204,-0.06444426,-1.214714,-0.0067960336,0.22287901,-1.2401223,0.4998066,0.2299823,0.1376635,0.83617306,-1.5156647,-0.34364262,-0.00204049,0.25340265,-0.5886409,-0.10514567,0.03979588,0.763696,0.01810241,0.3267498,0.006481917,-0.5768507,-0.46425846,-0.47635496,0.06106544,-0.0044966107,-0.49120232,0.28474212,0.43438312,-0.80585986,0.028465614,0.042939574,0.7201554,-0.64351255,0.23553976,-0.20078506,-0.38739508,-0.43626836,-0.21063855,0.9717322,0.573356,0.019722024,-0.36050126,-1.127659,0.25337073,-0.72773767,-0.029134534,-0.46448556,-0.24491341,-1.2326858,-0.2688814,-0.74979997,-0.21388446,0.22808582,0.05097479,-1.1865839,-1.5283955,-0.5946142,-0.81769985,-0.46046668,0.8592445,0.8108376,0.19090632,0.14273292,-0.8736675,-1.0112959,-0.6374902,-0.57720417,-0.15441887,0.22327761,0.01618391,0.019363206,-0.5785839,0.5479405,0.7646562,-1.1627753,-0.29247794,-1.1416428,0.40920168,0.38641796,0.3607295,-0.3156342,-0.5058643,0.82581323,-0.64047736,0.75939506,-0.05755077,-1.0085417,0.45527795,0.6065431,-0.20134309,0.003892525,1.2557242,-0.5132241,1.1516165,0.73415196,-0.051086385,0.2746929,0.120256685,-1.5740384,0.8908711,0.08954601,0.96662366,-0.060863506,-1.1754302,-0.36243507,-0.19390905,0.6185164,-0.16245843,1.2847275,-1.2210909,-1.1411004,-1.0134816,-0.08440146,0.4124783,-0.15873972,0.82341665,0.6885738,0.28013903,0.33100924,0.26191694,0.6978492,1.0231149,-0.0909677,0.15594213,0.78790075,0.88199073,-0.7978275,1.5091447,1.2455168,0.48666292,0.28091618,0.7593798,-0.06158532,0.07623599,-0.38904792,-0.93098265,0.3501123,0.3262443,0.4132039,-0.5400575,0.0062832464,0.20912237,-0.096631795,0.60405797,-0.48829022,-1.4149662,-1.1017892,0.884701,-0.33168375,0.5616345,-0.1742968,0.49595955,1.891036,0.91205186,-0.109178744,-0.7844275,-0.2985501,-0.47109306,-0.33805603,0.07510038,-1.1791216,-0.048633143,0.61114025,0.828383,-0.5064418,0.15464881,-0.88755465,-1.0096172,-1.9701371,-0.6208906,-0.8271822,-0.5365996,0.4807779,-0.26734903,-0.22242224,-0.60948074,0.99987245,0.005606548,0.90733933,-0.27086797,0.6325703,-0.18184006,-0.40811935,-0.81156,-0.0012861378,-0.44561353,0.08348709,0.41820338,0.125955,-0.3993488,1.3829226,0.88120735,0.71836555,-0.36464638,-0.5370094,-0.14228775,-0.82315063,1.2433568,-0.5835372,-1.3665454,-0.40698487,-0.7960128,-0.6275713,0.057601962,-0.29217812,1.2123922,-0.29890767,-0.3695296,0.08285963,-1.0164721,0.94953346,-0.5762223,-0.14651097,-0.4177753,-0.8730166,-0.74223024,-0.54569334,-0.70242983,1.5653673,0.06528162,-0.35451102,0.105550155,-0.33973968,-1.4738796,0.048764322,0.24066433,-0.13178706,0.03160501,-1.2823806,-0.56831396,0.5525487,-0.13765512,1.1225184,-0.10914859,0.18463337,2.0954385,0.34493694,0.036891665,-0.26991108,1.0574495,1.3845257,0.5814635,-1.2639318,-0.29265156,-0.34270552]	2026-02-10 19:53:24.250552	\N	\N	\N	{}	\N
2	external.dff_users	5	public	Record from database table 'dff_users': id: 5 | email: r00t@dfgchatai.com | username: r00t | lastname: Administrator | password: $2b$12$JzIA.LYEpdCAXglSx7vQmebad09k8DsPAzaGvwPl8gy57.VIsWkaG | firstname: System | middname: Root | updated_at: 2026-02-10 19:43:48.691660+00:00 | active: True | Phone: 00000000000 | id_role: 1 | created_at: 2026-02-10 19:43:48.691654	[-0.1798929,0.7856746,-3.580592,-0.37786162,1.5875524,-1.1825684,0.2875121,-0.054162595,-0.46286917,-0.50006723,-1.7642871,0.6510687,0.9343898,-0.43881515,0.3276256,-0.25641847,-0.7313293,-1.0854199,-0.296906,-0.014382765,-0.41102198,-1.3538723,-1.1211731,0.15619719,1.6500218,0.20590593,0.7119016,0.6795513,-0.87230915,0.18624605,0.48822948,0.70300764,0.3430187,-0.2673806,-0.6225563,-0.5291406,0.3064354,0.30259302,0.47029918,0.24894373,0.92133737,-0.117718875,-0.5340695,-0.36241618,-0.08543687,-0.12318053,0.13868845,0.98306715,0.8951458,0.18604887,-0.16224,0.26149592,-0.036383852,-0.4588743,0.08693137,0.5310454,-0.7081735,0.12990788,-0.16631544,-0.8831532,2.1617656,0.8649438,-1.0728614,1.6809182,0.5102286,0.4187717,-0.2888129,1.2578291,-0.30398205,-1.2156546,0.2744906,0.5463121,1.0573511,0.97411793,-0.2252264,0.08350177,-0.8596647,-0.9824042,0.4289751,0.14980948,0.7870097,-0.4590328,1.1128129,-0.34148964,0.48503664,0.22794536,0.2813479,1.2196376,-0.112404406,1.3789643,0.061680168,0.36681572,0.4828801,-0.14346944,-0.71561104,1.3609641,-0.13415575,0.16926315,-1.377042,-0.8077531,0.30457628,-0.46316275,0.61849266,0.79246217,0.8546261,0.39944857,-0.00039695928,-0.014182441,-0.6466711,-0.24551322,-1.3650517,1.6784189,0.07193518,-0.07827385,0.61185384,-0.59704095,1.088426,-1.0441793,-0.09201546,0.4743044,-0.49328142,0.078671575,-0.13756222,0.78979474,0.11146748,0.3371874,-1.1165944,-0.18619958,0.14141403,-0.2525402,-0.761219,-0.3215515,-0.7683095,-0.015855022,0.77970546,1.0959592,-0.24929363,-0.39811972,-0.21834545,-0.13846031,0.70599014,0.1842739,-0.19890386,-1.6708212,0.0597146,-0.972857,1.612696,-0.5007397,-0.4874955,0.57006395,0.387561,-0.56269526,-0.23802373,0.22480585,-0.09316626,-1.0999714,-0.17443326,0.13939247,0.21806367,1.2849171,0.013159228,0.22237697,-0.7969664,0.6828087,-0.11157209,-1.6058537,0.36138862,0.5168643,0.40912783,0.61783373,-0.59928364,-0.6620538,-0.088476084,-0.018018782,0.14233312,-0.82584774,-0.13852862,-0.2923511,0.89128256,-0.69651943,1.2693465,-1.1635318,1.6152204,0.2847177,-0.10917908,-0.8328493,0.715954,-0.4313205,-0.44440117,0.029316887,0.094644114,0.60003763,-0.52868813,-0.6893627,-0.5722833,-0.6060106,0.53196514,0.07265012,0.33787224,-0.70305943,-0.39392123,-0.53738123,-0.31937143,0.9050838,-0.4404626,0.7995679,-0.7252566,-0.33382314,-0.8798555,0.3217643,0.68664426,-0.82692707,-0.9494193,0.16033497,0.10914139,-0.18193793,0.5858851,-0.5687441,0.04235295,0.7982941,0.38632232,0.08370182,0.5760092,-0.5300974,0.5510544,-0.584028,-0.32595053,-0.68072134,-0.76285213,-0.4265164,-0.072593845,-1.8449564,0.52381015,0.11647612,-0.1994334,0.3982993,-0.6886572,0.78698564,-0.18818076,0.3155139,-0.34156767,0.35895994,-0.10196102,1.1754849,-0.9037218,0.47092155,-0.7026538,-0.38145965,0.6736502,1.3564068,0.7435445,-0.5947281,0.7561214,0.3082833,-0.10164256,-1.3187388,-1.7168512,0.07539981,0.57108957,-0.99097097,0.22377214,-0.32664272,0.30840567,-0.35917023,-0.5209611,-1.3747258,-0.33532575,-0.42475942,-0.3815531,-0.038934927,1.001345,0.8385692,-0.50443506,1.1295387,-0.5882388,0.6183281,-0.23825276,-0.24768467,-0.7943004,1.0457164,-0.03965333,-1.2161717,-0.048523087,1.0952806,-0.17105445,0.6142627,1.1330503,0.13986033,-0.3454099,0.255146,0.8440271,-0.24368134,-0.63830715,0.6169111,-0.563034,0.11080724,1.2012365,0.02921083,-0.103558734,0.53151345,0.20943668,0.08842279,0.9109131,0.85369414,-0.18751632,-0.68215084,0.6535759,0.23747782,0.90473473,-0.12039735,-0.35379383,-0.26293024,-0.2145405,0.757531,-0.82132167,0.2388117,0.4121423,0.39282525,0.6023984,0.25415075,0.37665698,-0.6449999,-0.38921654,0.08767019,0.38718766,1.4208314,-0.55981135,1.3524145,0.49560252,-0.90446705,1.355682,0.5011451,-0.35220906,-0.59285116,-0.09796776,0.3737435,-0.14630724,-0.15809812,-0.28613877,1.3585222,1.2948562,0.07181075,0.12565175,-1.1611611,-0.4832579,-0.56977177,-0.470301,0.3198164,-0.077913664,0.5368746,-1.9386078,0.76075715,-0.69059825,-0.35662514,0.79558766,-0.39242476,0.013249236,0.9538362,-0.41949907,-0.01326047,0.8487126,0.5026192,0.282398,-0.25586733,0.5578468,0.9468021,0.59875846,-0.20165116,0.8380577,0.19316159,-0.5797997,-0.8031013,0.72989154,0.91722256,0.4685583,0.102739036,-1.3396655,-0.8864496,-0.56990415,1.008648,0.5464291,-0.43372747,0.5819871,0.7199214,0.07764727,-1.3011712,0.21140444,-0.26612276,0.35654038,1.111349,-0.19746664,-0.2914992,-0.307618,1.0593655,0.27857885,-0.33799148,0.389051,1.2045249,0.6903938,0.9121158,-0.42907637,-0.93469507,0.32020107,0.16418509,0.18118992,1.1931741,-0.7954073,-1.1082796,1.3194753,-0.16483188,0.0600649,0.89211255,-0.1065736,-0.50213295,0.12679127,0.42660475,0.5103133,-0.41070592,-0.12022549,-0.52587396,2.167557,0.0708357,0.76685864,0.107721455,0.1792832,0.007771646,0.5044889,0.33279327,-0.008786099,-1.557115,0.0636314,0.46206668,0.5538306,0.52370185,-1.3185105,0.07954093,1.3963165,0.24894802,0.81927973,0.8059393,1.0646499,-0.6198757,-0.4409911,-0.03291927,-0.070434794,1.5710258,1.0582997,-0.34903023,-0.5159124,1.3819109,0.07089779,0.26637468,0.38087237,0.68117225,1.3029395,-0.1998555,0.7416228,-0.3303309,0.2069834,0.84043044,-0.20748934,0.059868123,-0.19603355,0.6117504,-0.12996483,-0.63989997,0.2755609,-0.45750505,0.073662445,1.4978693,-0.46631226,-0.5289263,0.84662414,-0.34437057,-0.8165908,0.54505324,-0.28234524,-0.91281414,0.68611866,0.8638656,0.27085298,0.023621567,-0.55622363,-0.9076242,-0.15343788,-0.06604057,0.645788,-0.14146835,0.59021217,-0.24446395,-0.16868235,-0.1442657,0.11056096,-0.54481477,-0.26684445,-0.54278785,-1.097825,-0.59280884,0.09488724,0.029019453,-0.52025974,0.78910947,-0.52406764,-0.19053875,0.35958326,-0.75086766,1.1802785,-1.3588703,-0.3501649,-0.6144097,-1.0688926,0.077678055,0.8670696,0.6423171,0.6695941,-0.48359743,0.8131812,0.9351354,-0.43657216,1.0432462,-0.35113138,-0.6112017,-0.056968927,-0.388701,-1.1792246,0.110759385,0.5026582,-0.9122879,0.48806357,-0.009457805,0.0424762,0.5671082,-1.4492779,-0.4358527,-0.013835513,-0.09837836,-0.6433795,0.2671692,0.068587966,1.055789,0.039194793,-0.24481031,-0.298423,-1.195171,-0.1445524,-0.36076972,0.49141943,-0.22503848,-0.7649156,-0.09472197,0.53279895,-0.4446298,-0.06566426,-0.10596774,0.5738322,-0.73855156,0.33418757,-0.1522528,-0.60170424,-0.5208854,-0.17354755,0.8418278,0.5856816,0.19641078,-0.78804356,-0.74877906,0.010516937,-0.11586361,-0.026998596,-0.68556935,0.08446035,-1.2040939,-0.31013185,-0.24601755,-0.37521315,0.25164312,-0.020143595,-0.3808652,-0.62716854,-0.48990852,-1.1953399,-0.43973428,0.82649446,0.85787433,0.18191074,0.119563065,-0.5029745,-0.8426045,-0.23335852,-0.4036991,0.08230306,0.2795667,-0.25745884,-0.034852024,-0.21414617,0.55890006,0.15467608,-0.65735334,-0.25188452,-0.942813,-0.056665584,0.5109747,0.7681882,-0.86603457,-0.15687095,0.57687974,-0.17344731,0.5410859,-0.656283,-1.1130981,0.7397664,0.28848013,-0.101484746,-0.34150854,0.784571,-0.6156584,1.1684301,0.5985197,0.033912152,0.41990197,-0.26456216,-1.887978,0.6184262,-0.72615224,0.8532226,-0.22298767,-0.63820446,-0.23576388,-0.06315855,0.23932764,0.16136214,0.60368425,-0.86988336,-1.3671213,-1.1695321,0.233479,0.02897774,0.010956122,0.78662485,0.37644482,0.7760352,0.6747637,0.0703844,0.3994146,0.9843592,-0.17545661,0.3808151,0.84502476,0.52950686,-0.72393954,1.7894045,0.87385535,0.19298664,-0.100752294,1.1263974,-0.3414919,0.04953971,-0.46186662,-1.4830022,-0.22820416,0.54282737,0.51696575,-0.51574147,-0.2855459,-0.010922137,0.3235387,0.8666467,0.17525133,-1.3013781,-0.9083586,0.31416714,0.12038305,0.46402076,-0.3329093,0.589707,1.6790378,1.2024242,0.116717786,-0.82310736,-0.17090254,0.25494444,-0.39517668,-0.008782462,-1.8470143,0.094799414,0.7188876,0.94913733,-0.42792457,-0.17260197,-0.58146465,-1.0755197,-1.5345317,-0.7271429,-0.82482463,-1.031776,0.4083526,-0.24899293,-0.17150472,-0.3083007,0.92494345,0.20099291,0.15216827,0.09870948,0.9554477,0.05274392,-0.26699862,-0.68760467,0.09407313,-0.61790526,0.30341384,-0.14465983,-0.6212733,-0.6970156,0.59737784,0.2664669,0.5894497,-0.9472452,-0.61733854,0.02805282,-0.9735323,1.1187793,-0.83276194,-1.5860475,-0.78168267,-1.1420196,-0.1834279,0.2139004,-0.92412,1.4880569,-0.17057458,-0.30056125,0.037284028,-0.76563424,1.0938041,-1.1383525,-0.5819918,-0.28426635,-1.2099127,-0.8813049,-0.8331101,-0.89714354,1.1018265,-0.038285557,0.25883618,-0.16344754,0.35777736,-1.530395,0.047242634,0.70559037,-0.23702912,0.22061859,-0.96455747,-0.36902067,0.5394495,-0.32421517,0.89113516,-0.10937124,0.53807384,2.0877197,0.8100033,0.075241305,-0.7558624,1.2304193,1.181377,0.5061549,-0.8395483,-0.5742063,-0.3791551]	2026-02-10 19:53:24.817291	\N	\N	\N	{}	\N
3	external.dff_users	1	public	Record from database table 'dff_users': id: 1 | email: admin@dfgchatai.com | username: admin | lastname: Administrator | password: $2b$12$z1r0BtMaqIvrY.VBVcM29u9SWtxsrqpIb.cgOyVCeYrS5cUGAuCA6 | firstname: System | middname: Root | updated_at: 2026-02-10 19:43:58.852366+00:00 | active: True | Phone: 00000000000 | id_role: 1 | created_at: 2026-01-21 13:28:37.149478 | session_id: 27794c18-e273-4da9-8677-e23c4d23a562	[-0.48417154,1.4154761,-3.4876027,-0.7656089,1.9182974,-1.590858,0.189568,-0.018726772,-0.20991161,-0.82797194,-1.3570313,0.5297311,0.5507992,-0.4449164,0.51283664,-0.17577647,-0.9193984,-1.0795325,-0.6765923,-0.5832118,-0.38264757,-1.1019586,-0.6508987,-0.14229278,1.9971093,0.19045748,0.5004559,0.47864753,-0.76997894,0.37729076,0.5494479,0.69025785,0.6209872,-0.19383793,-0.656507,-0.94149053,0.076129615,0.9921995,0.38998738,0.29208806,0.9052988,-0.020894567,-0.72190547,-0.45209035,-0.35864657,-0.37054855,0.42258847,1.1007719,0.81999624,0.22843492,-0.15383637,0.16230147,-0.10323194,-0.17664804,-0.05496171,0.6459077,-0.28289697,0.3054883,0.05650899,-0.9706207,2.3249552,0.5182409,-0.75738776,1.4597723,0.29513803,0.45923835,-0.12247863,0.993078,-0.34557873,-1.214184,0.21483476,0.58221114,0.98629266,0.95352566,-0.32422253,0.14694482,-0.88346857,-1.20311,0.5291837,0.16014518,0.6293595,-0.1830452,1.1466024,-0.7799596,0.58133525,0.41934502,0.037265718,1.0968397,-0.09298246,1.0185664,0.14467835,0.18112539,0.6110044,0.17325334,-0.58234704,1.3702947,-0.05458854,0.40641993,-1.0522566,-0.54708356,0.052609842,-0.48188168,0.50068533,0.3052553,0.8457793,0.75453264,-0.301335,0.10498338,-0.87360513,-0.012968243,-1.3278072,1.6982541,0.074894294,0.16311419,0.9276906,-0.5461342,1.093947,-0.73369515,-0.025472717,0.57594824,-0.5119561,-0.06372756,-0.49219692,0.48793626,0.07776736,0.2667883,-1.0452856,-0.09673891,0.24294452,-0.24626103,-0.818838,-0.6189114,-0.81379366,0.19950624,1.0453655,0.8834915,-0.24160063,-0.3715669,-0.1345108,-0.34848094,0.633536,-0.005819556,-0.24660541,-1.6689545,0.26235646,-0.8700958,2.049916,-0.5939431,-0.20120075,0.64207727,0.3204734,-0.5092964,-0.22032183,0.4489,0.0031477835,-1.0877473,-0.4906572,-0.021943426,0.39013484,1.1766778,0.20817377,0.013600047,-0.6183008,0.5737917,-0.07924094,-1.8089868,0.50770634,0.83135444,0.61390924,0.32007727,-0.6594481,-0.5102625,0.040537152,-0.16894,0.013712188,-0.60315204,-0.39942902,-0.11419657,0.81155956,-0.66682893,1.4600316,-0.97785234,1.6533338,0.2696638,0.009262524,-0.7767731,0.6899174,-0.41736978,-0.42730394,0.038513217,-0.19612479,0.546979,-0.064602934,-0.43296084,-0.34792474,-1.0032717,1.055418,0.071402095,0.28967053,-0.60677993,-0.12255752,-0.2544051,-0.23178269,0.6191629,0.05249166,0.7311598,-0.607557,-0.3720376,-0.8615937,0.23352006,0.9284977,-0.4049653,-0.9892316,0.48644856,-0.04986465,-0.46095648,0.30576208,-0.6367313,0.042923335,0.46877187,0.4674419,-0.19717558,0.61071765,-0.48279774,0.9534769,-0.43537968,-0.66876614,-0.7813831,-0.9006114,-0.35747737,-0.35279587,-1.5325042,0.42510587,-0.023202877,-0.21443515,0.53568137,-0.28317085,0.99815416,-0.24205644,0.4426478,-0.5997795,0.45081183,0.2330423,0.7584146,-0.8848447,0.5322512,-0.87629,-0.4620385,0.62932414,1.2515483,0.6336809,-0.32494688,0.9652032,0.13950655,0.041277446,-1.2081058,-1.5109166,0.3357243,0.8744923,-1.0212067,0.17462288,-0.80078,0.5650835,-0.65545917,-0.23206359,-1.3392911,-0.59265745,-0.43074277,-0.5865052,-0.054888636,1.095646,0.90729564,-0.4689898,1.0038372,-0.3790546,0.61833704,0.18592946,-0.0009843457,-0.93130547,0.8924538,-0.3203953,-0.9850627,-0.07189821,0.92730534,0.02487443,0.42039317,1.3548689,0.14930671,-0.49893478,-0.06312362,0.93394804,-0.2538768,-0.5357888,0.53577685,-0.5289756,0.054471303,1.2319169,0.31692252,-0.18776125,0.23971014,0.14013909,-0.006828767,0.5601091,0.97762114,0.08199589,-0.27622274,0.6473308,0.44726738,0.7681363,0.113671996,-0.44849998,-0.4063143,0.18453115,0.49505842,-0.7782461,0.4011234,0.20327426,0.26429576,0.5010028,0.18275727,0.18956454,-0.8956522,-0.6905731,0.12056873,0.37411478,1.3700895,-0.6218184,1.4359312,0.23138471,-1.1790105,1.1572214,0.080824055,-0.4092325,-0.6243406,-0.105672,0.115818396,0.20807749,-0.122239284,-0.32308367,1.3892899,1.4313945,0.23945662,0.22070551,-1.3835996,-0.4521546,-0.51073873,-0.23328504,0.5090516,-0.21928473,0.607054,-1.8809347,0.7313632,-0.4127737,-0.1672253,0.7515479,-0.5128255,0.020332161,0.59516853,-0.54921544,-0.1407888,0.9900718,0.3141563,0.20012912,-0.19819957,0.58685374,0.5874087,0.5065939,-0.20283838,0.8009456,-0.059540816,-0.54971844,-0.4615949,0.7981661,0.37550926,0.19248089,0.024976593,-1.257612,-0.54856926,-0.5106092,0.7973629,0.3168295,-0.14006418,0.52667177,0.6247002,0.08919671,-1.1418056,0.20990393,0.0015023659,0.054106567,0.9640586,-0.29725885,-0.42558497,-0.08228361,1.352942,0.38279104,-0.45168704,0.36753455,0.98494637,0.51150006,1.1880882,-0.57821655,-0.8757794,0.26369768,0.07077985,0.1228544,1.4501057,-0.85019755,-1.1923829,1.1888509,-0.26115274,0.39647397,0.61078465,0.06607894,-0.45008197,-0.02510481,0.260811,0.49071836,-0.22080368,-0.02496523,-0.49431598,2.1989198,-0.23751211,0.37794137,0.281567,0.3391919,-0.1886815,0.36460668,0.44853845,-0.10580197,-1.641085,-0.031835277,0.6416497,0.54653484,0.5269263,-1.4708598,0.11185141,1.2498829,-0.11496701,0.9136832,0.9372511,0.99294627,-0.8024035,-0.5832804,0.2267834,0.08894748,1.4097592,1.1225028,-0.4350551,-0.54950386,1.2273839,0.20882435,0.16705939,0.41692552,0.7893382,1.2640545,-0.55787975,0.9347211,0.0649785,0.1452657,0.77803564,-0.25191283,0.010046229,-0.2798122,0.6096654,-0.14035456,-0.28227416,0.4583749,-0.61685807,-0.091232456,1.5806053,-0.528033,-0.62554777,1.1065764,-0.30999723,-0.47067848,0.36441797,-0.13180143,-0.85601276,0.66103834,1.0557352,0.14442183,0.08372804,-0.8246566,-0.8027608,-0.47779968,-0.22179718,0.8508709,-0.18670277,0.18666556,-0.06607685,-0.42254525,-0.10005272,-0.10172799,-0.40237284,-0.08539633,-0.67776966,-1.0471551,-0.64950264,0.29762554,-0.31696475,-0.59399176,0.9541918,-0.58350736,-0.2885267,0.30468524,-0.6536939,1.170016,-1.2629918,-0.2628768,-0.4502339,-0.93737227,-0.28221953,0.83527714,0.6826818,0.42366043,-0.29566917,0.9722647,1.1175715,-0.49188167,1.1440728,-0.30795258,-0.39047623,-0.06939805,-0.4418604,-1.4689294,-0.14153022,0.34767652,-0.9451706,0.8245047,0.5550821,0.11724272,0.2563459,-1.5480616,-0.4006073,-0.17131788,-0.22386688,-0.6988091,0.13767721,0.25683492,1.1349112,-0.009734179,-0.35419682,-0.20378953,-0.90020066,-0.63695765,-0.53562427,0.38479778,-0.26590958,-0.8248668,0.33708844,0.6499614,-0.39950636,0.19692619,0.15980187,0.6260041,-0.374518,0.20199084,-0.10149002,-0.39578816,-0.5290425,-0.13244477,0.89458954,0.5273906,0.17641698,-0.5907997,-0.93796724,-0.2855572,0.07900005,0.082560666,-0.7196452,-0.22968361,-1.4899182,-0.4084245,-0.15769172,-0.23601688,0.064012334,-0.28131014,-0.10291802,-0.8369514,-0.69379216,-1.2604817,-0.0024148102,1.1644006,0.7719473,0.064219065,-0.003107922,-0.9081574,-0.73985344,-0.40581846,-0.5706035,0.08192143,0.5359919,-0.33234388,0.0014599327,-0.15593953,0.9525509,0.36279398,-0.54683036,-0.25417677,-1.1890363,0.079743594,0.4472255,0.3581415,-0.6458479,-0.039022867,0.73766536,-0.07892676,0.537137,-0.42938155,-1.147865,0.7922291,0.679515,-0.029011419,-0.24400747,0.5084296,-0.59989446,1.1428612,0.63077295,0.061494596,0.5195284,-0.058230545,-1.6854326,0.55096334,-0.67262954,0.6056285,-0.29090098,-0.9606312,-0.36285326,-0.055901736,0.4164737,0.2160423,0.87176484,-0.9602007,-1.7512122,-0.9937372,0.3180884,-0.22840548,-0.17437819,0.5755002,0.50125635,0.738062,0.58639014,0.10409884,0.27230144,0.81434315,-0.21220548,0.18548259,0.75954735,0.80191064,-0.5178317,1.7394035,0.79129416,0.2191909,0.1375222,1.0227011,-0.1536089,0.23744182,-0.5867835,-1.2414405,-0.16255318,0.65884596,0.42814004,-0.65843815,0.08508711,0.09108467,0.23466486,0.76019955,0.033773176,-1.1976489,-1.1513478,0.6768833,0.19910339,0.24441625,-0.25955644,0.633194,1.698616,1.2677164,0.16055174,-0.72359717,-0.17572613,0.14848115,-0.38308784,0.24278665,-1.9684792,0.027101254,0.6054603,0.9319438,-0.49806982,0.07786472,-0.46225312,-1.3477578,-1.7678019,-0.94018424,-1.2975006,-1.1915004,0.5448067,-0.18880703,-0.26529497,-0.35885596,0.8143511,0.060797762,0.051977605,0.0070568738,0.73721623,-0.07383608,-0.34290847,-0.5663191,0.3572737,-0.6992367,0.5324509,-0.06647416,-0.6204483,-0.8663438,0.86480576,-0.02369143,0.48554483,-0.9589893,-0.68496656,0.057145454,-0.8391112,0.9418136,-0.6906811,-1.3794694,-0.66770536,-0.8844017,-0.98446304,-0.01848434,-0.37172192,1.4773638,0.09592692,-0.56779927,-0.15982886,-0.809993,0.56956726,-1.0191405,-0.5895223,0.022858575,-1.2793417,-0.7656965,-1.1345254,-0.57366407,1.4796729,-0.08305929,0.32098335,-0.073128216,0.22184722,-1.378905,-0.21023767,0.36801755,-0.23050268,0.43695846,-1.004604,-0.22852366,0.36101508,-0.14056636,0.7481313,-0.1301885,0.61706305,2.164849,0.7519346,-0.30356658,-0.5059105,1.5142841,1.4726107,0.46391863,-0.8768645,-0.5326128,-0.53843343]	2026-02-10 19:53:25.527898	\N	\N	\N	{}	\N
\.


--
-- Data for Name: ai_messages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ai_messages (id, content, user_id, role, created_at, updated_at, section_id) FROM stdin;
f6264985-ddbf-4322-8079-aabeaa77aee7	hola	1	user	2026-02-10 19:44:15.517942+00	2026-02-10 19:44:15.517946+00	01db8e35-121f-4fbe-970c-801bfbc988b0
e59b1d6a-b060-42fb-b239-cfbb3457b8cd	hola	1	user	2026-02-10 19:52:33.22944+00	2026-02-10 19:52:33.229444+00	458eaa4c-a901-43a7-bf59-80a6c7b20b74
bc28ae4b-91b6-4419-9876-0f0d24fb4405	\n\nHola! 😊	1	assistant	2026-02-10 19:52:39.420904+00	2026-02-10 19:52:39.420907+00	458eaa4c-a901-43a7-bf59-80a6c7b20b74
2582c65c-4141-4190-8189-871fb08382c0	cuantos usuarios tenemos	1	user	2026-02-10 19:53:40.260012+00	2026-02-10 19:53:40.260014+00	458eaa4c-a901-43a7-bf59-80a6c7b20b74
e8368d38-dab9-4ac1-a88a-1ffbda2bd12a	\n\nWe have 3 users in total.	1	assistant	2026-02-10 19:53:58.045979+00	2026-02-10 19:53:58.045983+00	458eaa4c-a901-43a7-bf59-80a6c7b20b74
64d4f5b6-b76a-4a90-8e0d-2446b730f6d5	Tell me their names	1	user	2026-02-10 19:54:19.154247+00	2026-02-10 19:54:19.15425+00	458eaa4c-a901-43a7-bf59-80a6c7b20b74
1c0c0afc-fde4-4d09-9f7e-61727e0420b4	\n\nLos usuarios son:  \n- **Avinajera2011@gmail.com** (nombre: avinajera)  \n- **r00t@dfgchatai.com** (nombre: r00t)  \n- **admin@dfgchatai.com** (nombre: admin)	1	assistant	2026-02-10 19:54:33.602192+00	2026-02-10 19:54:33.602195+00	458eaa4c-a901-43a7-bf59-80a6c7b20b74
ec9f3044-ff06-4265-ac8a-f64a54b6d5cc	tell me phone number of admin	1	user	2026-02-10 20:10:51.225746+00	2026-02-10 20:10:51.225749+00	44851ac9-bcc3-48de-adff-e8491835a27c
2eada275-fefa-4c68-a9fb-2cea216a2469	\n\nEl número de teléfono del administrador es 00000000000.	1	assistant	2026-02-10 20:11:17.575664+00	2026-02-10 20:11:17.575667+00	44851ac9-bcc3-48de-adff-e8491835a27c
7b2cb48e-cac7-44c3-a1a2-600711ca0274	and the phone number of one user?	1	user	2026-02-10 20:12:06.230011+00	2026-02-10 20:12:06.230012+00	44851ac9-bcc3-48de-adff-e8491835a27c
e55f794f-300c-4b64-aa8f-cf0fd1e9dd0f	\n\nEl número de teléfono de cada usuario es:  \n- **Avinajera2011@gmail.com**: 06146491554  \n- **r00t@dfgchatai.com**: (número no proporcionado en el contexto)  \n- **admin@dfgchatai.com**: 00000000000.	1	assistant	2026-02-10 20:12:34.905504+00	2026-02-10 20:12:34.905508+00	44851ac9-bcc3-48de-adff-e8491835a27c
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
2	4	2	dfdfdf	\N	Avenue 7 de diciembre	\N	Santa Clara	Villa Clara	14	1	053777668		avinajera2011@gmail.com	t	t	2026-02-04 20:12:48.943318+00	2026-02-04 20:12:48.943321+00
3	2	1	aaaaa	\N	Avenue 7 de	\N	Santa Clara	Villa Clara	11	1	053777668		aaaaaa@gmail.com	t	t	2026-02-04 20:13:21.584519+00	2026-02-04 20:13:21.584522+00
4	1	1	John	Doe	123 Main St	\N	Miami	Dade	1	1	1234567890	987654321	john@example.com	f	t	2026-02-04 20:41:36.057076+00	2026-02-04 20:41:36.05708+00
5	1	1	aaa	sdad	123 Main St	\N	Miami	Dade	1	1	1234567890	987654321	asdfasd@asdas.com	t	t	2026-02-04 20:41:36.068376+00	2026-02-04 20:41:36.068379+00
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
2	1	Acme Corp	123 Ocean Dr	Miami	1	33101   	1
3	1	NEX	Street 8	Miami	2	33251   	1
4	2	XYZ	Street 98	Miami	1	33251   	1
5	1	aaa	123 Ocean Dr	Miami	1	33101   	1
6	1	bbb	Street 8	Miami	2	33251   	1
7	2	cccc	Street 98	Miami	1	33251   	1
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
3	1	PROD-008	Mango 2	1	t	2026-02-06 21:26:57.263604	\N
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
1	\N	Global Tech	123 Blvd	Beverly Hills	5	90210   	1
2	\N	Tech	123 Blvd	hilld	6	56789   	1
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
21	N8N_READ	Access automation workflows	n8n	2026-02-04 19:48:25.472229+00	\N
22	N8N_WRITE	Manage automation workflows	n8n	2026-02-04 19:48:25.472229+00	\N
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
9	developer	2026-02-04 19:48:25.472229+00	\N
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
2	3
9	22
9	21
2	1
2	2
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
1	21
1	22
\.


--
-- Data for Name: dff_users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dff_users (id, username, email, password, firstname, lastname, middname, movil, "Phone", id_role, active, created_at, updated_at, failed_attempts, lockout_until, session_id) FROM stdin;
4	one	avinajera2011@gmail.com	$2b$12$9NMLV7Tj9w0L71Y.TG7Gou8cJ0/K/wmW4.nsUJOYrNOP1NGFoaqWC	one	user		\N	06146491554	9	t	2026-02-03 20:06:08.451404	2026-02-04 21:06:48.553796+00	0	\N	\N
5	r00t	r00t@dfgchatai.com	$2b$12$JzIA.LYEpdCAXglSx7vQmebad09k8DsPAzaGvwPl8gy57.VIsWkaG	System	Administrator	Root	\N	00000000000	1	t	2026-02-10 19:43:48.691654	2026-02-10 19:43:48.69166+00	0	\N	\N
1	admin	admin@dfgchatai.com	$2b$12$z1r0BtMaqIvrY.VBVcM29u9SWtxsrqpIb.cgOyVCeYrS5cUGAuCA6	System	Administrator	Root	\N	00000000000	1	t	2026-01-21 13:28:37.149478	2026-02-10 20:02:54.18849+00	0	\N	dcf3bd90-12fb-4e20-9c2b-ddab8374a022
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
b8757123-aa03-4e7a-8974-6dc331c8d910	hola	1	user	2026-02-06 21:56:27.674707+00	2026-02-06 21:56:27.674712+00	3e7eaf6a-ce29-4bfa-b34a-220a960e7290
bebcd381-3fb4-4d4c-935f-ae2d288beb9e	\n\n¡Hola! ¿Cómo te puedo ayudar hoy? 😊	1	assistant	2026-02-06 21:56:31.769773+00	2026-02-06 21:56:31.769776+00	3e7eaf6a-ce29-4bfa-b34a-220a960e7290
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
-- Name: ai_external_source_config_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ai_external_source_config_id_seq', 2, true);


--
-- Name: ai_knowledge_store_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ai_knowledge_store_id_seq', 3, true);


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

SELECT pg_catalog.setval('public.bff_contact_id_seq', 5, true);


--
-- Name: bff_contact_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bff_contact_type_id_seq', 4, true);


--
-- Name: bff_contry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bff_contry_id_seq', 2, false);


--
-- Name: bff_customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bff_customers_id_seq', 7, true);


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

SELECT pg_catalog.setval('public.bff_products_id_seq', 3, true);


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

SELECT pg_catalog.setval('public.bff_responsability_id_seq', 6, true);


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

SELECT pg_catalog.setval('public.bff_vendor_id_seq', 2, true);


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

SELECT pg_catalog.setval('public.dff_permission_id_seq', 22, true);


--
-- Name: dff_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dff_role_id_seq', 9, true);


--
-- Name: dff_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dff_users_id_seq', 5, true);


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
-- Name: ai_external_source_config ai_external_source_config_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ai_external_source_config
    ADD CONSTRAINT ai_external_source_config_pkey PRIMARY KEY (id);


--
-- Name: ai_knowledge_store ai_knowledge_store_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ai_knowledge_store
    ADD CONSTRAINT ai_knowledge_store_pkey PRIMARY KEY (id);


--
-- Name: ai_messages ai_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ai_messages
    ADD CONSTRAINT ai_messages_pkey PRIMARY KEY (id);


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
-- Name: ix_ai_knowledge_store_content_hash; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_ai_knowledge_store_content_hash ON public.ai_knowledge_store USING btree (content_hash);


--
-- Name: ix_ai_knowledge_store_security_scope; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_ai_knowledge_store_security_scope ON public.ai_knowledge_store USING btree (security_scope);


--
-- Name: ix_ai_messages_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_ai_messages_id ON public.ai_messages USING btree (id);


--
-- Name: ix_ai_messages_section_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_ai_messages_section_id ON public.ai_messages USING btree (section_id);


--
-- Name: ix_ai_messages_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_ai_messages_user_id ON public.ai_messages USING btree (user_id);


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
-- Name: ix_knowledge_embedding; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_knowledge_embedding ON public.ai_knowledge_store USING ivfflat (embedding public.vector_cosine_ops) WITH (lists='100');


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
-- Name: ix_source_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX ix_source_unique ON public.ai_knowledge_store USING btree (source_type, source_id);


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

\unrestrict pEQz2yDpz74UNlx6KtwcCikFnVSz8jbgOw8UxLxmQuCRylpYvagLNGVtoFKadt8

