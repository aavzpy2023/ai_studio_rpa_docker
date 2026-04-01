--
-- PostgreSQL database dump
--

\restrict lscSUfjaQIvLbyXc7aWVjEml17mIFtr5ZKh5uYaIXz98JziztvlsoNRHOKbOLHx

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
ALTER TABLE IF EXISTS ONLY public.bff_customer_retail_prices DROP CONSTRAINT IF EXISTS bff_customer_retail_prices_pkey;
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
ALTER TABLE IF EXISTS public.bff_customer_retail_prices ALTER COLUMN id DROP DEFAULT;
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
DROP SEQUENCE IF EXISTS public.bff_customer_retail_prices_id_seq;
DROP TABLE IF EXISTS public.bff_customer_retail_prices;
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
-- Name: bff_customer_retail_prices; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bff_customer_retail_prices (
    id integer NOT NULL,
    idvendorcustomers integer NOT NULL,
    idproduct integer NOT NULL,
    retail_price numeric(10,2) DEFAULT 0.00 NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);


--
-- Name: bff_customer_retail_prices_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bff_customer_retail_prices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bff_customer_retail_prices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bff_customer_retail_prices_id_seq OWNED BY public.bff_customer_retail_prices.id;


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
-- Name: bff_customer_retail_prices id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bff_customer_retail_prices ALTER COLUMN id SET DEFAULT nextval('public.bff_customer_retail_prices_id_seq'::regclass);


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
10	local://system	[{"columns": [{"name": "id", "path": "root", "alias": "id", "destination": "vector"}, {"name": "email", "path": "root", "alias": "email", "destination": "vector"}, {"name": "username", "path": "root", "alias": "username", "destination": "vector"}, {"name": "lastname", "path": "root", "alias": "lastname", "destination": "vector"}, {"name": "firstname", "path": "root", "alias": "firstname", "destination": "vector"}, {"name": "middname", "path": "root", "alias": "middname", "destination": "vector"}, {"name": "movil", "path": "root", "alias": "movil", "destination": "vector"}, {"name": "lockout_until", "path": "root", "alias": "lockout_until", "destination": "vector"}, {"name": "updated_at", "path": "root", "alias": "updated_at", "destination": "vector"}, {"name": "active", "path": "root", "alias": "active", "destination": "vector"}, {"name": "Phone", "path": "root", "alias": "Phone", "destination": "vector"}, {"name": "id_role", "path": "root", "alias": "id_role", "destination": "vector"}, {"name": "failed_attempts", "path": "root", "alias": "failed_attempts", "destination": "vector"}, {"name": "created_at", "path": "root", "alias": "created_at", "destination": "vector"}, {"name": "session_id", "path": "root", "alias": "session_id", "destination": "vector"}, {"name": "name", "path": "id_role->role", "alias": "role_name", "destination": "vector"}, {"name": "updatedAt", "path": "id_role->role", "alias": "role_updatedAt", "destination": "vector"}, {"name": "password", "path": "root", "alias": "password", "destination": "vector"}, {"name": "scope", "path": "id_role->role", "alias": "role_scope", "destination": "vector"}], "table_name": "dff_users"}, {"columns": [{"name": "title", "path": "idcategory->bff_category", "alias": "bff_category_title", "destination": "vector"}, {"name": "idcategory", "path": "root", "alias": "idcategory", "destination": "vector"}, {"name": "description", "path": "idum->bff_um", "alias": "bff_um_description", "destination": "vector"}, {"name": "idum", "path": "root", "alias": "idum", "destination": "vector"}, {"name": "description", "path": "root", "alias": "description", "destination": "vector"}, {"name": "sku", "path": "root", "alias": "sku", "destination": "vector"}, {"name": "islot", "path": "root", "alias": "islot", "destination": "vector"}, {"name": "created_at", "path": "root", "alias": "created_at", "destination": "vector"}], "table_name": "bff_products"}, {"columns": [{"name": "company", "path": "root", "alias": "company", "destination": "vector"}, {"name": "address", "path": "root", "alias": "address", "destination": "vector"}, {"name": "city", "path": "root", "alias": "city", "destination": "vector"}, {"name": "zipcode", "path": "root", "alias": "zipcode", "destination": "vector"}, {"name": "idstate", "path": "root", "alias": "idstate", "destination": "vector"}, {"name": "name", "path": "idstate->bff_state", "alias": "bff_state_name", "destination": "vector"}, {"name": "name", "path": "idstate->bff_state.country_id->bff_country", "alias": "bff_state_bff_country_name", "destination": "vector"}, {"name": "name", "path": "idcontry->bff_country", "alias": "bff_country_name", "destination": "vector"}, {"name": "idcontry", "path": "root", "alias": "idcontry", "destination": "vector"}], "table_name": "bff_customers"}]	60	t
11	local://system	[{"columns": [{"name": "id", "path": "root", "alias": "id", "destination": "vector"}, {"name": "email", "path": "root", "alias": "email", "destination": "vector"}, {"name": "username", "path": "root", "alias": "username", "destination": "vector"}, {"name": "lastname", "path": "root", "alias": "lastname", "destination": "vector"}, {"name": "firstname", "path": "root", "alias": "firstname", "destination": "vector"}, {"name": "middname", "path": "root", "alias": "middname", "destination": "vector"}, {"name": "movil", "path": "root", "alias": "movil", "destination": "vector"}, {"name": "lockout_until", "path": "root", "alias": "lockout_until", "destination": "vector"}, {"name": "updated_at", "path": "root", "alias": "updated_at", "destination": "vector"}, {"name": "active", "path": "root", "alias": "active", "destination": "vector"}, {"name": "Phone", "path": "root", "alias": "Phone", "destination": "vector"}, {"name": "id_role", "path": "root", "alias": "id_role", "destination": "vector"}, {"name": "failed_attempts", "path": "root", "alias": "failed_attempts", "destination": "vector"}, {"name": "created_at", "path": "root", "alias": "created_at", "destination": "vector"}, {"name": "session_id", "path": "root", "alias": "session_id", "destination": "vector"}, {"name": "name", "path": "id_role->role", "alias": "role_name", "destination": "vector"}, {"name": "updatedAt", "path": "id_role->role", "alias": "role_updatedAt", "destination": "vector"}, {"name": "password", "path": "root", "alias": "password", "destination": "vector"}, {"name": "scope", "path": "id_role->role", "alias": "role_scope", "destination": "vector"}], "table_name": "dff_users"}, {"columns": [{"name": "title", "path": "idcategory->bff_category", "alias": "bff_category_title", "destination": "vector"}, {"name": "idcategory", "path": "root", "alias": "idcategory", "destination": "vector"}, {"name": "description", "path": "idum->bff_um", "alias": "bff_um_description", "destination": "vector"}, {"name": "idum", "path": "root", "alias": "idum", "destination": "vector"}, {"name": "description", "path": "root", "alias": "description", "destination": "vector"}, {"name": "sku", "path": "root", "alias": "sku", "destination": "vector"}, {"name": "islot", "path": "root", "alias": "islot", "destination": "vector"}, {"name": "created_at", "path": "root", "alias": "created_at", "destination": "vector"}], "table_name": "bff_products"}, {"columns": [{"name": "company", "path": "root", "alias": "company", "destination": "vector"}, {"name": "address", "path": "root", "alias": "address", "destination": "vector"}, {"name": "city", "path": "root", "alias": "city", "destination": "vector"}, {"name": "zipcode", "path": "root", "alias": "zipcode", "destination": "vector"}, {"name": "idstate", "path": "root", "alias": "idstate", "destination": "vector"}, {"name": "name", "path": "idstate->bff_state", "alias": "bff_state_name", "destination": "vector"}, {"name": "name", "path": "idstate->bff_state.country_id->bff_country", "alias": "bff_state_bff_country_name", "destination": "vector"}, {"name": "name", "path": "idcontry->bff_country", "alias": "bff_country_name", "destination": "vector"}, {"name": "idcontry", "path": "root", "alias": "idcontry", "destination": "vector"}], "table_name": "bff_customers"}, {"columns": [{"name": "company", "path": "root", "alias": "company", "destination": "vector"}, {"name": "address", "path": "root", "alias": "address", "destination": "vector"}, {"name": "city", "path": "root", "alias": "city", "destination": "vector"}, {"name": "zipcode", "path": "root", "alias": "zipcode", "destination": "vector"}, {"name": "name", "path": "idcontry->bff_country", "alias": "bff_country_name", "destination": "vector"}, {"name": "idcontry", "path": "root", "alias": "idcontry", "destination": "vector"}, {"name": "name", "path": "idstate->bff_state", "alias": "bff_state_name", "destination": "vector"}, {"name": "idstate", "path": "root", "alias": "idstate", "destination": "vector"}, {"name": "email", "path": "idrepresentative->bff_representative", "alias": "bff_representative_email", "destination": "vector"}, {"name": "idrepresentative", "path": "root", "alias": "idrepresentative", "destination": "vector"}, {"name": "name", "path": "idrepresentative->bff_representative", "alias": "bff_representative_name", "destination": "vector"}, {"name": "phone", "path": "idrepresentative->bff_representative", "alias": "bff_representative_phone", "destination": "vector"}], "table_name": "bff_vendor"}]	60	t
12	local://system	[{"columns": [{"name": "id", "path": "root", "alias": "id", "destination": "vector"}, {"name": "email", "path": "root", "alias": "email", "destination": "vector"}, {"name": "username", "path": "root", "alias": "username", "destination": "vector"}, {"name": "lastname", "path": "root", "alias": "lastname", "destination": "vector"}, {"name": "firstname", "path": "root", "alias": "firstname", "destination": "vector"}, {"name": "middname", "path": "root", "alias": "middname", "destination": "vector"}, {"name": "movil", "path": "root", "alias": "movil", "destination": "vector"}, {"name": "lockout_until", "path": "root", "alias": "lockout_until", "destination": "vector"}, {"name": "updated_at", "path": "root", "alias": "updated_at", "destination": "vector"}, {"name": "active", "path": "root", "alias": "active", "destination": "vector"}, {"name": "Phone", "path": "root", "alias": "Phone", "destination": "vector"}, {"name": "id_role", "path": "root", "alias": "id_role", "destination": "vector"}, {"name": "failed_attempts", "path": "root", "alias": "failed_attempts", "destination": "vector"}, {"name": "created_at", "path": "root", "alias": "created_at", "destination": "vector"}, {"name": "session_id", "path": "root", "alias": "session_id", "destination": "vector"}, {"name": "name", "path": "id_role->role", "alias": "role_name", "destination": "vector"}, {"name": "updatedAt", "path": "id_role->role", "alias": "role_updatedAt", "destination": "vector"}, {"name": "password", "path": "root", "alias": "password", "destination": "vector"}, {"name": "scope", "path": "id_role->role", "alias": "role_scope", "destination": "vector"}], "table_name": "dff_users"}, {"columns": [{"name": "title", "path": "idcategory->bff_category", "alias": "bff_category_title", "destination": "vector"}, {"name": "idcategory", "path": "root", "alias": "idcategory", "destination": "vector"}, {"name": "description", "path": "idum->bff_um", "alias": "bff_um_description", "destination": "vector"}, {"name": "idum", "path": "root", "alias": "idum", "destination": "vector"}, {"name": "description", "path": "root", "alias": "description", "destination": "vector"}, {"name": "sku", "path": "root", "alias": "sku", "destination": "vector"}, {"name": "islot", "path": "root", "alias": "islot", "destination": "vector"}, {"name": "created_at", "path": "root", "alias": "created_at", "destination": "vector"}], "table_name": "bff_products"}, {"columns": [{"name": "company", "path": "root", "alias": "company", "destination": "vector"}, {"name": "address", "path": "root", "alias": "address", "destination": "vector"}, {"name": "city", "path": "root", "alias": "city", "destination": "vector"}, {"name": "zipcode", "path": "root", "alias": "zipcode", "destination": "vector"}, {"name": "idstate", "path": "root", "alias": "idstate", "destination": "vector"}, {"name": "name", "path": "idstate->bff_state", "alias": "bff_state_name", "destination": "vector"}, {"name": "name", "path": "idstate->bff_state.country_id->bff_country", "alias": "bff_state_bff_country_name", "destination": "vector"}, {"name": "name", "path": "idcontry->bff_country", "alias": "bff_country_name", "destination": "vector"}, {"name": "idcontry", "path": "root", "alias": "idcontry", "destination": "vector"}], "table_name": "bff_customers"}, {"columns": [{"name": "company", "path": "root", "alias": "company", "destination": "vector"}, {"name": "address", "path": "root", "alias": "address", "destination": "vector"}, {"name": "city", "path": "root", "alias": "city", "destination": "vector"}, {"name": "zipcode", "path": "root", "alias": "zipcode", "destination": "vector"}, {"name": "name", "path": "idcontry->bff_country", "alias": "bff_country_name", "destination": "vector"}, {"name": "idcontry", "path": "root", "alias": "idcontry", "destination": "vector"}, {"name": "name", "path": "idstate->bff_state", "alias": "bff_state_name", "destination": "vector"}, {"name": "idstate", "path": "root", "alias": "idstate", "destination": "vector"}, {"name": "email", "path": "idrepresentative->bff_representative", "alias": "bff_representative_email", "destination": "vector"}, {"name": "idrepresentative", "path": "root", "alias": "idrepresentative", "destination": "vector"}, {"name": "name", "path": "idrepresentative->bff_representative", "alias": "bff_representative_name", "destination": "vector"}, {"name": "phone", "path": "idrepresentative->bff_representative", "alias": "bff_representative_phone", "destination": "vector"}], "table_name": "bff_vendor"}]	60	t
\.


