--
-- PostgreSQL database dump
--

\restrict OgZte5zIAoCkeTChGYXS8n9BdtvYuiSKb1dTuuyFNfTFFTQYvuTofQnZJarrrkG

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
    updated_at timestamp with time zone,
    is_system boolean DEFAULT false
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
3	local://system	[{"columns": [{"name": "id", "path": "root", "alias": "id", "destination": "vector"}, {"name": "email", "path": "root", "alias": "email", "destination": "vector"}, {"name": "username", "path": "root", "alias": "username", "destination": "vector"}, {"name": "lastname", "path": "root", "alias": "lastname", "destination": "vector"}, {"name": "password", "path": "root", "alias": "password", "destination": "vector"}, {"name": "firstname", "path": "root", "alias": "firstname", "destination": "vector"}, {"name": "middname", "path": "root", "alias": "middname", "destination": "vector"}, {"name": "movil", "path": "root", "alias": "movil", "destination": "vector"}, {"name": "lockout_until", "path": "root", "alias": "lockout_until", "destination": "vector"}, {"name": "updated_at", "path": "root", "alias": "updated_at", "destination": "vector"}, {"name": "active", "path": "root", "alias": "active", "destination": "vector"}, {"name": "Phone", "path": "root", "alias": "Phone", "destination": "vector"}, {"name": "id_role", "path": "root", "alias": "id_role", "destination": "vector"}, {"name": "failed_attempts", "path": "root", "alias": "failed_attempts", "destination": "vector"}, {"name": "created_at", "path": "root", "alias": "created_at", "destination": "vector"}, {"name": "session_id", "path": "root", "alias": "session_id", "destination": "vector"}, {"name": "name", "path": "id_role->role", "alias": "role_name", "destination": "vector"}, {"name": "scope", "path": "id_role->role", "alias": "role_scope", "destination": "vector"}, {"name": "createdAt", "path": "id_role->role", "alias": "role_createdAt", "destination": "vector"}, {"name": "updatedAt", "path": "id_role->role", "alias": "role_updatedAt", "destination": "vector"}], "table_name": "dff_users"}, {"columns": [{"name": "title", "path": "idcategory->bff_category", "alias": "bff_category_title", "destination": "vector"}, {"name": "idcategory", "path": "root", "alias": "idcategory", "destination": "vector"}, {"name": "description", "path": "idum->bff_um", "alias": "bff_um_description", "destination": "vector"}, {"name": "idum", "path": "root", "alias": "idum", "destination": "vector"}, {"name": "description", "path": "root", "alias": "description", "destination": "vector"}, {"name": "sku", "path": "root", "alias": "sku", "destination": "vector"}, {"name": "islot", "path": "root", "alias": "islot", "destination": "vector"}], "table_name": "bff_products"}]	60	t
4	local://system	[{"columns": [{"name": "id", "path": "root", "alias": "id", "destination": "vector"}, {"name": "email", "path": "root", "alias": "email", "destination": "vector"}, {"name": "username", "path": "root", "alias": "username", "destination": "vector"}, {"name": "lastname", "path": "root", "alias": "lastname", "destination": "vector"}, {"name": "firstname", "path": "root", "alias": "firstname", "destination": "vector"}, {"name": "middname", "path": "root", "alias": "middname", "destination": "vector"}, {"name": "movil", "path": "root", "alias": "movil", "destination": "vector"}, {"name": "lockout_until", "path": "root", "alias": "lockout_until", "destination": "vector"}, {"name": "updated_at", "path": "root", "alias": "updated_at", "destination": "vector"}, {"name": "active", "path": "root", "alias": "active", "destination": "vector"}, {"name": "Phone", "path": "root", "alias": "Phone", "destination": "vector"}, {"name": "id_role", "path": "root", "alias": "id_role", "destination": "vector"}, {"name": "failed_attempts", "path": "root", "alias": "failed_attempts", "destination": "vector"}, {"name": "created_at", "path": "root", "alias": "created_at", "destination": "vector"}, {"name": "session_id", "path": "root", "alias": "session_id", "destination": "vector"}, {"name": "name", "path": "id_role->role", "alias": "role_name", "destination": "vector"}, {"name": "scope", "path": "id_role->role", "alias": "role_scope", "destination": "vector"}, {"name": "createdAt", "path": "id_role->role", "alias": "role_createdAt", "destination": "vector"}, {"name": "updatedAt", "path": "id_role->role", "alias": "role_updatedAt", "destination": "vector"}, {"name": "password", "path": "root", "alias": "password", "destination": "vector"}], "table_name": "dff_users"}, {"columns": [{"name": "title", "path": "idcategory->bff_category", "alias": "bff_category_title", "destination": "vector"}, {"name": "idcategory", "path": "root", "alias": "idcategory", "destination": "vector"}, {"name": "description", "path": "idum->bff_um", "alias": "bff_um_description", "destination": "vector"}, {"name": "idum", "path": "root", "alias": "idum", "destination": "vector"}, {"name": "description", "path": "root", "alias": "description", "destination": "vector"}, {"name": "sku", "path": "root", "alias": "sku", "destination": "vector"}, {"name": "islot", "path": "root", "alias": "islot", "destination": "vector"}], "table_name": "bff_products"}]	60	t
5	local://system	[{"columns": [{"name": "id", "path": "root", "alias": "id", "destination": "vector"}, {"name": "email", "path": "root", "alias": "email", "destination": "vector"}, {"name": "username", "path": "root", "alias": "username", "destination": "vector"}, {"name": "lastname", "path": "root", "alias": "lastname", "destination": "vector"}, {"name": "firstname", "path": "root", "alias": "firstname", "destination": "vector"}, {"name": "middname", "path": "root", "alias": "middname", "destination": "vector"}, {"name": "movil", "path": "root", "alias": "movil", "destination": "vector"}, {"name": "lockout_until", "path": "root", "alias": "lockout_until", "destination": "vector"}, {"name": "updated_at", "path": "root", "alias": "updated_at", "destination": "vector"}, {"name": "active", "path": "root", "alias": "active", "destination": "vector"}, {"name": "Phone", "path": "root", "alias": "Phone", "destination": "vector"}, {"name": "id_role", "path": "root", "alias": "id_role", "destination": "vector"}, {"name": "failed_attempts", "path": "root", "alias": "failed_attempts", "destination": "vector"}, {"name": "created_at", "path": "root", "alias": "created_at", "destination": "vector"}, {"name": "session_id", "path": "root", "alias": "session_id", "destination": "vector"}, {"name": "name", "path": "id_role->role", "alias": "role_name", "destination": "vector"}, {"name": "updatedAt", "path": "id_role->role", "alias": "role_updatedAt", "destination": "vector"}, {"name": "password", "path": "root", "alias": "password", "destination": "vector"}, {"name": "scope", "path": "id_role->role", "alias": "role_scope", "destination": "vector"}], "table_name": "dff_users"}, {"columns": [{"name": "title", "path": "idcategory->bff_category", "alias": "bff_category_title", "destination": "vector"}, {"name": "idcategory", "path": "root", "alias": "idcategory", "destination": "vector"}, {"name": "description", "path": "idum->bff_um", "alias": "bff_um_description", "destination": "vector"}, {"name": "idum", "path": "root", "alias": "idum", "destination": "vector"}, {"name": "description", "path": "root", "alias": "description", "destination": "vector"}, {"name": "sku", "path": "root", "alias": "sku", "destination": "vector"}, {"name": "islot", "path": "root", "alias": "islot", "destination": "vector"}], "table_name": "bff_products"}]	60	t
6	local://system	[{"columns": [{"name": "id", "path": "root", "alias": "id", "destination": "vector"}, {"name": "email", "path": "root", "alias": "email", "destination": "vector"}, {"name": "username", "path": "root", "alias": "username", "destination": "vector"}, {"name": "lastname", "path": "root", "alias": "lastname", "destination": "vector"}, {"name": "firstname", "path": "root", "alias": "firstname", "destination": "vector"}, {"name": "middname", "path": "root", "alias": "middname", "destination": "vector"}, {"name": "movil", "path": "root", "alias": "movil", "destination": "vector"}, {"name": "lockout_until", "path": "root", "alias": "lockout_until", "destination": "vector"}, {"name": "updated_at", "path": "root", "alias": "updated_at", "destination": "vector"}, {"name": "active", "path": "root", "alias": "active", "destination": "vector"}, {"name": "Phone", "path": "root", "alias": "Phone", "destination": "vector"}, {"name": "id_role", "path": "root", "alias": "id_role", "destination": "vector"}, {"name": "failed_attempts", "path": "root", "alias": "failed_attempts", "destination": "vector"}, {"name": "created_at", "path": "root", "alias": "created_at", "destination": "vector"}, {"name": "session_id", "path": "root", "alias": "session_id", "destination": "vector"}, {"name": "name", "path": "id_role->role", "alias": "role_name", "destination": "vector"}, {"name": "updatedAt", "path": "id_role->role", "alias": "role_updatedAt", "destination": "vector"}, {"name": "password", "path": "root", "alias": "password", "destination": "vector"}, {"name": "scope", "path": "id_role->role", "alias": "role_scope", "destination": "vector"}], "table_name": "dff_users"}, {"columns": [{"name": "title", "path": "idcategory->bff_category", "alias": "bff_category_title", "destination": "vector"}, {"name": "idcategory", "path": "root", "alias": "idcategory", "destination": "vector"}, {"name": "description", "path": "idum->bff_um", "alias": "bff_um_description", "destination": "vector"}, {"name": "idum", "path": "root", "alias": "idum", "destination": "vector"}, {"name": "description", "path": "root", "alias": "description", "destination": "vector"}, {"name": "sku", "path": "root", "alias": "sku", "destination": "vector"}, {"name": "islot", "path": "root", "alias": "islot", "destination": "vector"}], "table_name": "bff_products"}]	1	t
7	local://system	[{"columns": [{"name": "id", "path": "root", "alias": "id", "destination": "vector"}, {"name": "email", "path": "root", "alias": "email", "destination": "vector"}, {"name": "username", "path": "root", "alias": "username", "destination": "vector"}, {"name": "lastname", "path": "root", "alias": "lastname", "destination": "vector"}, {"name": "firstname", "path": "root", "alias": "firstname", "destination": "vector"}, {"name": "middname", "path": "root", "alias": "middname", "destination": "vector"}, {"name": "movil", "path": "root", "alias": "movil", "destination": "vector"}, {"name": "lockout_until", "path": "root", "alias": "lockout_until", "destination": "vector"}, {"name": "updated_at", "path": "root", "alias": "updated_at", "destination": "vector"}, {"name": "active", "path": "root", "alias": "active", "destination": "vector"}, {"name": "Phone", "path": "root", "alias": "Phone", "destination": "vector"}, {"name": "id_role", "path": "root", "alias": "id_role", "destination": "vector"}, {"name": "failed_attempts", "path": "root", "alias": "failed_attempts", "destination": "vector"}, {"name": "created_at", "path": "root", "alias": "created_at", "destination": "vector"}, {"name": "session_id", "path": "root", "alias": "session_id", "destination": "vector"}, {"name": "name", "path": "id_role->role", "alias": "role_name", "destination": "vector"}, {"name": "updatedAt", "path": "id_role->role", "alias": "role_updatedAt", "destination": "vector"}, {"name": "password", "path": "root", "alias": "password", "destination": "vector"}, {"name": "scope", "path": "id_role->role", "alias": "role_scope", "destination": "vector"}], "table_name": "dff_users"}, {"columns": [{"name": "title", "path": "idcategory->bff_category", "alias": "bff_category_title", "destination": "vector"}, {"name": "idcategory", "path": "root", "alias": "idcategory", "destination": "vector"}, {"name": "description", "path": "idum->bff_um", "alias": "bff_um_description", "destination": "vector"}, {"name": "idum", "path": "root", "alias": "idum", "destination": "vector"}, {"name": "description", "path": "root", "alias": "description", "destination": "vector"}, {"name": "sku", "path": "root", "alias": "sku", "destination": "vector"}, {"name": "islot", "path": "root", "alias": "islot", "destination": "vector"}, {"name": "created_at", "path": "root", "alias": "created_at", "destination": "vector"}], "table_name": "bff_products"}]	60	t
8	local://system	[{"columns": [{"name": "id", "path": "root", "alias": "id", "destination": "vector"}, {"name": "email", "path": "root", "alias": "email", "destination": "vector"}, {"name": "username", "path": "root", "alias": "username", "destination": "vector"}, {"name": "lastname", "path": "root", "alias": "lastname", "destination": "vector"}, {"name": "firstname", "path": "root", "alias": "firstname", "destination": "vector"}, {"name": "middname", "path": "root", "alias": "middname", "destination": "vector"}, {"name": "movil", "path": "root", "alias": "movil", "destination": "vector"}, {"name": "lockout_until", "path": "root", "alias": "lockout_until", "destination": "vector"}, {"name": "updated_at", "path": "root", "alias": "updated_at", "destination": "vector"}, {"name": "active", "path": "root", "alias": "active", "destination": "vector"}, {"name": "Phone", "path": "root", "alias": "Phone", "destination": "vector"}, {"name": "id_role", "path": "root", "alias": "id_role", "destination": "vector"}, {"name": "failed_attempts", "path": "root", "alias": "failed_attempts", "destination": "vector"}, {"name": "created_at", "path": "root", "alias": "created_at", "destination": "vector"}, {"name": "session_id", "path": "root", "alias": "session_id", "destination": "vector"}, {"name": "name", "path": "id_role->role", "alias": "role_name", "destination": "vector"}, {"name": "updatedAt", "path": "id_role->role", "alias": "role_updatedAt", "destination": "vector"}, {"name": "password", "path": "root", "alias": "password", "destination": "vector"}, {"name": "scope", "path": "id_role->role", "alias": "role_scope", "destination": "vector"}], "table_name": "dff_users"}, {"columns": [{"name": "title", "path": "idcategory->bff_category", "alias": "bff_category_title", "destination": "vector"}, {"name": "idcategory", "path": "root", "alias": "idcategory", "destination": "vector"}, {"name": "description", "path": "idum->bff_um", "alias": "bff_um_description", "destination": "vector"}, {"name": "idum", "path": "root", "alias": "idum", "destination": "vector"}, {"name": "description", "path": "root", "alias": "description", "destination": "vector"}, {"name": "sku", "path": "root", "alias": "sku", "destination": "vector"}, {"name": "islot", "path": "root", "alias": "islot", "destination": "vector"}, {"name": "created_at", "path": "root", "alias": "created_at", "destination": "vector"}], "table_name": "bff_products"}]	60	t
9	local://system	[{"columns": [{"name": "id", "path": "root", "alias": "id", "destination": "vector"}, {"name": "email", "path": "root", "alias": "email", "destination": "vector"}, {"name": "username", "path": "root", "alias": "username", "destination": "vector"}, {"name": "lastname", "path": "root", "alias": "lastname", "destination": "vector"}, {"name": "firstname", "path": "root", "alias": "firstname", "destination": "vector"}, {"name": "middname", "path": "root", "alias": "middname", "destination": "vector"}, {"name": "movil", "path": "root", "alias": "movil", "destination": "vector"}, {"name": "lockout_until", "path": "root", "alias": "lockout_until", "destination": "vector"}, {"name": "updated_at", "path": "root", "alias": "updated_at", "destination": "vector"}, {"name": "active", "path": "root", "alias": "active", "destination": "vector"}, {"name": "Phone", "path": "root", "alias": "Phone", "destination": "vector"}, {"name": "id_role", "path": "root", "alias": "id_role", "destination": "vector"}, {"name": "failed_attempts", "path": "root", "alias": "failed_attempts", "destination": "vector"}, {"name": "created_at", "path": "root", "alias": "created_at", "destination": "vector"}, {"name": "session_id", "path": "root", "alias": "session_id", "destination": "vector"}, {"name": "name", "path": "id_role->role", "alias": "role_name", "destination": "vector"}, {"name": "updatedAt", "path": "id_role->role", "alias": "role_updatedAt", "destination": "vector"}, {"name": "password", "path": "root", "alias": "password", "destination": "vector"}, {"name": "scope", "path": "id_role->role", "alias": "role_scope", "destination": "vector"}], "table_name": "dff_users"}, {"columns": [{"name": "title", "path": "idcategory->bff_category", "alias": "bff_category_title", "destination": "vector"}, {"name": "idcategory", "path": "root", "alias": "idcategory", "destination": "vector"}, {"name": "description", "path": "idum->bff_um", "alias": "bff_um_description", "destination": "vector"}, {"name": "idum", "path": "root", "alias": "idum", "destination": "vector"}, {"name": "description", "path": "root", "alias": "description", "destination": "vector"}, {"name": "sku", "path": "root", "alias": "sku", "destination": "vector"}, {"name": "islot", "path": "root", "alias": "islot", "destination": "vector"}, {"name": "created_at", "path": "root", "alias": "created_at", "destination": "vector"}], "table_name": "bff_products"}]	1	t
\.