--
-- Data for Name: ai_knowledge_store; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ai_knowledge_store (id, source_type, source_id, security_scope, content, embedding, created_at, prev_chunk_id, next_chunk_id, content_hash, metadata, last_synced_at) FROM stdin;
3	external.dff_users	1	public	--- Entity: dff_users ---\nid: 1\nemail: admin@dfgchatai.com\nusername: admin\nlastname: Administrator\nfirstname: System\nmiddname: Root\nupdated_at: 2026-02-13 17:39:11.352785+00:00\nactive: True\nPhone: 00000000000\nid_role: 1\nfailed_attempts: 0\ncreated_at: 2026-01-21 13:28:37.149478\nsession_id: abff1e9b-a98a-43c5-9ae9-897c70deaec3\npassword: $2b$12$z1r0BtMaqIvrY.VBVcM29u9SWtxsrqpIb.cgOyVCeYrS5cUGAuCA6\n\n> Related role:\n  role_name: owner\n  role_updatedAt: 2026-01-21 13:28:39.221000+00:00\n  role_scope: global	[-0.88592046,1.4673225,-3.2844424,-0.76596534,2.34114,-1.2088776,0.23826094,-0.43912432,-0.005928782,-1.2583561,-0.86063004,0.26412115,0.65268207,-0.1884857,0.53750926,0.16058731,-0.5281359,-0.6233137,-0.69276166,-0.32716346,-0.9539865,-0.988575,-0.15752165,0.056092035,2.0409148,0.11934506,1.2616831,0.37062728,-0.15749258,0.11007409,0.5811585,0.75233024,0.411452,-0.25648442,-0.587655,-0.37182632,0.34038144,1.0825224,0.13332802,0.6250305,0.22583869,-0.1301602,-0.8378931,-0.2693008,-0.34734246,-0.6997487,0.5736854,0.6810416,1.2343645,-0.045142774,-0.33009136,0.13853748,-0.25217295,-0.32881042,0.28491876,0.3633822,-0.29794523,0.59556717,-0.16213658,-0.7789937,1.7881184,0.9866744,-0.74527085,1.5606244,0.0038062287,0.253754,-0.44362235,0.6584139,-0.16255637,-1.2563179,0.12878232,0.29664478,1.1226156,0.9710626,-0.039489947,-0.2209304,-0.961785,-0.92553127,0.2776046,0.15945104,0.8359528,0.07103144,1.1805435,-0.6621175,0.45462012,0.021858916,0.004436706,1.1764823,0.1161845,1.313769,0.34340435,0.48858857,0.21178544,0.43655628,-0.9649504,1.1284292,-0.16822316,0.43168133,-0.7181815,-0.34697908,-0.10749703,-0.54205054,0.43360594,0.64547896,0.563059,1.2511047,-0.03886502,0.38338444,-0.5969888,0.1579689,-1.2505178,1.4752325,0.06875339,-0.5986738,1.3907609,-0.58780175,1.1536306,-0.797181,-0.027567856,0.90005696,-0.56465644,0.09141826,-0.4156577,0.5317364,0.10935959,0.187021,-1.2657473,-0.32839516,-0.10333234,-0.022861807,-0.5293637,-0.64211893,-0.68642163,-0.42460293,0.88567764,0.85143214,-0.70765495,-0.11966729,0.055457268,0.090779886,0.2779416,-0.33492538,-0.011373143,-1.4460623,0.2998899,-0.9148761,1.9151523,-0.5082729,-0.3000667,0.27435046,0.25657147,-0.27938667,-0.446004,-0.11148481,0.52208316,-0.8758797,-0.6276124,0.1435403,0.01191471,0.7139769,-0.12723672,0.38896415,-0.73882794,0.522371,-0.009439752,-1.6963054,0.6444206,0.9392872,0.7400219,0.47012573,-0.725985,-0.34174672,-0.21385267,0.03313889,-0.007870447,-0.36249256,0.0049873306,-0.4973512,0.43814403,-0.5839366,1.3848438,-0.98341715,1.3241736,0.37250423,-0.103816785,-0.39961788,0.9298438,-0.20615718,-0.26396418,0.011692395,-0.44785357,0.5011529,0.21297233,-0.54208773,-0.57937473,-0.8682046,0.7334335,0.06513433,0.3586874,-0.80589813,-0.082245134,-0.6377695,0.043897692,0.5829918,-0.07209988,0.23969851,-0.43105298,-0.45345643,-0.49258506,0.04533454,1.1075853,-0.5435444,-1.4097806,0.27845666,-0.045829065,-0.33433786,0.22879693,-0.6682745,-0.31940612,0.317495,0.3780543,-0.028173175,0.3291158,-0.581251,1.1854748,-0.43307316,-0.69959354,-0.8693698,-1.1348869,-0.46995077,-0.03820938,-1.3407118,0.87360567,-0.055810712,-0.37959152,0.7990989,-0.029384563,0.59912676,-0.34005052,0.42810097,-0.42808443,0.88756245,0.19780935,1.0293807,-0.8919592,0.43402758,-1.1080911,-0.7541714,0.39798728,1.3501158,0.47543564,-0.25769174,1.0218687,-0.24692109,0.1530663,-1.2071885,-1.3047866,-0.025108274,1.029187,-0.8008984,0.07582888,-0.49384943,0.531312,-0.963355,-0.0696805,-1.382266,-0.87159437,-0.41139257,-0.39841336,0.13858476,1.2821923,1.3821795,-0.6380729,1.0696756,-0.4801365,0.70511127,0.18292613,-0.18275656,-1.2041589,0.98559725,-0.33820283,-0.9239382,-0.4061669,0.72531706,0.03620166,-0.027923973,1.2809081,0.2894084,-0.4802585,-0.02242589,0.8979485,-0.38616303,-0.4307519,0.62702316,-0.9244548,0.16561699,1.1223134,0.26175913,0.10181907,-0.008253979,-0.06447631,0.1712916,0.53031605,0.7375675,-0.053560916,-0.4811724,0.7588221,0.29149795,0.67447555,0.22343192,-0.4711602,-0.06435593,-0.15936862,0.34783095,-0.47287995,0.35820556,-0.040402334,0.034952085,0.225824,0.36948264,0.29630327,-0.8620727,-0.82278186,0.39039165,0.69456184,1.4727453,-0.5812471,1.3983124,0.32962263,-0.6843944,1.1290396,-0.031992666,-0.43112034,-0.7994793,-0.029514771,0.10251423,0.09047738,0.26660192,-0.29593343,1.22844,1.1193997,0.21484636,0.24788594,-1.3011612,-0.5178298,-0.57330906,-0.52586615,0.31860644,0.036441706,0.7706964,-1.9799639,0.63853693,-0.07736712,-0.03706772,0.91152865,-0.5169146,0.5085477,0.35310662,-0.8165814,-0.44251007,0.7161459,0.111768,0.052240524,-0.054610815,0.73287255,0.7980091,0.8876983,-0.26594236,0.5346508,-0.050564576,-0.18493351,-0.21422428,0.40531448,0.30952004,0.3427443,-0.09232575,-1.3621736,-1.0060737,-0.6464619,0.39695472,0.21317618,-0.49604785,0.7621021,0.47441435,0.47092938,-0.8130341,0.3721621,-0.28073165,0.559419,0.97830373,-0.36453906,-0.2606339,0.036767524,1.2054667,0.5218023,-0.14520441,0.28146708,0.9292258,0.90976465,1.2438462,-0.92824805,-0.7156174,0.1962182,0.21833937,0.4050893,1.2196304,-0.71128786,-1.0569401,1.074498,-0.35257617,0.7462537,0.70718443,0.5507578,-0.55306077,0.3418505,0.1873008,0.4437043,-0.36193517,-0.29279,-0.64577323,2.203237,-0.19325,0.26776034,0.5367932,0.36728954,-0.2209968,0.46095574,0.5592641,-0.0049518603,-1.3392766,-0.45544922,0.45633557,0.5586557,-0.047778975,-1.285135,-0.12373447,0.8417977,-0.28725567,0.76149935,1.4240459,1.2815008,-0.443782,-0.8707205,0.42126793,0.30264208,1.2122719,1.4544721,-0.24800716,-0.61955255,1.5780823,0.14971955,0.24919252,0.09689257,0.7731001,0.913655,-0.27786708,0.3985394,-0.346936,-0.18613222,0.104984455,-0.138981,-0.3166703,-0.7256181,0.92287385,0.28652388,-0.22380446,0.54682326,-0.29401222,-0.07739567,1.6046268,-0.7115164,-0.66178197,1.1008687,-0.39609966,-0.5243968,0.29969954,0.070080414,-0.5976292,0.65248686,1.2098864,0.212255,-0.46268463,-0.794943,-0.66266304,-0.6711788,0.12902266,1.0512456,0.14810017,0.0970607,-0.17344771,-0.53875405,-0.15657096,-0.3182061,-0.35810435,-0.30402797,-0.36334652,-0.6899413,-0.4641805,0.48715776,0.070530646,-0.19894545,1.0633218,-0.70437855,-0.29803726,0.33785614,-0.653999,0.9398643,-1.9755071,-0.2841856,-0.49769562,-0.7964663,-0.1747286,0.93797994,0.8312536,0.40063995,-0.72408617,0.63154733,0.77144367,-0.747126,0.925333,-0.34717894,-0.6409682,-0.085878946,-0.38200042,-1.2494367,0.3118575,0.68187886,-0.79849184,0.6754186,0.935622,0.26356876,0.47382623,-1.1686388,-0.47976628,-0.045821875,-0.2365169,-0.7055306,0.4927569,0.29083723,0.78977346,0.37121272,-0.20256986,-0.36004764,-1.0720922,-0.95001644,-0.4498638,0.30694118,0.08444794,-0.89823574,0.25249434,0.7903043,-0.54665315,0.30321926,0.3895604,0.9247317,-0.665134,0.14350255,-0.34198958,-0.6219134,-0.549295,-0.18056485,0.43755656,0.4370481,0.33607036,-0.4687459,-1.3225024,0.01765867,-0.08938296,0.115752466,-0.5704118,-0.26544282,-1.1547859,-0.2931193,-0.48205715,-0.1978524,-0.29485014,-0.6749746,-0.13396856,-0.97451013,-0.27661547,-1.0756214,-0.18430386,0.9265642,0.59130895,-0.10250537,-0.10331671,-0.7083528,-0.7506454,-0.1864348,-0.3189866,0.2837382,0.34933636,0.05216806,-0.09283921,-0.3909502,1.1814107,0.24134871,-0.5397323,-0.124704674,-0.9681058,0.16159536,0.08762022,0.40918657,-1.1235535,0.004570033,0.9002197,0.092358865,0.6753894,-0.12623397,-0.97763807,0.8130633,0.46744043,-0.28427166,-0.57985854,0.45862174,-0.5516208,1.3356947,0.3639965,0.47621354,0.30959985,-0.1234323,-1.8042943,0.8310987,-0.77813226,0.29274887,-0.43875226,-0.7061559,-0.42076522,-0.083341055,0.3592568,0.32614368,0.68357146,-1.063462,-2.297718,-0.9219888,0.12296199,-0.24807137,-0.6162301,0.6155117,0.40673286,0.61471164,0.3265823,0.14492771,0.14579971,0.88650644,-0.2335027,-0.017103126,1.1100286,1.025621,-0.27624196,1.6379559,0.83833206,0.10958131,0.38587928,0.7962622,-0.12889846,0.2828566,-1.1187093,-1.2737997,-0.27323943,0.6789621,0.53067863,-0.60343117,0.256811,-0.04693971,0.008219631,0.663303,0.17927441,-1.345782,-0.8511946,0.6101297,0.23345275,0.45630938,-0.3733841,0.53431875,1.3924273,0.92209417,0.112901,-0.17813294,-0.3644337,0.6652793,-0.22902448,0.6610956,-1.678232,0.1302835,0.34148207,1.1226468,-0.45986247,-0.13083422,-0.7155132,-1.2335403,-1.5739492,-0.4075246,-1.0276924,-0.8598988,0.26826712,0.05372494,-0.0011280822,-0.3097388,0.8797159,-0.17819753,0.20607452,0.07604214,0.23051815,0.072956845,-0.2718291,-1.0602144,0.3452575,-0.7653039,0.5401222,-0.2718243,-0.1359865,-0.9787164,0.7518685,0.043552876,0.22546571,-1.1330693,-0.6486195,0.123106666,-0.5065494,1.1806912,-0.86927223,-1.0881563,-0.840638,-1.3562376,-0.6661016,0.2213514,-0.6983621,1.3474443,-0.1561115,-0.9163939,0.010748992,-0.61444324,0.40654355,-1.0321102,-0.5767222,-0.26615694,-1.5118823,-0.74725175,-0.8909194,-0.23606578,1.5565248,-0.17962675,0.6278453,0.11837461,0.5349055,-1.1275554,-0.2934977,0.1590625,0.25554872,0.437407,-0.7170525,0.20513539,0.20607057,-0.15380521,0.57200307,-0.024315387,0.67962825,1.5469831,0.17887515,0.12051847,-0.51186657,1.4477565,1.1199191,0.1973174,-0.5587282,-1.0833471,-0.35823262]	2026-02-10 19:53:25.527898	\N	\N	\N	{}	2026-02-13 18:56:12.614282
2	external.dff_users	5	public	--- Entity: dff_users ---\nid: 5\nemail: r00t@dfgchatai.com\nusername: r00t\nlastname: Administrator\nfirstname: System\nmiddname: Root\nupdated_at: 2026-02-10 19:43:48.691660+00:00\nactive: True\nPhone: 00000000000\nid_role: 1\nfailed_attempts: 0\ncreated_at: 2026-02-10 19:43:48.691654\npassword: $2b$12$JzIA.LYEpdCAXglSx7vQmebad09k8DsPAzaGvwPl8gy57.VIsWkaG\n\n> Related role:\n  role_name: owner\n  role_updatedAt: 2026-01-21 13:28:39.221000+00:00\n  role_scope: global	[-0.7801273,0.9363596,-3.5902584,-0.36733827,2.0718646,-0.94648427,0.2627819,-0.38472077,-0.22957873,-1.1063476,-1.2695874,0.35989323,0.72900283,-0.1973973,0.4517815,0.014146301,-0.33610824,-0.57168126,-0.39068007,0.12928584,-0.81471914,-1.1389933,-0.5398288,0.2040922,1.7866095,0.24968113,1.4158995,0.5532674,-0.32375446,-0.037541058,0.70006543,0.75428545,0.18495676,-0.3265968,-0.6312562,-0.089203306,0.6175356,0.5681608,0.062348686,0.5727044,0.22661388,-0.26504958,-0.6384278,-0.23967226,-0.12039371,-0.43505532,0.22288966,0.7872148,1.2412403,-0.09350082,-0.20954362,0.23796484,-0.1998815,-0.56742126,0.28529432,0.26782182,-0.6245101,0.33524048,-0.3650036,-0.90842175,1.7721177,1.281553,-0.9192925,1.6704036,0.2068241,0.14560176,-0.47363234,0.95133436,-0.063063115,-1.3155882,0.18630993,0.20179315,0.9918771,1.0762391,-0.050333194,-0.3323396,-0.9712824,-0.77573115,0.18611746,0.053953726,0.7573043,-0.25855973,1.448262,-0.22995944,0.37282646,-0.017383598,0.13107888,1.2915922,0.07656077,1.624096,0.36431444,0.7281374,0.23558033,-0.07486827,-1.0700111,1.1490351,-0.25582162,0.21391469,-0.9672917,-0.6276777,0.11140451,-0.62076527,0.43407387,0.9495908,0.5701917,1.0382278,0.18490006,0.48350123,-0.40841436,0.04623469,-1.3062279,1.6168897,0.049401328,-0.7772682,1.2243476,-0.6192569,1.0997229,-0.9945037,0.03942429,0.8125533,-0.5696219,0.06555239,-0.110170685,0.7694735,0.23632318,0.19500831,-1.3149152,-0.37073398,-0.071758136,0.027052948,-0.7818937,-0.38369882,-0.618618,-0.53644776,0.6388499,0.9826223,-0.71313024,-0.21398194,-0.055693787,0.18241319,0.35593286,-0.2364479,0.037987977,-1.4600981,0.13173257,-1.140934,1.6932979,-0.550665,-0.6238411,0.21218072,0.20251828,-0.3043091,-0.43376565,-0.19380778,0.4466428,-0.9522938,-0.41079205,0.29143074,-0.016317338,0.80985945,-0.2113769,0.63154185,-0.91508186,0.48048577,0.028565573,-1.5058584,0.48160082,0.704923,0.67537045,0.6886662,-0.7493773,-0.5510613,-0.27016574,0.19347852,0.113360174,-0.4643106,0.00224048,-0.57316834,0.57831717,-0.63123363,1.2503158,-1.2056718,1.3403822,0.42645422,-0.14422412,-0.3892451,0.93228835,-0.42536864,-0.16673541,-0.04867243,-0.13121058,0.64233804,-0.30124518,-0.8389802,-0.59047323,-0.6367135,0.37922433,0.08551743,0.38034952,-0.86167157,-0.15983605,-0.9296125,-0.040254086,0.71556205,-0.37677836,0.28942987,-0.5539432,-0.25735217,-0.51989925,0.17548972,0.90804446,-0.9816583,-1.3145953,0.18603773,-0.006944341,-0.1581461,0.5200798,-0.70437473,-0.17482375,0.68247145,0.23369773,0.1975298,0.38022578,-0.66301244,0.81722057,-0.6089469,-0.36362666,-0.8309244,-0.90122634,-0.35945737,0.048085857,-1.5571344,0.93755466,0.08512526,-0.30379698,0.6417472,-0.3787225,0.46583906,-0.3793395,0.2948131,-0.2648302,0.92370415,-0.044116292,1.4027051,-0.9703146,0.44210488,-1.0072858,-0.7242651,0.5455611,1.3334157,0.59921205,-0.47055557,0.8688758,-0.05975645,-0.029603992,-1.2025036,-1.568427,0.0048859958,0.697082,-0.8270062,0.13791074,-0.03664942,0.30234137,-0.8000051,-0.280213,-1.3108926,-0.6679491,-0.46617422,-0.25604036,0.22018583,1.217425,1.2708119,-0.47215596,1.3438717,-0.7896571,0.76060534,-0.18170282,-0.23081565,-1.0859185,1.2675387,-0.087011375,-1.242366,-0.28608564,0.81563854,-0.003579406,0.19034564,1.1951287,0.37838972,-0.43346822,0.16945845,0.89280105,-0.39401513,-0.38125917,0.59485775,-0.97287625,0.09205474,1.0710416,0.11890844,0.17189246,0.3820892,0.11558795,0.3226403,0.8481041,0.6852231,-0.30846053,-0.8497285,0.7458537,0.2261169,0.78419745,0.07785918,-0.40474772,0.029084256,-0.46063882,0.5586823,-0.44613454,0.32329863,0.06529731,0.15819345,0.3178817,0.48759216,0.42441717,-0.66747373,-0.50929856,0.34266147,0.62394226,1.661775,-0.56830186,1.3476698,0.5712683,-0.40238687,1.3294054,0.30166146,-0.4434918,-0.6917267,-0.003008415,0.48844346,-0.2660898,0.19324915,-0.31129622,1.1191392,1.1905444,0.019558426,0.15331933,-1.0884782,-0.65856797,-0.7828542,-0.724767,0.18977591,0.22827983,0.68789244,-2.088067,0.7183199,-0.37939075,-0.25674576,1.0722228,-0.52061886,0.42043537,0.68220925,-0.708829,-0.31705198,0.60982317,0.24792981,0.0140386745,0.02796736,0.7931664,1.198326,0.9952747,-0.21720147,0.59176165,0.17644185,-0.35183325,-0.37192488,0.35943606,0.59881353,0.6043364,0.15109454,-1.308863,-1.3270415,-0.6340088,0.80800164,0.3387638,-0.5319394,0.6957883,0.6118495,0.63056904,-0.91562843,0.262522,-0.6134394,0.700674,1.1915412,-0.34227693,0.0119618075,-0.024310065,0.89933145,0.48029166,-0.19748847,0.45766103,0.9926296,1.0795165,1.013902,-0.7907982,-0.8204599,0.34482992,0.21888058,0.39383528,1.0508077,-0.7071679,-0.9494434,1.1724594,-0.2660077,0.41228938,0.8804734,0.39796436,-0.66330135,0.43685624,0.36718258,0.4694836,-0.58309174,-0.36320075,-0.65136105,2.1994853,0.026981741,0.5207894,0.38914073,0.4660391,-0.11690486,0.51658624,0.28209174,-0.038775854,-1.3998933,-0.31754577,0.32569996,0.5497368,0.011884339,-1.0929078,-0.13687243,1.134756,-0.0069647557,0.6758911,1.273537,1.2139348,-0.31650007,-0.8924122,0.17569283,0.070686445,1.3667482,1.4964252,-0.25031978,-0.7072883,1.7234323,0.15556993,0.24315514,0.18190037,0.7391636,0.9862646,-0.18013689,0.16705473,-0.5909888,-0.25757697,0.20659167,-0.066760026,-0.14753062,-0.56053674,0.8635714,0.37857047,-0.44888133,0.36284056,-0.15513381,0.06928282,1.5925357,-0.52239096,-0.50305057,0.84461623,-0.53035504,-0.90762484,0.4400469,-0.10492923,-0.48339033,0.666115,1.0371115,0.35484752,-0.6099295,-0.67485553,-0.73332894,-0.448391,0.18034957,0.92026144,0.21797563,0.57398766,-0.45556036,-0.40568358,-0.2876859,-0.050867014,-0.6619316,-0.35480556,-0.084163494,-0.7674634,-0.54086936,0.32867563,0.3304325,-0.07821423,0.88133305,-0.7171567,-0.22859941,0.39348945,-0.69799185,1.0313711,-1.9274354,-0.42593178,-0.73709726,-1.0000355,-0.021071743,0.94973737,0.61257935,0.63142574,-0.7736186,0.50653946,0.56840974,-0.60399383,0.7356747,-0.38804555,-0.8512949,-0.029788487,-0.3580213,-1.012703,0.4773143,0.7847046,-0.7323708,0.37075227,0.47169372,0.2078907,0.68359584,-1.1194123,-0.3771046,0.028558055,0.04191811,-0.51809573,0.44653195,0.21382762,0.6718835,0.48249236,-0.08059363,-0.5033039,-1.3406475,-0.8368365,-0.36372876,0.29674405,0.040962573,-0.8493308,-0.18716092,0.6915346,-0.65819657,0.07159613,0.15721495,0.8540022,-0.8933947,0.18424407,-0.52252775,-0.9753889,-0.5277959,-0.23204322,0.28805798,0.64435494,0.44689286,-0.47642374,-1.1729463,0.15981734,-0.26799023,0.06535357,-0.5583565,-0.17637071,-0.81561756,-0.28224444,-0.5510166,-0.33322984,-0.24033913,-0.38699615,-0.19881001,-0.79444325,-0.19323587,-0.97567344,-0.4008384,0.5464906,0.8266566,-0.08941394,-0.04569739,-0.4066626,-0.8927115,-0.15272677,-0.1605617,0.31442067,0.18264064,0.02365174,-0.23940852,-0.44706878,0.82166076,-0.012653489,-0.8693614,-0.24761313,-0.7066308,0.060444996,0.17572613,0.7505462,-1.2833405,-0.14668755,0.8945078,-0.053944036,0.6031345,-0.34114194,-0.9820091,0.83993447,0.2642592,-0.3685692,-0.7742233,0.72125775,-0.5965873,1.4638088,0.3857845,0.4014193,0.16856992,-0.17817271,-1.9513365,0.87959707,-0.8348771,0.40344793,-0.323769,-0.45268002,-0.4562422,-0.13168661,0.097709,0.24103224,0.5245221,-1.1542008,-1.9350508,-1.1645538,0.06373669,-0.16547167,-0.46737546,0.65496,0.41676563,0.7175446,0.35938007,0.024922192,0.23491167,1.1498758,-0.40620697,0.074918576,1.1379619,0.82085437,-0.37386233,1.8046217,0.9178244,0.17899913,0.18578683,0.8762634,-0.41416872,0.12556566,-0.96614754,-1.4640926,-0.4014928,0.5644118,0.7206571,-0.5927653,0.13027894,-0.13873123,0.1926646,0.9744542,0.2418775,-1.5061693,-0.7090365,0.32915306,0.19682497,0.6226593,-0.37083027,0.4130598,1.4295319,0.97121996,0.21382928,-0.24644966,-0.42324716,0.8489006,-0.30988204,0.4719377,-1.6545042,0.26265982,0.21164294,1.1390314,-0.44482827,-0.20877516,-0.700012,-0.93592036,-1.4141594,-0.33262354,-0.716358,-0.7740013,0.279085,-0.032661248,0.030998785,-0.2147305,1.045121,-0.123881064,0.3031872,0.20817737,0.5232555,0.17494076,-0.29475403,-1.075802,0.095716774,-0.61050045,0.34433323,-0.37811154,-0.1598368,-0.9684123,0.44903517,0.15955983,0.34362432,-1.0903305,-0.37172484,0.23110881,-0.5102197,1.3105161,-0.8571638,-1.3729885,-1.0018374,-1.6382254,-0.12382955,0.40784287,-1.1587197,1.4850436,-0.449775,-0.6089574,0.09558705,-0.7035074,0.77582276,-1.1137635,-0.505112,-0.39703608,-1.4155021,-0.82726383,-0.5906217,-0.6904125,1.279752,-0.020914394,0.50641775,-0.0041933693,0.65792704,-1.303252,-0.11105806,0.30667594,0.23729238,0.23036899,-0.5554808,0.048499204,0.32669792,-0.22816546,0.73383725,-0.054136388,0.7420748,1.5709401,0.38927963,0.43048167,-0.74051344,1.3366425,0.87164044,0.26471034,-0.671337,-0.9733614,-0.17180818]	2026-02-10 19:53:24.817291	\N	\N	\N	{}	2026-02-13 18:56:12.730397
1	external.dff_users	4	public	--- Entity: dff_users ---\nid: 4\nemail: avinajera2011@gmail.com\nusername: one\nlastname: user\nfirstname: one\nupdated_at: 2026-02-04 21:06:48.553796+00:00\nactive: True\nPhone: 06146491554\nid_role: 9\nfailed_attempts: 0\ncreated_at: 2026-02-03 20:06:08.451404\npassword: $2b$12$9NMLV7Tj9w0L71Y.TG7Gou8cJ0/K/wmW4.nsUJOYrNOP1NGFoaqWC	[-0.95604354,1.1423495,-3.1120543,-0.58914083,2.2658193,-0.84118485,0.10826151,-0.8139849,0.08982547,-0.22124468,-1.6564178,-0.17468384,1.076018,-0.38584936,0.4613136,-0.2380248,-0.12451561,-1.33104,-0.597059,-0.1766182,-1.1450155,-1.096885,-0.74752384,-0.7177274,2.0414867,-0.24462214,0.6765976,0.69941777,-0.9642632,-0.002849523,0.2781182,0.48212725,-0.11831918,-0.6906414,0.24919024,-0.096869454,-0.3367124,1.3762558,0.03657265,-0.2290403,1.1811233,-0.31315064,-0.66427624,0.5645232,-0.20012651,-0.17253174,1.0002588,0.4548283,1.7968761,-0.17501207,-0.06284496,0.50804156,-0.039018467,-0.6825242,-0.17596875,0.53258824,-0.7846151,0.096086666,0.053961,-0.9289894,2.1012542,1.4812953,-0.52147645,2.0668907,0.50940204,-0.03108709,-0.82517636,0.89530146,0.18944517,-1.5466896,0.7039487,0.20972383,0.72163904,1.2225147,0.120521545,-0.022432147,-0.8400084,-1.3779783,0.19938236,-0.08208225,1.1789787,0.19337001,0.38243404,-0.9428541,0.73131967,-0.41611588,0.23387407,1.3376632,0.24956444,0.64899814,-0.24341133,0.62951833,0.685729,0.40149736,-0.4009094,0.9045853,-0.3550381,0.50028896,-0.828837,-0.5360296,-0.2965663,-0.4739231,0.5028644,0.15258232,0.19909443,0.5885216,-0.36235937,-0.22620878,-0.1451694,-0.27595475,-1.554501,1.0476758,-0.4580037,-0.6174656,0.93900186,0.0029531224,1.2515107,-1.3840737,0.64810747,0.64694273,-0.6926257,-0.3278563,-0.13334535,0.77782816,0.04374755,0.053508483,-0.18246645,-0.043246303,0.24617127,-0.6817781,-0.9445605,-0.7481044,0.07759498,-0.6813073,0.16260049,1.1517065,-0.8261682,-0.086008765,0.27423674,0.29227775,1.0077164,-0.22203045,-0.23770706,-1.5730791,0.55103636,-1.2288382,1.0921391,-0.3217019,-0.7077247,0.2754596,0.81548846,-0.57678,-0.3777145,0.07562732,0.29765862,-1.0627663,-0.5364993,0.21107334,-0.052620944,0.96195257,0.20307696,-0.3417901,-0.58777493,0.6203725,-0.35070443,-0.92913115,-0.13136107,0.99865854,-0.12894292,0.9421135,-0.6081351,-1.1367168,-0.36820078,-0.25382438,0.15903826,-0.30579162,-0.10900611,-0.46368212,0.39038736,-0.63959086,1.5239658,-0.71942025,1.7368517,0.7014308,-0.05999553,-0.51987076,0.3830002,0.1456998,-0.3656351,-0.80222476,-0.28738794,0.76895946,-0.7174425,-0.6219152,-0.86817324,-0.5874773,1.1293693,-0.2368072,-0.17961752,-0.53176284,-0.7681618,-0.21753919,0.17174934,0.88237,-0.5100922,0.2897566,-0.07312183,-0.0047231093,-0.17096671,0.18985304,0.8192151,-0.78955173,-0.62364197,0.21331036,0.23385492,-0.6889336,0.47060955,-0.37619543,-0.5378009,0.64624846,0.5608907,0.1586143,0.31383556,0.010833325,0.9979165,-0.31720307,-0.69812214,-0.40333998,-1.513751,-0.42667842,0.108477026,-0.82105815,0.70122975,-0.4224838,-0.4419974,0.85595393,-0.3440314,0.51006037,-0.52257615,0.46390072,-0.10537664,0.95401967,-0.06403725,0.44692582,-0.805025,0.057782214,-0.576998,-0.45469612,0.7627618,1.5481749,-0.4655328,-0.039535016,0.50132215,0.5407822,0.094889194,-0.48887706,-1.1335846,-0.17875946,1.2672088,-0.59624994,0.4043641,-0.46359146,0.39034027,-0.94822425,-0.18237793,-1.2860439,-0.86896956,-0.47348696,-0.023079105,-0.49964336,0.53351045,1.0965648,-0.78340924,0.64840615,-0.58201826,0.3682695,0.31099844,-0.2124422,-0.48932105,1.348752,-0.4458679,-0.5951469,-0.5528782,0.7089665,0.07556409,0.2505726,1.3756888,0.46881744,-0.2637383,0.07993499,0.38246197,0.057336956,-0.91256803,0.047583014,-0.564399,0.4891058,1.4443982,0.18596476,0.10523599,-0.21855661,0.068919525,0.16381173,0.62316996,-0.05710275,0.55706906,-0.44970387,0.79905117,0.12505141,0.8687115,0.029067446,-0.5253527,0.5916785,-0.32858986,0.95150745,-0.60285306,0.4646622,-0.13821518,0.14173205,0.072480775,0.33469713,0.36160553,-0.9408206,-0.16475028,-0.23370296,0.82457495,1.435012,-0.5918823,1.7512114,0.5259553,-0.49554136,0.6877353,0.048579212,-0.17309107,-0.82460946,0.42983902,0.24029659,-0.36777818,0.098076954,-0.39309996,1.3138261,0.42893314,0.35021704,0.071243964,-1.3031482,-0.46712318,-0.00998966,-0.5847524,0.40435362,0.5292871,0.9158418,-2.078381,0.7664478,0.2637188,-0.15767272,0.6316391,-0.5214021,0.6056143,0.7085104,-0.15914783,-0.29924965,0.8806873,0.062133964,0.44393075,0.041130476,0.65510744,1.008359,0.9532275,-1.0165017,1.3604771,-0.10322975,-0.15029755,-0.09580221,0.84427494,0.5442414,0.25202596,0.51358557,-1.5024956,-0.5538255,-0.37511855,0.5191864,0.56920075,-0.34959096,0.46195692,0.50264543,0.5717919,-0.62736225,0.33447206,-0.3802862,0.14877331,0.44589832,-0.55666155,-0.32381752,0.04974066,1.2371671,0.49657342,-0.64014566,0.6329816,0.5148164,0.8066373,1.6000754,-0.7727148,-0.17827335,0.14613432,-0.022057625,0.6647934,1.0910476,-0.2021175,-0.6171465,0.5612646,-0.4275844,-0.1820456,1.0105908,0.29561773,-1.2294674,0.2179963,0.6055718,0.86401176,-0.44095486,-0.100262076,-1.225007,2.500805,0.37582383,0.2576365,-0.13470022,-0.1486305,0.65420943,0.5338813,0.41599494,-0.32262275,-1.086379,0.18132344,0.49172467,0.51330304,0.19538458,-0.7702827,0.2788878,1.1645907,-0.09045307,0.9222748,1.0272539,0.93595445,-0.7680792,0.07011625,0.07022093,1.0526677,1.2495787,0.8962664,-0.5272291,-0.2077602,1.1701505,0.30536348,0.27467084,0.63046306,0.5598831,1.4383337,-0.21274377,0.920592,-0.17129157,0.26683047,0.61122996,0.006647742,-0.06531745,-0.3415048,0.84061563,-0.2695862,-0.9234612,0.638543,-0.46253848,0.30381992,0.63241726,-0.73052424,-0.28485715,0.40028316,-0.13508676,-0.45240295,-0.35075194,0.009645697,-0.2901546,0.2582748,0.88337195,0.12426094,-0.24375835,-1.0547394,-1.0132627,-1.071979,-0.09507781,1.251538,-0.3138511,0.30637354,-0.07803511,-0.38013947,-0.5654131,0.15941665,-0.86511683,-0.30794683,-0.69274604,-0.9150933,-0.1565603,0.29289624,-0.03680872,-0.7742106,1.0739131,-0.8408148,-0.92334986,0.43267864,-0.6855968,0.0023703314,-1.486006,-0.38620752,-0.8144306,-1.3398573,-0.8132319,0.4587034,0.42826417,0.18097901,-0.41599038,0.70201313,0.6117062,-0.7012025,0.8819821,-0.23720008,-0.53150445,-0.41394722,-0.028292812,-1.115453,0.41823432,0.31339386,-1.190712,0.3059754,0.53310716,0.029403552,0.93216884,-1.2126718,-0.41078323,-0.17230475,0.41237578,-0.3002395,0.10836699,-0.028738331,0.5345665,0.18557823,0.31403494,-0.07087437,-0.4614263,-0.8537477,-0.31152856,-0.072748944,0.31064165,-0.6710327,0.23019055,0.45625323,-0.8665091,0.29327112,0.1898301,1.0121171,-0.8480766,0.2652911,-0.54714656,-0.5358715,-0.41514373,-0.16260186,0.4713514,0.4152246,0.28267813,-0.18814775,-1.2238716,0.50765026,-1.0017157,-0.11395331,-0.7104221,-0.584491,-0.8821603,-0.47192234,-1.2020277,-0.16353828,-0.25310865,0.14254427,-1.2368242,-1.9013218,-0.34078145,-0.73247194,-0.45701224,0.7547613,0.75347686,-0.050183557,0.048781417,-0.8331576,-0.91815037,-0.43271834,-0.439669,0.05991598,0.12899613,0.12338345,-0.03889213,-0.8260598,0.7309797,0.84407514,-0.96337664,-0.46465194,-0.7645268,0.30914575,0.45370877,0.34462988,-0.24804714,-0.52753747,0.86106217,-0.7039728,0.91953504,0.13292406,-0.86792773,0.5394064,0.6693982,0.019939631,-0.13836965,1.1942116,-0.31789142,1.217306,0.5557512,-0.044225104,0.20685333,0.32620138,-1.6386311,1.256537,0.026208218,0.5375654,-0.33613697,-0.7435683,-0.47313368,-0.41470075,0.4144616,0.08793301,1.1957345,-1.2417305,-1.7022452,-0.9703784,-0.2982452,0.50756055,-0.35223025,0.879106,0.6712185,0.32640618,0.0524583,0.36232135,0.582694,1.0564616,0.057690762,-0.13250248,0.95693266,0.5851958,-0.3968277,1.6241014,1.0503532,0.37198132,0.40509287,0.6608392,-0.03534734,0.21345508,-0.5781953,-0.82175577,0.27167043,0.37074932,0.4290402,-0.5770786,0.24012867,0.29975355,-0.3437209,0.82692546,-0.38564026,-1.5594249,-1.1106879,1.0577683,-0.37934864,0.34908804,-0.3433299,0.4434809,1.6922073,0.8981837,-0.04575809,-0.16556379,-0.50654674,0.045360535,-0.3247087,0.15208462,-0.85141253,0.077705294,0.60159177,1.3915966,-0.46002132,-0.15547442,-0.82562435,-0.77058834,-1.805784,-0.43132958,-0.659144,-0.43344337,0.4878943,-0.3424661,-0.04797163,-0.5774132,0.9800402,-0.3308394,1.2397888,-0.21730623,0.35046604,-0.16496514,-0.11153644,-1.1802286,0.0016048811,-0.6281561,-0.20196271,0.43500203,0.37531134,-0.5315871,1.1401314,0.7892436,0.46345398,-0.48356697,-0.3459269,-0.030092472,-0.82992685,1.3858379,-0.79802436,-1.4062246,-0.54341805,-1.0043128,-0.5613484,0.18821111,-0.45027223,1.22107,-0.5156888,-0.5456716,0.2193867,-0.88104194,0.7317067,-0.7280915,-0.31081432,-0.35426337,-0.8469341,-0.44352174,-0.6691903,-0.6184929,1.5508294,-0.19325416,-0.106396854,0.41660583,-0.44130984,-1.2771751,-0.06216357,0.14097401,0.11085135,0.091922976,-1.0335279,-0.555073,0.4237064,-0.24328601,0.8276731,-0.2712502,0.09373168,1.9890022,0.08875108,0.40075505,-0.3261569,1.1737909,1.0375372,0.47349408,-1.246527,-0.25819856,-0.60428214]	2026-02-10 19:53:24.250552	\N	\N	\N	{}	2026-02-13 18:56:12.845325
4	external.bff_products	1	public	--- Entity: bff_products ---\nidcategory: 1\nidum: 1\ndescription: Apple\nsku: safda\nislot: False\ncreated_at: 2026-01-23 20:37:07.072151\n\n> Related bff_category:\n  bff_category_title: Raw materials\n\n> Related bff_um:\n  bff_um_description: KG	[-0.32145813,1.4992037,-3.6308563,-0.5397453,0.9908916,-0.3806259,-0.23874167,-0.01885052,-0.82115114,-1.0658332,-0.35315174,0.192786,1.6465077,-0.11857385,-0.0615292,-0.2645227,-0.29545155,-0.48022956,-1.0463337,0.6268867,-0.52008396,0.024406852,-0.08490901,0.054986775,1.191831,0.7889507,0.6097273,0.033028405,-1.2966723,0.29002765,0.5371877,0.72687644,-0.28511605,-0.5172864,-0.2322198,-1.1172359,1.449105,1.3014146,0.9666759,0.7140905,0.32479215,0.8037674,1.2662199,-0.75241315,0.08549154,0.7069458,1.3671317,0.3801432,1.9986994,-0.6907229,0.9785633,1.0642058,0.58464247,-0.5344675,1.6500092,0.2416869,0.10043667,0.7255886,-0.8758474,0.6459262,0.64758885,2.1383386,-1.0181458,1.3468099,0.87130314,-0.08897728,-1.0586249,1.0310723,-1.2656676,-0.38920605,1.0580733,0.15289229,1.3998748,1.0183599,-0.5226706,-0.08931409,-0.9525194,-0.98670495,-0.34840932,1.0312085,1.7034441,0.6636792,1.512967,-0.24256064,0.9381937,0.016328996,-0.41744682,1.2562057,0.36314985,0.8998598,0.60327655,0.49521372,-0.2607283,-0.060128976,-1.1390378,1.1973444,-1.1065961,-0.14401343,-1.4164062,-1.0307385,0.13605778,0.3615772,0.54413307,-0.13117683,0.91291726,0.8397864,0.17147565,-0.06644782,-0.351735,-0.55366373,-0.8587733,1.1731684,-0.7108113,-0.054426342,1.0919304,-0.7283591,0.73212993,-0.68386114,0.42525974,0.6102302,-0.1143046,-0.5158785,0.0020117485,1.2462785,-0.4769769,-0.19781075,-1.1081033,0.4156459,0.94653714,-0.9621067,-0.514463,-0.83759505,-0.32295474,-0.8579319,0.16810147,1.1944779,0.021216061,0.35444948,0.27332285,0.32186553,0.83692026,0.15129909,-0.49836954,-1.0154022,0.09547637,-1.7422117,0.55365807,-0.46436623,-0.40073085,-0.074682586,-0.52701026,0.28026974,-1.1436148,1.2094402,0.49648592,-1.0415401,-0.15571995,0.21785443,0.5086022,-0.2402899,1.3203623,0.08096764,0.15832727,0.24965757,0.57685745,-0.7864628,0.56404305,1.289829,0.06180275,0.49642387,-1.2347049,-0.05088479,0.0076663326,-0.14023575,0.369323,-0.4207695,-0.057294495,-0.153866,0.5303934,-1.0899334,0.73253477,-1.2947006,0.77876174,0.9739658,0.30805057,-0.7119575,0.104247294,-0.4461436,-0.69677544,0.70805454,-1.0026795,0.51692885,-0.6721623,-1.1992879,-0.53891,-1.0485412,0.22250426,0.43358523,1.0471855,-0.66918266,-0.12790477,0.07225447,-1.4973888,1.2256203,-1.108199,0.95707303,-0.7292675,0.55342984,-0.5048176,0.5087273,1.0081061,-0.4608278,-1.1550977,0.33020824,0.16561821,-0.3131169,-0.06911821,-0.34169424,-1.4016712,0.6248023,0.5489131,0.3836608,0.028763793,-0.6499596,1.3834329,-0.32446438,-0.09923619,0.1983687,-0.51040584,0.37999818,-0.43920517,-1.5189234,0.52462554,-0.35431367,0.04426,0.49747914,0.26227853,1.1010582,-0.24772643,-0.12371828,-0.31322393,0.32229614,0.0099626295,-0.15354028,-0.77074665,0.7418237,-0.48805717,-1.0205302,0.87530035,0.9995757,-0.20060755,0.42469963,0.07270153,0.3958739,0.5627013,0.08425067,-0.3960052,0.4783251,0.30343705,-0.6259789,0.1909803,-1.4973826,1.8487258,0.27622586,-0.7629226,-0.8149639,-0.8398316,0.088800944,-0.06008385,-0.09538129,0.0033979565,0.05623418,0.28571135,0.3302416,0.48977393,0.19692446,0.36803845,0.085954286,-1.0517209,0.16291122,0.16198698,-1.4217407,-0.36927804,-0.02678889,-0.94086343,0.3956844,0.19614479,0.5830183,0.1060034,-0.23017086,0.01025563,0.16681008,-0.13103074,-0.07807073,-0.44528535,0.90137166,1.0577173,-0.56974983,-0.5684165,-0.0653849,0.6567127,0.76276696,0.7263987,0.08711167,-0.10384425,-0.29000363,0.07616097,-0.30935448,0.31686866,0.35795695,-1.035331,0.11196741,-0.16966714,0.46771145,-0.36652437,1.0200223,0.33020833,0.57767236,0.8019662,-0.42387432,-0.1366281,-0.6822105,-0.42413807,-0.23271985,0.7668468,1.4398435,-0.2757211,0.5647465,0.3128593,-0.6144568,0.22889844,0.56529796,-0.6363957,-1.1291424,-0.23461896,1.200402,-1.343754,0.5077733,-0.39599183,1.202151,1.5672705,-0.04709837,1.68095,-1.6122285,-0.65539163,0.9141717,-0.8649441,-0.14170404,0.64788705,0.74471176,-1.4291837,0.6480228,-0.19485244,0.06848042,-0.35824266,0.20976418,0.90048707,-0.031719774,0.41118613,-0.0807522,0.91443515,-0.13171552,0.37439767,-1.7853367,0.27238744,0.32438874,0.5277221,0.43745825,0.08172279,-1.2065771,0.034758914,-0.088925526,0.12418686,0.5984388,-0.15273866,0.05663914,-2.099806,-0.79394823,-0.9913164,-0.934081,0.4121515,-0.08421614,0.3418926,0.9951552,0.8496114,-0.5978154,0.38558203,-0.3703724,0.7961869,-0.027688675,-1.0698957,-1.241278,-1.0692623,-0.022925429,0.7533852,-0.9588693,0.46099445,0.17220913,0.19666283,1.8960472,0.18013015,-0.21297434,0.16540545,-0.79250973,0.550198,0.6739513,-0.8139029,-1.1023602,0.91853774,0.27081457,0.6037775,0.60487074,0.57512987,-1.3971506,0.56129205,-0.10946047,0.6393547,-0.17474467,-0.06297769,-0.28991717,1.5739454,0.1794783,-0.12976669,0.56271017,0.23847902,0.061855357,0.623763,0.49811912,-0.4893876,-1.1536099,-0.6749982,0.42481554,0.44986987,0.00921645,-0.8115221,0.24568936,0.36417156,-0.103837624,0.73267967,0.43058714,0.6834705,-0.48896882,-0.9913591,-0.17234276,0.6158544,1.6026284,0.7749158,-0.5570967,-1.3182361,0.7856277,-0.32492414,0.33386368,-0.12295817,0.47255337,1.2879689,-0.23261899,0.7574528,0.38383955,-0.21499951,0.90269685,-0.0003575636,-0.17273976,-0.71140015,0.12235484,-0.6679256,-0.92418027,0.8504536,-1.731089,-0.35080883,1.9221632,-0.5629117,-0.29042253,0.93977505,0.115982406,0.1602415,1.1245949,0.06081257,0.15725157,-0.50525534,0.50145364,-0.13395993,0.09498246,-1.1453322,-1.0391998,0.06291494,0.4532615,0.4007195,0.80146116,0.37852725,-0.2776739,0.49565524,-0.34287497,0.18915609,-0.03862614,-0.33454457,-0.6007137,-0.61357224,0.46276712,0.63247174,0.45824093,-0.41071337,0.46163124,0.28506118,0.47466686,1.2826446,-0.22984448,0.8980531,-1.2908657,-0.19065054,0.619187,-0.21507742,0.61695373,0.31231496,-0.1586343,0.40521887,-0.7063785,0.58543575,0.53233206,-0.28786543,0.24931091,-0.39037183,-0.963176,-1.3135386,-0.08157837,-1.9301238,0.69653904,0.4216538,-0.8678685,0.89531213,0.777643,-0.15040535,0.7455516,-0.71682864,-0.20358092,0.30619025,-0.017567974,-0.1793243,0.94089985,0.8778195,1.1260122,0.2325825,0.10741415,-0.7132063,-0.66615933,-0.21081784,-0.7090271,0.08807972,-0.20926592,0.05613734,-0.89655125,1.1896994,-1.1844085,0.5956234,-0.9492152,1.346981,-1.0968144,-0.84728444,-0.337654,-0.8889108,-0.9220503,-0.36867404,0.31671104,0.8043348,0.88817126,-0.035141457,-0.84498495,0.45342892,-0.50123245,0.031338926,0.27077883,-0.5849077,-0.8695395,0.016793745,-0.23868823,0.22771077,-1.1765672,0.3686356,0.262546,-0.3952779,-0.6954476,0.2486788,-0.7578397,-0.28578702,0.8741843,-0.6939267,0.032184616,0.15555775,-0.39363334,-0.8062731,-0.7268561,0.5546699,0.09511633,0.70113397,-0.3908718,-0.038235556,0.47562104,-0.72895116,-0.38632143,0.32083943,-1.21896,-0.9212077,0.6421082,0.9076029,-1.7500749,-0.26845637,0.884644,-0.40804312,1.1771951,-0.42897078,-0.028408032,0.46655986,0.15297908,-0.038525917,0.1498086,0.8327966,-0.6397716,0.91301066,0.17565174,-0.77638036,-0.85786414,0.17388651,-1.3898723,0.68298686,0.14437416,0.7388757,-0.24525166,-0.9797848,0.35705912,0.1364077,1.2304497,-0.5219353,0.871179,-1.258662,-1.3851078,-1.1720011,1.4452437,-1.3925768,0.869327,-0.491059,0.24140278,0.18488309,0.07451591,-0.1155067,0.96721023,0.71466875,0.29276153,0.9632321,0.68894774,0.50055325,-0.7686557,1.6700554,1.4265568,0.30504,0.48486474,0.031051964,-0.7699914,0.5879654,-0.9815054,-1.1098036,-0.8008966,-0.5572055,-0.5397659,-1.2099603,-0.2017965,0.19094515,0.014132983,-0.24771008,-0.09447956,-0.8715198,-0.87448025,0.8845377,0.6996504,0.51900554,-0.4050461,0.21290852,0.9338801,1.6873927,0.34561062,-0.024835013,-0.8314451,0.016397016,0.5191493,-0.30487114,-0.11892258,-0.61799926,-0.29134187,0.11476591,-0.660284,0.55313814,-0.9101351,-1.199163,-0.84562147,-0.9299935,-0.85204196,-0.8695826,-0.23689662,-0.32995427,-0.6281623,-0.6066958,1.4635481,-0.4634294,0.438731,-0.4777217,0.051781952,-0.21317911,0.055508308,0.17459448,-0.02610883,-0.31720656,0.54217225,-0.7689202,0.958569,-0.22205877,-0.067501836,-0.4529538,0.34758794,-0.8784628,-0.77122986,-1.299982,0.10603222,0.12420355,-0.095447384,-1.712431,-0.041918375,-0.08463743,-0.18408921,0.4463892,-0.96645623,0.71859235,-0.49644554,-0.9038122,0.124951154,-0.6730052,1.5638074,-0.34458548,-0.25940415,-0.15110227,-1.2164321,-0.8717482,-0.23613292,-0.5932063,0.1866763,0.37252212,0.15434447,-0.61254495,-0.8140717,-0.5758782,0.29881674,1.2677354,0.39958534,-0.53831935,-0.5576742,-0.7038478,-0.3372596,-0.40176773,0.45906025,-0.703148,0.937538,1.8156701,0.28603578,0.85630435,-0.18539211,0.32444406,0.5565648,-0.7731335,-0.38598585,-1.0589955,-0.29172847]	2026-02-12 14:19:30.549935	\N	\N	\N	{}	2026-02-13 18:56:13.258826
5	external.bff_products	2	public	--- Entity: bff_products ---\nidcategory: 1\nidum: 1\ndescription: hjjjjj\nsku: ghhjy\nislot: True\ncreated_at: 2026-01-23 21:41:03.805243\n\n> Related bff_category:\n  bff_category_title: Raw materials\n\n> Related bff_um:\n  bff_um_description: KG	[-0.72477496,1.077725,-3.470568,-0.85586,1.1251237,-0.55698127,-0.72703856,-0.09165978,-1.0837078,-1.4211513,-0.5609728,0.12916076,1.2872437,-0.39115652,0.25958255,-0.48479402,-0.38376936,-0.67889595,-1.1825016,0.37404004,-1.3666509,-0.2673932,0.37511075,-0.45977947,0.7095685,0.6359726,0.51445204,-0.29841036,-1.1946614,0.063087314,-0.13614193,0.22371426,-0.42836684,-0.44540665,0.1733292,-0.8749386,0.86684704,1.6105862,1.1445488,0.34035504,0.76144564,0.7985707,0.87313765,-1.1302265,0.055856586,0.59599465,1.1169304,0.4300002,1.8953192,-0.35513324,0.48609963,0.85699415,0.5647957,-0.3173082,2.0490403,0.22963125,-0.16636626,0.61876076,-0.22866395,0.13207884,0.3554887,2.6255102,-1.0562317,1.3996674,1.0611552,-0.2896198,-1.3994486,1.4021729,-0.8938223,-0.22964,0.7968868,0.5724087,1.0429136,0.9019483,-0.5454104,0.05795732,-0.4956324,-0.83151865,-0.07172726,0.93858856,1.3652439,0.9091888,1.3699704,-0.5673987,0.93475354,-0.18849647,-0.47446296,1.1643248,0.4808787,1.0133231,0.76169646,0.49540886,-0.052357383,0.20719427,-1.0229496,1.1455022,-1.1985922,-0.19338629,-0.89588755,-1.0670487,0.03501547,0.22428799,0.3421955,-0.2878885,0.9913465,0.792821,0.18233724,-0.095087044,-0.06585701,-0.7167846,-0.87931186,0.9489301,-0.7460392,0.043632187,1.0502928,-0.47808617,0.7904698,-0.5722989,0.54926485,0.8208636,-0.062150963,-0.18807906,-0.14319023,1.0924914,-0.6881207,-0.25784236,-1.2051655,0.23999232,1.2283895,-0.865658,-0.22691491,-0.7885396,-0.22588855,-1.1841671,-0.18654248,1.2451342,-0.018829564,0.4607251,0.5027241,0.4011724,1.0205214,-0.38774496,-0.9166726,-1.3084491,-0.052571528,-1.8046844,0.7681309,-0.62789553,-0.23918083,-0.039613243,-0.15533195,0.5629514,-0.6757592,0.7138437,0.8452629,-0.95471656,-0.09167698,0.23689102,0.3065351,-0.23996268,0.9833263,0.29843408,-0.20871939,0.07349855,0.5373498,-0.97669595,0.507482,1.0057012,0.16703686,0.7230969,-1.332694,-0.31264877,-0.5296003,0.19581154,0.38085714,-0.669807,0.49940246,0.1978518,0.5778412,-0.86716914,0.6768874,-1.4892837,0.9704526,0.8059079,0.16129261,-0.4916609,0.31647643,-0.1504084,-1.0408828,0.39131275,-1.1367983,0.85071284,-0.32439655,-1.2017155,-0.9222695,-0.9628036,0.20466635,0.40443677,0.786106,-0.681509,-0.5122922,-0.21256016,-0.8937961,0.8162693,-0.96995443,1.1728518,-0.65113664,0.4000954,-0.5535613,0.5037238,1.3595852,-0.5222787,-1.1660994,0.48362613,-0.1810227,-0.4908259,-0.5355293,-0.05260861,-1.3758323,0.39587218,0.28685948,0.7073582,0.24660176,-0.36109287,0.8541991,-0.3966214,0.19881763,0.16319638,-0.4029328,0.4549779,-0.19252947,-1.2548316,0.6444163,-0.9803739,-0.08835143,0.74725753,-0.162253,1.3994055,-0.21170786,0.14595897,-0.40814275,0.37641406,-0.019773904,-0.19190374,-1.1514373,0.34229508,-0.2782052,-0.99442047,0.76023287,1.2221688,0.094970055,0.07055787,-0.15434495,0.15251723,0.41481027,0.22826256,-0.14747205,0.5976213,-0.034900967,-0.5129197,0.17455867,-1.558978,1.5856284,0.016238967,-0.9398789,-1.1856445,-0.9699748,-0.088036805,-0.43181884,0.13932125,0.2557846,0.06452453,0.09060051,0.088654056,-0.1580846,0.36699268,0.62449825,0.113131896,-1.0591648,0.014183358,0.4228381,-1.1594688,-0.25709,-0.33808807,-0.9103539,0.5514362,0.32219264,0.5469121,0.046722747,-0.11763364,-0.16764943,0.0030095503,-0.06810258,0.055477157,-0.6091222,0.9781244,1.5272557,-0.36999995,-0.49753675,-0.20499459,0.5581301,0.5789956,0.79390705,0.22472799,-0.06073314,-0.20415609,0.034406833,-0.2939276,0.1766263,0.20057257,-1.0356289,-0.007999751,-0.364118,0.8871855,-0.2662978,1.3458548,0.31135187,0.3763072,0.5435534,-0.8475397,0.13104376,-0.68494064,-0.09727527,-0.51255864,0.7061265,1.0539489,-0.3904226,0.3298987,0.48837808,-0.6636038,0.4297329,0.3294406,-0.45011762,-1.1446893,-0.14941227,1.4188576,-1.0937165,-0.31230828,-0.3626173,0.7730906,1.7734578,-0.21498033,1.6910447,-1.4522362,-0.6704437,0.7308556,-0.7701859,-0.32085404,0.6691124,0.8003924,-1.5496602,0.6506938,-0.40047854,-0.25724506,-0.38182896,-0.10383022,0.6692412,0.33515775,0.24052191,-0.5778108,0.6941588,0.088530466,0.5621739,-1.7036089,0.36633864,0.19574167,0.95016617,0.6316961,0.23201531,-0.8398579,-0.011925213,0.050265044,0.067965165,1.020334,0.018437393,0.05742285,-1.9436005,-0.567651,-1.1229846,-1.0174564,0.3567225,-0.22565612,0.40064535,0.8646779,0.7481052,-0.6963604,0.32295218,-0.35322496,0.95779425,0.004872192,-0.8455837,-0.91937625,-0.8099703,-0.14831333,0.61035943,-0.70150447,0.29976144,0.09386634,0.15317267,1.8193357,0.3929599,-0.29487073,0.07084868,-0.73928046,0.38059896,0.46455574,-0.8426186,-1.0226167,0.812831,-0.030269086,0.62592393,0.92239606,0.30507553,-1.2607808,0.3433245,-0.07640422,0.41284645,-0.22890869,0.11095637,-0.22405012,1.5449457,0.21537156,-0.04633103,0.6325874,0.35125956,-0.30253375,1.1782987,0.6974153,-0.40882748,-0.91807044,-0.68567765,0.38744444,0.57150215,0.0057970444,-0.6399784,0.30401957,0.24080552,-0.09452818,0.71263766,0.3314207,1.0041878,-0.6306134,-0.80253184,-0.14200802,0.5003569,1.5740925,0.43036285,-0.68880713,-1.3091388,0.635568,-0.559237,0.55254775,0.24115244,0.3158084,1.2074441,-0.039524447,1.2040031,0.09780461,-0.13339345,1.0100976,0.2811431,-0.2898963,-0.44783664,-0.2594193,-0.39533874,-0.7991247,0.48148757,-0.93134373,-0.65036154,1.8877889,-0.51402795,-0.0030534377,1.0323771,-0.011287517,-0.12178463,0.9121362,-0.05457794,-0.08551443,-0.34670985,0.42327338,-0.20258716,0.21156058,-0.99338853,-1.0474428,0.28412998,0.3771598,0.37847638,0.8613076,0.36917537,-0.29628947,0.5619448,-0.24519801,0.6304854,0.105430536,-0.16137816,-1.0413473,-0.24327898,0.31536248,0.84055984,0.52757096,-0.06283814,0.7525001,0.006086855,-0.025829632,1.2521539,0.2143583,0.79279804,-1.5881798,-0.16750959,0.515437,-0.13642836,0.761001,0.2231088,-0.15949966,0.9129152,-0.6187224,0.53501093,0.6397424,0.07028707,0.59110075,-0.36987215,-0.9608624,-0.8136135,-0.3328473,-1.7293267,1.0698856,-0.13211977,-0.68516177,0.70749557,1.2417747,-0.16078329,0.4347227,-0.72578585,-0.112279594,0.13219167,0.10018675,-0.11178943,0.76973605,1.0661842,1.0917276,0.20989603,0.48458266,-1.3802509,-0.3310775,0.025644893,-0.55680925,-0.1310181,-0.28915146,0.32137892,-0.83788687,1.1424348,-1.3328646,0.9017554,-0.9244203,1.1244241,-1.0987046,-0.6457843,0.033799946,-0.93752867,-0.56218237,-0.097493395,0.5236369,0.4502458,0.93561226,-0.007317718,-1.0784385,0.57513607,-0.8925645,-0.083330326,0.34536764,-0.4507393,-1.4501203,0.07610474,-0.628436,0.5888434,-0.8600746,0.6051785,0.17131555,-0.951304,-0.6221638,0.10123186,-0.8061528,-0.14425115,0.5481744,-0.9925749,0.08644682,0.19790915,-0.44173214,-0.8005042,-0.8367035,0.7610405,0.23129106,0.46342883,-0.51048166,-0.0024447523,0.41167802,-0.47382808,-0.09424734,0.05446786,-1.1302514,-0.9644285,0.48584834,0.82575583,-1.5582235,0.11221682,1.1083335,-0.25366592,1.3063748,-0.46748725,0.054933656,0.3664334,0.38144532,-0.21733183,0.13673823,0.68592304,-0.55400646,0.96099496,0.43996114,-0.5162302,-1.1349387,0.08480713,-1.1740575,0.5286039,0.4446841,0.81470054,0.13014394,-1.1699866,0.28426793,0.017047787,1.0119133,-0.43020156,0.55334294,-1.3073803,-0.872167,-1.2658709,0.81832165,-1.5448478,0.8098319,-0.19058523,0.4089231,0.5224509,-0.123797655,0.060272567,0.87308615,0.87658477,0.20114963,0.9677305,0.90473497,0.83941615,-0.5186015,1.5835241,1.5313127,0.40232444,0.66391695,0.170534,-0.6217145,0.8170097,-1.3412013,-1.1366129,-0.5785131,-0.24893314,-0.63988465,-0.92148805,0.13105261,-0.06929045,-0.16124666,-0.18519649,0.018715333,-0.8442519,-0.79091567,0.86121416,0.48410183,0.40188777,-0.3834975,-0.09789953,0.57709134,1.3451637,0.4215819,0.09736546,-0.64113605,-0.43006033,0.7171165,-0.18822193,-0.035184663,-0.35981724,-0.098517574,-0.08689699,-0.5136385,0.07186947,-1.1186395,-1.2451721,-0.7940414,-0.48345372,-1.0393841,-0.66805303,-0.2418409,0.071630396,-0.4791385,-0.77240163,1.3149219,-0.1417234,-0.17401423,-0.6012772,-0.33573142,-0.120391235,-0.08454048,0.20066023,-0.05683446,0.262457,0.2536639,-0.72319686,1.1454121,-0.26385677,0.10030154,-0.3712978,0.4832116,-1.2539124,-0.6949127,-0.93833876,0.21711403,-0.16914178,0.38406816,-1.4411432,-0.28729904,-0.009465549,0.18423167,0.6065421,-1.4414269,0.48486367,-0.28996012,-0.6956614,-0.18395206,-1.0561298,1.6692111,0.03373505,-0.293823,-0.13013062,-0.7953372,-0.6966372,-0.037570726,-0.29894954,0.22398528,0.09830241,0.56345433,-0.5176679,-0.47104713,-0.7468645,0.24050571,1.0288326,0.5101857,-0.6129535,-0.22472006,-0.06881875,-0.42646688,-0.23655972,-0.19132297,-0.51236194,1.3760823,1.5855545,0.51421463,1.2700641,0.034467563,0.34017432,0.58064616,-0.9577481,0.22338957,-1.2273757,-0.28757972]	2026-02-12 14:19:30.630515	\N	\N	\N	{}	2026-02-13 18:56:13.367651
6	external.bff_products	3	public	--- Entity: bff_products ---\nidcategory: 1\nidum: 1\ndescription: Mango 2\nsku: PROD-008\nislot: True\ncreated_at: 2026-02-06 21:26:57.263604\n\n> Related bff_category:\n  bff_category_title: Raw materials\n\n> Related bff_um:\n  bff_um_description: KG	[-0.55644095,0.97586,-3.4896739,-0.22423835,1.3018274,-0.3945719,-0.6687176,-0.27138117,-1.3724641,-1.349716,-0.3661235,0.3764798,1.1192054,-0.36549312,0.25351244,-0.594804,0.07710453,-0.6719132,-0.9998063,0.445585,-1.1146345,-0.03034668,0.21557954,-0.15460454,1.1825808,0.8640398,0.4991815,0.3269746,-1.4214536,0.16672786,0.41456264,0.24014345,-0.32045686,-0.2807446,0.048747066,-0.80123854,1.076895,1.4376779,1.0678596,0.3161707,0.52801543,0.6525544,1.1554903,-0.67827463,0.027649827,0.5864673,1.1040537,0.2864516,1.6407144,-0.61857533,0.619397,0.9825638,0.80436456,-0.6054666,1.4370763,0.25363362,0.10498939,0.6011144,-0.16117379,0.2853896,0.7925547,2.2665424,-1.0422711,1.7916365,1.1652256,-0.30869624,-1.1328046,1.2675005,-1.2206866,-0.5369645,0.81938004,0.56667984,1.0989711,1.053818,-0.44264627,0.091277376,-0.6598619,-0.8621932,-0.16607113,0.7059699,1.6466584,0.82455724,1.3226947,-0.4873648,1.0741012,-0.62779087,-0.5027098,1.0461969,0.07213268,1.2679534,0.8003844,0.6977211,-0.16462137,-0.034043718,-1.2203844,1.2080808,-1.0536237,-0.17944121,-1.1519531,-0.9323004,0.14042741,0.15163761,0.3394791,-0.03223392,1.0723515,0.7729981,0.2879688,-0.029412538,0.01919875,-0.44982615,-0.75728655,0.9006725,-1.4625227,0.3504876,0.7827322,-0.4675066,0.343036,-0.6610019,0.6574239,0.8960699,0.12205799,-0.43899208,0.32660288,1.1795554,-0.14669004,-0.49970406,-1.2785975,0.1531651,0.86211836,-0.8827127,-0.32433915,-0.57054317,-0.054932654,-1.1138005,-0.38842455,1.4901206,-0.33969736,0.4839682,0.37092328,0.3443401,0.6515778,-0.33603194,-0.8694284,-1.2380545,-0.30624765,-1.6910744,0.84080327,-0.53957796,-0.3106025,0.10677986,-0.11509773,0.41638154,-1.0288501,1.1002007,0.6106514,-0.82137084,0.057170466,0.05305159,0.33136642,-0.19813141,1.2428815,0.16871862,-0.36770713,0.058342725,0.61362875,-1.4204261,0.7140769,1.1801817,-0.2393623,0.8797892,-1.4801556,0.0100477915,-0.14533557,0.23613244,0.052201048,-0.462387,0.2556698,-0.08279919,0.9495264,-1.0916957,0.5827981,-1.1604849,0.68060386,0.9432406,0.07433235,-0.7024586,0.2757227,-0.055216525,-0.7891328,0.23089673,-0.6750995,0.6274779,-0.5551487,-1.1185818,-0.575371,-0.94854933,0.15551254,0.49624032,0.7617686,-0.81165063,-0.6919445,-0.010968678,-0.9848273,1.1044037,-1.0307853,1.3658597,-0.47819927,0.28975147,-0.41961178,0.73121756,1.089558,-0.58895165,-0.91087645,0.44098324,-0.110786945,-0.7320392,-0.207609,-0.24357557,-0.78066665,0.8002753,0.16148004,0.33289146,0.22685942,-0.5049024,1.0434511,-0.12743932,0.1631293,0.2929113,-0.6522676,0.5574867,-0.19634011,-1.7527335,0.8903347,-0.48321486,-0.20325413,0.5057901,-0.086766504,1.3459872,-0.5372417,-0.120042205,-0.35819823,0.38432598,-0.12284634,0.2142752,-1.028583,0.5762988,-0.013400821,-0.73347545,0.9982261,1.2980092,0.026250739,0.06530456,-0.21084303,0.576234,0.47470924,-0.053751282,-0.43676275,0.85268605,0.12872154,-0.79374456,0.46632484,-1.7636641,1.7668409,0.3420658,-0.6754166,-0.7895729,-1.0740451,0.18831177,-0.42413154,0.22934246,0.2010572,0.13066523,-0.018337369,0.10876566,0.13935867,0.37322944,0.698293,0.25179017,-1.019685,0.21751086,0.18602568,-1.6497262,-0.36173052,-0.106678896,-0.75459045,0.63218594,0.04519229,0.6622052,0.044337787,-0.21962029,-0.33499402,0.15607488,0.21449496,0.15351407,-0.4739542,0.76809126,1.4132997,-0.42139444,-0.5394882,-0.67240083,0.7904638,0.5270513,0.7033118,0.09850609,0.20115471,-0.5575967,0.11271652,-0.1544885,0.13156706,0.047819547,-0.795347,0.5354769,-0.6548349,1.2070158,-0.65210307,1.1341918,0.26665998,0.7292825,0.8187716,-0.16553336,-0.21838386,-0.57430196,0.075415604,-0.5502637,0.7082467,1.1828923,-0.40260813,0.253633,0.50007045,-0.60427046,0.53390026,0.72232974,-0.7706884,-1.4385854,0.05942189,1.3287977,-1.3105417,0.049616806,-0.33167917,1.2561626,1.3070743,-0.32371628,1.498513,-1.620512,-0.65410316,0.5885299,-0.51121354,-0.3167836,0.7151119,0.7236181,-1.3896673,0.8645341,-0.51884633,-0.05060032,-0.45599204,0.041841745,0.7771781,0.12714402,0.17293905,-0.2539637,0.6125429,-0.008144349,0.22646046,-2.1063704,0.62754774,0.22186552,0.99055374,0.6664663,0.21853666,-1.2240028,0.15889183,-0.5077184,0.15413181,1.0066369,-0.17217617,0.005830884,-2.527242,-0.71284056,-1.0595373,-0.766983,0.559217,-0.18772417,0.34450078,1.0168498,0.9822375,-0.9367461,0.0954317,-0.28298056,1.1786028,0.10884952,-1.0444183,-1.2224345,-0.9342698,-0.1453367,0.67773247,-0.8021556,0.5682064,0.11876698,0.058658544,1.8377156,-0.06250602,0.018936671,-0.18246336,-0.77451223,0.46356952,0.50403416,-0.7305293,-0.9709678,0.97602814,0.11866143,0.5772815,0.77804923,0.29262936,-1.4362463,0.27816063,-0.12742373,0.3845458,-0.4701877,-0.14130515,-0.7670725,1.7505362,0.29256794,-0.36888927,0.46898705,0.30200592,-0.012799922,1.00212,0.77809525,-0.41533035,-1.0304818,-1.0356681,0.23289157,0.6451804,0.02268086,-0.62600875,-0.2399385,0.20108211,-0.36994854,0.93156445,0.3122334,0.642326,-0.5373374,-0.830486,-0.53290254,0.8399224,1.1872368,0.6668003,-0.73353213,-1.0784428,0.78624284,-0.377321,0.3335173,0.52482283,0.31216007,1.3139489,-0.114896715,0.9461453,0.15891093,-0.12000051,0.69373524,0.38352907,-0.46463442,-0.6849456,-0.09963101,-0.41377932,-0.8441722,0.33346686,-0.9423593,-0.2186028,1.6928606,-0.8451868,-0.47223458,0.9874271,-0.19708063,-0.08845967,0.7279078,-0.34462392,-0.06502121,0.15695907,0.3389985,-0.036315337,0.6007718,-0.94718385,-1.1258979,0.70094687,0.22021152,0.3921238,0.40498483,0.4281883,-0.09864822,0.67827785,-0.27962792,0.6266891,-0.09908097,-0.18563554,-0.89258754,0.013315124,0.5180774,0.6584528,0.5043367,-0.1601231,0.42639673,0.05862765,0.08270869,1.0877802,-0.2445219,0.95317227,-1.6064168,-0.11459584,0.8805161,0.15671945,0.50159585,0.4550452,-0.34732252,0.31510502,-0.7572962,0.87807566,0.41451123,-0.17065519,0.5355645,-0.16021502,-1.0869365,-1.13364,-0.16200833,-1.8387783,0.98482656,0.25911397,-0.50315964,0.48796672,0.6464727,-0.14318562,0.48698783,-1.0116009,-0.01560523,0.14576223,0.010854349,0.09546732,0.88015103,1.0397438,0.77989817,0.11690231,0.5324818,-1.0221026,-0.9389605,-0.15236124,-0.26159513,0.024137031,0.073795885,0.21423356,-0.9399406,0.9468596,-1.4383408,0.7541985,-0.9869951,1.1670241,-1.0207969,-0.64474297,0.06453687,-0.5098988,-0.5747101,-0.23630396,0.6246974,0.63839984,0.68222773,-0.09227347,-1.2534606,0.6043665,-0.50217915,-0.024630312,0.35906583,-0.5037561,-1.1182246,0.009129809,-0.53521264,0.34803498,-1.1278738,0.11290704,0.17453603,-0.4984486,-0.66948855,0.21092023,-0.98216456,-0.31226376,0.99969053,-0.63047266,0.15834688,0.1328331,-0.6240457,-0.5818652,-0.91268253,0.7389079,0.31764913,0.69545174,-0.46406043,-0.06346669,0.3970572,-0.8265697,-0.26299036,0.067966715,-1.110973,-1.0649452,0.35384074,0.6076963,-1.7688341,0.03583525,0.8203757,-0.29840407,1.385392,-0.3321451,0.18793906,0.6654632,0.22959882,-0.08013318,0.21073174,0.66474974,-0.7309479,0.95128584,0.13432637,-0.6363044,-1.10387,0.19111331,-1.6063504,0.6363133,-0.1315834,0.9242258,-0.05361093,-1.1034795,0.14205544,0.2185973,0.9244456,-0.46905556,0.35612416,-0.83643925,-0.7465122,-1.4030254,0.58288044,-1.2303901,0.9702801,-0.44146544,0.34214157,0.14819774,-0.010104892,-0.06830024,0.98954046,1.0123491,0.20221022,1.1803735,0.99474174,0.49227604,-0.613553,1.2247021,1.6266773,0.41306162,0.7826088,-0.085868984,-0.71586347,0.48724023,-1.2326905,-0.90199524,-0.56709707,-0.3999777,-0.48507488,-1.259167,-0.10212393,0.23503335,-0.12685147,-0.09104715,-0.017199289,-1.0764056,-0.90266526,0.8199029,0.45006895,0.41713345,-0.46193856,-0.17132913,0.6742456,1.8855135,0.41370088,0.042451553,-0.71045315,-0.012644574,0.25850114,0.04945039,-0.09680924,-0.5670773,-0.04790219,0.28160664,-0.38788515,0.3227772,-1.2464838,-1.1150632,-0.6618221,-0.6184058,-0.80013984,-0.95513517,-0.37533367,-0.24959926,-0.49667755,-0.9127068,1.4887135,0.03902927,0.15416029,-0.66722584,0.030176226,-0.019166145,-0.22846158,0.19096732,0.011021297,-0.046113826,0.25289938,-0.37873405,1.0377,0.12330203,0.54192555,-0.11460088,0.32218635,-1.080304,-0.5003714,-1.0968163,0.32773823,-0.043272234,0.41450307,-1.5067782,-0.45779127,-0.32466596,-0.0028352886,0.5320089,-1.208889,0.17683187,-0.09213427,-0.40447176,-0.09235414,-0.92950547,1.5252969,-0.054665238,-0.47769606,-0.3214702,-1.0219806,-1.024503,-0.20571533,-0.43733257,0.24901041,0.14910913,0.4533958,-0.58328265,-0.64450353,-0.9381875,0.85242295,1.6274793,0.7023382,-0.32511574,-0.6576525,-0.36522937,-0.22945015,-0.62251383,-0.104939215,-0.38650978,1.1547859,1.6930927,0.28777838,1.2026064,-0.118053064,0.27230924,0.64989597,-0.8746699,0.2670329,-1.1118146,-0.23619145]	2026-02-12 14:19:30.702516	\N	\N	\N	{}	2026-02-13 18:56:13.480016
7	external.bff_customers	7	public	--- Entity: bff_customers ---\ncompany: cccc\naddress: Street 98\ncity: Miami\nzipcode: 33251\nidstate: 1\nidcontry: 1\n\n> Related bff_state:\n  bff_state_name: Alabama\n\n> Related bff_country:\n  bff_state_bff_country_name: United States\n  bff_country_name: United States	[0.30393618,0.38315552,-3.7302065,-0.39184928,1.6299549,-0.7994534,0.56413925,0.24616008,-0.56497043,-0.9133109,-0.66709524,-1.0206348,1.6691968,-0.03978447,0.722933,-0.5511178,-0.59983087,-0.20729652,-0.85337347,-0.7677446,-0.96280485,-0.08788501,-0.07600076,-0.48340112,0.5843766,0.49818227,1.3607839,0.8111323,-1.553801,0.010347941,-0.17258547,1.2028079,-0.0024117965,-1.8064927,-0.83346766,-1.0704571,0.69438136,0.8046378,0.99214226,1.027241,0.9533749,1.1874585,0.38636386,-1.0677072,1.016646,0.5095625,1.1322948,0.27429804,2.6045003,-0.5357613,0.8603898,0.6880961,-0.081070185,0.42161635,0.6005533,-0.25944886,0.64340335,0.8295054,-1.0444485,0.24475272,1.7952595,1.7774225,0.21342504,1.7746272,0.98118275,0.6224568,-1.1393768,0.93461454,-0.9115794,-0.39216092,1.1384832,-0.061887626,0.50195557,0.6032738,-0.6951078,-0.44352898,-1.7457374,-1.1501675,-0.35185066,-0.25906342,1.3529829,0.3304106,0.9904001,-1.2592338,0.7440858,0.5868402,-0.05475546,1.6858823,-0.19430237,-0.24415334,0.023713253,0.4286384,1.279858,-0.07276533,-0.5693482,1.1959394,-0.44410402,-0.4719788,-0.88435423,-1.3107418,-0.4106623,-0.37543845,0.5265837,0.76800936,0.14492649,0.82209164,-0.007248999,-0.10201331,0.3378803,-0.31796527,-0.73867863,1.258483,-0.032246955,-0.11977707,0.2782114,-0.16234654,0.6324037,-0.31999746,0.9984328,0.84667075,-0.69273233,-0.6427562,0.25522327,0.87347674,-0.33421317,0.6127255,-0.67360044,0.30920655,0.7551009,-0.21139523,-0.15686403,-0.9342065,-0.059331954,-0.11658173,-0.7508556,0.6649294,0.21561024,0.14040062,0.2430599,1.0626073,1.1091297,0.08655501,0.75817174,-1.3198829,-0.023282677,-1.5604049,0.23249486,-1.417337,-0.28280628,-0.04984896,0.12010145,0.48490945,0.001423722,0.7875178,1.0755721,-0.88049704,-0.43651962,-0.15331888,1.0359087,0.49014053,0.6373115,0.19670482,-0.07136197,0.31840694,-0.37477013,-1.7120758,-0.33862606,1.9329331,-0.24754255,0.22400585,-1.0562336,-0.37928972,0.17659445,-0.40304637,-0.08170021,-0.6901126,0.25685188,0.752834,0.06327047,-1.2833495,0.82261497,-0.99359006,1.1126673,1.0741042,0.01119905,0.039901406,-0.4024118,0.34700683,-0.9145712,-0.05216565,-0.90736705,1.033817,-0.5603689,-0.5008187,-0.9517554,-0.56510925,0.6622746,-0.45220432,0.5021878,-0.63059264,-0.2687052,0.69116116,-0.2684575,0.9530903,-1.1316308,1.2762655,-0.6362044,-0.037197176,0.20613492,0.43539867,0.47359642,-1.216819,-1.7623025,0.74659574,0.09194027,-0.06237661,-0.047923733,-0.64237034,-1.5046284,0.18846707,1.3656648,0.18270327,1.4159559,-1.3219321,1.3813714,0.45954698,-0.70378613,0.09602883,0.3859882,1.113323,-0.533595,-1.3977717,0.8774284,0.20257397,-0.3114489,1.0128452,-0.05038832,2.1512532,-0.35215786,0.23400861,-0.3196342,0.53353876,0.30269688,0.16593167,-0.87295526,0.746714,-0.8730425,-0.7676867,0.75192183,0.4155795,0.3246083,0.13320482,-0.30064872,0.81398535,-0.21284136,-0.69530404,-0.24105406,-0.05155457,-0.69746614,-0.70485073,0.0972258,-0.86754745,1.9762263,-1.252833,-0.69220406,-0.616279,-0.6631575,0.09020723,-0.495275,-0.24160482,0.49960735,0.4388484,0.20512873,0.36387622,-0.15537153,-0.32589436,0.3291901,-0.42428055,-1.2619629,-0.110636175,0.28064233,-1.5217109,-0.05987181,-0.094742574,-0.23223326,0.2418223,0.20490335,1.186393,0.02050047,-1.0153224,0.9600276,0.0629656,-0.38665554,-0.022680623,-0.3453436,1.0241112,1.8580066,-0.07762502,0.05703804,-0.53584903,-0.39156473,0.37798697,-0.15950479,-0.31619596,-0.3443256,0.52961546,-0.005463181,-0.07898883,0.4898734,-0.28455198,-1.3359227,-0.4835134,-0.19492671,0.104012325,-0.68021554,0.6451046,0.4764224,0.644582,0.52341044,0.13479525,0.4375818,-0.07055805,-0.3316587,-0.5303824,0.96017915,1.6452585,-0.20058507,0.7186279,0.10177926,-1.3182364,0.12173011,-0.015491528,-0.13079518,-1.254579,0.14902268,0.44779527,-1.1495132,0.33277684,-0.13600394,0.54606503,1.5629978,0.6636068,1.2081498,-1.71072,-0.42024636,0.51764685,0.1487483,0.4451625,0.535504,0.7702478,-1.5026963,-0.14580993,-0.0076028984,-0.57394814,0.42996708,-0.82221085,0.4052234,0.16492234,-0.006157995,0.5718443,1.2925076,0.18883994,0.93037045,-0.90032226,-0.104549855,0.6151235,0.8835328,0.04662829,0.03741064,-1.0779313,-0.7452548,0.20026933,0.814715,0.9467903,0.52212447,0.4778723,-1.5583848,-0.86444384,-0.5636763,-0.43794262,0.47555616,-0.8048502,0.33033696,0.014376193,0.4379597,-0.55253637,-0.11582593,-0.6036025,0.331416,0.8201381,0.17900376,-1.3914135,0.015433489,0.11910271,1.5563221,-0.8066881,0.33202848,-0.14638773,0.44901645,0.66009206,-0.19535153,-0.198261,0.38465196,-0.49450198,-0.30584824,0.47869867,-0.88169503,-1.1816328,0.49805903,-0.0046633203,0.2795706,0.9461036,0.24262473,-1.7987957,0.99473715,0.19559316,0.027575456,-0.11539871,0.054252848,0.10572744,0.7729001,-0.2913154,0.04323855,0.5507288,0.2727406,0.116415545,0.6461878,0.73369074,-0.5493673,-0.6531225,-0.08997564,1.1887602,0.4747787,0.48504663,-0.7924298,-0.32261232,-0.58915824,-0.96406406,1.0699711,0.87268937,-0.35213235,-0.9124789,-0.34569728,-0.77334493,0.58701175,1.3731351,-0.050002772,0.005689189,-0.612345,0.18133311,0.17988351,0.94166267,0.17549726,1.2282561,0.4507776,-0.50816584,1.1300551,-0.49792048,0.5184815,1.2906199,0.8388259,0.34567708,-0.5223738,-0.016202034,0.012531868,-0.59989977,0.9212725,-1.3551513,-0.5888194,0.8598592,-1.2103971,-0.03125813,1.031138,-0.18233292,-0.6163484,0.7519322,-0.49861968,-0.1597875,0.09814034,0.20117354,-0.393524,0.013446995,-0.72775376,-1.5785934,-0.16161042,1.2821763,1.2462296,0.4158612,0.53952694,-0.33954012,-0.52421755,0.18447718,0.34683275,0.3071944,-0.115261994,-0.97438675,-0.9317452,0.26861492,0.37547967,0.06338264,0.42916623,0.6702075,0.023413926,0.27689567,1.0259509,0.19548814,0.7127932,-1.0788118,-0.2505441,0.01766717,-0.66385436,-0.65899444,0.50147426,-0.9830655,0.71586716,-0.026522834,0.21491092,0.048347916,0.30994564,0.6939396,0.13713348,-0.37098843,-0.5113991,-0.26243943,-2.472227,0.54944724,1.0879822,-0.8818244,0.21460688,-0.19186857,-0.21989037,1.2588291,-0.6956685,-0.19862258,0.7190626,-0.049886942,-0.12577014,0.09538251,1.217107,0.5488103,-0.5423372,-0.69270784,-0.7394141,-0.029188203,-0.37616682,-0.073335275,0.72766876,-1.0487446,-0.89029515,-0.06958555,0.70720816,-1.3119911,0.58394015,-0.83737135,1.3015227,-1.2525072,-0.78288245,0.4599474,-1.0901853,0.16119754,-0.98621273,-0.28045982,0.88113075,0.78975266,0.6285324,-0.4203461,0.2913311,0.57146496,0.04571385,0.06519917,-0.71166706,-1.7041513,0.16626616,-0.7813903,0.64746827,-0.5700629,0.3347571,-0.26387793,-0.77047247,-1.0392073,0.03306418,-0.5573533,-0.67357236,0.7442436,0.14842063,0.42381316,0.62942004,-0.5184782,-0.049049597,-0.9473134,0.6243701,0.559509,1.2110039,-0.039967347,-0.28198096,0.40405652,-0.69431746,-1.2440425,-0.5200216,-1.157549,0.070450135,1.2326629,0.8879753,-1.5447888,-0.38308465,0.4819791,-0.22521316,0.80396855,-0.1716782,-0.39240554,0.2786331,-0.16292752,-0.42948398,-0.40421608,1.2467412,-1.2702634,1.490315,0.031321928,-0.12264278,-0.61540073,0.12761089,-1.4158913,0.72819597,-0.32387787,1.0058484,-0.027081084,-0.90547526,0.23869853,0.58724827,0.53986895,0.11925179,-0.103066385,-1.063852,-1.3863517,-1.7937754,0.50731397,-0.87334144,-0.005792964,-0.34996164,0.11807034,1.0537425,0.08445711,0.5290045,0.30324364,1.5773699,-0.12995508,0.84211904,0.79570365,0.95390385,0.5803093,1.5655416,0.9258136,-0.033931106,1.2448517,0.4148891,-0.5956975,0.23281497,-0.9483435,-1.185384,0.3866741,0.40138245,0.49262333,-1.1321638,0.76379544,0.6247697,-0.31933555,0.3262991,-0.2928461,-0.836997,-1.115439,0.81553763,-0.26136532,-0.3853795,-0.8377399,0.5110583,0.95151114,0.45298254,1.0725651,0.124179766,-0.5809464,1.4775724,0.08372618,-0.4226211,-0.6536018,-0.2232049,-0.3535248,0.992591,-0.3460301,0.3371151,-1.4751153,-0.9198287,-1.8695666,-0.46565127,-1.0459731,-0.79503745,0.3691359,0.22025415,-0.29782006,-1.1537329,0.74682593,-0.31795782,-0.3686623,0.79756737,-0.28403217,0.28546262,-0.7636807,-1.4713882,-0.3386169,-0.6331416,-0.38758144,-0.46230868,0.63929063,0.52340823,0.28320312,-0.05669597,0.4647648,-0.26972872,-0.007537135,-0.29680622,0.13160264,-0.012398203,-0.33583176,-0.6821864,-0.5385169,-0.4091217,-0.2634486,-0.10462197,-0.8164717,0.77401996,-0.27935466,-1.1548642,-0.6885437,-0.76769286,0.68918,-0.16037638,-0.75007284,-0.6433872,-0.8332964,-0.036808886,-0.68523914,-1.2840856,-0.2308825,0.05336679,0.11675386,-0.21395254,-0.31922534,-0.7478048,0.29271427,0.9135383,0.31200162,0.8236203,-0.28675836,-1.3359448,-0.44122112,-0.12814999,0.5670762,0.533624,0.6578818,1.8674711,-0.16644591,1.589104,0.19773646,0.71519166,0.8392309,-0.5384333,-0.6770264,-0.92580974,-0.6337831]	2026-02-13 17:02:44.797131	\N	\N	\N	{}	2026-02-13 18:56:13.769456
8	external.bff_customers	5	public	--- Entity: bff_customers ---\ncompany: aaa\naddress: 123 Ocean Dr\ncity: Miami\nzipcode: 33101\nidstate: 1\nidcontry: 1\n\n> Related bff_state:\n  bff_state_name: Alabama\n\n> Related bff_country:\n  bff_state_bff_country_name: United States\n  bff_country_name: United States	[0.118819945,0.7910528,-3.6960893,-0.6105835,1.6924068,-0.73495775,0.46629688,-0.104697965,-0.4081789,-0.7650271,-0.2891033,-0.23691045,1.7504764,-0.21251488,0.40903556,-0.40255898,-0.756173,-0.454262,-0.65721834,-1.4288276,-0.8155518,-0.04629183,-0.7969333,-0.16531886,0.7382116,0.6020712,1.498471,1.0672007,-1.8333911,0.021702435,-0.34812498,1.045825,-0.32682252,-1.2819545,-0.39384937,-1.1270486,0.114750765,1.3837582,1.2811795,0.8390846,0.80894244,0.78459156,0.26734892,-0.14550433,0.6912634,0.15153918,0.96050555,0.19559887,2.4774227,-0.5887607,1.280612,0.70364344,-0.3461716,-0.00028422102,0.38894856,-0.50694704,0.3252936,1.0308805,-0.9551143,0.48778418,1.7038265,2.005875,-0.20239915,2.0632489,1.3600316,0.9444757,-1.4837178,0.6621492,-0.5497957,-0.70631987,1.2803041,-0.4048628,0.1777213,0.4228939,-0.6961342,0.18179014,-1.7987684,-0.9798909,-0.6479349,0.04712438,1.5204155,0.29144728,0.8828593,-1.176594,0.7050937,0.32458845,0.42786852,1.7691014,-0.24577452,-0.19591042,-0.35175815,0.48348522,1.3818327,-0.11387648,-0.61635387,1.0538423,-0.6170992,-0.18785004,-1.1162916,-1.4341432,-0.49114645,-0.52627486,0.5657812,0.6385196,0.44058633,0.45969656,0.112447314,-0.13018464,0.34834218,-0.16123362,-0.60081667,1.2056618,-0.021343816,0.06208736,0.11348958,0.030020911,0.20779213,-0.5164505,0.48259082,0.7833756,-0.27561945,-0.23588827,0.42340004,0.34828994,-0.4399001,0.42687535,-0.64637256,0.86330134,0.4840815,-0.225641,-0.023592664,-1.1180393,0.24785472,-0.3762811,-0.9703713,0.6865437,0.045000233,0.047515344,0.40629596,0.9752232,0.9522274,0.22911945,0.58807915,-1.7094997,0.09376334,-1.5669956,0.5733527,-1.1692443,-0.18093273,0.09030862,0.19973661,0.47143266,-0.093065746,1.0677981,0.97630054,-0.72624147,-0.41942182,0.03748571,1.1353136,0.44750848,1.1403306,0.4018652,-0.031498633,0.34561688,-0.30399743,-1.2318258,0.1123384,1.9171741,-0.32719362,0.54239833,-0.9346087,-0.57921284,0.39713252,-0.18434845,0.1683211,-0.3533042,0.1190049,0.4026746,-0.082964964,-1.2701356,1.1327564,-1.0130908,1.2171369,0.8277917,-0.2455762,0.1249242,-0.71655226,0.122780405,-0.9034874,-0.05759664,-0.5093618,0.8926018,-0.0991612,-0.7418637,-1.0201507,-0.51737,0.44295046,-0.5899717,0.35165703,-0.2514953,-0.32205075,0.9896869,0.15878251,1.0422333,-0.8276167,1.0466601,-0.42320356,-0.3823355,0.19656926,0.24664378,0.42093328,-1.0249721,-1.4962445,0.17195062,0.20461428,0.35525438,-0.060454078,-0.35261002,-1.5726926,0.24871308,1.4055225,0.16282344,1.2586887,-1.4773271,1.2623906,0.19943759,-0.900539,-0.18296374,0.25014937,0.86793005,-0.56866604,-1.2912114,1.0538896,0.1325911,-0.12229848,0.89553577,0.2512716,2.0329912,-0.42636913,0.3495711,-0.5434076,1.0456821,0.18607084,0.90096426,-0.8633366,0.898884,-0.9600166,-0.77370614,1.0010457,0.67826533,0.3226443,0.0968333,-0.15251334,1.0336277,-0.32212216,-0.24922565,-0.47027168,-0.2631447,0.043386683,-0.9621235,0.23591046,-0.5774426,1.9555019,-1.627712,-1.1662565,-0.5784412,-0.7205935,0.16920829,-0.3594812,-0.4252165,0.7870254,0.42000142,0.3130638,-0.10931857,-0.047516152,-0.05621108,0.30093688,-0.3983305,-0.9497939,0.021527126,0.025872352,-1.5576241,-0.5141268,-0.43935877,-0.13837868,0.6425791,0.6384436,1.5614647,-0.13918383,-0.6858316,0.8379925,-0.065925196,-0.7257024,-0.04891553,-0.6335837,1.1183803,1.6317704,0.12997514,0.30716583,-0.5668255,-0.48350543,0.2980625,0.27578756,-0.16334279,-0.33795035,0.443281,-0.023318605,-0.27524003,0.2234911,0.16440131,-1.4745765,-0.3351495,-0.2639343,0.44494522,-0.537051,0.6753485,0.40268216,0.36798248,0.9898357,-0.02538248,0.087571286,-0.41519758,-0.03310066,-0.62820435,0.70687175,1.4282256,-0.21697326,0.7629322,-0.24315582,-0.8834787,0.36185443,0.09620441,-0.32796913,-1.1961584,-0.14351991,0.5877696,-0.95974535,0.5074906,0.15944634,0.17056629,1.45719,0.48842645,0.9735797,-1.5758408,-0.6704931,0.31809342,0.16401944,0.15940264,0.6929548,1.3291728,-1.6472521,-0.11869807,0.28419983,-0.5012021,0.24998662,-0.8843451,0.75418,0.31516194,0.16856769,0.43008453,1.1574649,0.31188494,0.6724061,-0.8871431,-0.013860932,0.49845517,0.43129036,-0.10981209,-0.13571267,-1.1419226,-0.3269598,-0.10662761,0.66280407,0.66564494,0.5549935,0.41728568,-1.5479473,-0.7988545,-0.38048032,-0.28955835,0.84657913,-0.7183577,0.015458817,0.21850479,0.94480854,-0.4281807,-0.13157184,-0.70157397,0.2178646,0.34365076,-0.054275103,-1.3364594,0.13119245,0.3135889,1.4662734,-0.986639,0.5419822,0.319456,0.3072546,1.0644869,-0.41738725,0.18757185,0.039591674,-0.48594028,-0.2208696,0.08181416,-0.7091904,-1.3136722,0.41413742,-0.14241584,0.1790588,0.9625528,0.22960483,-1.9079535,0.51620686,0.56358534,-0.2541872,-0.2838425,-0.22404411,-0.31069592,1.3078568,0.15461378,0.43265623,0.27549642,-0.15880297,-0.009741238,1.0028337,0.62418795,-0.21442041,-0.7673392,-0.16796416,0.9235614,0.2295027,0.86262506,-0.9785497,-0.29286,-0.58836937,-0.7186894,1.8144121,0.37780112,0.06720162,-0.7220005,-0.58619374,-0.31415695,0.92562616,1.3644947,-0.28769004,0.048587583,-0.1476216,0.48847383,0.048800465,0.41472998,0.31445852,0.9640361,0.53849876,-0.3668073,0.97697425,-0.29481614,0.96908325,1.3329308,0.2172565,0.6501667,-0.43367374,0.4124353,-0.2694025,-0.705648,1.0408753,-1.1923914,-0.42660406,1.0856491,-1.2506739,-0.31559196,0.799329,-0.24163717,-0.65766525,0.7323387,-0.22736822,-0.38511893,0.03990711,-0.22136045,-0.46115372,-0.020953774,-1.1181529,-1.2810807,-0.25517836,1.5278975,0.93943864,0.18696505,0.35990873,-0.04625653,-0.7422289,0.1519297,0.5801515,0.532933,-0.51451397,-1.4898202,-1.1057618,0.52274626,0.44589424,-0.49110773,0.2772248,0.6502109,-0.09112595,-0.06156079,1.0757856,0.29837456,0.5390614,-0.8925567,-0.20976467,0.2412696,-0.3338987,-1.0340415,0.12001659,-0.7169264,0.8509277,-0.26111674,-0.045174055,0.18862697,0.12920602,1.1223581,0.18811208,-0.5614308,-0.12636173,-0.6644435,-2.3946,0.69108385,0.96187353,-0.52941144,-0.10169027,-0.42433417,-0.4147653,1.2719227,-1.0825994,-0.12084983,0.86228865,-0.1199495,-0.0042625507,-0.1153917,1.2537909,0.62913775,-0.61551106,0.0065074065,-0.8004554,-0.08681474,-0.8397198,-0.004029533,0.032684233,-0.48766518,-0.718398,-0.047690563,0.43040788,-1.093473,0.33532768,-0.9574215,0.99649024,-0.9240707,-0.6321066,0.33115742,-0.872949,-0.13443992,-1.0079261,-0.044092245,0.46281135,0.72929525,0.61514586,-0.6492653,0.67912906,0.75482446,-0.14601466,0.15141582,-0.5454835,-1.4021667,-0.1045488,-0.6656004,1.1178973,-0.54544324,0.36200574,-0.6743738,-0.69252855,-0.833438,-0.2428205,-0.6911339,-0.39393982,0.94717246,0.18973333,0.5548787,0.76712936,-0.71952885,-0.6163379,-1.2871542,0.55612415,0.62297475,0.8330283,-0.3207976,-0.39280427,0.34017995,-0.4338946,-1.2162533,-0.6963218,-1.1448833,-0.2173109,1.0866009,0.76923835,-1.6210146,-0.68066674,0.7953781,-0.18046041,0.50694156,-0.06429645,-0.5954949,0.47926646,-0.015211334,-0.76809967,-0.2681478,1.057401,-1.4796684,1.7921481,-0.37788862,-0.1743722,-0.023598243,-0.0146196345,-1.407809,0.56787276,-0.3801625,1.4663221,-0.5803877,-0.7918073,-0.06370873,0.093214914,0.439711,0.21138763,-0.38476178,-1.0621411,-0.9835392,-1.4776123,0.20814581,-0.09137218,-0.026998539,0.07734903,0.323136,0.7887512,0.4605504,0.6099996,0.6537702,1.402438,-0.29474297,0.55248946,1.1502109,1.0962318,0.8487919,1.6306745,0.67180365,0.0527231,1.7228335,0.3368963,-0.44598997,-0.37970415,-0.9709388,-1.4626068,0.42132863,0.44447348,1.1464608,-1.0766551,0.76717395,0.42669278,-0.71826285,0.07231784,-0.55651176,-0.71649754,-0.8555495,0.7439198,-0.032384943,-0.058927566,-0.9744472,0.43709886,1.432001,0.7692898,0.58525676,0.21797353,-0.35409504,1.6212835,0.2802944,-0.7898657,-1.0058486,-0.32850203,-0.08002184,0.71153843,-0.1456073,0.3455108,-1.1479715,-0.9801214,-1.980312,-0.28686732,-1.048818,-0.8290515,0.26713827,-0.029974634,-0.2614566,-1.2363356,0.26637647,-0.64673495,-0.18943085,0.9721195,-0.4330924,0.22465473,-0.4971075,-1.1473991,-0.51881146,-0.046357658,-0.57681364,-0.68288344,1.0451772,0.59721726,-0.010245152,0.15739807,0.21600531,-0.033291742,-0.45260644,-0.094012626,-0.39075404,0.06562115,-0.20827067,-0.9843245,-0.65870726,-0.35359874,-0.039009284,0.167105,-0.9416263,0.45166886,-0.5253714,-1.1281451,-0.7526381,-0.8763246,1.0808822,-0.075120375,-0.9316412,-0.78634554,-1.01292,0.39907247,-0.6036093,-0.69712585,0.06598305,-0.08919177,-0.13842414,-0.020019205,-0.49061242,-1.0648047,0.4227237,0.5730777,-0.15542641,0.86497873,-0.5868751,-1.0972252,-0.26057836,0.07292274,0.808423,0.5833188,0.42665836,2.0611665,-0.41926283,1.5202118,0.056234967,0.7959503,0.66012317,-0.31566676,-1.0310489,-0.7486871,-0.7647934]	2026-02-13 17:02:44.899758	\N	\N	\N	{}	2026-02-13 18:56:13.881649
9	external.bff_customers	4	public	--- Entity: bff_customers ---\ncompany: XYZ\naddress: Street 98\ncity: Miami\nzipcode: 33251\nidstate: 1\nidcontry: 1\n\n> Related bff_state:\n  bff_state_name: Alabama\n\n> Related bff_country:\n  bff_state_bff_country_name: United States\n  bff_country_name: United States	[0.050435454,0.68456525,-3.6873713,-0.14659017,1.5494806,-0.9963467,0.44279402,0.17190921,-0.30038846,-0.9633401,-0.60379094,-0.5449608,1.401964,-0.09734078,0.29952478,-0.6949662,-0.59797794,-0.012892567,-0.61587274,-0.8076681,-0.965933,0.2449563,-0.2633565,-0.4751657,0.357028,0.20290913,1.2180374,1.0009327,-1.5325401,-0.054444775,-0.13952449,1.4401523,-0.19888242,-1.213728,-0.6633625,-1.1568941,0.32031548,1.0678589,1.0597001,0.72995055,0.88313496,0.76892656,0.30042934,-0.7806928,1.0572118,0.11131512,1.0411218,0.37487495,2.2996984,-0.25152767,1.114249,0.95442,0.04764945,-0.11355561,0.77283335,-0.48878813,0.49233297,0.77918166,-0.98682404,0.5312961,1.7055378,2.1785045,-0.46410894,1.726846,1.0303364,0.6547884,-1.2750615,0.72693557,-0.9167025,-0.6685991,1.3788848,0.34808645,0.19255929,0.7580464,-0.58590186,-0.12113441,-1.723098,-0.7701857,-0.30984703,0.06318469,1.3813324,0.36751103,0.9195127,-1.1505089,0.66445935,0.3482492,0.10791081,1.468965,-0.2986842,0.024297848,-0.46642965,0.52207637,1.285075,0.1060452,-0.86933017,1.0984304,-0.7023209,-0.36535442,-0.9447596,-1.5518851,-0.2934418,-0.335518,0.7002944,0.80281866,0.42243624,0.2388016,-0.12263006,0.022676155,0.0731944,-0.24300951,-0.73792857,1.1808573,0.005974085,-0.16467547,0.19307765,0.051839795,0.41439003,-0.42132002,0.6123332,0.6909617,-0.49690592,-0.6647643,0.21887343,0.86084557,-0.35112473,0.3700105,-0.78030765,0.5146529,0.30634946,-0.1263969,-0.14000732,-1.07909,0.15912557,-0.491644,-0.7923068,0.5888603,0.15765376,0.023739465,0.16877925,0.9583486,1.4008033,0.074931905,0.49250004,-1.5419126,-0.09952917,-1.4774032,0.39546135,-1.3993067,-0.15375277,-0.118138246,-0.042372227,0.66328114,0.05101791,0.74909043,0.93841803,-0.88694596,-0.1954077,0.056066643,1.1122897,0.39677927,0.89615846,0.15268897,0.059925944,0.08794807,-0.27273798,-1.3974458,-0.5547106,1.4972512,-0.15761143,0.44813964,-0.8924409,-0.39751422,0.2723891,-0.19465771,-0.10075265,-0.47719783,-0.009481162,0.78799796,0.15681972,-1.2697042,0.73609334,-1.2049456,1.1573708,0.800781,0.0704018,-0.03692226,-0.3597833,0.26145777,-1.1160371,0.09517123,-0.7724042,0.9131696,-0.07076533,-0.5329903,-0.93814856,-0.6110354,0.5580976,-0.33009037,0.596143,-0.38035494,-0.4603779,0.76592255,-0.51726854,1.0160577,-0.80143344,0.92490685,-0.6731258,-0.09911807,0.09822463,0.36008707,0.4710132,-1.2579874,-1.3248805,0.69850296,0.25118116,-0.06002317,0.117191195,-0.4000166,-1.3548148,0.40240103,1.3383663,0.26378885,1.4814348,-1.2355156,1.5096229,0.32540542,-0.69559085,-0.015864233,0.25916582,1.1501791,-0.51506644,-1.3530784,0.9498209,0.19156788,-0.3560856,0.8699683,0.11089237,2.265498,-0.51102924,0.29284465,-0.43589792,0.66157764,0.3387663,0.90720797,-0.92964685,0.84212005,-1.0116811,-0.95479834,0.9703017,0.6491535,0.50426626,0.22110733,-0.1794015,0.94039696,-0.2702189,-0.71165824,-0.45880672,-0.2169261,-0.2235246,-1.0459219,0.26793015,-0.5196741,1.8874414,-1.2866417,-0.8629612,-0.7981193,-0.5955879,0.22143334,-0.45480227,-0.34795383,0.529767,0.37107873,0.38704413,0.29521793,0.3817328,-0.07366235,0.3194211,-0.4105869,-1.0689027,-0.101178646,0.18694882,-1.5545921,-0.31008688,0.071035676,-0.03604051,0.31068766,0.6991021,1.1555624,-0.06957446,-1.2033838,0.70393914,0.042695366,-0.5626419,-0.32485893,-0.6736607,0.9683552,1.4282689,-0.34428778,-0.0039955415,-0.6554388,-0.32132187,0.41943565,0.29701835,-0.28694925,-0.22852735,0.459554,-0.41165343,-0.23656936,0.24389607,-0.34035915,-1.2260637,-0.31387293,-0.35913366,0.4627256,-0.7522062,0.7733718,0.11626758,0.44038662,0.99290836,0.13588604,0.08756134,-0.33777887,0.083852455,-0.69261014,0.78568745,1.6833878,-0.076973915,0.8824084,-0.210241,-0.6129957,-0.014207207,0.06282027,-0.4493556,-1.3203299,0.15469775,0.74394625,-1.4763343,0.2948015,0.098938055,0.7566181,1.7053119,0.6546668,1.009752,-1.777941,-0.47133827,0.44410104,-0.015790572,0.27456504,0.52352846,0.90279627,-1.4675355,-0.018594146,0.096576706,-0.52473724,0.36346895,-0.7103147,0.78529006,0.02296415,-0.101061046,0.56807095,1.2444568,0.24548803,0.77770567,-0.910406,-0.09075585,0.426814,0.77435994,-0.17562045,-0.1259057,-1.2761166,-0.54434335,0.017283736,0.74905574,0.8949573,0.22081807,0.3162143,-1.3340089,-0.7969173,-0.41624826,-0.21455854,0.59685934,-0.40636188,0.02574557,0.23432562,0.94461775,-0.5800468,0.0638257,-0.6524123,0.6604419,0.79120624,-0.16759165,-1.3901229,0.080420226,0.1313838,1.272932,-0.8561748,0.6295358,0.048993614,0.5564449,1.0762495,-0.27200574,-0.12319526,0.07650685,-0.64406383,-0.120133646,0.3381849,-0.9316144,-1.4129319,0.5168615,-0.33136255,-0.0020579193,0.99887574,0.31170517,-1.8053275,0.6324928,0.62435204,-0.04130456,-0.39653236,-0.18824229,-0.16514495,1.3154485,-0.15597121,0.47316474,0.37527007,0.23101847,-0.11924839,0.8678692,0.5183368,-0.44206268,-0.75132823,-0.054519676,1.1495501,0.1950903,0.7355653,-1.0477667,-0.41481292,-0.5523587,-1.083699,1.5079296,0.91884446,-0.13317543,-0.75691193,-0.57320225,-0.4742019,0.51921475,1.1638618,-0.10841441,-0.040184785,-0.31152317,0.27911606,-0.15821122,0.62346905,0.2616097,0.88642967,0.5024448,-0.24152024,1.0640826,-0.3100596,0.55784976,1.4369974,0.56768477,0.31373155,-0.5720028,0.22755828,0.013237894,-0.8020789,0.8388282,-1.1445752,-0.6479748,0.7759023,-1.1938664,-0.20149359,0.9574454,-0.061928384,-0.4411734,0.93217635,-0.49328512,-0.43583235,0.26100853,-0.1456246,-0.57370734,0.0017567798,-0.5940652,-1.5313015,-0.10220895,1.2238755,1.0786422,0.52390045,0.322668,-0.23312539,-0.53793687,0.17592368,0.63342893,0.40886158,-0.6038661,-1.0838157,-1.0205832,0.33571452,0.47178262,-0.26847827,0.32638097,0.6938407,-0.004893465,-0.08674919,1.1861234,0.07952904,0.5959759,-1.1323297,-0.6351837,0.013676843,-0.6419853,-0.5062512,0.22144619,-1.0331563,0.7332165,-0.089548714,0.08947161,0.2347728,0.2738039,0.96744543,0.11479155,-0.723853,-0.39116588,-0.63571817,-2.4365015,0.7268235,0.79806566,-0.8473223,-0.21895805,-0.30889624,-0.32062405,1.2171793,-0.81371725,-0.17140737,0.748224,0.12308245,0.019169094,-0.123807415,0.9991616,0.7283925,-0.47537372,-0.3034054,-0.7036768,-0.1968713,-0.7091584,-0.097980544,0.29072154,-0.6556019,-0.818186,-0.10019131,0.5383631,-1.2424498,0.1878138,-0.99640054,1.137963,-0.8686146,-0.8157631,0.37926018,-1.2303677,-0.22327462,-0.90821147,-0.34563643,0.5929607,0.60687876,0.60347694,-0.6525564,0.49528965,0.5556601,-0.07708368,0.21498108,-0.45624945,-1.2456615,-0.05275898,-0.35959786,0.79838896,-0.5183339,0.37673214,-0.46028447,-0.62303025,-0.62609804,-0.29507428,-0.57461953,-0.6451965,1.0888232,-0.088366166,0.5971538,0.67409134,-0.17814794,-0.65779734,-1.2923493,0.5957856,0.6502967,0.9659627,-0.2171753,-0.24718857,0.3665714,-0.3156316,-1.0270957,-0.48599377,-1.0390327,-0.12738201,0.82978857,0.86937773,-1.4469358,-0.49828482,0.6986181,-0.058687232,0.8323685,-0.19968219,-0.508238,0.4566485,-0.1656821,-0.4582926,-0.31140053,1.3224612,-1.4023187,1.4810147,-0.23608951,-0.093033396,-0.41897938,-0.21948034,-1.4562869,0.29073024,-0.24324836,1.3273189,-0.13626932,-0.7880169,0.060615495,0.2141124,0.44574985,0.23990642,-0.118116915,-1.1508636,-1.0123992,-1.6335862,0.48862523,-0.2639908,0.024519658,-0.17435567,0.4498132,0.7773405,0.32834834,0.5362737,0.5760393,1.2246141,-0.062468532,0.4852271,1.2952907,0.9529154,0.5184083,1.6923908,0.7013843,0.076235265,1.471533,0.482607,-0.45251757,-0.18191984,-0.7892705,-1.2149414,0.2995216,0.336043,0.8451227,-1.1860292,1.017755,0.566943,0.0768213,0.35418195,-0.37614048,-0.50974655,-0.95145226,0.718773,-0.00034451857,0.118932925,-1.1491601,0.34374803,1.2959745,0.6964834,0.7171295,0.015102252,-0.4344019,1.7184324,0.11100367,-0.72422755,-0.7831827,-0.4261225,-0.084184915,0.8169816,-0.14456195,0.33526793,-1.1441402,-0.9930501,-1.7433774,-0.5343301,-0.99431384,-1.0095253,0.19819355,-0.01149081,-0.07851211,-1.192439,0.69208217,-0.46166116,-0.35004482,0.7982946,-0.063457884,0.32736194,-0.47971332,-1.1341975,-0.570933,-0.13780354,-0.6964086,-0.3312694,1.0397849,0.56919205,0.28724688,-0.03600757,0.4523781,-0.03710124,-0.078423314,-0.26157397,-0.12145934,0.2282706,-0.13290307,-0.5134809,-0.7441676,-0.30897525,-0.20514238,0.010050172,-0.87119806,0.72237813,-0.5699966,-0.8946297,-0.60029435,-0.7151214,0.97762823,-0.31429553,-0.74545825,-0.6895909,-0.85612667,-0.038323347,-0.5504044,-0.76317924,0.16542336,0.080121696,0.16206488,-0.3003829,-0.5372238,-0.79828596,0.51393706,0.9577655,0.2182702,0.40554476,-0.6140743,-1.1834881,-0.61984265,-0.37262183,0.7110671,0.2423619,0.632117,1.8897913,-0.27022073,1.4974582,-0.0083210245,0.6249825,0.87652475,-0.59617996,-0.7656394,-0.79263777,-0.8318975]	2026-02-13 17:02:45.008209	\N	\N	\N	{}	2026-02-13 18:56:13.984849
10	external.bff_customers	2	public	--- Entity: bff_customers ---\ncompany: Acme Corp\naddress: 123 Ocean Dr\ncity: Miami\nzipcode: 33101\nidstate: 1\nidcontry: 1\n\n> Related bff_state:\n  bff_state_name: Alabama\n\n> Related bff_country:\n  bff_state_bff_country_name: United States\n  bff_country_name: United States	[-0.2494289,0.7509799,-3.7165456,-0.43580854,1.425518,-0.6848866,0.67648727,-0.27708498,-0.7712971,-0.8005917,-0.3272544,-0.27653146,1.62014,-0.02465705,0.55651,-0.45671287,-0.37336928,-0.09285657,-0.6978762,-0.9647093,-0.9055417,-0.31061834,-0.5450127,-0.3153555,0.86546874,0.585456,1.6696477,0.7356352,-1.6631742,0.46074387,-0.092243925,1.0010114,-0.1491335,-1.3775792,-0.5644128,-1.1215585,0.75936455,0.98987424,0.91137046,1.1750417,1.3726066,0.2227129,-0.12735526,0.11529815,0.96131694,0.41894656,0.71366924,-0.3849236,2.1244984,-0.66909313,0.9852057,0.38217133,-0.3523931,0.5199262,0.42733723,-0.29979068,0.61551756,1.1129451,-1.0436987,0.074346446,1.7969875,1.769391,0.1563613,2.3934877,1.0110725,0.94164896,-1.3106422,0.54417914,-0.5223136,-0.772959,0.6910393,-0.22889744,0.40218845,0.36609015,-0.67020637,-0.21927534,-2.00469,-1.1146461,-1.0165484,0.004930335,1.335587,0.45141226,0.6050314,-1.1501604,0.79628676,0.39844143,0.102495216,1.4848716,-0.25706747,-0.3491904,-0.21398635,0.6286951,1.1710716,-0.3619648,-0.41113642,1.2553445,-0.35089657,-0.3259265,-0.87426114,-1.6115693,-0.5107988,-0.22780794,0.7826757,0.95268464,0.48445642,0.63382524,0.14194863,-0.27870935,0.8244992,-0.08136595,-0.3811881,1.0240756,-0.30968884,0.052350864,0.29366213,-0.13225904,0.44934854,-0.0777127,0.35765475,0.9901058,-0.62593055,-0.5012611,0.5418405,0.49658436,-0.24862002,0.5638207,-0.554289,0.7646972,0.583469,-0.28577825,0.45216823,-0.8555284,0.11275605,-0.7296766,-0.8535567,0.4918125,-0.2666857,-0.10002652,0.7202588,0.74403214,0.7867684,-0.025772275,0.944069,-1.0867828,0.0069380235,-1.2742133,0.016167348,-1.1055932,-0.2833469,0.1786699,-0.07061228,0.6077629,-0.63547885,1.2397918,0.5544495,-1.0234972,-0.2822291,-0.19395633,0.9353125,0.45497113,0.9679531,0.30648512,0.42696857,0.20761412,-0.34214565,-1.1423999,-0.087925486,2.0175295,-0.42867845,-0.01992671,-1.1006907,-0.6751115,0.13245615,-0.6194916,0.103762366,-0.73268634,-0.17288801,0.37005886,0.6587519,-1.708748,1.1033974,-0.8202292,1.277944,0.918214,-0.43722576,-0.11951918,-0.3337014,-0.12801094,-1.0668135,-0.43144712,-0.56756806,0.6207981,-0.04850317,-0.833904,-0.70806664,-0.44367877,0.43120015,0.050390486,0.6294745,-0.36801976,0.09545829,0.99555635,-0.24244693,1.2411333,-0.45242095,1.0012285,-0.2266545,0.3541051,0.33889505,0.4478198,0.8214416,-1.1765559,-1.5330707,0.24907614,0.10492945,0.040146045,-0.10478432,-0.5326802,-1.6258157,-0.11040908,1.3012085,0.10982445,1.1470484,-1.0908625,0.9677669,0.36336753,-0.9475975,-0.30648887,-0.089251794,0.86632836,-0.6652934,-1.2859151,1.2297761,0.38083452,-0.17981428,0.3020826,0.33095646,2.0692992,-0.67693615,0.17310126,-0.29575118,0.75053,-0.1617336,0.5855001,-1.0152106,1.2533677,-0.7846679,-1.1069255,0.5355265,0.9055392,0.26958662,0.09857286,-0.43190736,0.6384863,0.19845149,-0.073333964,-0.21419735,-0.13871525,-0.24841659,-0.71827155,0.17060402,-0.80482984,1.9889746,-1.3099111,-0.9950566,-0.58351624,-1.0458468,0.120102584,-0.15493357,-0.15404822,0.821746,0.7636016,-0.22158487,-0.18031138,-0.5497201,-0.44807577,0.45890993,-0.7109886,-1.2002578,0.07319647,-0.16698895,-1.4031769,-0.27083626,-0.5707334,-0.09347453,0.09729521,0.4398952,1.377234,-0.024176631,-0.92135566,1.0270995,-0.20918217,-0.40344805,0.17801218,-0.8325417,1.0249032,1.5159565,0.20152707,0.17076267,-0.6647801,-0.6570373,0.36443177,0.2846516,-0.2489539,-0.28187978,0.55190337,-0.21683167,0.18752487,0.6633156,-0.31845564,-1.3800024,-0.4005351,-0.29762542,0.05426258,-0.5092372,0.69756514,0.18109635,0.11473097,0.9875088,-0.47855082,0.24235313,-0.57274574,0.034512322,-0.7123418,0.75110745,1.3872811,-0.13152984,0.97152066,-0.5754331,-0.9495208,0.42111662,-0.04730131,-0.09188614,-1.0842456,0.080934905,0.6522965,-0.5562183,0.56917644,0.15614098,0.5802055,1.2203002,0.78869545,1.1148674,-1.6902521,-0.3773136,0.20156339,0.21171497,-0.017286818,0.75051796,0.9908294,-1.6265056,-0.1596229,0.5829085,-0.62137157,0.246237,-0.94909215,1.0173285,0.22904955,0.27895087,0.26165554,1.2839179,-0.12911856,0.41783488,-1.121115,0.023697158,0.46482587,0.79513854,0.40188372,0.28107196,-1.2234654,-0.49232006,0.05487018,0.71112454,0.7541213,0.42075723,0.24770905,-1.6397424,-0.77787817,-0.3236962,-0.43489712,0.951834,-0.56052554,0.19945161,0.31729457,0.9011905,-0.5165933,-0.00087137683,-0.49396366,-0.053217918,0.60144305,-0.04568059,-1.6343955,-0.421827,0.52992517,1.5996013,-0.5720546,0.53345656,0.52877647,0.12846708,1.1690114,-0.30634254,-0.07020788,0.10656986,-0.121063516,0.04969503,0.20140974,-0.62371385,-1.0336287,0.31766686,0.2685808,0.40533784,1.4500397,0.22983651,-1.8298086,0.5593752,0.27387354,-0.12851475,-0.2704688,-0.4093881,-0.3079903,0.9469386,-0.05077055,-0.20556986,0.47960815,-0.0751386,0.046325784,0.89238435,0.2934559,-0.5519849,-0.95799375,-0.5258999,0.9458239,0.018872807,1.0500124,-1.1062479,0.080574036,-0.45267782,-0.80984056,1.6346027,0.5809743,0.06441391,-0.6936858,-0.762982,-0.62071884,0.68005437,1.3130666,0.3159392,-0.012935343,-0.49222666,0.7718783,-0.12772252,0.4382264,0.2771582,1.1699373,0.21464041,-0.21685113,0.7552094,-0.20284317,0.55718654,1.2448776,0.42230383,0.5139155,-0.53816664,0.361776,-0.1617043,-0.8257641,1.1866283,-1.0301366,-0.83581024,1.1717072,-0.9234275,-0.32640034,1.0258267,-0.28915024,-0.54810274,0.9351001,-0.384985,-0.21779789,0.019353162,0.08339842,-0.4786984,-0.22750188,-1.1953071,-1.1513501,0.10877003,1.288954,0.8940068,0.4631243,0.39124498,-0.5929997,-0.6200532,0.2742691,0.60034513,-0.117932,-0.31625286,-0.88616586,-1.0340073,0.66518563,-0.022597548,-0.29394442,0.20838122,0.9125032,-0.14571784,-0.21091658,0.84836054,0.1894956,0.2367992,-0.6745382,-0.15729341,0.26637673,-0.10893133,-0.76299673,0.080220275,-0.6484916,1.1125145,-0.04384188,0.23128593,0.119926855,-0.116957255,0.72312224,0.30790097,-0.90924406,0.0050899656,-0.48389462,-2.298614,0.7415311,0.9913734,-0.47087967,0.16844995,0.061141137,-0.29717487,1.294919,-0.5945888,-0.008217751,0.7027399,0.106775954,0.034740187,0.22817746,1.2748046,0.61117387,-0.4845313,-0.521765,-0.85898453,-0.15441826,-0.49456662,0.33123282,0.5922395,-0.56580347,-1.3024709,-0.09014249,0.5929093,-1.1543887,0.6489317,-1.0216694,1.4210374,-0.9767609,-0.999022,0.41812164,-0.8439712,0.3676601,-0.9741463,-0.23251127,0.99002314,0.70664054,0.99935496,-0.53128946,0.7345455,1.016694,0.11099105,0.5936428,-0.32118592,-1.5606054,-0.47501105,-0.90256846,0.685848,-1.024493,0.28567553,-0.42147964,-0.7335143,-0.8920568,-0.10101638,-0.9229225,-0.3527508,0.6176776,0.018024616,0.6906873,0.60997844,-0.92000747,0.022630975,-0.88133687,0.7964041,0.5647304,0.6869215,0.22276695,-0.4352085,0.64402723,-0.22933191,-1.3580433,-0.5173317,-1.2626506,-0.1908952,1.1011636,0.88285923,-1.7758427,-0.64382,0.7673131,0.076933235,0.9260781,-0.45237052,-0.8719786,0.28236017,-0.44906944,-0.67059195,-0.0095326975,1.1774884,-0.9160623,1.6213789,-0.32291034,-0.39221004,0.09334833,0.2668065,-1.1131018,0.8050493,-0.6368148,1.077989,-0.7273874,-0.47072312,0.14025088,0.28022647,0.2596132,-0.000915674,-0.18916237,-0.8001166,-1.3476734,-1.5967987,0.31755534,0.003615227,-0.67770004,0.42837656,0.659841,0.8747387,-0.034126636,0.26295575,0.6992123,1.4762176,-0.28454995,1.0258003,1.133374,1.031875,0.7602216,1.4150349,0.8629304,0.11549662,1.6608319,0.37579748,-0.51946,-0.4814638,-0.9446254,-1.3088433,0.32834518,0.16365977,0.6651112,-0.75782025,0.6388717,0.48730096,-0.91665506,0.1500819,-0.1459449,-1.0588593,-0.76925224,1.1879711,0.06342725,0.19067137,-1.2113096,0.066438824,1.0623908,0.88235533,0.4914653,0.11458574,-0.32314065,1.9340781,0.11462085,-0.64730406,-0.50851387,-0.107137635,-0.029704206,0.94627607,0.10471465,0.4986518,-1.3231431,-1.0570824,-1.7466664,-0.8534727,-0.7370185,-0.98067963,0.37882823,0.25845468,0.0385029,-1.1953743,0.55350816,-0.329517,0.29793087,0.6856337,-0.77201366,0.065854035,-0.28177536,-1.3932729,-0.5726585,-0.3288877,-0.6847807,-1.2307636,1.3569348,0.2720885,0.17184325,-0.026768055,0.5730436,-0.31433752,-0.3753043,-0.48010755,-0.11842335,0.11234017,-0.44989815,-1.184519,-0.7921027,-0.44302782,0.042748645,0.1333635,-0.7785113,0.6405405,-0.7464187,-0.78592384,-1.1006047,-1.2506975,0.8601817,-0.20334227,-0.7766643,-0.33880827,-0.8018881,0.3017226,-0.88560456,-0.7701298,-0.15154143,0.29324165,-0.047089994,-0.028750226,-0.7535572,-0.59397143,0.19004865,0.5461876,-0.21208747,0.57224363,-0.5692681,-0.83310133,-0.07796152,0.15203464,0.52370745,0.85845256,0.26318142,1.6567134,-0.68002003,1.373791,-0.104002126,0.6195721,0.8386885,-0.17125082,-0.53213567,-0.7623485,-1.2854984]	2026-02-13 17:02:45.105088	\N	\N	\N	{}	2026-02-13 18:56:14.088229
11	external.bff_customers	1	public	--- Entity: bff_customers ---\ncompany: sdsd\naddress: sdasd rwgfewr\ncity: dddd\nzipcode: 33695\nidstate: 1\nidcontry: 1\n\n> Related bff_state:\n  bff_state_name: Alabama\n\n> Related bff_country:\n  bff_state_bff_country_name: United States\n  bff_country_name: United States	[-0.013448425,0.5313077,-3.7213235,-0.5519612,1.1004565,-0.531772,-0.188638,0.22826067,-0.065705046,-1.2829239,-0.28624564,0.06799722,1.7470063,-0.17596923,0.48836595,0.19918808,-0.75919956,-0.72285956,-0.75808287,-0.8724226,-1.0189748,0.44420254,-0.20884562,-0.6180604,0.7701556,0.47909558,0.99402446,0.4938805,-1.8383942,0.55135643,0.051394634,1.4138145,-0.20160735,-0.96379256,-0.85176075,-1.4046226,0.62336546,0.58106697,1.2289417,0.73832417,0.5012305,0.7441134,0.24862146,-1.0120466,1.0696467,0.13609834,1.0661747,0.00814913,2.729486,-0.114242986,0.79143655,0.7113621,-0.32172313,-0.3372313,0.14780039,-0.8715213,0.020211067,0.43131578,-1.4691472,0.18705195,1.0460927,2.184501,-0.7553138,1.6818898,1.0811365,0.8613168,-0.9486057,0.22096886,-0.09313165,-0.96671,1.5588342,0.34319502,0.42098475,0.45511365,-0.4139032,-0.487176,-1.5207946,-0.91954577,-0.45327392,-0.05101715,1.1210223,-0.15033098,1.3104796,-0.98522425,0.7296678,0.76013786,0.48060825,2.119532,-0.20010033,0.3468154,-0.48302007,0.46029222,0.8470562,0.15715683,-1.00874,0.98745406,-0.92051363,-0.0727517,-0.9489034,-1.0759251,-0.7724271,-0.6482185,0.8971323,0.9125531,0.33348632,0.600844,-0.20890611,-0.13733143,0.19729842,-0.32035476,-1.4657576,1.1711599,-0.36236683,0.21053244,1.023127,0.17746882,0.18536377,-0.85550267,0.08243999,0.5492835,0.16378568,-0.5045862,-0.038855184,0.51512855,-0.37984496,0.6605071,-1.2440392,0.46105865,0.91301143,-0.02073878,0.10726076,-0.87091297,-0.27793002,-0.5188457,-0.25603157,1.2078214,0.16648093,0.41951698,0.009235788,0.7317343,0.5557797,0.041203327,-0.0036445335,-0.8652139,0.11395166,-1.445523,0.5911407,-0.99664664,-0.6456245,0.15888266,0.035297446,0.33432385,0.093595296,0.5194844,0.49761337,-0.8414966,0.099231385,-0.086642966,0.86284983,0.39972115,0.6972057,0.32667285,-0.2259283,0.5189649,0.29551065,-1.3902317,0.57979155,1.7727318,-0.0263857,0.52145696,-1.0622616,-0.65976846,0.52221406,-0.3498953,-0.11247379,-0.28282952,0.015255168,-0.112368986,0.116791725,-1.4643707,1.038512,-1.2551192,1.9179033,0.6589285,0.41034496,-0.19768824,-0.35953254,-0.1937958,-0.7787927,0.22114885,-0.41462988,1.2068468,-0.24973258,-0.7634795,-0.8067544,-0.79387164,0.75709033,-0.24447909,0.9356582,-1.0705255,-0.5923375,0.74475557,-0.44251487,1.0845513,-0.49446332,1.4830364,-1.4028658,-0.07967396,-0.1933096,0.37045068,0.91339463,-1.1801293,-1.5904108,0.426627,0.4077413,-0.51734906,-0.36742207,-0.45233953,-1.777464,0.38502535,0.97059345,-0.2756049,1.0486603,-0.9561528,1.1486733,0.10961975,-0.9186504,0.15284647,0.49418917,0.63150406,-0.580274,-1.6223712,0.6808928,-0.1956933,0.2449257,1.1953524,0.4921944,1.4785779,-0.48522568,0.09198127,-0.51140183,0.37362465,-0.015294582,1.2420268,-0.8396505,0.8629581,-0.8851247,-0.81182885,0.9363781,0.4969225,0.5359595,0.29343793,0.1445385,1.0416234,-0.09490564,-0.43924022,-0.7226225,-0.34971833,-0.11304505,-1.0828952,0.49752313,-0.9823245,1.5616868,-1.0735987,-0.96154034,-1.074723,-0.6215205,-0.14041223,-0.5610095,-0.53773504,0.46833077,0.069461085,0.34544796,0.29177964,0.11268678,0.61907446,0.78474927,-0.3167734,-1.1559029,0.2720239,0.23807305,-1.2050514,-0.7754419,-0.41367403,-0.23742422,0.5918526,1.0234356,0.98177385,-0.1113292,-0.6877361,0.6699615,-0.04213991,-0.7123345,-0.12007374,-0.4529871,0.7499368,1.209805,-0.25209174,-0.4340548,0.010403529,-0.50411195,0.05843244,0.6236092,-0.23568131,-0.648998,-0.0049503297,0.56983995,-0.17339589,0.22649908,-0.24454236,-0.8848764,-0.12981278,-0.52679825,0.04712221,-0.7948085,0.27144223,0.3601569,0.72062105,1.1383554,0.28535697,0.24630776,-0.30314037,-0.15456294,-0.7122656,0.3729095,1.6976907,-0.3796881,0.7391237,-0.28682625,-0.5749421,0.09934342,0.16546753,-0.42972863,-0.42915183,-0.25307712,0.7106239,-1.7758024,0.27124393,0.07502866,0.9216388,1.996424,0.47352883,0.95431006,-1.2842473,-0.25182527,0.7141025,-0.27148598,0.07991449,0.43765888,0.93250054,-1.7155615,0.055088207,-0.07773668,-0.5597006,0.5087913,-0.70687807,0.43476775,-0.10504171,0.19680093,0.21047892,0.7428466,0.51238894,-0.017841129,-0.5641397,0.18597709,0.69796383,0.94043994,-0.39234734,-0.10752112,-0.90870845,-0.34270424,-0.47948277,0.9584973,0.6903302,0.5466223,0.7053868,-1.443193,-0.6168126,-0.34924173,0.07379006,0.1329014,-0.017590769,0.3229212,0.40127724,0.1009713,-0.8181352,0.24969056,-0.34174305,0.3310115,0.77178967,0.07027015,-1.511319,0.04664633,-0.094344996,1.014165,-0.60671794,0.55783236,0.47107387,0.5829352,1.1650417,-0.083184965,-0.26380646,-0.24199456,-0.60925627,-0.16408819,0.36027676,-1.1386074,-1.3291252,0.7972501,-0.11705075,-0.3026943,0.7486151,-0.13597214,-1.3023994,0.5887032,0.4591405,0.38798362,-0.38134423,-0.43513918,0.19510454,1.5009154,0.07677074,0.11622779,0.5407866,-0.0029956773,-0.054910418,0.96754974,0.7754804,-0.6034938,-0.7051629,-0.09948843,1.0545225,0.2676654,1.2294428,-0.9326724,-0.3384027,-0.110414855,-0.6269274,0.7434602,0.62817013,0.21637803,-0.83210176,-0.23168378,-0.3286406,0.8313039,1.2598447,0.22075158,-0.30725855,-0.22877687,0.53568834,-0.10936329,0.8774184,0.039843388,0.8414761,0.72985387,-0.086933896,0.8951076,-0.07350418,0.19089457,1.4046015,0.7097701,0.8166458,-0.5620226,0.15024239,-0.67225677,-0.8791374,1.0179434,-1.5078585,-0.41675073,0.72430056,-0.8895602,-0.44983652,0.44696337,-0.007669866,0.13030347,0.94985634,-0.5525694,-0.66272235,0.118265465,-0.06870118,-0.34450328,0.16396205,-0.033057813,-1.3741848,-0.1217542,0.94868255,1.1889453,0.72652334,0.35405552,-0.879347,-0.87111974,-0.1540289,0.47793967,0.9279607,-0.36586106,-0.9452406,-1.0441056,0.59093016,-0.37767473,-0.09753986,0.32214957,0.6949061,-0.0108210575,-0.4718172,1.3415072,0.3579815,1.0140722,-0.99136686,-0.5593008,-0.15064645,-0.751265,-0.35267317,0.73508906,-0.94833636,1.0278832,-0.12618893,0.30266508,0.23391482,0.006369643,0.7731906,-0.3049804,-0.8075426,-0.24771263,-0.7101171,-2.069002,0.56960535,0.8063265,-0.47300315,-0.23880942,0.11020821,-0.070569724,1.0582227,-0.66525686,0.11613652,0.92930526,-0.25326183,0.43604487,-0.031573426,0.7478243,0.6003623,-0.6421033,0.13806671,-0.9793019,-0.74392974,-1.0251846,0.07292481,0.28473863,-0.8150047,-0.94989836,0.13590324,0.47291338,-1.069755,0.04186797,-0.96295977,0.7417474,-1.1712103,-0.50200784,-0.07512188,-0.85301185,-0.5889411,-0.9718202,-0.12627698,0.101290464,0.7432164,0.5863361,-0.80552375,1.0752853,0.51758784,0.11434536,0.11309043,-0.7438002,-1.4222937,-0.04212465,-0.3448736,0.43470636,-1.0462527,-0.05891663,-0.27846736,-0.13531202,-0.47213584,0.14949569,-0.37566453,-0.4529438,1.5127876,-0.17738917,0.46552205,0.54180884,-0.1684686,-0.51092666,-1.2198664,0.6251036,0.7808135,1.0712562,-0.40185046,-0.849041,0.160229,-0.013981375,-1.0382389,-0.6750214,-1.2307174,-0.020815756,1.0813003,1.0112267,-1.3606329,-0.12670334,0.5503532,-0.23059712,0.30956513,0.23575667,-0.10222614,0.77254105,0.12689343,-0.58355284,-0.042568445,1.0892912,-1.4832156,1.040698,0.34330997,-0.22760566,-0.57221633,0.064035244,-0.59551895,0.5065028,-0.28588104,1.5970968,-0.39780772,-1.1550024,-0.34751916,-0.15838797,0.46223128,0.051655404,0.030075058,-1.2169296,-1.2377594,-1.1192305,0.9100735,-0.09873628,0.25729182,0.016205877,0.57408977,0.5467146,0.49408847,0.093753375,0.9444086,1.4511925,0.16338871,0.5117299,1.2655973,1.024173,0.37183732,2.0460038,0.9602859,0.0034467913,1.6781013,0.51381516,-0.5676533,-0.013233453,-0.54559845,-1.6901711,0.468622,0.24537131,0.17734994,-1.2729381,0.55521333,0.45412672,-0.42748418,0.5644456,-0.57123363,-0.5590583,-0.651791,0.84508485,0.048556343,0.070801616,-1.0519204,0.29165345,1.0949464,0.6920134,0.9972516,0.055828616,-0.708714,1.8272156,0.17676644,-0.42207405,-0.7741324,-0.6986439,0.030990265,1.0052899,-0.428037,0.72727096,-0.9213981,-0.97367275,-1.2135929,-0.4831019,-0.71519905,-1.1746407,-0.025329042,0.082917295,-0.12102687,-1.2212743,0.42221582,-0.7225375,0.062648416,0.756189,0.28774342,0.7416484,-0.87414724,-0.78732437,-0.18481645,-0.23293833,-0.30354202,0.23316438,0.53136426,0.18630818,-0.12963368,-0.38128215,0.8679838,-0.30397403,-0.6193471,-0.2710477,-0.10907158,0.4046398,0.025609728,-0.86516297,-0.8753469,-0.36876556,-0.28364474,0.25356856,-0.91358453,0.8746266,-0.80930614,-0.66407853,-0.34448817,-0.58346283,1.0829146,0.08931985,-0.4431311,-0.86996603,-0.55195415,-0.34404135,-0.43547028,-0.8654123,-0.05369249,0.19432104,0.10298454,-0.16327968,-0.4894796,-0.5984954,-0.022056445,0.83673036,0.35212964,0.23493008,-0.59356326,-0.95126295,-0.60372233,-0.49632177,0.5194238,0.98751384,0.8235658,1.646696,-0.14481816,1.0422677,-0.046312444,0.7610295,0.9325824,-0.56961125,-1.0703444,-1.2784603,-0.76110154]	2026-02-13 17:02:45.211837	\N	\N	\N	{}	2026-02-13 18:56:14.18712
12	external.bff_customers	6	public	--- Entity: bff_customers ---\ncompany: bbb\naddress: Street 8\ncity: Miami\nzipcode: 33251\nidstate: 2\nidcontry: 1\n\n> Related bff_state:\n  bff_state_name: Alaska\n\n> Related bff_country:\n  bff_state_bff_country_name: United States\n  bff_country_name: United States	[-0.046315946,0.8919764,-3.5880673,-0.2218356,1.3438282,-0.6483122,0.08150975,0.195473,-0.6274631,-1.2593942,-0.65707314,0.04905904,1.1958413,0.094782144,0.17388299,-1.0107148,-0.9536649,-0.36480674,-0.20588027,-0.9091025,-1.3395067,0.19215515,-0.16681151,-0.26948524,0.5190618,0.25184184,1.2664917,1.1460837,-1.4872668,-0.14357947,-0.5111639,0.97582555,-0.46350315,-1.7605879,-0.52059615,-0.73130214,0.5105222,1.0517536,0.6819416,0.021579035,1.0571247,1.0018085,-0.081799805,-0.23050316,1.0354,-0.11709975,1.3223265,0.61307204,2.054019,0.036724333,1.224777,0.57441986,0.12690724,-0.15938435,0.7894434,-0.52310044,0.4920175,1.0198803,-1.2434565,0.29915574,1.9019885,1.99063,-0.23985876,1.9235781,1.4772031,0.8215097,-1.2442546,0.9088953,-1.1803493,-0.77168745,1.2136672,0.38173237,0.5146689,1.015128,-0.79210365,-0.18461715,-2.2161155,-0.61157954,-0.50436175,0.5956178,1.548993,0.65822726,0.6850561,-1.2068933,0.86426747,0.36063802,0.0930684,1.0727932,-0.24000438,0.10009207,-0.53577346,0.83050996,1.4444578,0.5282538,-0.96755236,1.2583343,0.049400233,-0.52620393,-0.9873079,-1.1294717,-0.6522198,-0.3173767,0.22122903,0.604086,0.15517858,0.07451463,0.19124396,-0.16834149,0.23646858,-0.3484361,-0.8518272,0.84972984,0.23732944,-0.24587488,-0.30702424,0.30152026,0.4513278,-0.44505557,0.500109,0.8853637,-0.29537633,-0.8788442,-0.20531072,0.85263467,-0.4261184,0.46746102,-1.0209596,0.6032668,0.42268902,-0.31370357,0.41736203,-1.1103274,0.050596885,-0.3007536,-0.17863077,0.5628185,0.17164205,0.06308253,0.29224545,0.81551486,1.1563106,-0.053185027,0.29778525,-1.294274,-0.026069086,-1.4012319,0.12733556,-1.5382204,-0.12131573,0.36334696,0.13811156,0.30174464,-0.37007898,0.82230693,0.8372359,-0.50703233,-0.28060642,0.3404555,1.652195,0.35266033,0.6728271,0.13557872,-0.4176671,-0.07050795,-0.29324853,-1.1086025,-0.1740037,1.5911363,-0.0056005684,0.52666014,-1.186187,-0.3453289,0.17713901,-0.2698035,0.06089159,-0.31225723,-0.08113139,0.82741135,0.16591802,-0.78442585,0.6825757,-1.1677005,1.3594488,1.049555,-0.10595474,0.003624917,0.04291163,0.24867932,-0.5521243,-0.353288,-0.5711641,0.97567165,-0.08038731,-0.8229497,-1.0390177,-0.29642493,0.40492335,-0.034655895,0.64866376,-0.5821213,-0.20178759,1.1157762,-0.3815806,0.85348624,-0.8864994,1.00078,-0.2472466,-0.15229097,-0.36265537,0.27107987,0.31667277,-1.5410875,-1.3964825,0.6636413,0.2234685,-0.1942775,0.11908608,-0.085604705,-1.2451253,0.32377234,1.0172385,0.17914797,0.8669255,-1.0479662,1.6237499,0.16929083,-0.52179676,-0.3712507,-0.054979537,0.90442765,-0.7761078,-1.271107,1.2707785,0.27299178,-0.3415923,1.1534626,0.14214398,1.7306101,-0.4967547,0.47192702,-0.22848286,0.8031136,0.32075813,1.4820181,-0.9150758,0.9166017,-0.6575845,-0.9926711,0.93070984,0.7946009,-0.35946846,0.4658685,0.23654136,0.75745016,-0.0018782138,-0.29200178,-0.27774036,-0.44863155,-0.3213273,-1.1917417,0.35827094,-1.0934397,1.9130764,-0.7563503,-0.8748204,-0.66587067,-0.8349731,0.26412106,-0.4842474,-0.36012304,0.6794626,0.3571453,0.074436024,-0.011495132,0.29936287,-0.27735704,0.8987554,-0.5218997,-0.82846874,-0.0021325396,-0.12078592,-1.2855873,-0.53765345,-0.31304267,0.08053849,0.5225924,0.22528979,1.4094504,-0.16332716,-1.190189,0.45042992,0.19804972,-0.44735485,0.37361225,-0.41894472,1.108011,1.1688385,-0.047520507,0.18975192,-0.832832,-0.16483642,-0.0050469036,0.15229532,-0.4501654,-0.6922416,0.43551657,0.17248179,-0.3627814,0.054321207,-0.18362999,-1.1092634,-0.22397132,-0.7737464,0.728873,-0.5641307,1.2404456,0.3911668,0.2264018,1.1419296,-0.110680275,0.27849913,-0.5249747,0.15194671,-0.37459347,1.2184658,1.4664744,-0.22150262,0.88007045,-0.19357574,-0.5514989,-0.08605581,-0.023784142,-0.2749747,-1.4239378,-0.37295228,0.92764276,-0.9525623,0.57099414,0.13428168,0.8658463,1.5734644,0.44282046,1.0003932,-1.7261307,-0.8225714,0.37387332,0.22204503,0.14876576,0.39779565,1.0410792,-1.6179427,0.2242679,0.11713692,-0.29322693,0.38108262,-0.73776776,0.50457954,0.0026669921,0.2294001,0.17869025,1.0430009,0.15947616,1.2351447,-0.7299113,-0.012448624,0.038924064,0.73289096,-0.1268686,-0.04473072,-1.4441876,-0.39529356,-0.21756378,0.5012208,0.7539165,1.0096067,0.40391052,-1.4778919,-0.7438361,-0.5160646,-0.3933072,0.36504,-0.6217762,0.49226686,0.008325772,0.75279605,-0.5058243,-0.0022425363,-0.75139487,0.6576914,0.76033455,-0.02792771,-1.3442483,0.16169809,0.25334594,1.6413138,-0.9461844,0.5386642,-0.029780248,0.62355113,1.4701362,-0.5947819,-0.35238653,-0.14901373,-0.8812927,-0.24545726,0.40538594,-0.9113742,-1.4596138,0.2730162,-0.24177435,0.2805079,0.756312,0.24257511,-2.0480456,0.76739645,0.45136622,0.14908688,-0.32897276,-0.3204809,-0.05877075,0.9581501,-0.14463514,0.29092935,0.28156546,0.2769276,0.042827252,0.91971904,0.55633146,-0.21647613,-0.60237384,-0.15777485,1.2143095,0.24855646,0.68658817,-1.1426791,-0.39193597,-0.5384235,-0.79990363,1.8135575,0.9973373,-0.11339141,-1.1136404,-0.688233,-0.19271876,0.62212837,1.5903497,-0.013787263,0.214748,-0.22800148,0.14312905,-0.009982747,0.45901734,0.66203773,0.80015635,0.544089,0.006280209,1.374656,-0.50778997,0.3226458,1.5454102,0.6719169,0.19965981,-0.52106106,0.1929881,-0.55580115,-1.1306143,0.98194575,-1.0150635,-0.7839919,1.0538887,-1.1514478,0.18931279,0.8805991,0.17757744,-0.52839416,0.78583896,-0.44482833,-0.25234446,0.19083884,0.08405203,-0.1256657,-0.15282479,-0.87768286,-1.3425165,-0.28279707,0.9039177,0.9843028,0.114460476,0.67055386,-0.33550924,-0.57931846,0.5896219,1.0081863,0.5957456,-0.5491479,-0.9738353,-0.91290283,0.84383196,0.7515134,-0.287757,0.23380789,0.5384941,0.20116927,-0.04218778,1.0947373,0.23363778,0.036833864,-0.86058486,-0.34307504,0.7106249,-0.9119642,-0.3478109,0.014440376,-1.009838,0.71479833,-0.054229293,0.27438283,0.24479094,-0.13454844,1.0119774,0.21504787,-0.59665954,-0.17859957,-0.2475719,-2.2200403,0.69059306,0.83337444,-0.89025766,-0.01060012,-0.14405523,-0.44410658,0.90408343,-0.7116685,0.17543465,0.8922671,0.3690154,-0.26627192,0.5119376,0.8560862,1.2391262,0.017755575,0.08802383,-0.9252296,-0.3640292,-0.5388848,-0.15992345,0.609558,-0.6776564,-0.8631767,-0.04049635,0.25855145,-1.0874579,0.3791669,-0.94693214,1.3241875,-1.2851449,-0.92707974,0.44672918,-1.0040449,-0.13919121,-1.1616273,-0.07006376,0.53361154,0.7002128,1.0387427,-1.1573926,0.23617949,0.36593983,0.25711155,-0.1365059,-0.61062366,-1.5259382,0.08245232,-0.6291995,0.616459,-0.5686502,0.14105387,-0.5509096,-0.7840748,-0.4230407,-0.15567866,-0.5129883,-0.733734,1.0675589,-0.10673866,0.8745882,0.54532415,0.015309426,-0.7131343,-0.6350774,0.79881847,0.17077233,0.6759441,-0.35701856,-0.19099224,0.47874677,-0.08085093,-1.1606331,-1.1992855,-1.3973576,-0.2631049,0.5900873,0.64566994,-1.6846056,-0.5327499,1.1731554,-0.31947201,0.8425552,-0.27226824,-0.19048266,0.57971644,-0.48567143,-0.30012488,-0.11414512,1.1282668,-1.1222324,1.4555613,-0.43929705,-0.22343932,-0.19548813,0.15352227,-1.6499667,0.45323306,0.045054194,1.636121,-0.1094007,-0.9607643,-0.004190488,-0.22798575,0.734661,-0.06565161,0.10126899,-1.4029639,-0.993985,-1.4714112,0.61488444,-0.39296156,-0.060557432,-0.6036166,0.5263745,0.5743729,-0.34105372,0.3481675,0.97550356,0.9557774,-0.06984209,0.6384301,1.3382915,0.90846026,0.41080678,1.8204736,0.96582395,0.026729748,1.1711743,0.51117945,-0.7590943,-0.15732574,-0.8235298,-1.1513721,0.2860544,0.39342868,0.53399277,-1.4914635,0.8710767,1.1218954,0.006343722,0.13817015,0.11399484,-0.8083513,-1.1148455,0.6955074,-0.25493008,-0.008355049,-1.1981544,0.2855711,1.1281352,0.8766443,0.74511963,0.33288836,-0.5758821,1.6188308,0.7805762,-0.98176813,-0.5405993,-0.7616624,0.07767508,0.75671,-0.1777555,-0.00471107,-1.2912174,-1.4196781,-1.4435923,-0.7140272,-0.8228587,-0.93324625,0.12156854,0.00039847614,-0.45123988,-0.88608104,0.6219168,-0.44078436,-0.40729192,0.36573875,-0.15080445,0.20229098,-0.35985857,-1.172694,-0.29559717,-0.12640293,-0.46360713,-0.12341606,0.7603309,0.66163164,0.44228676,-0.18474032,0.10190215,-0.31036246,-0.31154686,0.16002588,-0.43292522,0.01994253,-0.046808787,-0.8313812,-0.7879506,-0.6926956,-0.66612464,-0.22561754,-0.6281658,0.34925526,-0.5970628,-1.2000105,-0.7743033,-1.238848,0.789796,-0.23840897,-0.6184611,-0.687388,-1.0025419,0.14545661,-0.45137832,-0.6885127,0.4683792,0.22874099,0.069293536,-0.15215982,-0.70904493,-0.7932521,-0.27301672,1.0971452,-0.23811112,0.5604045,-0.92363983,-0.6469192,-0.6546094,-0.92943686,0.7103004,0.31292987,0.67701733,1.5220833,-0.019459078,1.5694706,0.0032048952,0.5599558,0.6835088,-0.55919003,-0.8325422,-0.7457408,-0.33634374]	2026-02-13 17:02:45.313103	\N	\N	\N	{}	2026-02-13 18:56:14.293965
13	external.bff_customers	3	public	--- Entity: bff_customers ---\ncompany: NEX\naddress: Street 8\ncity: Miami\nzipcode: 33251\nidstate: 2\nidcontry: 1\n\n> Related bff_state:\n  bff_state_name: Alaska\n\n> Related bff_country:\n  bff_state_bff_country_name: United States\n  bff_country_name: United States	[-0.3831239,0.863699,-3.6244295,-0.21899323,1.1118394,-0.75154483,-0.56490684,-0.18173291,-0.32412535,-1.2270906,-1.0307411,-0.19124766,1.1750791,-0.050430283,0.15810362,-0.6447777,-0.55991644,0.12270797,-0.18496983,-0.9231779,-1.1069131,0.16772476,-0.24200167,-0.59770745,0.5435445,0.30110806,1.4896601,0.9871716,-1.8753107,-0.19175231,-0.014211948,0.96159095,-0.25398907,-1.3904519,-0.65937257,-0.94126964,0.40815496,1.1461185,0.8204497,0.28191182,1.0955508,1.0102907,0.055644453,-0.4795805,0.92115337,0.16168515,0.97442305,0.3223659,1.9704773,-0.22975154,0.79049855,0.8657947,-0.28208935,0.048081823,0.5884068,-0.4209265,0.103716165,1.4269662,-0.9972677,0.29437578,1.7651154,2.2217376,-0.41870546,1.7289137,1.2051022,0.72287774,-1.204405,1.1786933,-0.8000005,-0.94884557,0.95130277,0.566941,0.57268435,0.8678965,-0.653745,-0.4768172,-2.0233667,-0.6060585,-1.0954537,0.19287767,1.6955702,0.4013398,0.6627966,-1.42639,0.9668688,0.18406664,0.07072977,1.110954,-0.055901963,0.114657566,-0.53978515,1.0520699,1.390318,0.12119344,-0.68647707,1.0655444,-0.28501725,-0.56030256,-0.8294201,-1.683513,-0.3513683,-0.48685274,0.17284322,0.011249735,0.51924115,0.13337395,-0.08730046,0.3997709,0.30335766,-0.7603822,-0.5615432,1.2238809,0.09728549,-0.086804144,0.37366772,0.1362731,0.26157278,-0.7369651,0.38397595,1.3615797,-0.52658296,-0.638067,-0.011942164,1.355815,-0.4263604,0.36763304,-0.53101844,0.35749775,0.46188226,-0.26178652,0.14154024,-0.9844656,0.014666306,-0.092750214,-0.49784827,0.57324016,0.15227176,0.0008067023,0.155243,0.8826422,1.2691776,0.1248783,0.31013823,-1.607115,0.026113074,-1.6812835,0.4381254,-1.6265401,-0.2762436,0.08951305,-0.02966808,0.19194789,-0.4785904,0.94604343,0.8600584,-0.69018877,-0.16694403,0.081028506,1.1452377,0.33045378,0.83654416,0.20210129,-0.2077136,0.34999868,-0.20598027,-1.2115438,-0.08639388,1.6125367,-0.15314186,0.30746788,-0.921314,-0.5185413,0.32497317,-0.3657189,0.29021192,-0.51827484,0.2585612,0.65437037,-0.017481694,-0.92755,0.6641556,-0.99125355,1.1320465,1.008723,-0.25857916,-0.22385813,-0.026829805,0.2217222,-0.64444643,-0.27268803,-0.5250022,0.9717533,-0.17402138,-0.46311167,-1.0482397,-0.56187886,0.20776379,-0.2973441,0.70010734,-0.4528393,-0.27318552,1.0076114,-0.28938285,0.88394254,-0.6666217,0.8169916,-0.40108362,-0.31340533,-0.20722991,0.56443775,0.43119553,-1.3181696,-1.3638875,0.81651694,-0.042796053,-0.07754706,0.3875749,-0.44518372,-1.4375442,0.3085357,1.0866178,0.059097726,1.0060059,-1.1547191,1.4640977,0.022264518,-0.51591706,-0.16322976,-0.11895517,1.0605799,-0.7261867,-1.3681883,0.8140728,0.080856115,-0.43541086,1.2478654,0.2187238,2.0270462,-0.70954,0.5324369,0.08769137,0.92370903,0.11310103,1.0043386,-1.1067941,1.0398352,-1.0941843,-0.9259218,0.77977055,0.6496751,0.018746208,0.22427064,-0.39507693,0.81826705,0.29409167,-0.3641456,-0.4535691,-0.21218565,-0.3606523,-1.111835,0.078411505,-0.6911363,1.8292747,-0.9010603,-0.8819015,-0.4995607,-0.6449434,0.48843324,-0.5680429,-0.06225269,0.5821922,0.19940515,-0.09147659,0.28234074,0.28633192,-0.63757145,0.7940067,-0.23543291,-0.6253619,-0.039343797,0.12810282,-0.9807349,-0.1789123,-0.3724091,0.4210806,0.3806122,0.37580225,1.471892,-0.2795406,-1.043165,0.7765208,0.26700163,-0.5918876,-0.21558209,-0.6756372,0.961025,1.1966263,0.11495784,0.25614098,-0.6341977,-0.1288224,-0.3137329,0.3049218,-0.15230724,-0.4291565,0.1769106,0.22522227,-0.24428304,0.3979131,-0.53376776,-1.2584275,-0.143949,-0.4319692,0.82089216,-0.76897573,1.3878531,0.58827573,0.3931232,0.7962038,-0.25210306,0.301489,-0.6934836,0.054553255,-0.18172722,1.0629051,1.2757785,-0.2779528,0.93254846,-0.18905765,-0.2949111,0.28600672,-0.15189996,-0.2504701,-1.5768116,-0.054531485,1.029718,-1.1803535,0.49268204,0.069812104,1.0395323,1.207368,0.39147288,0.71907544,-1.7772173,-0.65726644,0.58565956,0.12859523,0.26888582,0.6317004,0.9485072,-1.8507802,0.1794294,0.07951912,-0.48265356,0.16646855,-0.64615804,0.44067803,-0.30067295,0.0070178034,0.6639779,1.1791065,0.14022025,0.9373636,-0.98057514,-0.28864372,0.047433104,0.82734144,-0.16204205,0.037693497,-1.1533048,-0.3406829,0.17078269,0.52478874,0.5832514,0.55590314,0.4591314,-1.4930549,-0.65572083,-0.703939,-0.19000983,0.37446412,-0.88870764,0.54200363,-0.05905606,0.73291594,-0.43212906,-0.010725409,-0.7417642,0.65128464,0.57564616,-0.09160565,-1.1423844,-7.850584e-06,0.24228156,1.6991718,-1.0109633,0.51444274,-0.013926687,0.25308618,1.1980017,-0.12591971,-0.2566992,0.07647616,-0.8696789,0.009382733,0.39785054,-1.2722707,-1.0994763,0.3772544,-0.29811677,0.224032,1.1910862,0.30651203,-2.046144,0.7280414,0.34229213,0.21416165,-0.29544434,-0.31119025,-0.079860464,1.1090703,0.080034584,0.26504514,0.3715686,0.32045937,0.4645186,0.86214906,0.80125964,-0.21890217,-0.7605958,-0.3129229,1.1971686,0.34673184,0.48972505,-1.1523011,-0.35983753,-0.46475732,-0.5614133,1.5370824,1.0198828,-0.60067225,-0.5408514,-0.80894023,0.035431612,0.20160058,1.9489826,-0.11048938,0.38022795,-0.5538121,0.52622294,-0.31598684,0.39109063,0.55190164,0.99352103,0.66069436,0.046754602,1.289768,-0.5709792,0.3069011,1.2860525,0.579972,0.22839959,-0.79716635,0.37571397,-0.31938365,-0.86619127,0.831429,-1.2154651,-0.58127403,1.0933996,-1.0622667,-0.20082687,0.98029846,-0.11067172,-0.36257413,0.5851025,-0.15738094,-0.23116907,0.13445085,0.10323327,-0.18629009,-0.16744642,-0.86096084,-1.2974845,-0.034977634,0.8830682,0.8139761,0.4974718,0.6458406,-0.6193499,-0.52403504,0.3460076,0.8129206,0.5722891,-0.40972015,-0.8164496,-0.99176025,0.54702044,0.8797404,-0.23842958,0.34808746,0.5618256,-0.024876647,-0.14979473,1.447453,0.26450837,0.20408762,-0.9883031,-0.34377012,0.48594317,-0.53792554,-0.36925608,0.19019347,-1.1887745,0.5603139,0.013494099,-0.03302445,0.3337457,-0.07434867,1.0396665,0.32364425,-0.7892106,-0.2738011,-0.37737355,-1.8762338,0.4095822,0.92587405,-0.7811768,0.06353891,-0.3855444,-0.13703321,0.9152046,-0.7819207,0.234674,0.6821712,-0.07678992,-0.31838283,0.40166605,0.79676086,1.008724,-0.45904762,-0.12794353,-0.86317384,-0.21559024,-0.9120741,-0.012593454,0.7745149,-0.6977212,-0.7538358,-0.18128651,0.28664842,-1.2590011,0.42530417,-0.8697283,1.0506713,-1.3330971,-0.8265762,0.5308847,-1.0248233,-0.26336083,-0.9571224,-0.47053537,0.48984078,1.2006298,0.8890016,-0.9004764,0.39192864,0.3626817,0.25118312,-0.12921955,-0.23036276,-1.313858,-0.15735635,-0.6201511,0.6857092,-0.5828943,0.35007048,-0.25107595,-0.9944858,-0.53497326,-0.20331396,-0.72637415,-0.6874259,1.1403639,-0.5378776,0.7606838,0.84904635,-0.03762461,-0.43156648,-0.95907265,0.8855295,0.0038267311,0.89448225,-0.36225042,-0.12638931,0.58480096,-0.1406415,-1.3084792,-0.77119046,-0.89031345,-0.21695259,0.5857943,1.0528003,-1.6789773,-0.5899786,1.2426406,-0.21205625,1.3670223,-0.39851835,-0.33757898,0.5235419,-0.011693067,-0.4135302,-0.48724905,1.2654238,-1.171238,1.4892514,-0.36692357,-0.10467396,-0.26932487,-0.28296348,-1.6912694,0.09196991,0.10939844,1.3656229,-0.23038195,-0.91006947,0.03463611,-0.08788444,0.8082377,0.24113175,0.24304536,-1.4712573,-0.94060725,-1.5393722,0.42460346,-0.20601854,-0.18376128,-0.047885165,0.6083615,0.5344146,-0.30135065,0.09769815,0.67366016,0.8445401,0.07342002,0.47933403,0.8707202,0.89373064,0.44180235,1.697391,0.87471175,0.042294957,1.601038,0.5698369,-0.26069644,-0.08851173,-0.8425748,-1.074083,0.41129887,0.38555396,0.40498033,-1.3863883,1.1535548,0.70744526,0.13375905,0.3268968,0.10727392,-0.94491214,-1.2061683,0.84111214,-0.46312198,-0.09657855,-1.0548902,-0.023843491,1.0277842,0.8253828,0.44092357,0.06961763,-0.741425,1.7945604,0.6470159,-0.62658817,-0.84512275,-0.61475456,-0.23064004,0.5555551,-0.2383978,-0.16082962,-1.1809763,-1.1358839,-1.5920069,-0.4413485,-0.74639404,-1.1067871,0.05167884,-0.10271507,-0.40164572,-0.70246494,0.7148645,-0.16660322,-0.29463142,0.8179209,-0.16309473,0.15776436,-0.56101197,-0.9764223,-0.10769694,0.1721418,-0.52003187,-0.21115503,0.78562135,0.71192074,0.728524,0.05697496,0.16076687,-0.060648628,-0.28115427,-0.1131424,-0.35698318,0.162374,0.24970847,-0.8473914,-0.659314,-0.7253576,-0.3989241,-0.1677458,-0.4777646,0.46289682,-0.37578505,-1.1805081,-0.56152594,-1.4062641,0.6356261,0.04917687,-0.5593832,-0.5821184,-0.97584397,-0.21029504,-0.48397058,-0.55062664,0.42338836,0.11800827,0.06303849,-0.1867561,-0.65569556,-0.47273687,0.1324423,0.7537597,0.13954991,0.47785455,-0.826522,-0.48232102,-0.576831,-0.6872956,0.60471636,0.2796383,0.4528631,1.5497407,-0.12667122,1.7034694,0.045987107,0.7455561,0.8275849,-0.6063068,-0.6877156,-0.89063376,-0.41978526]	2026-02-13 17:02:45.423912	\N	\N	\N	{}	2026-02-13 18:56:14.390175
14	external.bff_vendor	2	public	--- Entity: bff_vendor ---\ncompany: Tech\naddress: 123 Blvd\ncity: hilld\nzipcode: 56789\nidcontry: 1\nidstate: 6\n\n> Related bff_country:\n  bff_country_name: United States\n\n> Related bff_state:\n  bff_state_name: Colorado	[0.23290351,0.93314445,-3.7943811,-0.13675645,1.1993477,-0.26829955,0.46430382,0.14353085,-1.2263303,-1.363716,-0.8432286,-0.16223466,0.45029005,-0.102029406,0.7596391,0.49413213,-0.4632199,-0.15219042,-0.08855311,-0.78383577,-1.171949,-0.37618998,-0.51663643,-0.42605078,0.90886515,0.52147526,0.7650755,0.5225423,-0.5952454,-0.48722655,-0.29823723,1.2258033,-0.7857583,-0.5020656,-0.31268233,-0.94936323,1.1017249,0.38083947,0.5227898,0.8730989,1.5146511,0.83024335,0.019290853,-0.50619656,0.7840785,0.5924677,1.0929067,0.60695696,2.8477986,-0.09059464,0.3236648,1.0113595,-0.7656367,0.53461486,0.6362236,-0.60054463,-0.44481403,0.51402724,-1.1666626,-0.14482409,2.4034069,2.5608847,0.2494039,1.2825093,1.4034628,0.40828943,-1.1016184,0.6820563,-0.8236105,-0.82798505,0.9289402,0.50691247,0.6144125,0.5639974,-0.6092038,-0.23423429,-1.2876054,-1.1916775,-0.7714536,0.3481667,0.9767049,0.19862033,1.1572367,-0.8867593,0.49599773,0.76009744,0.36839706,1.2080088,-0.6994111,0.12278099,-0.39302564,0.6654986,0.41824567,0.4318165,-0.9593347,1.1146696,-0.90508515,-0.44392717,-0.8232033,-1.2904207,-0.8348302,-0.8780871,0.010976151,0.5344453,0.200275,0.43310514,-0.33225167,-0.40175572,0.034790616,-0.3963666,-1.3444542,1.2396979,-0.61481166,-0.8800458,0.7067651,-0.055143896,0.8626679,0.18631655,-0.1389129,0.9503308,-0.43227512,-0.71777534,0.295393,0.50298756,0.038574405,0.42797303,-1.1831118,-0.48376,0.762357,-0.37525254,0.26410136,-1.0055571,0.34880102,-0.3196508,-0.8929092,1.0385249,-0.14464,1.0178081,0.57739675,0.7296963,0.7938128,-0.4158711,0.3805268,-1.1100821,0.56496644,-0.8800909,-0.009557456,-0.9134925,0.5357133,-0.1091301,-0.5010487,0.5587749,-0.08371946,-0.105821,0.13285273,-0.5818389,0.2813795,1.0060811,0.57108945,1.1191915,0.20052838,-0.13772283,-0.32609528,0.6831816,0.24789001,-1.1655238,-0.43825582,1.4062617,-0.26180166,0.5199063,-1.004735,-0.05292715,0.28448144,-0.80335224,0.07373672,-0.654679,-0.87301016,0.66407675,0.41893753,-0.6931942,1.5778627,-1.4537746,0.8857751,1.0989748,0.13634722,-0.44440067,0.28668433,-0.6459778,-0.63130707,-0.42315143,-0.94546705,1.0160245,-0.9228354,-0.9447286,-1.3096876,-0.73139936,0.16621602,-0.0499722,1.3411326,-0.5515199,-0.779481,0.846611,0.0001190342,0.7385275,-0.74067426,1.0708494,-1.2196137,-0.17983374,-0.61126757,0.05862775,0.41383857,-1.996196,-0.50781184,0.49372303,-0.21895227,-0.7725508,0.425165,-0.6061677,-1.5773902,0.58334905,1.3768122,-0.19520697,1.0609605,-1.2169588,1.1255898,-0.025810689,-0.8173036,-0.23502228,0.21572925,0.4110249,0.075254,-0.6462878,0.42994332,0.16920568,0.4342235,0.88047725,-0.017260319,1.0224358,-0.24105786,0.36641648,0.050690994,0.6848856,-0.065813325,0.20459275,-1.3679091,0.8459449,-1.0643784,-0.45570457,0.33350766,0.95141,0.55748624,0.58333445,0.26921856,0.3534953,-0.008148752,0.021081531,-0.36451286,-0.76394767,-0.5881449,-1.1574072,-0.039047748,-0.8210571,2.548755,-0.62971306,-0.6157594,-0.2278601,-0.7409156,0.44119832,-0.36135748,-0.39338356,1.2905371,-0.3745847,0.19080053,0.37221786,-0.4000018,-0.4820234,1.003096,0.1373444,-0.97213596,0.25306877,0.21557324,-1.2361045,-1.055987,-0.060743984,-0.22226015,0.48019433,0.80902624,1.1093905,-0.060229134,0.0022821366,0.52604145,0.17915313,-0.45356137,0.2844258,-0.04289084,0.70881784,1.3048357,0.038405113,-0.6703682,-0.7174837,-0.51016456,0.04946951,0.9853128,0.33709458,-0.9852163,-0.5125286,0.609068,-0.036891013,0.15519167,0.02449692,-0.9847456,0.31410712,-0.5976521,0.005946519,-0.094867356,0.81328654,0.50381947,0.24912687,0.8493886,-0.26586682,-0.4350661,-0.7536722,-0.8885749,-1.3170738,0.25395852,1.537838,-0.0794431,0.9741074,0.029858103,-0.97907305,0.2736463,-0.13984078,-0.25712964,-0.9031911,0.3069149,0.21969235,-1.0741036,0.94136274,0.5344039,0.6107891,1.2748848,0.8397281,-0.021604704,-1.644243,-1.0254496,0.17074683,0.14257966,0.06522609,0.20765018,0.92115957,-1.1992239,0.4139218,0.049584452,-0.19551854,0.20933586,-0.026429191,-0.006269102,0.30776095,0.3797618,-0.032098677,0.6542854,0.44342396,0.88461095,-1.1004726,-0.4793878,-0.11163674,1.0220548,-0.030100238,0.57947165,-0.98754936,-0.3792588,-0.258378,0.98784035,1.092051,0.5301466,0.5613728,-1.6059542,-1.4286203,-0.21631002,-0.25496858,-0.2761763,-0.50337213,0.22419296,0.111102134,0.48228708,-1.1285498,-0.16243827,-0.47587952,0.5902738,0.38579234,0.17062971,-1.6027062,-0.31979826,-0.30402392,1.6741462,-0.70033365,0.4708113,-0.31195274,0.612362,1.6008128,-0.15418656,-0.9115773,0.6244174,-0.6797035,-0.053689614,0.6845089,-0.23177662,-1.145233,1.3370656,-0.5227297,0.6070283,0.35920304,-0.049369983,-1.3088489,1.3375608,-0.03576657,0.46238956,-0.71279687,-0.062052246,-0.17469558,1.3688835,-0.19637151,-0.3144925,0.37952268,-0.0707855,-0.07912015,0.48121905,0.65530586,-0.94851404,-1.0179716,0.062175386,0.80353266,0.50088066,0.5688389,-1.0274781,-0.18901667,-0.57819694,-0.07894252,0.84325486,1.1122766,0.11768917,-0.6615975,-0.37052244,-0.79688007,0.26148933,1.263044,0.021955552,-0.44811308,-0.44829738,0.57935816,0.13509007,0.22421567,0.30952775,0.7964188,0.89154774,-0.024282146,1.1908946,-0.7202708,-0.18572468,0.866379,0.07836392,0.61558974,-1.1162894,-0.10264079,-0.9618678,-0.6946815,-0.008424289,-1.9361112,-0.07894697,1.3579153,-1.2749627,-0.050488744,1.1322364,0.84277636,0.049445745,0.8922867,-0.15153615,0.28384066,-0.18499292,-0.20927961,0.027989263,0.6855402,-0.6994167,-1.3133763,-0.33934823,0.22727989,0.005053222,0.35109687,0.41589308,-1.6451062,-0.44631106,-0.02054307,0.60679096,0.28934896,-0.2592408,-1.345145,-0.91619587,-0.12782107,0.7256598,0.3128894,-0.005461882,0.2720564,-0.16159311,0.071624324,1.0858779,0.24275683,0.660192,-0.8755391,-0.3007578,0.057859715,-0.76770717,0.9673707,-0.06433001,-0.8250598,0.4654591,0.17244634,0.2783018,0.7768465,-0.52439904,0.5787159,-0.67399484,-0.8204747,0.43726662,-0.48295155,-1.8911101,1.0377454,0.9638263,-0.7448692,-0.13898106,0.5322115,-0.608034,1.2313724,-0.6387375,-0.12030733,0.6942199,0.23898838,0.4112519,0.25714722,0.39319217,1.0082237,-0.442023,-0.14780392,-1.0818362,-0.28605127,-0.22854461,-0.46250033,0.19729213,-0.88482374,-0.67396,-0.15314217,1.0186341,-1.3095181,0.17414841,-0.63837403,1.2000916,-1.01309,-0.7630561,0.6162609,-0.5341687,0.0007581385,-0.40719223,-0.13114557,-0.3613079,0.29513252,1.1058598,-0.58719987,0.83875394,0.3248791,0.194831,0.56902754,-0.07786808,-1.4187721,-0.35224542,-0.2895748,0.4742829,-0.66445524,0.10879295,-0.46590018,-0.40108424,-0.7296759,-0.22123508,0.17017008,-0.7237823,1.1415873,-0.3468373,0.38154444,0.0039911824,-0.3279102,-0.32605165,-1.5565492,0.89574295,0.6643374,0.71767294,-0.15181504,-0.5140137,0.88060296,0.060812034,-1.1178433,-0.32735088,-0.7979732,-0.3891405,0.7331784,0.4751443,-0.9481349,-0.14288211,1.0563465,-0.47527573,0.63782614,0.09747191,-0.6673664,0.984589,-0.4091685,-0.98915225,-0.09613557,0.70284,-0.3837025,1.3214004,0.14097248,-0.1796014,-0.6685537,0.516717,-0.9731937,0.20530142,-0.018737536,1.4681385,-0.76589566,-0.7889267,0.10777105,0.38351366,0.87394017,-0.11438172,0.8917942,-1.2302433,-1.2635186,-1.3793039,0.58392775,-0.87441516,-0.13344368,0.332036,0.60373527,0.9626133,-0.3121536,0.3902359,0.6635937,1.3341725,0.5125641,0.5348535,0.99301916,1.0935011,0.16575563,1.8209659,1.8807118,0.17534189,2.1524994,0.7611229,-0.915499,-0.32032073,-0.25087327,-1.3454647,0.41503087,0.2770606,-0.19901398,-1.3634785,0.772616,0.5797776,0.45233852,-0.5354182,0.4097393,-1.3345104,-0.6978411,0.9043626,-0.1373333,-0.20014495,-0.648017,0.5448688,0.7002139,0.98201036,1.2433349,-0.57006073,-0.96158797,1.2790514,0.3181835,-1.020609,-0.51028824,-0.08953889,-0.4991149,0.77742475,-0.30236515,0.99340045,-0.88969517,-0.5719637,-0.8120368,-0.35222375,-0.33497763,-0.49341798,0.55423117,0.084363885,-0.38541502,-0.98492366,0.9003486,-0.11836172,-0.2468484,0.051588327,-0.28706223,0.23795779,-0.41114348,-0.97674376,0.34690338,-0.053378135,0.35487336,0.27541667,0.8011941,0.5576947,0.41827112,-0.1487232,0.7158975,-0.023074998,-0.49988028,-0.040465944,-0.6023065,0.47692546,-0.32365704,-1.484482,-1.0807418,0.044440802,0.16710836,-0.30429104,-0.23371495,0.83551943,-0.16120288,-0.7662896,-0.9410502,-1.0152107,1.092258,0.1690245,-0.3432695,-0.34273067,-0.9391163,-0.09773813,-0.4506419,-0.7615601,0.0974716,-0.18294394,-0.1559494,-0.1830027,0.051815502,-0.5471835,-0.12196663,0.25256577,0.15527207,0.036406655,0.03924567,0.3443693,-0.6809724,-0.24274638,0.014010139,1.0444567,0.6396818,1.7131997,0.10008587,1.1033075,-0.2545163,0.9536434,0.6330414,-1.6211995,-0.598252,-0.7460716,0.11928545]	2026-02-13 17:04:19.830919	\N	\N	\N	{}	2026-02-13 18:56:14.669328
15	external.bff_vendor	1	public	--- Entity: bff_vendor ---\ncompany: Global Tech\naddress: 123 Blvd\ncity: Beverly Hills\nzipcode: 90210\nidcontry: 1\nidstate: 5\n\n> Related bff_country:\n  bff_country_name: United States\n\n> Related bff_state:\n  bff_state_name: California	[0.1872172,0.90280104,-3.6026318,-0.05389504,0.9047115,-0.17119439,-0.15187694,0.41673204,-0.7613747,-0.9041291,-0.38370883,0.19502604,0.39881998,0.13622183,0.6453393,-0.2913922,-0.5117614,-0.42550123,-0.3417002,-0.82091296,-0.9303915,-0.9326912,-0.92569333,-1.014118,1.1052656,0.6248447,0.76677823,0.5993778,-0.97009873,-0.69194573,-0.39449736,1.1586709,-0.899517,-0.92207265,-0.35113618,-0.59488285,0.047442377,0.7099823,0.7038375,1.1382436,1.0647492,1.3032392,0.5282392,-0.4712416,0.9107999,0.17221321,1.0081764,-0.21366642,2.721892,-0.5735568,0.15600179,0.972674,-0.93531704,0.60859656,0.4065851,-0.5994432,-0.5176922,1.2757185,-1.2275479,0.09525407,2.142481,2.39346,0.27408233,1.6050313,1.2509882,-0.31823438,-0.99479103,0.22203264,-0.950915,-0.85506094,0.7361857,0.26734188,1.066138,0.540674,-0.71261936,-0.36790377,-1.7604223,-0.7677547,-1.147227,0.9273824,1.5416322,0.12558773,1.2809229,-0.49339542,0.6726845,0.4266508,0.2836666,1.5537306,0.087183535,0.36618206,0.6217221,0.6502024,0.40050617,0.29372838,-1.1932846,1.1799053,-0.90673864,-0.08444472,-0.8124273,-1.3378559,-0.26952302,-0.62080246,0.38361913,0.5068065,-0.02460205,0.90287054,-0.001353221,-0.8647327,-0.06652033,-0.09036854,-0.8158284,0.36801413,-0.495607,-0.7050033,0.3609241,0.037403107,1.0702977,-0.37309852,0.41393656,1.103765,-0.35837924,-0.751033,-0.41224232,0.36904266,-0.018592658,0.73368067,-1.0185361,-0.3033681,0.88866276,-0.14096601,0.79153574,-1.4018853,-0.027645424,-0.29522228,-0.70225626,0.8610944,-0.46211863,0.9211161,0.6796037,0.7363779,0.5437899,-0.3212373,0.015487969,-1.2106711,0.10069348,-1.4429715,0.05405275,-0.77600294,0.37764925,-0.20430177,-0.14086074,0.457277,0.15669876,0.15038234,1.0532931,-0.60569066,-0.27968705,0.9402878,0.9693875,0.92894495,0.36522672,-0.10474502,-0.42072347,0.49661946,-0.04195325,-1.3400888,-0.27422622,1.3365681,-0.41431433,0.6505724,-0.9849727,-0.18216477,0.41390803,-0.78018165,0.47743174,-0.47293386,-0.4813715,0.06731758,0.37126333,-0.93335724,0.8536559,-1.1853021,0.7845843,0.5894764,0.62112725,0.12969455,0.33185622,-0.05593486,-1.0821387,-0.20865953,-0.56328744,1.2424046,-0.45646816,-0.78988206,-1.489264,-0.7864497,-0.13701627,-0.095885925,1.1573426,-0.6236441,-0.8578478,0.5291202,0.029835017,0.53640294,-0.6240576,1.1209142,-0.6101461,-0.19933292,-0.6226895,0.17845722,0.5804727,-1.7805641,-0.64842254,0.48101673,-0.052714095,-0.6441801,-0.28222203,-0.46162045,-1.2911806,0.40856564,1.6971151,0.0058024796,1.4546864,-0.7877803,1.121447,0.058031306,-0.6663338,-0.22379714,0.024401385,0.6904525,-0.7899009,-0.8282121,0.431135,0.23048076,0.7607213,0.8404844,-0.16673063,1.4618247,-0.58124226,0.6712441,-0.123431474,0.74541223,-0.36107436,0.7356132,-1.3178736,0.7722452,-1.1027883,-0.58205426,0.1799704,0.8289333,-0.011717859,0.4325265,0.20306024,1.0402627,-0.054224785,-0.28176108,-0.10180535,-0.28495538,-0.030819971,-1.1106749,0.24873309,-0.6026737,2.3170786,-1.0342658,-0.5071296,-0.46804482,-0.32783905,0.44385904,-0.36930472,-0.23149855,1.7315158,-0.40617973,0.20012718,0.2405068,-0.39534968,-0.1132257,1.5692526,-0.049337007,-1.0118617,0.5589663,0.10550777,-1.4224739,-0.994357,-0.7702956,-0.11306214,0.5876423,0.9081967,1.2821466,-0.15149106,-0.66885775,0.48224002,-0.060019758,-0.73300856,0.0013983874,-0.34349853,1.4938389,1.2751518,0.19359548,-0.03410993,-0.5295164,-0.49298933,0.02524132,0.5185566,0.17775455,-0.9416013,-0.3941554,0.42641592,-0.22909255,-0.04250533,0.042657007,-0.7815795,-0.20701398,-0.4678457,-0.044546194,0.06848779,0.2898589,0.37376806,0.83283365,0.5158195,0.43244523,-0.44946036,-0.49314487,-0.71261847,-1.0430572,0.16274048,1.4781005,-0.07007022,0.78555,0.49127775,-0.78064233,0.048728157,-0.112218276,-0.44376302,-1.1238775,0.18420206,0.43893135,-1.0026156,0.52558964,-0.016335262,0.40855062,1.0081581,0.5139322,0.4465365,-1.2905086,-0.83604205,0.26914105,0.44768545,0.092362896,0.2716698,1.0024853,-0.99168634,0.37238863,0.06277314,-0.5586283,0.114852786,-0.5658373,0.08240788,0.12588976,0.5418091,-0.43626428,0.67202795,0.5928769,1.2530125,-1.4799836,-0.015831001,0.24996033,0.9942508,-0.3651133,0.27965432,-0.86747056,-0.40149584,-0.34605688,1.1570382,0.64671654,0.26650387,0.8299032,-1.5705738,-1.2188112,-0.7316735,-0.312481,-0.03825365,-0.47653753,0.2172547,0.34681085,0.32554004,-0.9418339,-0.47315928,-0.40731668,0.73661554,0.061106723,0.72330946,-1.4251206,0.48395243,-0.41627523,1.6450858,-1.1105589,0.18303727,-0.116582096,0.5258052,1.5302198,0.21080402,-0.5922313,0.7292076,-1.0721163,0.2304059,0.6478804,-0.16499995,-0.686759,1.085188,0.0309801,0.07059067,1.0581495,0.04098078,-1.1873503,1.243444,0.12827425,-0.12648621,-0.8227635,-0.31638774,0.35703814,0.8681653,-0.39920038,-0.06735621,-0.23207945,0.2238622,0.24653324,1.0448378,1.1009345,-0.3327634,-0.7951383,-0.19080758,1.2750512,0.43054524,0.80124617,-0.9509494,0.3128017,-0.6840794,-0.528337,0.96734625,0.795589,0.41092145,-1.4342613,-0.9979571,-0.15407899,0.49496067,1.2566415,-0.094396845,-0.2469688,-0.76779324,0.123671755,-0.3131622,0.13415807,0.176427,0.6880413,0.59410065,0.13168843,1.0939511,-0.6480129,-0.07312031,0.9003642,0.12487482,0.9759425,-0.86786056,0.27197802,-0.21882926,-0.336664,0.3944821,-1.283078,-0.45675522,1.469247,-1.4552484,-0.5230223,1.1343977,0.7452458,-0.0716124,1.020685,-1.030715,0.257066,-0.4327251,-0.16604677,-0.3483166,0.32330605,-0.1455636,-1.2303733,-0.018004512,0.57437795,0.046664022,0.39707538,0.62688583,-1.0036091,-0.61433923,-0.095313124,0.89058834,0.4296308,0.054116912,-1.0403295,-1.0158697,0.21909131,0.05151077,0.30253386,-0.0735318,0.3908742,0.3710486,-0.034121647,0.947874,0.32662675,0.45528147,-0.9696319,-0.26958662,0.40194032,-0.4905095,0.65892035,-0.1371295,-0.6196398,0.99089605,-0.86623293,0.3645997,0.5032102,-0.2540755,0.18396014,-0.81578475,-0.7059085,0.014771497,0.19024728,-1.6708101,1.0523196,1.029075,-0.58323157,-0.16034615,0.44144598,-0.1740474,0.66485447,-0.7572021,-0.1099273,1.0852734,0.113590226,0.40445852,0.22011302,0.9294898,0.8377794,-0.39379895,0.48510408,-1.0036371,-0.1300812,-0.37147596,0.24882424,0.36640367,-0.5796547,-0.58412945,-0.69789475,1.0143241,-1.1223745,-0.10176679,-0.41184232,1.1878998,-0.89158446,-0.6797845,0.32884452,-0.8359612,-0.01880613,-0.9986345,-0.17589784,-0.54823166,0.86140543,0.9089153,-0.24899814,0.979997,0.50606304,0.1893406,0.30426863,-0.590735,-1.8018734,-0.4962642,-0.09436481,0.54245317,-1.2111473,0.52515745,-0.9249843,-0.715701,-0.91258216,-0.30086592,-0.18587902,-0.6011695,1.0675877,-0.13606222,0.39889693,-0.36262852,-0.012640387,-0.68621033,-1.7457564,0.6558578,0.45336196,0.5055387,-0.22536188,-0.87490124,0.5099832,-0.11967228,-1.2960073,-0.16882923,-1.2722001,-0.30233112,1.0840955,0.9428619,-1.193979,-0.20961097,0.44734365,-0.30967987,0.9012961,-0.14375533,-0.6323744,0.7548777,-0.038556926,-0.73170185,-0.3116813,1.1302112,-0.42350498,1.4653962,-0.046444945,-0.07661769,-0.6433798,0.06243955,-1.0496832,0.6493328,0.05270596,1.3581672,-0.48893073,-1.1088916,-0.1657175,0.09969955,0.7381095,-0.21457142,0.5298654,-1.2561355,-1.3093078,-1.377272,0.56605136,-1.1540228,0.14468753,0.4250648,0.6370347,1.2740239,-0.32058945,0.4851064,0.7633258,1.850243,-0.0020736079,0.27128273,1.3172565,1.6274333,0.15852459,2.1343524,1.5006323,0.3562622,1.8966435,0.17321426,-0.65488064,-0.16689508,-0.7075744,-1.2787138,0.4155838,0.14716119,-0.6611536,-1.0124626,0.9195046,0.5039069,0.23574348,-0.10651688,0.09198618,-1.1334114,-1.1282474,0.7288,0.18362734,-0.5753924,-0.53026986,-0.1677936,0.45060632,0.80055815,1.2745458,-0.79905045,-0.4175042,1.7147937,0.5610606,-0.7709926,-0.3654229,-0.8180292,-0.5123653,0.8643791,0.3523184,0.5683713,-0.7657347,-0.87467504,-1.0907146,0.029856019,-0.7106127,-0.49785998,0.6388442,0.17027862,-0.2405562,-1.1289116,0.68384254,-0.08311148,-0.11073235,0.06604348,-0.40010425,-0.094692655,-0.27798468,-1.2501504,-0.32531604,-0.19750066,0.153898,-0.04792348,0.88720274,-0.027764807,0.14375181,-0.4870039,0.6286819,-0.036276016,-0.5069889,-0.31662756,-0.34501946,0.69914365,-0.2480512,-1.2685204,-1.1101267,0.108157374,0.3660086,0.39534712,-0.642295,0.5843948,0.016785355,-1.5533979,-0.97910047,-0.90927476,1.2311378,0.20447825,-0.71573526,-0.31215116,-1.6466141,-0.41887093,-0.5793705,-0.5976537,-0.05814758,-0.18860014,0.4588785,-0.14459684,-0.0010875273,-0.43568262,0.05374854,0.71925324,0.25208902,0.09470491,0.3717224,-0.05355683,-0.22631374,0.06863655,0.0678036,1.0228386,0.5711355,1.6424227,0.36328587,1.0695473,-0.43161264,0.5980676,0.8424962,-1.3530749,-0.66445684,-0.6318315,0.10342429]	2026-02-13 17:04:19.932646	\N	\N	\N	{}	2026-02-13 18:56:14.77524
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
f0bdbf81-1fbd-40d5-8c49-d920c24e5589	cual es la direccion fisica completa del vendedor tech?	1	user	2026-02-13 18:07:09.288686+00	2026-02-13 18:07:09.288688+00	5989fc4c-0bca-4284-817c-0a0d46573c98
c540cc43-83b2-4c6d-af2e-81474b6b356a	cual es la direccion fisica del vendedor tech?	1	user	2026-02-13 18:07:26.017859+00	2026-02-13 18:07:26.017864+00	4234c921-2f7d-4ab5-8679-5bc64c59bdec
bebbbb16-d76d-4440-925b-fe61ad6e4bb1	\n\nThe user identified as **"admin"** is associated with the **"owner"** role and has the following details:  \n\n- **Email**: admin@dfgchatai.com  \n- **Username**: admin  \n- **Full Name**: System Administrator  \n- **Role**: owner (global scope)  \n- **Phone**: 00000000000  \n\nThis user is explicitly labeled as the **admin** in the context. Another user (**r00t@dfgchatai.com**) also has the **"owner"** role but is not referred to as "admin" in the data.	1	assistant	2026-02-12 15:55:16.725879+00	2026-02-12 15:55:16.725882+00	73147291-49b0-4c08-a162-54e49ea15a96
f0032a30-b311-4306-a65b-2e7154b8a52b	who is admin?	1	user	2026-02-13 15:57:23.111438+00	2026-02-13 15:57:23.111441+00	f2560dcc-c063-44d5-b6d5-73f1d191b66f
29f7700c-b0d7-475f-8ca4-262012b482ce	\n\nThe user identified as **"admin"** is associated with the **"owner"** role and has the following details:  \n\n- **Email**: admin@dfgchatai.com  \n- **Username**: admin  \n- **Full Name**: System Administrator  \n- **Role**: owner (global scope)  \n- **Phone**: 00000000000  \n\nThis user is explicitly labeled as the **admin** in the context. Another user (**r00t@dfgchatai.com**) also has the **"owner"** role but is not referred to as "admin" in the data.	1	assistant	2026-02-13 15:57:49.763279+00	2026-02-13 15:57:49.763281+00	f2560dcc-c063-44d5-b6d5-73f1d191b66f
bde6e4aa-60cd-4122-9d19-e056b3494a61	who is admin?	1	user	2026-02-13 16:03:54.833996+00	2026-02-13 16:03:54.833998+00	a9ddd64f-61eb-432e-b118-292235afe5c3
06a95d02-c399-4701-bb7c-70cd56d5f6bd	\n\nThe user identified as **"admin"** is associated with the **"owner"** role and has the following details:  \n\n- **Email**: admin@dfgchatai.com  \n- **Username**: admin  \n- **Full Name**: System Administrator  \n- **Role**: owner (global scope)  \n- **Phone**: 00000000000  \n\nThis user is explicitly labeled as the **admin** in the context. Another user (**r00t@dfgchatai.com**) also has the **"owner"** role but is not referred to as "admin" in the data.	1	assistant	2026-02-13 16:04:20.083474+00	2026-02-13 16:04:20.083477+00	a9ddd64f-61eb-432e-b118-292235afe5c3
8e328c08-d8d6-4618-8cf5-9e4e8d33c99f	how many user we have?	1	user	2026-02-13 16:04:27.584879+00	2026-02-13 16:04:27.584881+00	a9ddd64f-61eb-432e-b118-292235afe5c3
606474a7-081b-4f2c-be2a-13c1e7882acc	\n\nWe have **3 users** in total. Here are their details:  \n\n1. **r00t@dfgchatai.com** (username: r00t)  \n2. **avinajera2011@gmail.com** (username: one)  \n3. **admin@dfgchatai.com** (username: admin)  \n\nEach of these entries corresponds to a distinct user in the system.	1	assistant	2026-02-13 16:04:49.264816+00	2026-02-13 16:04:49.264818+00	a9ddd64f-61eb-432e-b118-292235afe5c3
4c95417d-73f5-4b32-9f1e-c1ecbf93c128	what is te phone of users one?	1	user	2026-02-13 16:05:03.242917+00	2026-02-13 16:05:03.242919+00	a9ddd64f-61eb-432e-b118-292235afe5c3
2f6cc339-5144-4068-a932-5f53365463e7	\n\nThe phone number of the user with the username **"one"** is **06146491554**.	1	assistant	2026-02-13 16:05:18.223799+00	2026-02-13 16:05:18.223802+00	a9ddd64f-61eb-432e-b118-292235afe5c3
47a7571c-9125-4fcf-873c-f434625ceee1	how many user we have?	1	user	2026-02-13 16:59:58.894032+00	2026-02-13 16:59:58.894034+00	6a5cf182-3cc3-4bb5-bdbd-299887225516
d33d4544-7ea2-4414-b48f-3aed03adc1e9	\n\nWe have **3 users** in total. Here are their details:  \n\n1. **r00t@dfgchatai.com** (username: r00t)  \n2. **avinajera2011@gmail.com** (username: one)  \n3. **admin@dfgchatai.com** (username: admin)  \n\nEach of these entries corresponds to a distinct user in the system.	1	assistant	2026-02-13 17:00:22.471438+00	2026-02-13 17:00:22.471445+00	6a5cf182-3cc3-4bb5-bdbd-299887225516
dfd31459-f53e-409e-a008-45e7a6e96f14	how many customer we have?	1	user	2026-02-13 17:03:00.447933+00	2026-02-13 17:03:00.447936+00	6a5cf182-3cc3-4bb5-bdbd-299887225516
14ccfa3b-d14e-4a25-b462-9f69fca2e8c4	\n\nBased on the context provided, there are **2 customers** listed under the `bff_customers` entity:  \n\n1. **NEX**  \n   - Company: NEX  \n   - Address: Street 8  \n   - City: Miami  \n   - Zipcode: 33251  \n   - State: Alaska  \n   - Country: United States  \n\n2. **Acme Corp**  \n   - Company: Acme Corp  \n   - Address: 123 Ocean Dr  \n   - City: Miami  \n   - Zipcode: 33101  \n   - State: Alabama  \n   - Country: United States  \n\nThese are the only two customer records in the data.	1	assistant	2026-02-13 17:03:26.802657+00	2026-02-13 17:03:26.802667+00	6a5cf182-3cc3-4bb5-bdbd-299887225516
2ad46883-5214-4f9b-82cc-dce402e80c88	there is any vendor of city with zipcode 56789?	1	user	2026-02-13 17:04:57.595055+00	2026-02-13 17:04:57.595058+00	6a5cf182-3cc3-4bb5-bdbd-299887225516
3ee40037-5468-4758-a1b0-80c42339b5b2	\n\nYes, there is a vendor in the city of **hilld** with **zipcode 56789**.  \n\n**Details**:  \n- **Company**: Tech  \n- **Address**: 123 Blvd  \n- **City**: hilld  \n- **Zipcode**: 56789  \n- **Country**: United States  \n- **State**: Colorado  \n\nThis vendor is listed under the `bff_vendor` entity in the context.	1	assistant	2026-02-13 17:05:19.115532+00	2026-02-13 17:05:19.115536+00	6a5cf182-3cc3-4bb5-bdbd-299887225516
98773a6b-6077-4ab0-a28f-edbe4e75d825	what is the city of the vendor Tech?	1	user	2026-02-13 17:07:40.409588+00	2026-02-13 17:07:40.40959+00	6a5cf182-3cc3-4bb5-bdbd-299887225516
8322e540-2a51-4454-b45d-fc57fbd3de4c	\n\nThe city of the vendor **Tech** is **hilld**.	1	assistant	2026-02-13 17:07:56.538042+00	2026-02-13 17:07:56.538046+00	6a5cf182-3cc3-4bb5-bdbd-299887225516
97d28cc1-ebd6-4e24-9b26-f6eae4a3cf42	de que ciudad es el vendor tech?	1	user	2026-02-13 17:08:12.89023+00	2026-02-13 17:08:12.890232+00	6a5cf182-3cc3-4bb5-bdbd-299887225516
5283e8db-3a96-451e-af5f-da4245bd6b36	\n\nEl vendor **Tech** está ubicado en la ciudad de **hilld**.	1	assistant	2026-02-13 17:08:27.961497+00	2026-02-13 17:08:27.961504+00	6a5cf182-3cc3-4bb5-bdbd-299887225516
21b8cf55-1396-4e09-a0cc-ef17330dc426	de que ciudad es el vendor tech?	1	user	2026-02-13 17:39:18.950014+00	2026-02-13 17:39:18.950016+00	b6aba635-ca02-45ef-8805-52d31253997a
dd36b597-2d9e-42ee-bae8-555ca70bce5f	\n\nEl vendor **Tech** está ubicado en la ciudad de **hilld**.	1	assistant	2026-02-13 17:39:42.356221+00	2026-02-13 17:39:42.356226+00	b6aba635-ca02-45ef-8805-52d31253997a
ccb7d70c-e282-4c04-83d5-4383e029b453	de que ciudad es el vendor tech?	1	user	2026-02-13 17:39:48.1114+00	2026-02-13 17:39:48.111403+00	b1105071-3649-4893-8ec4-0e2cd3d12238
6055b396-10bf-430a-b889-6d30df6abc2c	\n\nEl vendor **Tech** está ubicado en la ciudad de **hilld**.	1	assistant	2026-02-13 17:40:02.147808+00	2026-02-13 17:40:02.147812+00	b1105071-3649-4893-8ec4-0e2cd3d12238
2fb54464-a89f-494b-a5a9-4d49ecce7a80	de que ciudad es el vendor tech?	1	user	2026-02-13 17:40:55.588558+00	2026-02-13 17:40:55.58856+00	f7f4b370-89a9-4b33-bfda-96d64f84e460
77e4f58a-dbcc-4040-9da5-f87c7b08a0ee	\n\nEl vendor **Tech** está ubicado en la ciudad de **hilld**.	1	assistant	2026-02-13 17:41:06.861768+00	2026-02-13 17:41:06.861772+00	f7f4b370-89a9-4b33-bfda-96d64f84e460
8b9253a9-ee8c-415d-b58b-97a7f0053205	cual es el ID del proveedor tech?	1	user	2026-02-13 17:42:09.311406+00	2026-02-13 17:42:09.311407+00	f7f4b370-89a9-4b33-bfda-96d64f84e460
f4614a48-0219-4392-866e-1d5f8e3b0ed0	\n\nEl ID del proveedor **Tech** no está disponible en el contexto proporcionado. La información disponible solo incluye los detalles de la empresa, dirección y ubicación, pero no su identificador único.	1	assistant	2026-02-13 17:42:32.485154+00	2026-02-13 17:42:32.485158+00	f7f4b370-89a9-4b33-bfda-96d64f84e460
69144221-232d-4762-b080-1290e4275d09	cual es la direccion fisica del vendedor tech?	1	user	2026-02-13 18:03:59.681153+00	2026-02-13 18:03:59.681155+00	f7f4b370-89a9-4b33-bfda-96d64f84e460
2bb6d72a-c545-4292-afc6-c59041eeced9	\n\nLa dirección física del vendedor **Tech** es **123 Blvd**.	1	assistant	2026-02-13 18:04:12.508052+00	2026-02-13 18:04:12.508057+00	f7f4b370-89a9-4b33-bfda-96d64f84e460
a23cfca1-db4a-4e7e-bc86-430757c11aba	cual es la direccion fisica del vendedor tech?	1	user	2026-02-13 18:06:27.029495+00	2026-02-13 18:06:27.029498+00	5989fc4c-0bca-4284-817c-0a0d46573c98
b98b56b8-1f1f-4a4f-9539-ffffcc56a5f8	\n\nLa dirección física del vendedor **Tech** es **123 Blvd**.	1	assistant	2026-02-13 18:06:37.909369+00	2026-02-13 18:06:37.909374+00	5989fc4c-0bca-4284-817c-0a0d46573c98
630dd16f-f971-4c7f-8577-968d7a1cdfd8	how many user we have?	1	user	2026-02-13 18:08:14.422431+00	2026-02-13 18:08:14.422432+00	7521e9bb-e2a0-453a-8469-f8e52f52e03f
5696305f-f872-4705-b2b6-a5c509dd969e	\n\nWe have **3 users** in total. Here are their details:  \n\n1. **r00t@dfgchatai.com** (username: r00t)  \n2. **avinajera2011@gmail.com** (username: one)  \n3. **admin@dfgchatai.com** (username: admin)  \n\nEach of these entries corresponds to a distinct user in the system.	1	assistant	2026-02-13 18:08:36.74007+00	2026-02-13 18:08:36.740073+00	7521e9bb-e2a0-453a-8469-f8e52f52e03f
d93a5f0a-e1f6-4646-8419-3e5471f56d0c	cual es la direccion fisica del vendedor tech?	1	user	2026-02-13 18:08:44.339956+00	2026-02-13 18:08:44.339958+00	42960605-76c4-43ed-b3aa-5384efdb9a05
016a650c-0dcd-4f3b-8a3d-4c6689e7ce9a	\n\nLa dirección física del vendedor **Tech** es **123 Blvd**.	1	assistant	2026-02-13 18:09:06.505242+00	2026-02-13 18:09:06.505245+00	42960605-76c4-43ed-b3aa-5384efdb9a05
ec831d7b-b248-4d0a-a841-e80b078a48f8	how many user we have?	1	user	2026-02-13 18:09:19.82064+00	2026-02-13 18:09:19.820644+00	42960605-76c4-43ed-b3aa-5384efdb9a05
e91fac22-8f00-4532-84ce-9e93901d7862	\n\nWe have **3 users** in total. Here are their details:  \n\n1. **r00t@dfgchatai.com** (username: r00t)  \n2. **avinajera2011@gmail.com** (username: one)  \n3. **admin@dfgchatai.com** (username: admin)  \n\nEach of these entries corresponds to a distinct user in the system.	1	assistant	2026-02-13 18:09:40.262672+00	2026-02-13 18:09:40.262675+00	42960605-76c4-43ed-b3aa-5384efdb9a05
2b83e699-9ec1-4fbb-9f54-6eb87363dd06	how many user we have??	1	user	2026-02-13 18:24:51.539705+00	2026-02-13 18:24:51.539706+00	58f82f49-dc82-4f25-bf35-49ade0925b72
475e90c5-e4b2-44bd-a5e6-060b553a37f3	\n\nWe have **3 users** in total. Here are their details:  \n\n1. **admin@dfgchatai.com** (username: admin)  \n2. **r00t@dfgchatai.com** (username: r00t)  \n3. **avinajera2011@gmail.com** (username: one)  \n\nEach of these entries corresponds to a distinct user in the system.	1	assistant	2026-02-13 18:25:20.948747+00	2026-02-13 18:25:20.948755+00	58f82f49-dc82-4f25-bf35-49ade0925b72
b07f4af4-57ba-42fc-a125-2e11ecf90369	how many user we have??	1	user	2026-02-13 18:56:49.890742+00	2026-02-13 18:56:49.890744+00	bbf141da-a1c3-40b2-827d-fb621058bbd4
1b9e6893-1a94-43ca-b06d-8d15f36ef0e6	\n\nWe have **3 users** in total. Here are their details:  \n\n1. **admin@dfgchatai.com** (username: admin)  \n2. **r00t@dfgchatai.com** (username: r00t)  \n3. **avinajera2011@gmail.com** (username: one)  \n\nEach of these entries corresponds to a distinct user in the system.	1	assistant	2026-02-13 18:57:17.799448+00	2026-02-13 18:57:17.799452+00	bbf141da-a1c3-40b2-827d-fb621058bbd4
38893350-26e5-4a0b-8b40-709a0561b39e	what is the phisical location of Tech vendro?	1	user	2026-02-13 18:57:54.082794+00	2026-02-13 18:57:54.082797+00	bbf141da-a1c3-40b2-827d-fb621058bbd4
a4fd5970-0d54-45b8-b3c2-168883960ab9	\n\nThe physical location of the **Tech** vendor is:  \n**123 Blvd, hilld, Colorado, United States** (zipcode: 56789).	1	assistant	2026-02-13 18:58:18.294397+00	2026-02-13 18:58:18.294406+00	bbf141da-a1c3-40b2-827d-fb621058bbd4
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
2	Producto	Auto-imported	t	2026-02-16 13:02:49.857683
3	PODRIDO	Auto-imported	t	2026-02-16 15:40:51.586412
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
6	1	1	Jane	Doe	100 Tech Blvd	Suite 500	Austin	Travis	1	1	1234567890	0987654321	jane@example.com	f	t	2026-02-13 16:26:39.419144+00	2026-02-13 16:26:39.419151+00
7	1	1	pedro	alvarez	123 Main St	\N	CMG	Conda	58	7	1234567890	987654321	pedro@gm.com	f	t	2026-02-16 16:19:16.665452+00	2026-02-16 16:19:16.665456+00
8	7	9	Luis	perez	123 Main St	\N	CMG	Conda	58	8	1234567890	987654321	perez@gm.com	f	t	2026-02-16 16:28:56.420377+00	2026-02-16 16:28:56.420381+00
9	7	9	PACO	perez	123 Main St	\N	CMG	Conda	59	9	1234567890	987654321	perez@gm.com	f	t	2026-02-16 16:34:56.103862+00	2026-02-16 16:34:56.103867+00
\.


--
-- Data for Name: bff_contact_type; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bff_contact_type (id, name, created_at, updated_at) FROM stdin;
1	Customer	2026-02-03 02:08:20.964381+00	2026-02-03 02:08:20.964381+00
2	Vendor	2026-02-03 02:08:20.964381+00	2026-02-03 02:08:20.964381+00
3	Internal/Employee	2026-02-03 02:08:20.964381+00	2026-02-03 02:08:20.964381+00
4	Partner/Lead	2026-02-03 02:08:20.964381+00	2026-02-03 02:08:20.964381+00
5	Bodeguero	2026-02-13 16:27:30.501499+00	2026-02-13 16:27:30.501502+00
6	MINE	2026-02-16 16:19:16.63924+00	2026-02-16 16:19:16.639245+00
7	BROTHER	2026-02-16 16:28:56.392687+00	2026-02-16 16:28:56.392695+00
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
2	Alemania
3	China
4	Australia
5	CANADA
6	PERU
7	MEXICO
8	brazil
9	VENEX
\.


--
-- Data for Name: bff_customer_retail_prices; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bff_customer_retail_prices (id, idvendorcustomers, idproduct, retail_price, created_at, updated_at) FROM stdin;
1	9990	9990	120.00	2026-02-16 18:29:17.07979	2026-02-16 18:29:17.07979
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
8	2	Acme Corp	123 Ocean Dr	Miami	22	33101   	1
9	3	XXXX	123 Ocean Dr	Magdeburg	51	33101   	2
10	3	XXXX	123 Ocean Dr	SINKIK	52	33101   	3
11	4	YYYYY	123 Ocean Dr	SINKIK	53	33101   	3
12	5	DDDDDD	123 Ocean Dr	Snd	54	33101   	4
13	6	LLLLL	123 Ocean Dr	YIYI	55	33101   	5
14	7	WWWWW	456 PER	TOK	56	33101   	6
9990	1	Cliente Final SA	\N	\N	1	00000   	\N
\.