--
-- Data for Name: ai_knowledge_store; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ai_knowledge_store (id, source_type, source_id, security_scope, content, embedding, created_at, prev_chunk_id, next_chunk_id, content_hash, metadata, last_synced_at) FROM stdin;
3	external.dff_users	1	public	--- Entity: dff_users ---\nid: 1\nemail: admin@dfgchatai.com\nusername: admin\nlastname: Administrator\nfirstname: System\nmiddname: Root\nupdated_at: 2026-02-12 14:26:26.793227+00:00\nactive: True\nPhone: 00000000000\nid_role: 1\nfailed_attempts: 0\ncreated_at: 2026-01-21 13:28:37.149478\nsession_id: f8e81c96-af6f-45a4-be1c-cb800252d720\npassword: $2b$12$z1r0BtMaqIvrY.VBVcM29u9SWtxsrqpIb.cgOyVCeYrS5cUGAuCA6\n\n> Related role:\n  role_name: owner\n  role_updatedAt: 2026-01-21 13:28:39.221000+00:00\n  role_scope: global	[-0.9866377,1.3843985,-3.3361926,-0.76854575,2.3611746,-1.2686921,0.17850935,-0.4370196,-0.049065396,-1.3489575,-0.9728755,0.2072066,0.57061404,-0.19965467,0.5691172,0.10580172,-0.5999649,-0.5475347,-0.64313674,-0.3182098,-0.91008013,-0.9104545,-0.17001802,0.006873632,2.0051978,0.13531007,1.2527857,0.4026898,-0.14402306,0.14286482,0.58026564,0.8317592,0.36593756,-0.16144049,-0.49702963,-0.4343631,0.34139967,1.0345082,0.17241275,0.660185,0.18137991,-0.10837256,-0.86554325,-0.3086384,-0.3032349,-0.71348697,0.47591066,0.83385384,1.1745396,-0.06892644,-0.37937477,0.12219684,-0.21058035,-0.32751644,0.18873946,0.3762767,-0.30311862,0.5398827,-0.12313083,-0.9100735,1.7784965,1.0059109,-0.68663216,1.6092196,0.030293845,0.20126498,-0.43132734,0.73235667,-0.21103399,-1.2477624,0.09433443,0.2378624,1.069432,1.075961,0.03047428,-0.2773813,-0.9802455,-0.9533834,0.30375445,0.026034884,0.7531265,0.030016726,1.279155,-0.64007795,0.3912505,0.088616416,-0.08413875,1.1399138,0.12109431,1.3315938,0.4114232,0.5386124,0.22343808,0.280801,-0.9951163,1.0877237,-0.167381,0.45200658,-0.7321162,-0.47230542,-0.06463575,-0.58391345,0.48293245,0.5634014,0.5454215,1.2971175,-0.032819,0.45873585,-0.6108241,0.09874036,-1.250764,1.5115097,0.047375944,-0.54986703,1.433488,-0.63161445,1.1570234,-0.796424,0.030524783,0.8670589,-0.615683,0.1273941,-0.395486,0.56238556,0.22144401,0.19483447,-1.1984525,-0.363015,0.036654152,-0.033875838,-0.65185964,-0.61104447,-0.66239834,-0.4121259,0.8818202,0.8556744,-0.6750922,-0.10751055,0.09958309,0.123476945,0.31711176,-0.42048696,-0.009349395,-1.5377581,0.34043503,-1.0526206,1.9423794,-0.55052364,-0.30239987,0.22697124,0.22101453,-0.22714508,-0.41366696,-0.15032518,0.52051705,-0.86071545,-0.6598481,0.13519488,0.1225188,0.65678066,-0.035767928,0.40155116,-0.6826199,0.447028,0.03818351,-1.6921,0.59224564,0.88103765,0.7632139,0.5207375,-0.76920074,-0.33358625,-0.17002895,0.039224744,0.104349986,-0.3109349,-0.057788387,-0.48844367,0.470544,-0.5148884,1.2903925,-1.0015928,1.3782909,0.3942259,-0.059747055,-0.35176182,0.9505277,-0.20815518,-0.21011737,0.0791494,-0.44568068,0.4215752,0.20602877,-0.5481421,-0.57978994,-0.8824232,0.71274257,0.14051779,0.29825646,-0.8378401,-0.042452812,-0.7051588,0.03547476,0.56679845,-0.020050507,0.22569364,-0.42572522,-0.41489443,-0.4663672,0.11801027,1.0695903,-0.6021992,-1.3998264,0.44586542,-0.05508463,-0.3799538,0.25536388,-0.7051858,-0.24885583,0.42573088,0.38193834,-0.016228948,0.390667,-0.6477308,1.1998342,-0.46962696,-0.6094353,-0.88610435,-1.1088862,-0.33648586,-0.06173364,-1.3728533,0.8771952,-0.0098798135,-0.31517386,0.73148113,-0.08760375,0.68825966,-0.3787486,0.31230447,-0.47934625,0.806952,0.16123562,1.0397735,-0.96447563,0.44895196,-1.1840465,-0.80536723,0.50001097,1.3238322,0.5411978,-0.25563753,0.9859509,-0.17726061,0.14217909,-1.2317798,-1.2843001,-0.0016501718,0.9351824,-0.8160254,0.11849339,-0.34771633,0.44307494,-0.94311476,-0.08491768,-1.26857,-0.79583806,-0.4186681,-0.36765915,0.15087548,1.2570972,1.3972062,-0.60468435,1.1053052,-0.53353286,0.75801194,0.19772756,-0.08250525,-1.1901126,1.1016473,-0.27144456,-0.90938884,-0.36739808,0.6903244,0.067028336,0.0051175766,1.2669898,0.30198708,-0.35375726,-0.040232405,0.92711186,-0.3714093,-0.36295992,0.5620494,-0.9750042,0.15884283,1.0734653,0.24541098,0.08273337,-0.0062526576,0.04464692,0.27485016,0.5545783,0.7393612,-0.043825664,-0.4317581,0.79314035,0.3812124,0.6330911,0.17248902,-0.5084992,0.0011254661,-0.15727098,0.39909104,-0.41080797,0.39321727,-0.11654265,0.076851055,0.20295836,0.32807624,0.3065179,-0.7738379,-0.77693963,0.33386478,0.7047497,1.5313965,-0.6145401,1.417069,0.383811,-0.64480114,1.1621718,0.016538717,-0.504879,-0.7012534,0.014239078,0.1663754,0.014966819,0.30639434,-0.31368837,1.2517061,1.1126747,0.12870833,0.29327446,-1.2979527,-0.5909964,-0.6229782,-0.5484317,0.29712543,0.04738179,0.750308,-1.9845333,0.7005041,-0.1823842,0.016168393,0.92963004,-0.5375284,0.49708748,0.34839344,-0.9101317,-0.41157126,0.71706605,0.07992834,0.029451279,-0.039029315,0.80121887,0.8594903,0.896869,-0.26584888,0.5155022,-0.018092953,-0.2367051,-0.09570038,0.39063993,0.3013293,0.2683314,-0.006971825,-1.321615,-1.0296929,-0.7233468,0.44063997,0.20551948,-0.4304922,0.7419367,0.5708195,0.5566093,-0.92826617,0.2651914,-0.38132966,0.5594393,1.0941396,-0.4138965,-0.26102036,0.1301016,1.1422908,0.60087776,-0.1396406,0.40891486,0.9039166,1.0031517,1.276953,-0.8729124,-0.7376636,0.2846015,0.1516314,0.41284359,1.1730852,-0.8067535,-1.1110625,1.1113293,-0.37598568,0.7419915,0.6302446,0.57093745,-0.4879602,0.33184218,0.16945761,0.42586458,-0.39220816,-0.3488866,-0.63806486,2.262888,-0.18537828,0.3284675,0.5311513,0.44690457,-0.21432999,0.46347767,0.43263525,-0.0046705995,-1.3721828,-0.348853,0.44237697,0.56359386,-0.029572256,-1.1786399,-0.1596424,0.8910377,-0.30958048,0.7061729,1.4234669,1.1895814,-0.47069165,-0.8934306,0.43647754,0.21748166,1.2507014,1.4813766,-0.19706416,-0.6764728,1.6216321,0.12625685,0.22766215,0.11079529,0.735994,0.92192745,-0.27228338,0.27006036,-0.3671068,-0.23189381,0.07780725,-0.08971799,-0.26943028,-0.7310357,0.8081069,0.3048128,-0.14149901,0.54245436,-0.30002552,-0.074749015,1.5480385,-0.651795,-0.6368698,1.1095891,-0.4077388,-0.5734766,0.32838497,0.111387186,-0.5099312,0.6650038,1.1224723,0.104796335,-0.3806266,-0.82535356,-0.7124982,-0.6245248,0.07385795,1.1638639,0.20690471,0.13673209,-0.15822138,-0.5504886,-0.16260083,-0.27552345,-0.3959294,-0.25528932,-0.31654465,-0.6514872,-0.5097668,0.4894914,-0.015741082,-0.2109616,0.99245334,-0.65176415,-0.27576196,0.3312952,-0.55684566,0.9473212,-1.9236579,-0.32535598,-0.5355838,-0.83061105,-0.21400374,0.9056177,0.75925034,0.39688963,-0.7170608,0.61980975,0.76882064,-0.6755859,0.8948968,-0.339575,-0.65754384,-0.02937232,-0.3517235,-1.2653124,0.34505367,0.72527957,-0.81325287,0.72303545,0.8815193,0.28310663,0.46673423,-1.1483791,-0.37392187,-0.08528422,-0.22775772,-0.60497653,0.54920244,0.32289237,0.7547624,0.4178264,-0.16126916,-0.4430311,-1.0893507,-1.0751177,-0.4651184,0.29992616,0.08152299,-0.90326506,0.17401138,0.7293283,-0.5658647,0.26429614,0.34413514,1.001481,-0.6584415,0.10497002,-0.33238465,-0.7025607,-0.56811905,-0.12072472,0.39670646,0.44466215,0.313105,-0.4386781,-1.3006897,-0.002853854,-0.18693608,0.17253874,-0.58408105,-0.3771608,-1.0880992,-0.28795606,-0.5322877,-0.26115698,-0.3774606,-0.58462965,-0.09237492,-0.9782954,-0.28255686,-1.0873702,-0.16687587,0.8684013,0.6684659,-0.07792415,-0.115968525,-0.71436065,-0.7034758,-0.18436511,-0.30019647,0.27369648,0.46796328,-0.042177565,-0.08555797,-0.35820505,1.115335,0.18332778,-0.59945726,-0.16187719,-0.9630091,0.14470781,0.039943684,0.43856207,-1.0390915,-0.0004216209,0.93924797,0.08765432,0.6411923,-0.19362769,-0.98099935,0.86231256,0.49332094,-0.30116227,-0.69448847,0.51530904,-0.6037518,1.377451,0.29818645,0.3927352,0.32659805,-0.10917862,-1.8192613,0.83335847,-0.7541841,0.2107816,-0.38141692,-0.73525774,-0.46786952,-0.105127566,0.3048346,0.2863568,0.66921985,-1.1113641,-2.3278868,-1.0117092,0.07800104,-0.21039532,-0.5880655,0.56147146,0.47120064,0.6922394,0.37325656,0.10953669,0.10188104,0.87216014,-0.39423215,-0.029464897,1.0748179,0.9743431,-0.2196622,1.6959018,0.8213193,0.12937889,0.3600437,0.80719036,-0.20627381,0.27986184,-1.1765127,-1.2960858,-0.38745263,0.7001332,0.49068177,-0.6264908,0.31462145,-0.061024565,0.089431025,0.721876,0.24566644,-1.4477897,-0.80471885,0.56101227,0.30968818,0.48647776,-0.40156966,0.5717368,1.3756582,0.9419646,0.1523915,-0.15452851,-0.40337878,0.6965127,-0.28635117,0.6793209,-1.7904435,0.13923033,0.19336425,1.1358626,-0.55351233,-0.083296016,-0.70721644,-1.1931456,-1.5460131,-0.39957404,-1.1123886,-0.96350026,0.29816008,0.029487863,0.07627241,-0.22727811,0.9013014,-0.21467848,0.18423674,0.08283378,0.23413226,0.074909024,-0.3146376,-0.9922083,0.27139658,-0.72050846,0.5262297,-0.383975,-0.066649325,-1.0601866,0.6681168,-0.014103506,0.17506617,-1.1732461,-0.50649834,0.19485202,-0.52235913,1.1040044,-0.80885625,-1.1369152,-0.8689911,-1.3893497,-0.679458,0.15801175,-0.6557219,1.4209002,-0.13248497,-0.8813003,-0.046549812,-0.6209514,0.4375976,-1.0327183,-0.5992274,-0.21724066,-1.4692888,-0.81295955,-0.8043778,-0.27149642,1.6357279,-0.128387,0.6070182,0.08153714,0.5632966,-1.1927432,-0.27795875,0.13863605,0.24365737,0.39777097,-0.68640935,0.1310731,0.1430263,-0.15585972,0.5890602,-0.07609077,0.79015136,1.646821,0.25535852,0.16148368,-0.5186205,1.5278887,1.0731124,0.17420885,-0.63852394,-1.009304,-0.37128708]	2026-02-10 19:53:25.527898	\N	\N	\N	{}	2026-02-12 15:53:49.454639
2	external.dff_users	5	public	--- Entity: dff_users ---\nid: 5\nemail: r00t@dfgchatai.com\nusername: r00t\nlastname: Administrator\nfirstname: System\nmiddname: Root\nupdated_at: 2026-02-10 19:43:48.691660+00:00\nactive: True\nPhone: 00000000000\nid_role: 1\nfailed_attempts: 0\ncreated_at: 2026-02-10 19:43:48.691654\npassword: $2b$12$JzIA.LYEpdCAXglSx7vQmebad09k8DsPAzaGvwPl8gy57.VIsWkaG\n\n> Related role:\n  role_name: owner\n  role_updatedAt: 2026-01-21 13:28:39.221000+00:00\n  role_scope: global	[-0.7801273,0.9363596,-3.5902584,-0.36733827,2.0718646,-0.94648427,0.2627819,-0.38472077,-0.22957873,-1.1063476,-1.2695874,0.35989323,0.72900283,-0.1973973,0.4517815,0.014146301,-0.33610824,-0.57168126,-0.39068007,0.12928584,-0.81471914,-1.1389933,-0.5398288,0.2040922,1.7866095,0.24968113,1.4158995,0.5532674,-0.32375446,-0.037541058,0.70006543,0.75428545,0.18495676,-0.3265968,-0.6312562,-0.089203306,0.6175356,0.5681608,0.062348686,0.5727044,0.22661388,-0.26504958,-0.6384278,-0.23967226,-0.12039371,-0.43505532,0.22288966,0.7872148,1.2412403,-0.09350082,-0.20954362,0.23796484,-0.1998815,-0.56742126,0.28529432,0.26782182,-0.6245101,0.33524048,-0.3650036,-0.90842175,1.7721177,1.281553,-0.9192925,1.6704036,0.2068241,0.14560176,-0.47363234,0.95133436,-0.063063115,-1.3155882,0.18630993,0.20179315,0.9918771,1.0762391,-0.050333194,-0.3323396,-0.9712824,-0.77573115,0.18611746,0.053953726,0.7573043,-0.25855973,1.448262,-0.22995944,0.37282646,-0.017383598,0.13107888,1.2915922,0.07656077,1.624096,0.36431444,0.7281374,0.23558033,-0.07486827,-1.0700111,1.1490351,-0.25582162,0.21391469,-0.9672917,-0.6276777,0.11140451,-0.62076527,0.43407387,0.9495908,0.5701917,1.0382278,0.18490006,0.48350123,-0.40841436,0.04623469,-1.3062279,1.6168897,0.049401328,-0.7772682,1.2243476,-0.6192569,1.0997229,-0.9945037,0.03942429,0.8125533,-0.5696219,0.06555239,-0.110170685,0.7694735,0.23632318,0.19500831,-1.3149152,-0.37073398,-0.071758136,0.027052948,-0.7818937,-0.38369882,-0.618618,-0.53644776,0.6388499,0.9826223,-0.71313024,-0.21398194,-0.055693787,0.18241319,0.35593286,-0.2364479,0.037987977,-1.4600981,0.13173257,-1.140934,1.6932979,-0.550665,-0.6238411,0.21218072,0.20251828,-0.3043091,-0.43376565,-0.19380778,0.4466428,-0.9522938,-0.41079205,0.29143074,-0.016317338,0.80985945,-0.2113769,0.63154185,-0.91508186,0.48048577,0.028565573,-1.5058584,0.48160082,0.704923,0.67537045,0.6886662,-0.7493773,-0.5510613,-0.27016574,0.19347852,0.113360174,-0.4643106,0.00224048,-0.57316834,0.57831717,-0.63123363,1.2503158,-1.2056718,1.3403822,0.42645422,-0.14422412,-0.3892451,0.93228835,-0.42536864,-0.16673541,-0.04867243,-0.13121058,0.64233804,-0.30124518,-0.8389802,-0.59047323,-0.6367135,0.37922433,0.08551743,0.38034952,-0.86167157,-0.15983605,-0.9296125,-0.040254086,0.71556205,-0.37677836,0.28942987,-0.5539432,-0.25735217,-0.51989925,0.17548972,0.90804446,-0.9816583,-1.3145953,0.18603773,-0.006944341,-0.1581461,0.5200798,-0.70437473,-0.17482375,0.68247145,0.23369773,0.1975298,0.38022578,-0.66301244,0.81722057,-0.6089469,-0.36362666,-0.8309244,-0.90122634,-0.35945737,0.048085857,-1.5571344,0.93755466,0.08512526,-0.30379698,0.6417472,-0.3787225,0.46583906,-0.3793395,0.2948131,-0.2648302,0.92370415,-0.044116292,1.4027051,-0.9703146,0.44210488,-1.0072858,-0.7242651,0.5455611,1.3334157,0.59921205,-0.47055557,0.8688758,-0.05975645,-0.029603992,-1.2025036,-1.568427,0.0048859958,0.697082,-0.8270062,0.13791074,-0.03664942,0.30234137,-0.8000051,-0.280213,-1.3108926,-0.6679491,-0.46617422,-0.25604036,0.22018583,1.217425,1.2708119,-0.47215596,1.3438717,-0.7896571,0.76060534,-0.18170282,-0.23081565,-1.0859185,1.2675387,-0.087011375,-1.242366,-0.28608564,0.81563854,-0.003579406,0.19034564,1.1951287,0.37838972,-0.43346822,0.16945845,0.89280105,-0.39401513,-0.38125917,0.59485775,-0.97287625,0.09205474,1.0710416,0.11890844,0.17189246,0.3820892,0.11558795,0.3226403,0.8481041,0.6852231,-0.30846053,-0.8497285,0.7458537,0.2261169,0.78419745,0.07785918,-0.40474772,0.029084256,-0.46063882,0.5586823,-0.44613454,0.32329863,0.06529731,0.15819345,0.3178817,0.48759216,0.42441717,-0.66747373,-0.50929856,0.34266147,0.62394226,1.661775,-0.56830186,1.3476698,0.5712683,-0.40238687,1.3294054,0.30166146,-0.4434918,-0.6917267,-0.003008415,0.48844346,-0.2660898,0.19324915,-0.31129622,1.1191392,1.1905444,0.019558426,0.15331933,-1.0884782,-0.65856797,-0.7828542,-0.724767,0.18977591,0.22827983,0.68789244,-2.088067,0.7183199,-0.37939075,-0.25674576,1.0722228,-0.52061886,0.42043537,0.68220925,-0.708829,-0.31705198,0.60982317,0.24792981,0.0140386745,0.02796736,0.7931664,1.198326,0.9952747,-0.21720147,0.59176165,0.17644185,-0.35183325,-0.37192488,0.35943606,0.59881353,0.6043364,0.15109454,-1.308863,-1.3270415,-0.6340088,0.80800164,0.3387638,-0.5319394,0.6957883,0.6118495,0.63056904,-0.91562843,0.262522,-0.6134394,0.700674,1.1915412,-0.34227693,0.0119618075,-0.024310065,0.89933145,0.48029166,-0.19748847,0.45766103,0.9926296,1.0795165,1.013902,-0.7907982,-0.8204599,0.34482992,0.21888058,0.39383528,1.0508077,-0.7071679,-0.9494434,1.1724594,-0.2660077,0.41228938,0.8804734,0.39796436,-0.66330135,0.43685624,0.36718258,0.4694836,-0.58309174,-0.36320075,-0.65136105,2.1994853,0.026981741,0.5207894,0.38914073,0.4660391,-0.11690486,0.51658624,0.28209174,-0.038775854,-1.3998933,-0.31754577,0.32569996,0.5497368,0.011884339,-1.0929078,-0.13687243,1.134756,-0.0069647557,0.6758911,1.273537,1.2139348,-0.31650007,-0.8924122,0.17569283,0.070686445,1.3667482,1.4964252,-0.25031978,-0.7072883,1.7234323,0.15556993,0.24315514,0.18190037,0.7391636,0.9862646,-0.18013689,0.16705473,-0.5909888,-0.25757697,0.20659167,-0.066760026,-0.14753062,-0.56053674,0.8635714,0.37857047,-0.44888133,0.36284056,-0.15513381,0.06928282,1.5925357,-0.52239096,-0.50305057,0.84461623,-0.53035504,-0.90762484,0.4400469,-0.10492923,-0.48339033,0.666115,1.0371115,0.35484752,-0.6099295,-0.67485553,-0.73332894,-0.448391,0.18034957,0.92026144,0.21797563,0.57398766,-0.45556036,-0.40568358,-0.2876859,-0.050867014,-0.6619316,-0.35480556,-0.084163494,-0.7674634,-0.54086936,0.32867563,0.3304325,-0.07821423,0.88133305,-0.7171567,-0.22859941,0.39348945,-0.69799185,1.0313711,-1.9274354,-0.42593178,-0.73709726,-1.0000355,-0.021071743,0.94973737,0.61257935,0.63142574,-0.7736186,0.50653946,0.56840974,-0.60399383,0.7356747,-0.38804555,-0.8512949,-0.029788487,-0.3580213,-1.012703,0.4773143,0.7847046,-0.7323708,0.37075227,0.47169372,0.2078907,0.68359584,-1.1194123,-0.3771046,0.028558055,0.04191811,-0.51809573,0.44653195,0.21382762,0.6718835,0.48249236,-0.08059363,-0.5033039,-1.3406475,-0.8368365,-0.36372876,0.29674405,0.040962573,-0.8493308,-0.18716092,0.6915346,-0.65819657,0.07159613,0.15721495,0.8540022,-0.8933947,0.18424407,-0.52252775,-0.9753889,-0.5277959,-0.23204322,0.28805798,0.64435494,0.44689286,-0.47642374,-1.1729463,0.15981734,-0.26799023,0.06535357,-0.5583565,-0.17637071,-0.81561756,-0.28224444,-0.5510166,-0.33322984,-0.24033913,-0.38699615,-0.19881001,-0.79444325,-0.19323587,-0.97567344,-0.4008384,0.5464906,0.8266566,-0.08941394,-0.04569739,-0.4066626,-0.8927115,-0.15272677,-0.1605617,0.31442067,0.18264064,0.02365174,-0.23940852,-0.44706878,0.82166076,-0.012653489,-0.8693614,-0.24761313,-0.7066308,0.060444996,0.17572613,0.7505462,-1.2833405,-0.14668755,0.8945078,-0.053944036,0.6031345,-0.34114194,-0.9820091,0.83993447,0.2642592,-0.3685692,-0.7742233,0.72125775,-0.5965873,1.4638088,0.3857845,0.4014193,0.16856992,-0.17817271,-1.9513365,0.87959707,-0.8348771,0.40344793,-0.323769,-0.45268002,-0.4562422,-0.13168661,0.097709,0.24103224,0.5245221,-1.1542008,-1.9350508,-1.1645538,0.06373669,-0.16547167,-0.46737546,0.65496,0.41676563,0.7175446,0.35938007,0.024922192,0.23491167,1.1498758,-0.40620697,0.074918576,1.1379619,0.82085437,-0.37386233,1.8046217,0.9178244,0.17899913,0.18578683,0.8762634,-0.41416872,0.12556566,-0.96614754,-1.4640926,-0.4014928,0.5644118,0.7206571,-0.5927653,0.13027894,-0.13873123,0.1926646,0.9744542,0.2418775,-1.5061693,-0.7090365,0.32915306,0.19682497,0.6226593,-0.37083027,0.4130598,1.4295319,0.97121996,0.21382928,-0.24644966,-0.42324716,0.8489006,-0.30988204,0.4719377,-1.6545042,0.26265982,0.21164294,1.1390314,-0.44482827,-0.20877516,-0.700012,-0.93592036,-1.4141594,-0.33262354,-0.716358,-0.7740013,0.279085,-0.032661248,0.030998785,-0.2147305,1.045121,-0.123881064,0.3031872,0.20817737,0.5232555,0.17494076,-0.29475403,-1.075802,0.095716774,-0.61050045,0.34433323,-0.37811154,-0.1598368,-0.9684123,0.44903517,0.15955983,0.34362432,-1.0903305,-0.37172484,0.23110881,-0.5102197,1.3105161,-0.8571638,-1.3729885,-1.0018374,-1.6382254,-0.12382955,0.40784287,-1.1587197,1.4850436,-0.449775,-0.6089574,0.09558705,-0.7035074,0.77582276,-1.1137635,-0.505112,-0.39703608,-1.4155021,-0.82726383,-0.5906217,-0.6904125,1.279752,-0.020914394,0.50641775,-0.0041933693,0.65792704,-1.303252,-0.11105806,0.30667594,0.23729238,0.23036899,-0.5554808,0.048499204,0.32669792,-0.22816546,0.73383725,-0.054136388,0.7420748,1.5709401,0.38927963,0.43048167,-0.74051344,1.3366425,0.87164044,0.26471034,-0.671337,-0.9733614,-0.17180818]	2026-02-10 19:53:24.817291	\N	\N	\N	{}	2026-02-12 15:53:49.621738
1	external.dff_users	4	public	--- Entity: dff_users ---\nid: 4\nemail: avinajera2011@gmail.com\nusername: one\nlastname: user\nfirstname: one\nupdated_at: 2026-02-04 21:06:48.553796+00:00\nactive: True\nPhone: 06146491554\nid_role: 9\nfailed_attempts: 0\ncreated_at: 2026-02-03 20:06:08.451404\npassword: $2b$12$9NMLV7Tj9w0L71Y.TG7Gou8cJ0/K/wmW4.nsUJOYrNOP1NGFoaqWC	[-0.95604354,1.1423495,-3.1120543,-0.58914083,2.2658193,-0.84118485,0.10826151,-0.8139849,0.08982547,-0.22124468,-1.6564178,-0.17468384,1.076018,-0.38584936,0.4613136,-0.2380248,-0.12451561,-1.33104,-0.597059,-0.1766182,-1.1450155,-1.096885,-0.74752384,-0.7177274,2.0414867,-0.24462214,0.6765976,0.69941777,-0.9642632,-0.002849523,0.2781182,0.48212725,-0.11831918,-0.6906414,0.24919024,-0.096869454,-0.3367124,1.3762558,0.03657265,-0.2290403,1.1811233,-0.31315064,-0.66427624,0.5645232,-0.20012651,-0.17253174,1.0002588,0.4548283,1.7968761,-0.17501207,-0.06284496,0.50804156,-0.039018467,-0.6825242,-0.17596875,0.53258824,-0.7846151,0.096086666,0.053961,-0.9289894,2.1012542,1.4812953,-0.52147645,2.0668907,0.50940204,-0.03108709,-0.82517636,0.89530146,0.18944517,-1.5466896,0.7039487,0.20972383,0.72163904,1.2225147,0.120521545,-0.022432147,-0.8400084,-1.3779783,0.19938236,-0.08208225,1.1789787,0.19337001,0.38243404,-0.9428541,0.73131967,-0.41611588,0.23387407,1.3376632,0.24956444,0.64899814,-0.24341133,0.62951833,0.685729,0.40149736,-0.4009094,0.9045853,-0.3550381,0.50028896,-0.828837,-0.5360296,-0.2965663,-0.4739231,0.5028644,0.15258232,0.19909443,0.5885216,-0.36235937,-0.22620878,-0.1451694,-0.27595475,-1.554501,1.0476758,-0.4580037,-0.6174656,0.93900186,0.0029531224,1.2515107,-1.3840737,0.64810747,0.64694273,-0.6926257,-0.3278563,-0.13334535,0.77782816,0.04374755,0.053508483,-0.18246645,-0.043246303,0.24617127,-0.6817781,-0.9445605,-0.7481044,0.07759498,-0.6813073,0.16260049,1.1517065,-0.8261682,-0.086008765,0.27423674,0.29227775,1.0077164,-0.22203045,-0.23770706,-1.5730791,0.55103636,-1.2288382,1.0921391,-0.3217019,-0.7077247,0.2754596,0.81548846,-0.57678,-0.3777145,0.07562732,0.29765862,-1.0627663,-0.5364993,0.21107334,-0.052620944,0.96195257,0.20307696,-0.3417901,-0.58777493,0.6203725,-0.35070443,-0.92913115,-0.13136107,0.99865854,-0.12894292,0.9421135,-0.6081351,-1.1367168,-0.36820078,-0.25382438,0.15903826,-0.30579162,-0.10900611,-0.46368212,0.39038736,-0.63959086,1.5239658,-0.71942025,1.7368517,0.7014308,-0.05999553,-0.51987076,0.3830002,0.1456998,-0.3656351,-0.80222476,-0.28738794,0.76895946,-0.7174425,-0.6219152,-0.86817324,-0.5874773,1.1293693,-0.2368072,-0.17961752,-0.53176284,-0.7681618,-0.21753919,0.17174934,0.88237,-0.5100922,0.2897566,-0.07312183,-0.0047231093,-0.17096671,0.18985304,0.8192151,-0.78955173,-0.62364197,0.21331036,0.23385492,-0.6889336,0.47060955,-0.37619543,-0.5378009,0.64624846,0.5608907,0.1586143,0.31383556,0.010833325,0.9979165,-0.31720307,-0.69812214,-0.40333998,-1.513751,-0.42667842,0.108477026,-0.82105815,0.70122975,-0.4224838,-0.4419974,0.85595393,-0.3440314,0.51006037,-0.52257615,0.46390072,-0.10537664,0.95401967,-0.06403725,0.44692582,-0.805025,0.057782214,-0.576998,-0.45469612,0.7627618,1.5481749,-0.4655328,-0.039535016,0.50132215,0.5407822,0.094889194,-0.48887706,-1.1335846,-0.17875946,1.2672088,-0.59624994,0.4043641,-0.46359146,0.39034027,-0.94822425,-0.18237793,-1.2860439,-0.86896956,-0.47348696,-0.023079105,-0.49964336,0.53351045,1.0965648,-0.78340924,0.64840615,-0.58201826,0.3682695,0.31099844,-0.2124422,-0.48932105,1.348752,-0.4458679,-0.5951469,-0.5528782,0.7089665,0.07556409,0.2505726,1.3756888,0.46881744,-0.2637383,0.07993499,0.38246197,0.057336956,-0.91256803,0.047583014,-0.564399,0.4891058,1.4443982,0.18596476,0.10523599,-0.21855661,0.068919525,0.16381173,0.62316996,-0.05710275,0.55706906,-0.44970387,0.79905117,0.12505141,0.8687115,0.029067446,-0.5253527,0.5916785,-0.32858986,0.95150745,-0.60285306,0.4646622,-0.13821518,0.14173205,0.072480775,0.33469713,0.36160553,-0.9408206,-0.16475028,-0.23370296,0.82457495,1.435012,-0.5918823,1.7512114,0.5259553,-0.49554136,0.6877353,0.048579212,-0.17309107,-0.82460946,0.42983902,0.24029659,-0.36777818,0.098076954,-0.39309996,1.3138261,0.42893314,0.35021704,0.071243964,-1.3031482,-0.46712318,-0.00998966,-0.5847524,0.40435362,0.5292871,0.9158418,-2.078381,0.7664478,0.2637188,-0.15767272,0.6316391,-0.5214021,0.6056143,0.7085104,-0.15914783,-0.29924965,0.8806873,0.062133964,0.44393075,0.041130476,0.65510744,1.008359,0.9532275,-1.0165017,1.3604771,-0.10322975,-0.15029755,-0.09580221,0.84427494,0.5442414,0.25202596,0.51358557,-1.5024956,-0.5538255,-0.37511855,0.5191864,0.56920075,-0.34959096,0.46195692,0.50264543,0.5717919,-0.62736225,0.33447206,-0.3802862,0.14877331,0.44589832,-0.55666155,-0.32381752,0.04974066,1.2371671,0.49657342,-0.64014566,0.6329816,0.5148164,0.8066373,1.6000754,-0.7727148,-0.17827335,0.14613432,-0.022057625,0.6647934,1.0910476,-0.2021175,-0.6171465,0.5612646,-0.4275844,-0.1820456,1.0105908,0.29561773,-1.2294674,0.2179963,0.6055718,0.86401176,-0.44095486,-0.100262076,-1.225007,2.500805,0.37582383,0.2576365,-0.13470022,-0.1486305,0.65420943,0.5338813,0.41599494,-0.32262275,-1.086379,0.18132344,0.49172467,0.51330304,0.19538458,-0.7702827,0.2788878,1.1645907,-0.09045307,0.9222748,1.0272539,0.93595445,-0.7680792,0.07011625,0.07022093,1.0526677,1.2495787,0.8962664,-0.5272291,-0.2077602,1.1701505,0.30536348,0.27467084,0.63046306,0.5598831,1.4383337,-0.21274377,0.920592,-0.17129157,0.26683047,0.61122996,0.006647742,-0.06531745,-0.3415048,0.84061563,-0.2695862,-0.9234612,0.638543,-0.46253848,0.30381992,0.63241726,-0.73052424,-0.28485715,0.40028316,-0.13508676,-0.45240295,-0.35075194,0.009645697,-0.2901546,0.2582748,0.88337195,0.12426094,-0.24375835,-1.0547394,-1.0132627,-1.071979,-0.09507781,1.251538,-0.3138511,0.30637354,-0.07803511,-0.38013947,-0.5654131,0.15941665,-0.86511683,-0.30794683,-0.69274604,-0.9150933,-0.1565603,0.29289624,-0.03680872,-0.7742106,1.0739131,-0.8408148,-0.92334986,0.43267864,-0.6855968,0.0023703314,-1.486006,-0.38620752,-0.8144306,-1.3398573,-0.8132319,0.4587034,0.42826417,0.18097901,-0.41599038,0.70201313,0.6117062,-0.7012025,0.8819821,-0.23720008,-0.53150445,-0.41394722,-0.028292812,-1.115453,0.41823432,0.31339386,-1.190712,0.3059754,0.53310716,0.029403552,0.93216884,-1.2126718,-0.41078323,-0.17230475,0.41237578,-0.3002395,0.10836699,-0.028738331,0.5345665,0.18557823,0.31403494,-0.07087437,-0.4614263,-0.8537477,-0.31152856,-0.072748944,0.31064165,-0.6710327,0.23019055,0.45625323,-0.8665091,0.29327112,0.1898301,1.0121171,-0.8480766,0.2652911,-0.54714656,-0.5358715,-0.41514373,-0.16260186,0.4713514,0.4152246,0.28267813,-0.18814775,-1.2238716,0.50765026,-1.0017157,-0.11395331,-0.7104221,-0.584491,-0.8821603,-0.47192234,-1.2020277,-0.16353828,-0.25310865,0.14254427,-1.2368242,-1.9013218,-0.34078145,-0.73247194,-0.45701224,0.7547613,0.75347686,-0.050183557,0.048781417,-0.8331576,-0.91815037,-0.43271834,-0.439669,0.05991598,0.12899613,0.12338345,-0.03889213,-0.8260598,0.7309797,0.84407514,-0.96337664,-0.46465194,-0.7645268,0.30914575,0.45370877,0.34462988,-0.24804714,-0.52753747,0.86106217,-0.7039728,0.91953504,0.13292406,-0.86792773,0.5394064,0.6693982,0.019939631,-0.13836965,1.1942116,-0.31789142,1.217306,0.5557512,-0.044225104,0.20685333,0.32620138,-1.6386311,1.256537,0.026208218,0.5375654,-0.33613697,-0.7435683,-0.47313368,-0.41470075,0.4144616,0.08793301,1.1957345,-1.2417305,-1.7022452,-0.9703784,-0.2982452,0.50756055,-0.35223025,0.879106,0.6712185,0.32640618,0.0524583,0.36232135,0.582694,1.0564616,0.057690762,-0.13250248,0.95693266,0.5851958,-0.3968277,1.6241014,1.0503532,0.37198132,0.40509287,0.6608392,-0.03534734,0.21345508,-0.5781953,-0.82175577,0.27167043,0.37074932,0.4290402,-0.5770786,0.24012867,0.29975355,-0.3437209,0.82692546,-0.38564026,-1.5594249,-1.1106879,1.0577683,-0.37934864,0.34908804,-0.3433299,0.4434809,1.6922073,0.8981837,-0.04575809,-0.16556379,-0.50654674,0.045360535,-0.3247087,0.15208462,-0.85141253,0.077705294,0.60159177,1.3915966,-0.46002132,-0.15547442,-0.82562435,-0.77058834,-1.805784,-0.43132958,-0.659144,-0.43344337,0.4878943,-0.3424661,-0.04797163,-0.5774132,0.9800402,-0.3308394,1.2397888,-0.21730623,0.35046604,-0.16496514,-0.11153644,-1.1802286,0.0016048811,-0.6281561,-0.20196271,0.43500203,0.37531134,-0.5315871,1.1401314,0.7892436,0.46345398,-0.48356697,-0.3459269,-0.030092472,-0.82992685,1.3858379,-0.79802436,-1.4062246,-0.54341805,-1.0043128,-0.5613484,0.18821111,-0.45027223,1.22107,-0.5156888,-0.5456716,0.2193867,-0.88104194,0.7317067,-0.7280915,-0.31081432,-0.35426337,-0.8469341,-0.44352174,-0.6691903,-0.6184929,1.5508294,-0.19325416,-0.106396854,0.41660583,-0.44130984,-1.2771751,-0.06216357,0.14097401,0.11085135,0.091922976,-1.0335279,-0.555073,0.4237064,-0.24328601,0.8276731,-0.2712502,0.09373168,1.9890022,0.08875108,0.40075505,-0.3261569,1.1737909,1.0375372,0.47349408,-1.246527,-0.25819856,-0.60428214]	2026-02-10 19:53:24.250552	\N	\N	\N	{}	2026-02-12 15:53:49.877109
4	external.bff_products	1	public	--- Entity: bff_products ---\nidcategory: 1\nidum: 1\ndescription: Apple\nsku: safda\nislot: False\ncreated_at: 2026-01-23 20:37:07.072151\n\n> Related bff_category:\n  bff_category_title: Raw materials\n\n> Related bff_um:\n  bff_um_description: KG	[-0.32145813,1.4992037,-3.6308563,-0.5397453,0.9908916,-0.3806259,-0.23874167,-0.01885052,-0.82115114,-1.0658332,-0.35315174,0.192786,1.6465077,-0.11857385,-0.0615292,-0.2645227,-0.29545155,-0.48022956,-1.0463337,0.6268867,-0.52008396,0.024406852,-0.08490901,0.054986775,1.191831,0.7889507,0.6097273,0.033028405,-1.2966723,0.29002765,0.5371877,0.72687644,-0.28511605,-0.5172864,-0.2322198,-1.1172359,1.449105,1.3014146,0.9666759,0.7140905,0.32479215,0.8037674,1.2662199,-0.75241315,0.08549154,0.7069458,1.3671317,0.3801432,1.9986994,-0.6907229,0.9785633,1.0642058,0.58464247,-0.5344675,1.6500092,0.2416869,0.10043667,0.7255886,-0.8758474,0.6459262,0.64758885,2.1383386,-1.0181458,1.3468099,0.87130314,-0.08897728,-1.0586249,1.0310723,-1.2656676,-0.38920605,1.0580733,0.15289229,1.3998748,1.0183599,-0.5226706,-0.08931409,-0.9525194,-0.98670495,-0.34840932,1.0312085,1.7034441,0.6636792,1.512967,-0.24256064,0.9381937,0.016328996,-0.41744682,1.2562057,0.36314985,0.8998598,0.60327655,0.49521372,-0.2607283,-0.060128976,-1.1390378,1.1973444,-1.1065961,-0.14401343,-1.4164062,-1.0307385,0.13605778,0.3615772,0.54413307,-0.13117683,0.91291726,0.8397864,0.17147565,-0.06644782,-0.351735,-0.55366373,-0.8587733,1.1731684,-0.7108113,-0.054426342,1.0919304,-0.7283591,0.73212993,-0.68386114,0.42525974,0.6102302,-0.1143046,-0.5158785,0.0020117485,1.2462785,-0.4769769,-0.19781075,-1.1081033,0.4156459,0.94653714,-0.9621067,-0.514463,-0.83759505,-0.32295474,-0.8579319,0.16810147,1.1944779,0.021216061,0.35444948,0.27332285,0.32186553,0.83692026,0.15129909,-0.49836954,-1.0154022,0.09547637,-1.7422117,0.55365807,-0.46436623,-0.40073085,-0.074682586,-0.52701026,0.28026974,-1.1436148,1.2094402,0.49648592,-1.0415401,-0.15571995,0.21785443,0.5086022,-0.2402899,1.3203623,0.08096764,0.15832727,0.24965757,0.57685745,-0.7864628,0.56404305,1.289829,0.06180275,0.49642387,-1.2347049,-0.05088479,0.0076663326,-0.14023575,0.369323,-0.4207695,-0.057294495,-0.153866,0.5303934,-1.0899334,0.73253477,-1.2947006,0.77876174,0.9739658,0.30805057,-0.7119575,0.104247294,-0.4461436,-0.69677544,0.70805454,-1.0026795,0.51692885,-0.6721623,-1.1992879,-0.53891,-1.0485412,0.22250426,0.43358523,1.0471855,-0.66918266,-0.12790477,0.07225447,-1.4973888,1.2256203,-1.108199,0.95707303,-0.7292675,0.55342984,-0.5048176,0.5087273,1.0081061,-0.4608278,-1.1550977,0.33020824,0.16561821,-0.3131169,-0.06911821,-0.34169424,-1.4016712,0.6248023,0.5489131,0.3836608,0.028763793,-0.6499596,1.3834329,-0.32446438,-0.09923619,0.1983687,-0.51040584,0.37999818,-0.43920517,-1.5189234,0.52462554,-0.35431367,0.04426,0.49747914,0.26227853,1.1010582,-0.24772643,-0.12371828,-0.31322393,0.32229614,0.0099626295,-0.15354028,-0.77074665,0.7418237,-0.48805717,-1.0205302,0.87530035,0.9995757,-0.20060755,0.42469963,0.07270153,0.3958739,0.5627013,0.08425067,-0.3960052,0.4783251,0.30343705,-0.6259789,0.1909803,-1.4973826,1.8487258,0.27622586,-0.7629226,-0.8149639,-0.8398316,0.088800944,-0.06008385,-0.09538129,0.0033979565,0.05623418,0.28571135,0.3302416,0.48977393,0.19692446,0.36803845,0.085954286,-1.0517209,0.16291122,0.16198698,-1.4217407,-0.36927804,-0.02678889,-0.94086343,0.3956844,0.19614479,0.5830183,0.1060034,-0.23017086,0.01025563,0.16681008,-0.13103074,-0.07807073,-0.44528535,0.90137166,1.0577173,-0.56974983,-0.5684165,-0.0653849,0.6567127,0.76276696,0.7263987,0.08711167,-0.10384425,-0.29000363,0.07616097,-0.30935448,0.31686866,0.35795695,-1.035331,0.11196741,-0.16966714,0.46771145,-0.36652437,1.0200223,0.33020833,0.57767236,0.8019662,-0.42387432,-0.1366281,-0.6822105,-0.42413807,-0.23271985,0.7668468,1.4398435,-0.2757211,0.5647465,0.3128593,-0.6144568,0.22889844,0.56529796,-0.6363957,-1.1291424,-0.23461896,1.200402,-1.343754,0.5077733,-0.39599183,1.202151,1.5672705,-0.04709837,1.68095,-1.6122285,-0.65539163,0.9141717,-0.8649441,-0.14170404,0.64788705,0.74471176,-1.4291837,0.6480228,-0.19485244,0.06848042,-0.35824266,0.20976418,0.90048707,-0.031719774,0.41118613,-0.0807522,0.91443515,-0.13171552,0.37439767,-1.7853367,0.27238744,0.32438874,0.5277221,0.43745825,0.08172279,-1.2065771,0.034758914,-0.088925526,0.12418686,0.5984388,-0.15273866,0.05663914,-2.099806,-0.79394823,-0.9913164,-0.934081,0.4121515,-0.08421614,0.3418926,0.9951552,0.8496114,-0.5978154,0.38558203,-0.3703724,0.7961869,-0.027688675,-1.0698957,-1.241278,-1.0692623,-0.022925429,0.7533852,-0.9588693,0.46099445,0.17220913,0.19666283,1.8960472,0.18013015,-0.21297434,0.16540545,-0.79250973,0.550198,0.6739513,-0.8139029,-1.1023602,0.91853774,0.27081457,0.6037775,0.60487074,0.57512987,-1.3971506,0.56129205,-0.10946047,0.6393547,-0.17474467,-0.06297769,-0.28991717,1.5739454,0.1794783,-0.12976669,0.56271017,0.23847902,0.061855357,0.623763,0.49811912,-0.4893876,-1.1536099,-0.6749982,0.42481554,0.44986987,0.00921645,-0.8115221,0.24568936,0.36417156,-0.103837624,0.73267967,0.43058714,0.6834705,-0.48896882,-0.9913591,-0.17234276,0.6158544,1.6026284,0.7749158,-0.5570967,-1.3182361,0.7856277,-0.32492414,0.33386368,-0.12295817,0.47255337,1.2879689,-0.23261899,0.7574528,0.38383955,-0.21499951,0.90269685,-0.0003575636,-0.17273976,-0.71140015,0.12235484,-0.6679256,-0.92418027,0.8504536,-1.731089,-0.35080883,1.9221632,-0.5629117,-0.29042253,0.93977505,0.115982406,0.1602415,1.1245949,0.06081257,0.15725157,-0.50525534,0.50145364,-0.13395993,0.09498246,-1.1453322,-1.0391998,0.06291494,0.4532615,0.4007195,0.80146116,0.37852725,-0.2776739,0.49565524,-0.34287497,0.18915609,-0.03862614,-0.33454457,-0.6007137,-0.61357224,0.46276712,0.63247174,0.45824093,-0.41071337,0.46163124,0.28506118,0.47466686,1.2826446,-0.22984448,0.8980531,-1.2908657,-0.19065054,0.619187,-0.21507742,0.61695373,0.31231496,-0.1586343,0.40521887,-0.7063785,0.58543575,0.53233206,-0.28786543,0.24931091,-0.39037183,-0.963176,-1.3135386,-0.08157837,-1.9301238,0.69653904,0.4216538,-0.8678685,0.89531213,0.777643,-0.15040535,0.7455516,-0.71682864,-0.20358092,0.30619025,-0.017567974,-0.1793243,0.94089985,0.8778195,1.1260122,0.2325825,0.10741415,-0.7132063,-0.66615933,-0.21081784,-0.7090271,0.08807972,-0.20926592,0.05613734,-0.89655125,1.1896994,-1.1844085,0.5956234,-0.9492152,1.346981,-1.0968144,-0.84728444,-0.337654,-0.8889108,-0.9220503,-0.36867404,0.31671104,0.8043348,0.88817126,-0.035141457,-0.84498495,0.45342892,-0.50123245,0.031338926,0.27077883,-0.5849077,-0.8695395,0.016793745,-0.23868823,0.22771077,-1.1765672,0.3686356,0.262546,-0.3952779,-0.6954476,0.2486788,-0.7578397,-0.28578702,0.8741843,-0.6939267,0.032184616,0.15555775,-0.39363334,-0.8062731,-0.7268561,0.5546699,0.09511633,0.70113397,-0.3908718,-0.038235556,0.47562104,-0.72895116,-0.38632143,0.32083943,-1.21896,-0.9212077,0.6421082,0.9076029,-1.7500749,-0.26845637,0.884644,-0.40804312,1.1771951,-0.42897078,-0.028408032,0.46655986,0.15297908,-0.038525917,0.1498086,0.8327966,-0.6397716,0.91301066,0.17565174,-0.77638036,-0.85786414,0.17388651,-1.3898723,0.68298686,0.14437416,0.7388757,-0.24525166,-0.9797848,0.35705912,0.1364077,1.2304497,-0.5219353,0.871179,-1.258662,-1.3851078,-1.1720011,1.4452437,-1.3925768,0.869327,-0.491059,0.24140278,0.18488309,0.07451591,-0.1155067,0.96721023,0.71466875,0.29276153,0.9632321,0.68894774,0.50055325,-0.7686557,1.6700554,1.4265568,0.30504,0.48486474,0.031051964,-0.7699914,0.5879654,-0.9815054,-1.1098036,-0.8008966,-0.5572055,-0.5397659,-1.2099603,-0.2017965,0.19094515,0.014132983,-0.24771008,-0.09447956,-0.8715198,-0.87448025,0.8845377,0.6996504,0.51900554,-0.4050461,0.21290852,0.9338801,1.6873927,0.34561062,-0.024835013,-0.8314451,0.016397016,0.5191493,-0.30487114,-0.11892258,-0.61799926,-0.29134187,0.11476591,-0.660284,0.55313814,-0.9101351,-1.199163,-0.84562147,-0.9299935,-0.85204196,-0.8695826,-0.23689662,-0.32995427,-0.6281623,-0.6066958,1.4635481,-0.4634294,0.438731,-0.4777217,0.051781952,-0.21317911,0.055508308,0.17459448,-0.02610883,-0.31720656,0.54217225,-0.7689202,0.958569,-0.22205877,-0.067501836,-0.4529538,0.34758794,-0.8784628,-0.77122986,-1.299982,0.10603222,0.12420355,-0.095447384,-1.712431,-0.041918375,-0.08463743,-0.18408921,0.4463892,-0.96645623,0.71859235,-0.49644554,-0.9038122,0.124951154,-0.6730052,1.5638074,-0.34458548,-0.25940415,-0.15110227,-1.2164321,-0.8717482,-0.23613292,-0.5932063,0.1866763,0.37252212,0.15434447,-0.61254495,-0.8140717,-0.5758782,0.29881674,1.2677354,0.39958534,-0.53831935,-0.5576742,-0.7038478,-0.3372596,-0.40176773,0.45906025,-0.703148,0.937538,1.8156701,0.28603578,0.85630435,-0.18539211,0.32444406,0.5565648,-0.7731335,-0.38598585,-1.0589955,-0.29172847]	2026-02-12 14:19:30.549935	\N	\N	\N	{}	2026-02-12 15:53:50.42631
5	external.bff_products	2	public	--- Entity: bff_products ---\nidcategory: 1\nidum: 1\ndescription: hjjjjj\nsku: ghhjy\nislot: True\ncreated_at: 2026-01-23 21:41:03.805243\n\n> Related bff_category:\n  bff_category_title: Raw materials\n\n> Related bff_um:\n  bff_um_description: KG	[-0.72477496,1.077725,-3.470568,-0.85586,1.1251237,-0.55698127,-0.72703856,-0.09165978,-1.0837078,-1.4211513,-0.5609728,0.12916076,1.2872437,-0.39115652,0.25958255,-0.48479402,-0.38376936,-0.67889595,-1.1825016,0.37404004,-1.3666509,-0.2673932,0.37511075,-0.45977947,0.7095685,0.6359726,0.51445204,-0.29841036,-1.1946614,0.063087314,-0.13614193,0.22371426,-0.42836684,-0.44540665,0.1733292,-0.8749386,0.86684704,1.6105862,1.1445488,0.34035504,0.76144564,0.7985707,0.87313765,-1.1302265,0.055856586,0.59599465,1.1169304,0.4300002,1.8953192,-0.35513324,0.48609963,0.85699415,0.5647957,-0.3173082,2.0490403,0.22963125,-0.16636626,0.61876076,-0.22866395,0.13207884,0.3554887,2.6255102,-1.0562317,1.3996674,1.0611552,-0.2896198,-1.3994486,1.4021729,-0.8938223,-0.22964,0.7968868,0.5724087,1.0429136,0.9019483,-0.5454104,0.05795732,-0.4956324,-0.83151865,-0.07172726,0.93858856,1.3652439,0.9091888,1.3699704,-0.5673987,0.93475354,-0.18849647,-0.47446296,1.1643248,0.4808787,1.0133231,0.76169646,0.49540886,-0.052357383,0.20719427,-1.0229496,1.1455022,-1.1985922,-0.19338629,-0.89588755,-1.0670487,0.03501547,0.22428799,0.3421955,-0.2878885,0.9913465,0.792821,0.18233724,-0.095087044,-0.06585701,-0.7167846,-0.87931186,0.9489301,-0.7460392,0.043632187,1.0502928,-0.47808617,0.7904698,-0.5722989,0.54926485,0.8208636,-0.062150963,-0.18807906,-0.14319023,1.0924914,-0.6881207,-0.25784236,-1.2051655,0.23999232,1.2283895,-0.865658,-0.22691491,-0.7885396,-0.22588855,-1.1841671,-0.18654248,1.2451342,-0.018829564,0.4607251,0.5027241,0.4011724,1.0205214,-0.38774496,-0.9166726,-1.3084491,-0.052571528,-1.8046844,0.7681309,-0.62789553,-0.23918083,-0.039613243,-0.15533195,0.5629514,-0.6757592,0.7138437,0.8452629,-0.95471656,-0.09167698,0.23689102,0.3065351,-0.23996268,0.9833263,0.29843408,-0.20871939,0.07349855,0.5373498,-0.97669595,0.507482,1.0057012,0.16703686,0.7230969,-1.332694,-0.31264877,-0.5296003,0.19581154,0.38085714,-0.669807,0.49940246,0.1978518,0.5778412,-0.86716914,0.6768874,-1.4892837,0.9704526,0.8059079,0.16129261,-0.4916609,0.31647643,-0.1504084,-1.0408828,0.39131275,-1.1367983,0.85071284,-0.32439655,-1.2017155,-0.9222695,-0.9628036,0.20466635,0.40443677,0.786106,-0.681509,-0.5122922,-0.21256016,-0.8937961,0.8162693,-0.96995443,1.1728518,-0.65113664,0.4000954,-0.5535613,0.5037238,1.3595852,-0.5222787,-1.1660994,0.48362613,-0.1810227,-0.4908259,-0.5355293,-0.05260861,-1.3758323,0.39587218,0.28685948,0.7073582,0.24660176,-0.36109287,0.8541991,-0.3966214,0.19881763,0.16319638,-0.4029328,0.4549779,-0.19252947,-1.2548316,0.6444163,-0.9803739,-0.08835143,0.74725753,-0.162253,1.3994055,-0.21170786,0.14595897,-0.40814275,0.37641406,-0.019773904,-0.19190374,-1.1514373,0.34229508,-0.2782052,-0.99442047,0.76023287,1.2221688,0.094970055,0.07055787,-0.15434495,0.15251723,0.41481027,0.22826256,-0.14747205,0.5976213,-0.034900967,-0.5129197,0.17455867,-1.558978,1.5856284,0.016238967,-0.9398789,-1.1856445,-0.9699748,-0.088036805,-0.43181884,0.13932125,0.2557846,0.06452453,0.09060051,0.088654056,-0.1580846,0.36699268,0.62449825,0.113131896,-1.0591648,0.014183358,0.4228381,-1.1594688,-0.25709,-0.33808807,-0.9103539,0.5514362,0.32219264,0.5469121,0.046722747,-0.11763364,-0.16764943,0.0030095503,-0.06810258,0.055477157,-0.6091222,0.9781244,1.5272557,-0.36999995,-0.49753675,-0.20499459,0.5581301,0.5789956,0.79390705,0.22472799,-0.06073314,-0.20415609,0.034406833,-0.2939276,0.1766263,0.20057257,-1.0356289,-0.007999751,-0.364118,0.8871855,-0.2662978,1.3458548,0.31135187,0.3763072,0.5435534,-0.8475397,0.13104376,-0.68494064,-0.09727527,-0.51255864,0.7061265,1.0539489,-0.3904226,0.3298987,0.48837808,-0.6636038,0.4297329,0.3294406,-0.45011762,-1.1446893,-0.14941227,1.4188576,-1.0937165,-0.31230828,-0.3626173,0.7730906,1.7734578,-0.21498033,1.6910447,-1.4522362,-0.6704437,0.7308556,-0.7701859,-0.32085404,0.6691124,0.8003924,-1.5496602,0.6506938,-0.40047854,-0.25724506,-0.38182896,-0.10383022,0.6692412,0.33515775,0.24052191,-0.5778108,0.6941588,0.088530466,0.5621739,-1.7036089,0.36633864,0.19574167,0.95016617,0.6316961,0.23201531,-0.8398579,-0.011925213,0.050265044,0.067965165,1.020334,0.018437393,0.05742285,-1.9436005,-0.567651,-1.1229846,-1.0174564,0.3567225,-0.22565612,0.40064535,0.8646779,0.7481052,-0.6963604,0.32295218,-0.35322496,0.95779425,0.004872192,-0.8455837,-0.91937625,-0.8099703,-0.14831333,0.61035943,-0.70150447,0.29976144,0.09386634,0.15317267,1.8193357,0.3929599,-0.29487073,0.07084868,-0.73928046,0.38059896,0.46455574,-0.8426186,-1.0226167,0.812831,-0.030269086,0.62592393,0.92239606,0.30507553,-1.2607808,0.3433245,-0.07640422,0.41284645,-0.22890869,0.11095637,-0.22405012,1.5449457,0.21537156,-0.04633103,0.6325874,0.35125956,-0.30253375,1.1782987,0.6974153,-0.40882748,-0.91807044,-0.68567765,0.38744444,0.57150215,0.0057970444,-0.6399784,0.30401957,0.24080552,-0.09452818,0.71263766,0.3314207,1.0041878,-0.6306134,-0.80253184,-0.14200802,0.5003569,1.5740925,0.43036285,-0.68880713,-1.3091388,0.635568,-0.559237,0.55254775,0.24115244,0.3158084,1.2074441,-0.039524447,1.2040031,0.09780461,-0.13339345,1.0100976,0.2811431,-0.2898963,-0.44783664,-0.2594193,-0.39533874,-0.7991247,0.48148757,-0.93134373,-0.65036154,1.8877889,-0.51402795,-0.0030534377,1.0323771,-0.011287517,-0.12178463,0.9121362,-0.05457794,-0.08551443,-0.34670985,0.42327338,-0.20258716,0.21156058,-0.99338853,-1.0474428,0.28412998,0.3771598,0.37847638,0.8613076,0.36917537,-0.29628947,0.5619448,-0.24519801,0.6304854,0.105430536,-0.16137816,-1.0413473,-0.24327898,0.31536248,0.84055984,0.52757096,-0.06283814,0.7525001,0.006086855,-0.025829632,1.2521539,0.2143583,0.79279804,-1.5881798,-0.16750959,0.515437,-0.13642836,0.761001,0.2231088,-0.15949966,0.9129152,-0.6187224,0.53501093,0.6397424,0.07028707,0.59110075,-0.36987215,-0.9608624,-0.8136135,-0.3328473,-1.7293267,1.0698856,-0.13211977,-0.68516177,0.70749557,1.2417747,-0.16078329,0.4347227,-0.72578585,-0.112279594,0.13219167,0.10018675,-0.11178943,0.76973605,1.0661842,1.0917276,0.20989603,0.48458266,-1.3802509,-0.3310775,0.025644893,-0.55680925,-0.1310181,-0.28915146,0.32137892,-0.83788687,1.1424348,-1.3328646,0.9017554,-0.9244203,1.1244241,-1.0987046,-0.6457843,0.033799946,-0.93752867,-0.56218237,-0.097493395,0.5236369,0.4502458,0.93561226,-0.007317718,-1.0784385,0.57513607,-0.8925645,-0.083330326,0.34536764,-0.4507393,-1.4501203,0.07610474,-0.628436,0.5888434,-0.8600746,0.6051785,0.17131555,-0.951304,-0.6221638,0.10123186,-0.8061528,-0.14425115,0.5481744,-0.9925749,0.08644682,0.19790915,-0.44173214,-0.8005042,-0.8367035,0.7610405,0.23129106,0.46342883,-0.51048166,-0.0024447523,0.41167802,-0.47382808,-0.09424734,0.05446786,-1.1302514,-0.9644285,0.48584834,0.82575583,-1.5582235,0.11221682,1.1083335,-0.25366592,1.3063748,-0.46748725,0.054933656,0.3664334,0.38144532,-0.21733183,0.13673823,0.68592304,-0.55400646,0.96099496,0.43996114,-0.5162302,-1.1349387,0.08480713,-1.1740575,0.5286039,0.4446841,0.81470054,0.13014394,-1.1699866,0.28426793,0.017047787,1.0119133,-0.43020156,0.55334294,-1.3073803,-0.872167,-1.2658709,0.81832165,-1.5448478,0.8098319,-0.19058523,0.4089231,0.5224509,-0.123797655,0.060272567,0.87308615,0.87658477,0.20114963,0.9677305,0.90473497,0.83941615,-0.5186015,1.5835241,1.5313127,0.40232444,0.66391695,0.170534,-0.6217145,0.8170097,-1.3412013,-1.1366129,-0.5785131,-0.24893314,-0.63988465,-0.92148805,0.13105261,-0.06929045,-0.16124666,-0.18519649,0.018715333,-0.8442519,-0.79091567,0.86121416,0.48410183,0.40188777,-0.3834975,-0.09789953,0.57709134,1.3451637,0.4215819,0.09736546,-0.64113605,-0.43006033,0.7171165,-0.18822193,-0.035184663,-0.35981724,-0.098517574,-0.08689699,-0.5136385,0.07186947,-1.1186395,-1.2451721,-0.7940414,-0.48345372,-1.0393841,-0.66805303,-0.2418409,0.071630396,-0.4791385,-0.77240163,1.3149219,-0.1417234,-0.17401423,-0.6012772,-0.33573142,-0.120391235,-0.08454048,0.20066023,-0.05683446,0.262457,0.2536639,-0.72319686,1.1454121,-0.26385677,0.10030154,-0.3712978,0.4832116,-1.2539124,-0.6949127,-0.93833876,0.21711403,-0.16914178,0.38406816,-1.4411432,-0.28729904,-0.009465549,0.18423167,0.6065421,-1.4414269,0.48486367,-0.28996012,-0.6956614,-0.18395206,-1.0561298,1.6692111,0.03373505,-0.293823,-0.13013062,-0.7953372,-0.6966372,-0.037570726,-0.29894954,0.22398528,0.09830241,0.56345433,-0.5176679,-0.47104713,-0.7468645,0.24050571,1.0288326,0.5101857,-0.6129535,-0.22472006,-0.06881875,-0.42646688,-0.23655972,-0.19132297,-0.51236194,1.3760823,1.5855545,0.51421463,1.2700641,0.034467563,0.34017432,0.58064616,-0.9577481,0.22338957,-1.2273757,-0.28757972]	2026-02-12 14:19:30.630515	\N	\N	\N	{}	2026-02-12 15:53:50.632779
6	external.bff_products	3	public	--- Entity: bff_products ---\nidcategory: 1\nidum: 1\ndescription: Mango 2\nsku: PROD-008\nislot: True\ncreated_at: 2026-02-06 21:26:57.263604\n\n> Related bff_category:\n  bff_category_title: Raw materials\n\n> Related bff_um:\n  bff_um_description: KG	[-0.55644095,0.97586,-3.4896739,-0.22423835,1.3018274,-0.3945719,-0.6687176,-0.27138117,-1.3724641,-1.349716,-0.3661235,0.3764798,1.1192054,-0.36549312,0.25351244,-0.594804,0.07710453,-0.6719132,-0.9998063,0.445585,-1.1146345,-0.03034668,0.21557954,-0.15460454,1.1825808,0.8640398,0.4991815,0.3269746,-1.4214536,0.16672786,0.41456264,0.24014345,-0.32045686,-0.2807446,0.048747066,-0.80123854,1.076895,1.4376779,1.0678596,0.3161707,0.52801543,0.6525544,1.1554903,-0.67827463,0.027649827,0.5864673,1.1040537,0.2864516,1.6407144,-0.61857533,0.619397,0.9825638,0.80436456,-0.6054666,1.4370763,0.25363362,0.10498939,0.6011144,-0.16117379,0.2853896,0.7925547,2.2665424,-1.0422711,1.7916365,1.1652256,-0.30869624,-1.1328046,1.2675005,-1.2206866,-0.5369645,0.81938004,0.56667984,1.0989711,1.053818,-0.44264627,0.091277376,-0.6598619,-0.8621932,-0.16607113,0.7059699,1.6466584,0.82455724,1.3226947,-0.4873648,1.0741012,-0.62779087,-0.5027098,1.0461969,0.07213268,1.2679534,0.8003844,0.6977211,-0.16462137,-0.034043718,-1.2203844,1.2080808,-1.0536237,-0.17944121,-1.1519531,-0.9323004,0.14042741,0.15163761,0.3394791,-0.03223392,1.0723515,0.7729981,0.2879688,-0.029412538,0.01919875,-0.44982615,-0.75728655,0.9006725,-1.4625227,0.3504876,0.7827322,-0.4675066,0.343036,-0.6610019,0.6574239,0.8960699,0.12205799,-0.43899208,0.32660288,1.1795554,-0.14669004,-0.49970406,-1.2785975,0.1531651,0.86211836,-0.8827127,-0.32433915,-0.57054317,-0.054932654,-1.1138005,-0.38842455,1.4901206,-0.33969736,0.4839682,0.37092328,0.3443401,0.6515778,-0.33603194,-0.8694284,-1.2380545,-0.30624765,-1.6910744,0.84080327,-0.53957796,-0.3106025,0.10677986,-0.11509773,0.41638154,-1.0288501,1.1002007,0.6106514,-0.82137084,0.057170466,0.05305159,0.33136642,-0.19813141,1.2428815,0.16871862,-0.36770713,0.058342725,0.61362875,-1.4204261,0.7140769,1.1801817,-0.2393623,0.8797892,-1.4801556,0.0100477915,-0.14533557,0.23613244,0.052201048,-0.462387,0.2556698,-0.08279919,0.9495264,-1.0916957,0.5827981,-1.1604849,0.68060386,0.9432406,0.07433235,-0.7024586,0.2757227,-0.055216525,-0.7891328,0.23089673,-0.6750995,0.6274779,-0.5551487,-1.1185818,-0.575371,-0.94854933,0.15551254,0.49624032,0.7617686,-0.81165063,-0.6919445,-0.010968678,-0.9848273,1.1044037,-1.0307853,1.3658597,-0.47819927,0.28975147,-0.41961178,0.73121756,1.089558,-0.58895165,-0.91087645,0.44098324,-0.110786945,-0.7320392,-0.207609,-0.24357557,-0.78066665,0.8002753,0.16148004,0.33289146,0.22685942,-0.5049024,1.0434511,-0.12743932,0.1631293,0.2929113,-0.6522676,0.5574867,-0.19634011,-1.7527335,0.8903347,-0.48321486,-0.20325413,0.5057901,-0.086766504,1.3459872,-0.5372417,-0.120042205,-0.35819823,0.38432598,-0.12284634,0.2142752,-1.028583,0.5762988,-0.013400821,-0.73347545,0.9982261,1.2980092,0.026250739,0.06530456,-0.21084303,0.576234,0.47470924,-0.053751282,-0.43676275,0.85268605,0.12872154,-0.79374456,0.46632484,-1.7636641,1.7668409,0.3420658,-0.6754166,-0.7895729,-1.0740451,0.18831177,-0.42413154,0.22934246,0.2010572,0.13066523,-0.018337369,0.10876566,0.13935867,0.37322944,0.698293,0.25179017,-1.019685,0.21751086,0.18602568,-1.6497262,-0.36173052,-0.106678896,-0.75459045,0.63218594,0.04519229,0.6622052,0.044337787,-0.21962029,-0.33499402,0.15607488,0.21449496,0.15351407,-0.4739542,0.76809126,1.4132997,-0.42139444,-0.5394882,-0.67240083,0.7904638,0.5270513,0.7033118,0.09850609,0.20115471,-0.5575967,0.11271652,-0.1544885,0.13156706,0.047819547,-0.795347,0.5354769,-0.6548349,1.2070158,-0.65210307,1.1341918,0.26665998,0.7292825,0.8187716,-0.16553336,-0.21838386,-0.57430196,0.075415604,-0.5502637,0.7082467,1.1828923,-0.40260813,0.253633,0.50007045,-0.60427046,0.53390026,0.72232974,-0.7706884,-1.4385854,0.05942189,1.3287977,-1.3105417,0.049616806,-0.33167917,1.2561626,1.3070743,-0.32371628,1.498513,-1.620512,-0.65410316,0.5885299,-0.51121354,-0.3167836,0.7151119,0.7236181,-1.3896673,0.8645341,-0.51884633,-0.05060032,-0.45599204,0.041841745,0.7771781,0.12714402,0.17293905,-0.2539637,0.6125429,-0.008144349,0.22646046,-2.1063704,0.62754774,0.22186552,0.99055374,0.6664663,0.21853666,-1.2240028,0.15889183,-0.5077184,0.15413181,1.0066369,-0.17217617,0.005830884,-2.527242,-0.71284056,-1.0595373,-0.766983,0.559217,-0.18772417,0.34450078,1.0168498,0.9822375,-0.9367461,0.0954317,-0.28298056,1.1786028,0.10884952,-1.0444183,-1.2224345,-0.9342698,-0.1453367,0.67773247,-0.8021556,0.5682064,0.11876698,0.058658544,1.8377156,-0.06250602,0.018936671,-0.18246336,-0.77451223,0.46356952,0.50403416,-0.7305293,-0.9709678,0.97602814,0.11866143,0.5772815,0.77804923,0.29262936,-1.4362463,0.27816063,-0.12742373,0.3845458,-0.4701877,-0.14130515,-0.7670725,1.7505362,0.29256794,-0.36888927,0.46898705,0.30200592,-0.012799922,1.00212,0.77809525,-0.41533035,-1.0304818,-1.0356681,0.23289157,0.6451804,0.02268086,-0.62600875,-0.2399385,0.20108211,-0.36994854,0.93156445,0.3122334,0.642326,-0.5373374,-0.830486,-0.53290254,0.8399224,1.1872368,0.6668003,-0.73353213,-1.0784428,0.78624284,-0.377321,0.3335173,0.52482283,0.31216007,1.3139489,-0.114896715,0.9461453,0.15891093,-0.12000051,0.69373524,0.38352907,-0.46463442,-0.6849456,-0.09963101,-0.41377932,-0.8441722,0.33346686,-0.9423593,-0.2186028,1.6928606,-0.8451868,-0.47223458,0.9874271,-0.19708063,-0.08845967,0.7279078,-0.34462392,-0.06502121,0.15695907,0.3389985,-0.036315337,0.6007718,-0.94718385,-1.1258979,0.70094687,0.22021152,0.3921238,0.40498483,0.4281883,-0.09864822,0.67827785,-0.27962792,0.6266891,-0.09908097,-0.18563554,-0.89258754,0.013315124,0.5180774,0.6584528,0.5043367,-0.1601231,0.42639673,0.05862765,0.08270869,1.0877802,-0.2445219,0.95317227,-1.6064168,-0.11459584,0.8805161,0.15671945,0.50159585,0.4550452,-0.34732252,0.31510502,-0.7572962,0.87807566,0.41451123,-0.17065519,0.5355645,-0.16021502,-1.0869365,-1.13364,-0.16200833,-1.8387783,0.98482656,0.25911397,-0.50315964,0.48796672,0.6464727,-0.14318562,0.48698783,-1.0116009,-0.01560523,0.14576223,0.010854349,0.09546732,0.88015103,1.0397438,0.77989817,0.11690231,0.5324818,-1.0221026,-0.9389605,-0.15236124,-0.26159513,0.024137031,0.073795885,0.21423356,-0.9399406,0.9468596,-1.4383408,0.7541985,-0.9869951,1.1670241,-1.0207969,-0.64474297,0.06453687,-0.5098988,-0.5747101,-0.23630396,0.6246974,0.63839984,0.68222773,-0.09227347,-1.2534606,0.6043665,-0.50217915,-0.024630312,0.35906583,-0.5037561,-1.1182246,0.009129809,-0.53521264,0.34803498,-1.1278738,0.11290704,0.17453603,-0.4984486,-0.66948855,0.21092023,-0.98216456,-0.31226376,0.99969053,-0.63047266,0.15834688,0.1328331,-0.6240457,-0.5818652,-0.91268253,0.7389079,0.31764913,0.69545174,-0.46406043,-0.06346669,0.3970572,-0.8265697,-0.26299036,0.067966715,-1.110973,-1.0649452,0.35384074,0.6076963,-1.7688341,0.03583525,0.8203757,-0.29840407,1.385392,-0.3321451,0.18793906,0.6654632,0.22959882,-0.08013318,0.21073174,0.66474974,-0.7309479,0.95128584,0.13432637,-0.6363044,-1.10387,0.19111331,-1.6063504,0.6363133,-0.1315834,0.9242258,-0.05361093,-1.1034795,0.14205544,0.2185973,0.9244456,-0.46905556,0.35612416,-0.83643925,-0.7465122,-1.4030254,0.58288044,-1.2303901,0.9702801,-0.44146544,0.34214157,0.14819774,-0.010104892,-0.06830024,0.98954046,1.0123491,0.20221022,1.1803735,0.99474174,0.49227604,-0.613553,1.2247021,1.6266773,0.41306162,0.7826088,-0.085868984,-0.71586347,0.48724023,-1.2326905,-0.90199524,-0.56709707,-0.3999777,-0.48507488,-1.259167,-0.10212393,0.23503335,-0.12685147,-0.09104715,-0.017199289,-1.0764056,-0.90266526,0.8199029,0.45006895,0.41713345,-0.46193856,-0.17132913,0.6742456,1.8855135,0.41370088,0.042451553,-0.71045315,-0.012644574,0.25850114,0.04945039,-0.09680924,-0.5670773,-0.04790219,0.28160664,-0.38788515,0.3227772,-1.2464838,-1.1150632,-0.6618221,-0.6184058,-0.80013984,-0.95513517,-0.37533367,-0.24959926,-0.49667755,-0.9127068,1.4887135,0.03902927,0.15416029,-0.66722584,0.030176226,-0.019166145,-0.22846158,0.19096732,0.011021297,-0.046113826,0.25289938,-0.37873405,1.0377,0.12330203,0.54192555,-0.11460088,0.32218635,-1.080304,-0.5003714,-1.0968163,0.32773823,-0.043272234,0.41450307,-1.5067782,-0.45779127,-0.32466596,-0.0028352886,0.5320089,-1.208889,0.17683187,-0.09213427,-0.40447176,-0.09235414,-0.92950547,1.5252969,-0.054665238,-0.47769606,-0.3214702,-1.0219806,-1.024503,-0.20571533,-0.43733257,0.24901041,0.14910913,0.4533958,-0.58328265,-0.64450353,-0.9381875,0.85242295,1.6274793,0.7023382,-0.32511574,-0.6576525,-0.36522937,-0.22945015,-0.62251383,-0.104939215,-0.38650978,1.1547859,1.6930927,0.28777838,1.2026064,-0.118053064,0.27230924,0.64989597,-0.8746699,0.2670329,-1.1118146,-0.23619145]	2026-02-12 14:19:30.702516	\N	\N	\N	{}	2026-02-12 15:53:50.857839
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
67924f11-5842-46bb-b83e-82a1396ced78	how may user with rtle admin we have?	1	user	2026-02-12 14:19:45.317313+00	2026-02-12 14:19:45.317316+00	219e5bbc-8e76-4e8c-b94d-70000a8d3e2e
e3513429-8c64-44f3-98e9-24f5cc8b619f	\n\nNo hay usuarios con el nombre "rtle admin" en el contexto proporcionado. Los usuarios registrados son:  \n1. **r00t@dfgchatai.com** (username: r00t)  \n2. **admin@dfgchatai.com** (username: admin)  \n3. **avinajera2011@gmail.com** (username: one)  \n\nninguno de ellos incluye "rtle admin" en su nombre de usuario o correo electrónico.	1	assistant	2026-02-12 14:20:07.008097+00	2026-02-12 14:20:07.0081+00	219e5bbc-8e76-4e8c-b94d-70000a8d3e2e
f5070d7e-56fd-4781-b4f0-0d84a65a7869	how may user with role admin we have?	1	user	2026-02-12 14:20:20.76906+00	2026-02-12 14:20:20.769062+00	219e5bbc-8e76-4e8c-b94d-70000a8d3e2e
864433cd-07b6-4533-afd3-a82546ff27b1	\n\nThere are **2 users** with the "admin" role (role_name: **owner**):  \n1. **admin@dfgchatai.com** (username: admin)  \n2. **r00t@dfgchatai.com** (username: r00t)  \n\nThe third user (avinajera2011@gmail.com) has a different role (id_role: 9, role_name not specified in the context).	1	assistant	2026-02-12 14:20:40.165338+00	2026-02-12 14:20:40.165341+00	219e5bbc-8e76-4e8c-b94d-70000a8d3e2e
3b717e45-4fa3-4cc6-9f46-496103161cce	how may user with role admin we have?	1	user	2026-02-12 14:26:38.334518+00	2026-02-12 14:26:38.33452+00	d0d0293d-d954-4464-8bf5-52166fcbb29a
f7af960c-2a5d-4486-91b5-d1404977e41c	\n\nThere are **2 users** with the **"owner"** role (role_name: **owner**):  \n1. **admin@dfgchatai.com** (username: admin)  \n2. **r00t@dfgchatai.com** (username: r00t)  \n\nNote: The term "admin" in the question likely refers to the **"owner"** role in this context, as no role named "admin" exists in the provided data.	1	assistant	2026-02-12 14:26:57.377893+00	2026-02-12 14:26:57.377895+00	d0d0293d-d954-4464-8bf5-52166fcbb29a
64f3303e-02ce-4355-a8bb-5f92b12c97f2	how may user with role admin we have?	1	user	2026-02-12 14:32:14.432933+00	2026-02-12 14:32:14.432936+00	a6c70ed6-6e7f-4e27-9a86-32133cb053cd
20bbd780-82e7-46d3-b05d-630b5cf42506	\n\nThere are **2 users** with the **"owner"** role (role_name: **owner**):  \n1. **admin@dfgchatai.com** (username: admin)  \n2. **r00t@dfgchatai.com** (username: r00t)  \n\nNote: The term "admin" in the question likely refers to the **"owner"** role in this context, as no role named "admin" exists in the provided data.	1	assistant	2026-02-12 14:32:32.823909+00	2026-02-12 14:32:32.823912+00	a6c70ed6-6e7f-4e27-9a86-32133cb053cd
4cff20f1-5da6-48af-bdc4-0a9f6012e10c	how may user with role admin we have?	1	user	2026-02-12 14:33:24.392772+00	2026-02-12 14:33:24.392774+00	a6c70ed6-6e7f-4e27-9a86-32133cb053cd
af5251e0-3281-4655-8e9d-8cb4b0bb025d	\n\nThere are **2 users** with the **"owner"** role (role_name: **owner**):  \n1. **admin@dfgchatai.com** (username: admin)  \n2. **r00t@dfgchatai.com** (username: r00t)  \n\nNote: The term "admin" in your question likely refers to the **"owner"** role in this context, as no role named "admin" exists in the provided data. The third user (avinajera2011@gmail.com) has a different role (id_role: 9, role_name not specified).	1	assistant	2026-02-12 14:33:42.059291+00	2026-02-12 14:33:42.059294+00	a6c70ed6-6e7f-4e27-9a86-32133cb053cd
d102bcc1-1fc5-4074-9f7e-089ffd9cfe38	how may user with role admin we have?	1	user	2026-02-12 14:35:55.493583+00	2026-02-12 14:35:55.493586+00	a6c70ed6-6e7f-4e27-9a86-32133cb053cd
5be1b023-8809-4eda-8e6a-9885b27954a5	\n\nThere are **2 users** with the **"owner"** role (role_name: **owner**):  \n1. **admin@dfgchatai.com** (username: admin)  \n2. **r00t@dfgchatai.com** (username: r00t)  \n\nNote: The term "admin" in your question likely refers to the **"owner"** role in this context, as no role named "admin" exists in the provided data. The third user (avinajera2011@gmail.com) has a different role (id_role: 9, role_name not specified).	1	assistant	2026-02-12 14:36:11.462312+00	2026-02-12 14:36:11.462316+00	a6c70ed6-6e7f-4e27-9a86-32133cb053cd
392259be-9273-4349-9078-70fac7505af4	Who is admin?	1	user	2026-02-12 14:36:20.418208+00	2026-02-12 14:36:20.418211+00	a6c70ed6-6e7f-4e27-9a86-32133cb053cd
d5739e2b-0eac-4d5f-8800-715b21f08d6f	\n\nThe user with the username **"admin"** is associated with the **"owner"** role. Here are the details:  \n\n- **Email**: admin@dfgchatai.com  \n- **Username**: admin  \n- **Full Name**: System Administrator  \n- **Role**: owner (global scope)  \n\nThere is also another user (**r00t@dfgchatai.com**) with the same **"owner"** role, but their username is **r00t**. The term "admin" in your question likely refers to the **"owner"** role, as no role named "admin" exists in the provided data.	1	assistant	2026-02-12 14:36:37.025117+00	2026-02-12 14:36:37.025119+00	a6c70ed6-6e7f-4e27-9a86-32133cb053cd
acb5a6b6-f772-42ae-821b-4cb89ef4333c	Who is admin?	1	user	2026-02-12 14:40:40.205249+00	2026-02-12 14:40:40.20525+00	fe951698-7dae-435f-9403-0121d56fb7d0
0e512fd7-6366-4353-b2bc-7ff716dbe2e4	\n\nThe user with the username **"admin"** is associated with the **"owner"** role. Here are their details:  \n\n- **Email**: admin@dfgchatai.com  \n- **Username**: admin  \n- **Full Name**: System Administrator  \n- **Role**: owner (global scope)  \n\nThis user is identified as the **admin** in the context. There is also another user (**r00t@dfgchatai.com**) with the same **"owner"** role, but their username is **r00t**.	1	assistant	2026-02-12 14:40:55.623287+00	2026-02-12 14:40:55.623289+00	fe951698-7dae-435f-9403-0121d56fb7d0
fd9aa882-f6f0-49e6-9ecf-e679adc5209d	who is admin?	1	user	2026-02-12 15:54:00.134401+00	2026-02-12 15:54:00.134411+00	73147291-49b0-4c08-a162-54e49ea15a96
bebbbb16-d76d-4440-925b-fe61ad6e4bb1	\n\nThe user identified as **"admin"** is associated with the **"owner"** role and has the following details:  \n\n- **Email**: admin@dfgchatai.com  \n- **Username**: admin  \n- **Full Name**: System Administrator  \n- **Role**: owner (global scope)  \n- **Phone**: 00000000000  \n\nThis user is explicitly labeled as the **admin** in the context. Another user (**r00t@dfgchatai.com**) also has the **"owner"** role but is not referred to as "admin" in the data.	1	assistant	2026-02-12 15:55:16.725879+00	2026-02-12 15:55:16.725882+00	73147291-49b0-4c08-a162-54e49ea15a96
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