--
-- Data for Name: bff_customers_type; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bff_customers_type (id, description) FROM stdin;
1	Wholesale
2	Retail
3	VEND
4	AGRIC
5	AOPO
6	YOYO
7	WWW
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
5	2	MANZANA	Sample Desc	2	f	2026-02-16 13:05:17.362783	\N
6	2	SOP-098	MANZANA	2	f	2026-02-16 13:06:24.269613	\N
7	1	CAL001	CALABAZA	3	t	2026-02-16 15:38:23.784581	\N
9	3	CAL002	COCO	3	t	2026-02-16 15:44:57.731121	\N
9990	\N	PRD-9990	Producto Test Matrix	1	f	2026-02-16 18:29:17.066855	\N
\.


--
-- Data for Name: bff_products_MP; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."bff_products_MP" (id, sku, description, idum, price, create_at, update_at) FROM stdin;
9990	PRD-9990	Producto Test Matrix	1	100.00	2026-02-16 18:29:17.069071	2026-02-16 18:29:17.069071
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
1	JIM DO	jdoe@global.com	555-0199	2026-02-16 16:05:16.5953	2026-02-16 16:05:16.595313
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
7	Decision Maker	f	2026-02-13 16:28:03.315056+00	2026-02-13 16:28:03.315059+00
8	Intermediary	t	2026-02-16 16:19:16.651613+00	2026-02-16 16:19:16.651616+00
9	final	t	2026-02-16 16:28:56.408364+00	2026-02-16 16:28:56.408369+00
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
51	2	Berlin
52	3	Beigin
53	3	CHINGUANG
54	4	SUSUS
55	5	YEYE
56	6	WEWE
57	5	Otawa
58	7	DF
59	9	DF
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
2	METRO
3	CIRCU
\.


--
-- Data for Name: bff_vendor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bff_vendor (id, idrepresentative, company, address, city, idstate, zipcode, idcontry) FROM stdin;
1	\N	Global Tech	123 Blvd	Beverly Hills	5	90210   	1
2	\N	Tech	123 Blvd	hilld	6	56789   	1
3	1	NEX	123 Blvd	ontario	57	90210   	5
9990	\N	Vendor Matrix Corp	\N	\N	1	00000   	\N
\.


--
-- Data for Name: bff_vendor_customers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bff_vendor_customers (id, idvendor, idcustomers) FROM stdin;
9990	9990	9990
\.


--
-- Data for Name: bff_vendor_customers_price; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bff_vendor_customers_price (idprice, idvendorcustomers, idproduct, price) FROM stdin;
1	9990	9990	75.00
\.


--
-- Data for Name: bff_vendor_prices; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bff_vendor_prices (idprice, idvendor, idproduct, price) FROM stdin;
2	9990	9990	50.00
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
10	temp_sales	2026-02-13 15:51:07.319982+00	2026-02-13 15:51:07.319982+00	f
3	sales_rep	2026-01-23 20:30:04.703675+00	\N	f
4	sales_manager	2026-01-23 20:30:04.703675+00	\N	f
5	buyer	2026-01-23 20:30:04.703675+00	\N	f
6	purchasing_manager	2026-01-23 20:30:04.703675+00	\N	f
7	inventory_manager	2026-01-23 20:30:04.703675+00	\N	f
8	customer_support	2026-01-23 20:30:04.703675+00	\N	f
9	developer	2026-02-04 19:48:25.472229+00	\N	f
1	admin	2026-01-23 20:30:04.703675+00	\N	t
2	viewer	2026-01-23 20:30:04.703675+00	\N	t
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
1	admin	admin@dfgchatai.com	$2b$12$z1r0BtMaqIvrY.VBVcM29u9SWtxsrqpIb.cgOyVCeYrS5cUGAuCA6	System	Administrator	Root	\N	00000000000	1	t	2026-01-21 13:28:37.149478	2026-02-16 12:30:41.906693+00	0	\N	db6effe1-36c3-44e3-b809-62cddaafae1c
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