COPY public.dff_role (id, role, created_at, updated_at, is_system) FROM stdin;
1	admin	2026-01-23 20:30:04.703675+00	\N	t
2	viewer	2026-01-23 20:30:04.703675+00	\N	t
3	sales_rep	2026-01-23 20:30:04.703675+00	\N	f
4	sales_manager	2026-01-23 20:30:04.703675+00	\N	f
5	buyer	2026-01-23 20:30:04.703675+00	\N	f
6	purchasing_manager	2026-01-23 20:30:04.703675+00	\N	f
7	inventory_manager	2026-01-23 20:30:04.703675+00	\N	f
8	customer_support	2026-01-23 20:30:04.703675+00	\N	f
9	developer	2026-02-04 19:48:25.472229+00	\N	f
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
1	admin	admin@dfgchatai.com	$2b$12$z1r0BtMaqIvrY.VBVcM29u9SWtxsrqpIb.cgOyVCeYrS5cUGAuCA6	System	Administrator	Root	\N	00000000000	1	t	2026-01-21 13:28:37.149478	2026-02-12 19:30:25.094018+00	0	\N	3837fcfd-e3fe-40c8-83ef-e525a6841d3d
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

SELECT pg_catalog.setval('public.ai_external_source_config_id_seq', 9, true);


--
-- Name: ai_knowledge_store_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ai_knowledge_store_id_seq', 6, true);


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

\unrestrict OgZte5zIAoCkeTChGYXS8n9BdtvYuiSKb1dTuuyFNfTFFTQYvuTofQnZJarrrkG