SELECT pg_catalog.setval('public.ai_external_source_config_id_seq', 12, true);


--
-- Name: ai_knowledge_store_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ai_knowledge_store_id_seq', 15, true);


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

SELECT pg_catalog.setval('public.bff_category_id_seq', 3, true);


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

SELECT pg_catalog.setval('public.bff_contact_id_seq', 9, true);


--
-- Name: bff_contact_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bff_contact_type_id_seq', 7, true);


--
-- Name: bff_contry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bff_contry_id_seq', 10, false);


--
-- Name: bff_customer_retail_prices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bff_customer_retail_prices_id_seq', 1, true);


--
-- Name: bff_customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bff_customers_id_seq', 14, true);


--
-- Name: bff_customers_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bff_customers_type_id_seq', 8, false);


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

SELECT pg_catalog.setval('public.bff_products_id_seq', 9, true);


--
-- Name: bff_products_prop_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bff_products_prop_id_seq', 1, false);


--
-- Name: bff_representative_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bff_representative_id_seq', 1, true);


--
-- Name: bff_responsability_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bff_responsability_id_seq', 9, true);


--
-- Name: bff_state_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bff_state_id_seq', 60, false);


--
-- Name: bff_type_representative_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bff_type_representative_id_seq', 1, false);


--
-- Name: bff_um_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bff_um_id_seq', 3, true);


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

SELECT pg_catalog.setval('public.bff_vendor_customers_price_idprice_seq', 1, true);


--
-- Name: bff_vendor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bff_vendor_id_seq', 3, true);


--
-- Name: bff_vendor_prices_idprice_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bff_vendor_prices_idprice_seq', 2, true);


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

SELECT pg_catalog.setval('public.dff_role_id_seq', 10, true);


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
-- Name: bff_customer_retail_prices bff_customer_retail_prices_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bff_customer_retail_prices
    ADD CONSTRAINT bff_customer_retail_prices_pkey PRIMARY KEY (id);


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

\unrestrict lscSUfjaQIvLbyXc7aWVjEml17mIFtr5ZKh5uYaIXz98JziztvlsoNRHOKbOLHx

