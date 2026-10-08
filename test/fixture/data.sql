--
-- PostgreSQL database dump
--

\restrict xYCYavlnCvuSuONJEY0TUty3HDD5VysqvFDoyi1BgrtNmMYBBDcgxm0ni96DZGM

-- Dumped from database version 15.19 (Debian 15.19-1.pgdg13+2)
-- Dumped by pg_dump version 15.19 (Debian 15.19-1.pgdg13+2)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: _sqlx_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

SET SESSION AUTHORIZATION DEFAULT;

ALTER TABLE "public"."_sqlx_migrations" DISABLE TRIGGER ALL;

INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (1, 'setup', '2026-10-08 09:57:41.559458+00', true, '\x44748caaec8b09f6fa20eb95f83d8aea7f9d51afdc52bfcafa8c58d44bec7fb1a6fc711b6d7cc0548a9367dd2ac19a81', 8262829);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (2, 'warehouse', '2026-10-08 09:57:41.559458+00', true, '\x58f595584b3b88f1865995e4af0ef84d8908c80d2f77e8a19e02f130d4332292643a70664b9d297d16a7e8505fb3cfa3', 3545172);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (3, 'secret', '2026-10-08 09:57:41.559458+00', true, '\x225a1b4719428159722d577e561d28b65e05f0b25b194ffbf6b60c8a249622538387049a083769171281f6d0ea7b3dcb', 1332836);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (4, 'namespace', '2026-10-08 09:57:41.559458+00', true, '\xcecdbb17a4110070c57062bd62c8dd239bf71fa5610e2f9b471c794d580d7381bf6b7b2ca68e48e139828176efb690c9', 2679899);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (5, 'table', '2026-10-08 09:57:41.559458+00', true, '\x9aef13da32da13ffe98a021198fd0201d5ea7a25f82db1f9ddab765e307988de099005e4f6f26f0bf87ebd35e8b8ca89', 2788554);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20240620151429, 'timecolumns', '2026-10-08 09:57:41.559458+00', true, '\x255792dcad31ae41b33215ec2a724a6c758c8b56dd0cdb5916798745f55521c006c907085af498045869f48d42574547', 178247);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20240620151514, 'tabular identifiers', '2026-10-08 09:57:41.559458+00', true, '\xd229b1be11187cac021d6e546b4b6f4af59c4504ed8c3f1ddf6bcd96376e66ea8665f9d565a8e2e6c3b4ce7dfa6fb311', 8735270);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20240620151544, 'views', '2026-10-08 09:57:41.559458+00', true, '\x070336ffd87183e9e5bd4b1c72b025d71ed504d9d92ab12b33b8031fd5af2cf1a0dd9917e6bb4e625c749e1408dd1e1b', 12562234);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20240897111544, 'view versions are i32', '2026-10-08 09:57:41.559458+00', true, '\x84f46223a0c4a900a026d08922ea82c40e0961bc506310b38e3f247ee0b62c0f84daf48fc840ea93dd269b7f201ed128', 8416257);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20240898160621, 'tabular deleted at', '2026-10-08 09:57:41.559458+00', true, '\x19152bb9a9069d3e708d6559d816b284db33823f8b6fa52656a80cc0b46009e9830cf3b9b7c9b9087f4c68cffcf6e3d1', 249511);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20240898175225, 'tabular deletion extended', '2026-10-08 09:57:41.559458+00', true, '\x96f284a89006b4f8317c7c78e0969b5f81948124d71c17338cd9267954e4ff117a0eecbf99acbdae6d6b46a330db08ad', 1215926);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20240899175225, 'tabular expiration', '2026-10-08 09:57:41.559458+00', true, '\x19cac9768c9b611a14f459c434cbe02291a8fdbf6585db17f3349db51c6ab17f9771b6487141a2ea70b310cd12590458', 6392027);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20240909120857, 'configurable drops', '2026-10-08 09:57:41.559458+00', true, '\xc7b480b4d576d774c6da07b2011225be3e1392d6e80c102722e1f64bbf7d7317c64fc193dd9bdc33e81ae80dba0d1c06', 799349);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20240911094637, 'unique tabular location', '2026-10-08 09:57:41.559458+00', true, '\x5d68135df940e2bf31b496b258df36e31218ce4feacb49ab37cc272603edfb2a5f6d67edfafc34ba6773d75bbfb7878e', 700292);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20241006083546, 'projects-table', '2026-10-08 09:57:41.559458+00', true, '\x300a586e0947cf994fb1043af0acddd2eabed168b94b215038e3c9f7668a1328402914abd5e5983cd5b6b25698dfb153', 2230340);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20241009122911, 'users and roles', '2026-10-08 09:57:41.559458+00', true, '\x633c0a8822c896e89249d5ada24c39dc1197b132b57d462cc4e59566851fc5dbeb5d064e900f15345de5c221af59a579', 21414505);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20241011203612, 'server', '2026-10-08 09:57:41.559458+00', true, '\x4571f34b4f62ecc9f90e413c228d37f59c278b478d3ceefb7ec546b31321df2a8aa020db9b7e5be266481c1ffdb2b577', 1700170);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20241106163000, 'user email search', '2026-10-08 09:57:41.559458+00', true, '\x4e98d3e168ffc1c9901351bbc86d085025ede29b96270154cc843749d9c27a7bb1052a8703e0ec345c88523780610e82', 552864);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20241106201139, 'split table metadata', '2026-10-08 09:57:41.559458+00', true, '\xc4292b2f4c49baa6c42aabebbee93c9dc64c63b45ecbb791a875b78f48a84980db8b9fcb3b2baf20d26c8870e1ef4e4c', 22264730);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20241117144332, 'task queue indexes', '2026-10-08 09:57:41.559458+00', true, '\x93069e237dc85e2d6ec5bf717feb088b71beffa3c74c97003c859e9ded5c5f265e8121970952f907777d6b2744695cdf', 855105);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20241216114355, 'table statistics', '2026-10-08 09:57:41.559458+00', true, '\x8ddc9dbca113fb69dfcf3c5311c3e5b24450b42300eeb2848cceb3f56de3e9e1b9a95953b5f8b5d224937f94477007eb', 3888862);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20241216150545, 'fix schemaless snapshots', '2026-10-08 09:57:41.559458+00', true, '\xc06ec31cf310ef63bbed99590b05ee1a4d1df51cf1378bc3291d82261f864c0ae4501896cca3ec35e44cf123e28976da', 148600);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20241224055514, 'unique user email', '2026-10-08 09:57:41.559458+00', true, '\xd5fc3bcb8af5706cea9434a948fc6426f083e6bf31f94389953440d4e7f054994562f6cdedec1ab7df5cc06f892918cf', 636732);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20250108131004, 'statistics', '2026-10-08 09:57:41.559458+00', true, '\x87c07858acedf8b9599d1eee6a9bbe23e2430aef4012f673b2d2ff719df3f99cb214252a0307993cb114339eb04a949d', 2503536);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20250216105917, 'variant protocols', '2026-10-08 09:57:41.559458+00', true, '\x76c58ded446245c86dd7cac5bddd34ccd9126db5eae307a5942c18875126f5999238569c02076742d63dc3c7a98fa222', 2081129);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20250304100842, 'string project ids', '2026-10-08 09:57:41.559458+00', true, '\x42d41bcc48fde8622073cd669b7eeba8396f3b463aec28e4370402ada7f9eefa424cca45f074ca540a7c4dfea46e5d65', 2983101);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20250310181331, 'endpoint stats', '2026-10-08 09:57:41.559458+00', true, '\x0e475131b17449d48330d9979e78c69e43d72854e691528a9a7a9a83acf8658142865c552424848089b45239848ee59f', 3830321);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20250326153233, 'table statistics fkey', '2026-10-08 09:57:41.559458+00', true, '\xda90a37bee3f857b21e8374f1adefc865b8bf05ce090d06626eb34a135f58159ae598a0afab8bb29aa6a2e16ca440c9b', 807855);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20250328131139, 'fix sequence number', '2026-10-08 09:57:41.559458+00', true, '\xd8a6efb1006b7f9477c511c70591da1c73e6b2e6ada9fa9062524444213faed8cd8dc32ce5db8a7254a4ffc4459532fe', 499283);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20250401163352, 'project id constraints', '2026-10-08 09:57:41.559458+00', true, '\xa16230d4226b6a55a644c24239f5fbb40be816d96aa4ecc3b155a41042bd30892ec06996dcb64f3951110419b48e6a53', 919626);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20250407144536, 'fix warehouse deletion fk', '2026-10-08 09:57:41.559458+00', true, '\xdc02cc58d053f9fad616db6705cfff33364fa822e22e29f0f9228feab8835164cd266b7466c72ced1b12eeee3d8fa590', 607757);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20250409201248, 'cascade delete', '2026-10-08 09:57:41.559458+00', true, '\x725285449a654945fffa2a2941799acecce7e38d37fe13e32b8ad690b6365760a058ebc2fcdb9ba9d8e2b57892d9e8d9', 960874);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20250410024101, 'fix warehouse stats', '2026-10-08 09:57:41.559458+00', true, '\x563ba555ceeade50819aee877fd130d1c5b7cf8286b571ba8fc28f01d3a97c73de60a2027c62dd6abfc00fec1d3b49bb', 5259549);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20250412220607, 'restructure endpoints', '2026-10-08 09:57:41.559458+00', true, '\xa82ad2ccbb7eaa4e3bcac1c246ce901ab97e12951345d3b55699e6428b3560f2103bde8899694a7ea0d80fbf2a43c7c8', 7759538);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20250428072447, 'add task warehouse id idx', '2026-10-08 09:57:41.559458+00', true, '\x456a06466a8f75dd5db3779c046ae55dfb3c4f9ce3d5b72bce99aa4a77ce4bf85545fcd0390b0e3f8c5106185b95ea28', 2891899);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20250505101407, 'fix index function', '2026-10-08 09:57:41.559458+00', true, '\x2b2885dbc012ecaac71fc2e3a2c67399c5d30139f8176e613c574dd834e07a7010f5cfdaf7206e3f0ac48fef7e795593', 108875);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20250506094141, 'fix index function2', '2026-10-08 09:57:41.559458+00', true, '\x41d5623f06bcd747458a96bef6d49edd8f21820d484f95e97298032bb143dc671cc5f8c6defc7305727525b25830b302', 58170);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20250513172324, 's3 sign table endpoint', '2026-10-08 09:57:41.559458+00', true, '\x14c7c0c6f8698b881fb1b7886c8e77c9aafb1e2a0b5c83f92b676cee98267f444448d0fcad4a6616cebfb55b2bb84891', 244271);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20250523101407, 'tasks store their state', '2026-10-08 09:57:41.559458+00', true, '\xd683513c18f6c69d5554f5b6668440a0f0f986cace59c1b5be5c81be9c72c65db2190f22554348b1b51a949a6f841309', 11937254);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20250623114333, 'fix soft deleted tabulars', '2026-10-08 09:57:41.559458+00', true, '\x69c17d9fa0097f5fdae0038bba6456928b019b013fa1fa2e59f94557f200b02d5c7e93c48c32f158a21212a8a2594bfd', 1897562);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20250826171037, 'task runtime information', '2026-10-08 09:57:41.559458+00', true, '\xe94445d3c02c310458359196019123c8ca5f1e060139730b3e914b26d1b51cbf0011a1feff343929af3ba1cff4c7b6c2', 5837610);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20250904142650, 'reusable table id', '2026-10-08 09:57:41.559458+00', true, '\xa514abf508d7e9183c5bc293656010c2cf1e42e05f0caba5fa3e2a2f2dd43d8f5aae151a13eea886459720faa4dd95fc', 26676007);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20250919101934, 'add task entity name', '2026-10-08 09:57:41.559458+00', true, '\x5f1014aa1080bb434de90cb511101d77cf471b210afe9bbaf9f197d50da51f439a5d60fec317c0546d6e4ade0bf7ebc9', 3835922);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20250923102542, 'v3 support', '2026-10-08 09:57:41.559458+00', true, '\x3a79587d573174c1286da46ad4644b97badcefe80556fe4c50cb2e84d57d7435783b62f671dcab7a8bd4a70c4884f64d', 2518444);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20250923164029, 'fuzzy tabular search', '2026-10-08 09:57:41.559458+00', true, '\x103bb5d0f13ea02d35b70ae495d8964412251c90dbea7ddd1ed3d1caea692dd22a7a539cedf076ca73d6cf59a2657452', 18116529);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20250930101627, 'active tabulars remove namespace join', '2026-10-08 09:57:41.559458+00', true, '\x593c731cd893b3fd8ef983a4f75009528808d810593f2727f52ca10a344a0d1e8174d7a9e88881f79417f5666dc28a59', 768170);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20251003103404, 'fix project endpoint stats', '2026-10-08 09:57:41.559458+00', true, '\x569ccc3f2c9d7bb50ec89fdc888769a65ca3236f89b01b896f13867b4bddfcdb262b9002cede9e93f2bf5cd4e54600bf', 301699);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20251027163724, 'introduce entity versions', '2026-10-08 09:57:41.559458+00', true, '\xfc4c004bb9ec2f641bd3d4dfab45cbf5baaeeeb2bb0175c14cd53ee4ea50aec503d9a228788530ff483533d8b0576323', 1069640);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20251109122721, 'role project filter', '2026-10-08 09:57:41.559458+00', true, '\x606b2b212b19609b678003d25557fe62ad58bf1d1aeecbcac18419a7982749c12f98603d917c2a459473dfb7ad4d80e2', 606876);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20251117114624, 'action endpoint statistics', '2026-10-08 09:57:41.559458+00', true, '\x9d543932d02cac35ce815e8cd6701e95843bd15b3d79ad94098a1dcb2ba02e0909ec48b76055c020ac7b0da7139ed45b', 643394);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20251121072340, 'role external id', '2026-10-08 09:57:41.559458+00', true, '\x3a3ff71ca594036dfabb1afc0050dfa252c664b4407c59659812d238ae46f5156e0da5acb888f9e9fddbd9e5576e2ed0', 776536);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20251228101923, 'enable tasks on project level', '2026-10-08 09:57:41.559458+00', true, '\x4b37aefd7ee8a615b002440ac5ab0c24ad02972d6e591f762281edee819618ef00aac0b419aa6f34fe2933ca22d81a37', 12357718);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20260219081950, 'improve list performance', '2026-10-08 09:57:41.559458+00', true, '\xe274713de4ad41421623946f543cd00aeea5e2e34fdee15755130ececf4bde79dd6661e5dcb888bc1435558d3bbf733c', 4262376);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20260220011106, 'string role id', '2026-10-08 09:57:41.559458+00', true, '\xec8049a0a96bae04831452df46f3d3998db0e786b2f50b8dcb28d2e9cdb52da42121a79f2c76e3ba03ebe53c015923bf', 1504350);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20260301083426, 'user role mappings', '2026-10-08 09:57:41.559458+00', true, '\xb4793d54e8352013c49bcc67f529dec265f0ca73e8480fa36ead31402de6de6658e186b6e558612f1ed184c29c195b90', 3545944);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20260318120000, 'idempotency record', '2026-10-08 09:57:41.559458+00', true, '\xfbd914a0cb067ade744d4f3461a668c8c22253df4958759aab7833440369c2a0faed7d7f80ce57a6cf1080d817261564', 1379645);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20260513091606, 'drop unique user email', '2026-10-08 09:57:41.559458+00', true, '\xda8f014576ee46e50bc33d914b4659fe02591b2d72084c33722ac0b0ae2ecb6b59acd1d3b4746c3637e197a02ca88b67', 98486);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20260525120000, 'fix namespace trigger wholerow when', '2026-10-08 09:57:41.559458+00', true, '\x29be3c0d646d1aff68f5c5efb8a1463e4a27d11b666e3c13affd430665e53b68aa7570ec7d2df354a0cd70d2b0b65a4c', 219455);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20260527120000, 'add schedule task endpoint', '2026-10-08 09:57:41.559458+00', true, '\xa046d7c4047684771dd416596e100d0f6eee2731fa0a4266957f98dbf9eea6c1ca595a75ca0c078bfa61bd7c84e95b0d', 103235);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20260529000000, 'add generic table', '2026-10-08 09:57:41.559458+00', true, '\x519eb57638de32a80737b143ea5cb22b6417ebd17abc2896fb9b13d7b68439096b0a48c18be6b5caced1dc55cb71a8fe', 14931837);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20260529120000, 'warehouse format version policy', '2026-10-08 09:57:41.559458+00', true, '\x46fb8da91a336e1f3d8560bfae3b9824cc0ed2db516a2eccbf916b20ffa555700082b9ff7d1b3bfe7ff294b6ec154d0f', 678812);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20260601000000, 'role membership', '2026-10-08 09:57:41.559458+00', true, '\x7c2f6323b7f8ef844a2b91b3f7bfd5caa89ddd54a1f72ace7f16a616134cf78731b3246a69058660ddf34ce9cf5d14f1', 1456910);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20260605000000, 'warehouse managed by', '2026-10-08 09:57:41.559458+00', true, '\x7d09b329832755e7e36a2f83f4c36a8f89e3be1f4ff404048eb3714d48b66dadfffeda6b31a63d16ec77cf1b421b46a6', 329773);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20260607000000, 'role membership endpoints and user name nullable', '2026-10-08 09:57:41.559458+00', true, '\x70f8ac73b2de457e8632f5a14d14072930abc01055c0033413862d3587f7f76978f6e6e0c077069e2e8c0c21f2bce1ed', 1397398);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20260625000000, 'normalized schema', '2026-10-08 09:57:41.559458+00', true, '\x9bc3e8e236d24341c7eedccb8bd9c1db43799ebbb0af38619352ef27ecf78e81861d08fe92c300c5d12b6c4fb82f1887', 5183225);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20260720000000, 'tags', '2026-10-08 09:57:41.559458+00', true, '\x42d3e2bbc08fb9d280ff33c189166aec552df008c03e394acc48b57af3ac2d76e9f11a9b6ea78e56db873016d8adc05d', 11866151);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20260806220000, 'add warehouse validate endpoints', '2026-10-08 09:57:41.559458+00', true, '\xb4e371ba6bd76966341081177d8339fb35955a2af30bc5ce9136c25296084ed8f714de0a474fd0fd488ebbfc19df62b4', 304244);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20260811000000, 'grants', '2026-10-08 09:57:41.559458+00', true, '\x8b1e897da492fd4691706ac3e60dabafaaa9989aeab480949872b574380ab6bc5c2da6c82e095d7c1c5dec045c7bf565', 10742449);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20260812090000, 'add move namespace endpoint', '2026-10-08 09:57:41.559458+00', true, '\x766efaa7abe4dc1ef7e6fb2ad999eae2825d4149157d0fcca6e2c242bb95db62e663ffdd9cb6d129e9b1ad7b45bc99ff', 115708);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20260813000000, 'fix list tabulars index', '2026-10-08 09:57:41.559458+00', true, '\x2fcb76367038f8bd09f8f18cb9ef41180235ae37c0048d43ad8ce81c94baea906a9a177e4816c3a40c3933a9e17eebff', 750417);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20260814090000, 'sign by table name endpoint', '2026-10-08 09:57:41.559458+00', true, '\xb6c5d69e27d73bf2e6e6071ba71ee285e140c1b13424e41dc19a080f6f37007a056bea0ea7f30f778317a3d8086cbe9c', 142519);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20260829000000, 'subtree grants', '2026-10-08 09:57:41.559458+00', true, '\xf3e82af6deeb69d7a9d81bcedea6c5844d2978c12e36802faca770ea60f041014c280ae8ab40f1b62d85144b1320a7f7', 826431);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20260830000000, 'normalize and index tabular location', '2026-10-08 09:57:41.559458+00', true, '\x4686281ba5646c5e42aded6337c592aa6cdc435fbe0d68419ee81901c2c6abdb493fa54dcc7fc724c03e09e14147f543', 596547);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20261005000000, 'server grants users only', '2026-10-08 09:57:41.559458+00', true, '\xc5414310e3517a329db06f0d39bfd75b77c1e2cc87d79167243a9e7980015626d1b6fc0a869491e743ac84b6176d4789', 515042);


ALTER TABLE "public"."_sqlx_migrations" ENABLE TRIGGER ALL;

--
-- Data for Name: project; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."project" DISABLE TRIGGER ALL;

INSERT INTO "public"."project" ("project_name", "created_at", "updated_at", "project_id", "version") VALUES ('Default Project', '2026-10-08 09:57:44.691584+00', NULL, '00000000-0000-0000-0000-000000000000', 0);
INSERT INTO "public"."project" ("project_name", "created_at", "updated_at", "project_id", "version") VALUES ('finance', '2026-10-08 09:57:44.804961+00', NULL, '01a11af2-88e5-7b11-90c2-1c1419cbf26a', 0);


ALTER TABLE "public"."project" ENABLE TRIGGER ALL;

--
-- Data for Name: warehouse; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."warehouse" DISABLE TRIGGER ALL;

INSERT INTO "public"."warehouse" ("warehouse_id", "warehouse_name", "storage_profile", "storage_secret_id", "created_at", "updated_at", "status", "tabular_expiration_seconds", "tabular_delete_mode", "project_id", "protected", "version", "allowed_format_versions", "default_format_version", "managed_by") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', 'wh_hard', '{"type": "s3", "bucket": "warehouse", "flavor": "s3-compat", "region": "local-01", "endpoint": "http://minio:9000/", "key-prefix": "hard", "sts-enabled": true, "sts-endpoint": null, "sts-role-arn": null, "storage-layout": null, "assume-role-arn": null, "aws-kms-key-arn": null, "sts-session-tags": {}, "path-style-access": true, "legacy-md5-behavior": null, "remote-signing-enabled": true, "push-s3-delete-disabled": true, "remote-signing-url-style": "auto", "sts-token-validity-seconds": 3600, "allow-alternative-protocols": null}', 'b58c1e72-c2fe-11f1-a837-1fda95cecced', '2026-10-08 09:57:44.852271+00', NULL, 'active', NULL, 'hard', '00000000-0000-0000-0000-000000000000', false, 0, '{1,2,3}', NULL, 'self-managed');
INSERT INTO "public"."warehouse" ("warehouse_id", "warehouse_name", "storage_profile", "storage_secret_id", "created_at", "updated_at", "status", "tabular_expiration_seconds", "tabular_delete_mode", "project_id", "protected", "version", "allowed_format_versions", "default_format_version", "managed_by") VALUES ('01a11af2-8949-7551-b98c-b422f0fc2104', 'wh_off', '{"type": "s3", "bucket": "warehouse", "flavor": "s3-compat", "region": "local-01", "endpoint": "http://minio:9000/", "key-prefix": "off", "sts-enabled": true, "sts-endpoint": null, "sts-role-arn": null, "storage-layout": null, "assume-role-arn": null, "aws-kms-key-arn": null, "sts-session-tags": {}, "path-style-access": true, "legacy-md5-behavior": null, "remote-signing-enabled": true, "push-s3-delete-disabled": true, "remote-signing-url-style": "auto", "sts-token-validity-seconds": 3600, "allow-alternative-protocols": null}', 'b595de08-c2fe-11f1-a837-d7d0dabe3aaa', '2026-10-08 09:57:44.91729+00', '2026-10-08 09:57:44.93778+00', 'inactive', NULL, 'hard', '00000000-0000-0000-0000-000000000000', false, 1, '{1,2,3}', NULL, 'self-managed');
INSERT INTO "public"."warehouse" ("warehouse_id", "warehouse_name", "storage_profile", "storage_secret_id", "created_at", "updated_at", "status", "tabular_expiration_seconds", "tabular_delete_mode", "project_id", "protected", "version", "allowed_format_versions", "default_format_version", "managed_by") VALUES ('01a11af2-8928-7093-9114-577cfc8b406c', 'wh_soft', '{"type": "s3", "bucket": "warehouse", "flavor": "s3-compat", "region": "local-01", "endpoint": "http://minio:9000/", "key-prefix": "soft", "sts-enabled": true, "sts-endpoint": null, "sts-role-arn": null, "storage-layout": null, "assume-role-arn": null, "aws-kms-key-arn": null, "sts-session-tags": {}, "path-style-access": true, "legacy-md5-behavior": null, "remote-signing-enabled": true, "push-s3-delete-disabled": true, "remote-signing-url-style": "auto", "sts-token-validity-seconds": 3600, "allow-alternative-protocols": null}', 'b590e15a-c2fe-11f1-b7df-43f0b09b7b86', '2026-10-08 09:57:44.883954+00', '2026-10-08 09:57:44.952511+00', 'active', 86400, 'soft', '00000000-0000-0000-0000-000000000000', true, 1, '{1,2,3}', NULL, 'self-managed');


ALTER TABLE "public"."warehouse" ENABLE TRIGGER ALL;

--
-- Data for Name: namespace; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."namespace" DISABLE TRIGGER ALL;

INSERT INTO "public"."namespace" ("namespace_id", "warehouse_id", "namespace_name", "namespace_properties", "created_at", "updated_at", "protected", "version") VALUES ('01a11af2-8989-7d92-b253-4bee1721c6f3', '01a11af2-88f2-7f21-bfcf-3c8f1265c632', '{sales}', '{"owner": "analytics", "location": "s3://warehouse/hard"}', '2026-10-08 09:57:44.969191+00', NULL, false, 0);
INSERT INTO "public"."namespace" ("namespace_id", "warehouse_id", "namespace_name", "namespace_properties", "created_at", "updated_at", "protected", "version") VALUES ('01a11af2-8994-7c13-9f7b-ef799dadb486', '01a11af2-88f2-7f21-bfcf-3c8f1265c632', '{sales,eu}', '{"location": "s3://warehouse/hard"}', '2026-10-08 09:57:44.980291+00', NULL, false, 0);
INSERT INTO "public"."namespace" ("namespace_id", "warehouse_id", "namespace_name", "namespace_properties", "created_at", "updated_at", "protected", "version") VALUES ('01a11af2-89a6-7f40-9857-c6b7ab62fba7', '01a11af2-88f2-7f21-bfcf-3c8f1265c632', '{sales,eu,q1}', '{"location": "s3://warehouse/hard", "retention": "5y"}', '2026-10-08 09:57:44.998245+00', NULL, false, 0);
INSERT INTO "public"."namespace" ("namespace_id", "warehouse_id", "namespace_name", "namespace_properties", "created_at", "updated_at", "protected", "version") VALUES ('01a11af2-89af-7713-bcd4-b735d3d4de9c', '01a11af2-88f2-7f21-bfcf-3c8f1265c632', '{logs}', '{"location": "s3://warehouse/hard"}', '2026-10-08 09:57:45.00786+00', NULL, false, 0);
INSERT INTO "public"."namespace" ("namespace_id", "warehouse_id", "namespace_name", "namespace_properties", "created_at", "updated_at", "protected", "version") VALUES ('01a11af2-89b9-76e0-85fa-74709abf4b39', '01a11af2-8928-7093-9114-577cfc8b406c', '{staging}', '{"location": "s3://warehouse/soft"}', '2026-10-08 09:57:45.017523+00', NULL, false, 0);


ALTER TABLE "public"."namespace" ENABLE TRIGGER ALL;

--
-- Data for Name: tabular; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."tabular" DISABLE TRIGGER ALL;

INSERT INTO "public"."tabular" ("tabular_id", "namespace_id", "name", "typ", "metadata_location", "created_at", "updated_at", "deleted_at", "fs_protocol", "fs_location", "protected", "warehouse_id", "tabular_namespace_name") VALUES ('01a11af2-89c9-7d01-9b5c-8b526777f564', '01a11af2-8994-7c13-9f7b-ef799dadb486', 'orders', 'table', 's3://warehouse/hard/01a11af2-89c9-7d01-9b5c-8b526777f564/metadata/00002-01a11af2-8a1e-7951-abd2-80b284d20849.gz.metadata.json', '2026-10-08 09:57:45.034072+00', '2026-10-08 09:57:45.121949+00', NULL, 's3', 'warehouse/hard/01a11af2-89c9-7d01-9b5c-8b526777f564', false, '01a11af2-88f2-7f21-bfcf-3c8f1265c632', '{sales,eu}');
INSERT INTO "public"."tabular" ("tabular_id", "namespace_id", "name", "typ", "metadata_location", "created_at", "updated_at", "deleted_at", "fs_protocol", "fs_location", "protected", "warehouse_id", "tabular_namespace_name") VALUES ('01a11af2-8a2f-7ef0-b17e-7a052c1a829b', '01a11af2-89af-7713-bcd4-b735d3d4de9c', 'events', 'table', 's3://warehouse/hard/01a11af2-8a2f-7ef0-b17e-7a052c1a829b/metadata/00000-01a11af2-8a30-7571-98f7-2f6219c89383.gz.metadata.json', '2026-10-08 09:57:45.136161+00', NULL, NULL, 's3', 'warehouse/hard/01a11af2-8a2f-7ef0-b17e-7a052c1a829b', false, '01a11af2-88f2-7f21-bfcf-3c8f1265c632', '{logs}');
INSERT INTO "public"."tabular" ("tabular_id", "namespace_id", "name", "typ", "metadata_location", "created_at", "updated_at", "deleted_at", "fs_protocol", "fs_location", "protected", "warehouse_id", "tabular_namespace_name") VALUES ('01a11af2-8a41-7d10-aacb-23614773cc3b', '01a11af2-8994-7c13-9f7b-ef799dadb486', 'orders_v3', 'table', 's3://warehouse/hard/01a11af2-8a41-7d10-aacb-23614773cc3b/metadata/00001-01a11af2-8a6c-7443-af3d-687601c2f3c0.gz.metadata.json', '2026-10-08 09:57:45.154055+00', '2026-10-08 09:57:45.199367+00', NULL, 's3', 'warehouse/hard/01a11af2-8a41-7d10-aacb-23614773cc3b', false, '01a11af2-88f2-7f21-bfcf-3c8f1265c632', '{sales,eu}');
INSERT INTO "public"."tabular" ("tabular_id", "namespace_id", "name", "typ", "metadata_location", "created_at", "updated_at", "deleted_at", "fs_protocol", "fs_location", "protected", "warehouse_id", "tabular_namespace_name") VALUES ('01a11af2-8a7a-7f02-9c0b-6b1d94784dba', '01a11af2-89af-7713-bcd4-b735d3d4de9c', 'encrypted_v3', 'table', 's3://warehouse/hard/01a11af2-8a7a-7f02-9c0b-6b1d94784dba/metadata/00001-01a11af2-8aa5-7fe3-ba24-8e94327c509b.gz.metadata.json', '2026-10-08 09:57:45.210855+00', '2026-10-08 09:57:45.256749+00', NULL, 's3', 'warehouse/hard/01a11af2-8a7a-7f02-9c0b-6b1d94784dba', false, '01a11af2-88f2-7f21-bfcf-3c8f1265c632', '{logs}');
INSERT INTO "public"."tabular" ("tabular_id", "namespace_id", "name", "typ", "metadata_location", "created_at", "updated_at", "deleted_at", "fs_protocol", "fs_location", "protected", "warehouse_id", "tabular_namespace_name") VALUES ('01a11af2-8ab3-7cc2-a2d1-93c7f183043f', '01a11af2-89af-7713-bcd4-b735d3d4de9c', 'legacy_v1', 'table', 's3://warehouse/hard/01a11af2-8ab3-7cc2-a2d1-93c7f183043f/metadata/00000-01a11af2-8ab4-7201-a4bc-241fa454c030.gz.metadata.json', '2026-10-08 09:57:45.268117+00', NULL, NULL, 's3', 'warehouse/hard/01a11af2-8ab3-7cc2-a2d1-93c7f183043f', false, '01a11af2-88f2-7f21-bfcf-3c8f1265c632', '{logs}');
INSERT INTO "public"."tabular" ("tabular_id", "namespace_id", "name", "typ", "metadata_location", "created_at", "updated_at", "deleted_at", "fs_protocol", "fs_location", "protected", "warehouse_id", "tabular_namespace_name") VALUES ('01a11af2-8ac6-7e82-9d7f-b08bf79a2dc6', '01a11af2-89af-7713-bcd4-b735d3d4de9c', 'audit', 'table', 's3://warehouse/hard/01a11af2-8ac6-7e82-9d7f-b08bf79a2dc6/metadata/00000-01a11af2-8ac6-7e82-9d7f-b096ee911edd.gz.metadata.json', '2026-10-08 09:57:45.286715+00', '2026-10-08 09:57:45.316911+00', NULL, 's3', 'warehouse/hard/01a11af2-8ac6-7e82-9d7f-b08bf79a2dc6', true, '01a11af2-88f2-7f21-bfcf-3c8f1265c632', '{logs}');
INSERT INTO "public"."tabular" ("tabular_id", "namespace_id", "name", "typ", "metadata_location", "created_at", "updated_at", "deleted_at", "fs_protocol", "fs_location", "protected", "warehouse_id", "tabular_namespace_name") VALUES ('01a11af2-8b0c-7f33-aa87-ab8863800f8e', '01a11af2-89b9-76e0-85fa-74709abf4b39', 'retired', 'table', 's3://warehouse/soft/01a11af2-8b0c-7f33-aa87-ab8863800f8e/metadata/00000-01a11af2-8b0c-7f33-aa87-ab9e4906d736.gz.metadata.json', '2026-10-08 09:57:45.356823+00', '2026-10-08 09:57:45.373329+00', '2026-10-08 09:57:45.374063+00', 's3', 'warehouse/soft/01a11af2-8b0c-7f33-aa87-ab8863800f8e', false, '01a11af2-8928-7093-9114-577cfc8b406c', '{staging}');
INSERT INTO "public"."tabular" ("tabular_id", "namespace_id", "name", "typ", "metadata_location", "created_at", "updated_at", "deleted_at", "fs_protocol", "fs_location", "protected", "warehouse_id", "tabular_namespace_name") VALUES ('01a11af2-8b26-7093-816a-1831c4bc4b7e', '01a11af2-8994-7c13-9f7b-ef799dadb486', 'evolved', 'table', 's3://warehouse/hard/01a11af2-8b26-7093-816a-1831c4bc4b7e/metadata/00008-01a11af2-8bd4-7693-bc93-e7ab6c3bbcc5.gz.metadata.json', '2026-10-08 09:57:45.382486+00', '2026-10-08 09:57:45.559444+00', NULL, 's3', 'warehouse/hard/01a11af2-8b26-7093-816a-1831c4bc4b7e', false, '01a11af2-88f2-7f21-bfcf-3c8f1265c632', '{sales,eu}');
INSERT INTO "public"."tabular" ("tabular_id", "namespace_id", "name", "typ", "metadata_location", "created_at", "updated_at", "deleted_at", "fs_protocol", "fs_location", "protected", "warehouse_id", "tabular_namespace_name") VALUES ('01a11af2-8be3-7f01-9900-faaede7c910e', '01a11af2-8994-7c13-9f7b-ef799dadb486', 'eu_orders', 'view', 's3://warehouse/hard/01a11af2-8be3-7f01-9900-faaede7c910e/metadata/00001-01a11af2-8bf9-74c2-9215-c7fdbab8ce09.gz.metadata.json', '2026-10-08 09:57:45.571148+00', '2026-10-08 09:57:45.59002+00', NULL, 's3', 'warehouse/hard/01a11af2-8be3-7f01-9900-faaede7c910e', false, '01a11af2-88f2-7f21-bfcf-3c8f1265c632', '{sales,eu}');
INSERT INTO "public"."tabular" ("tabular_id", "namespace_id", "name", "typ", "metadata_location", "created_at", "updated_at", "deleted_at", "fs_protocol", "fs_location", "protected", "warehouse_id", "tabular_namespace_name") VALUES ('01a11af2-8c0c-79a1-954f-f96ebad34946', '01a11af2-8994-7c13-9f7b-ef799dadb486', 'eu_orders_cat', 'view', 's3://warehouse/hard/01a11af2-8c0c-79a1-954f-f96ebad34946/metadata/00000-01a11af2-8c0c-79a1-954f-f96ebad34946.gz.metadata.json', '2026-10-08 09:57:45.612822+00', NULL, NULL, 's3', 'warehouse/hard/01a11af2-8c0c-79a1-954f-f96ebad34946', false, '01a11af2-88f2-7f21-bfcf-3c8f1265c632', '{sales,eu}');
INSERT INTO "public"."tabular" ("tabular_id", "namespace_id", "name", "typ", "metadata_location", "created_at", "updated_at", "deleted_at", "fs_protocol", "fs_location", "protected", "warehouse_id", "tabular_namespace_name") VALUES ('01a11af2-8c1f-7421-bc00-365d7ffcaa3d', '01a11af2-89af-7713-bcd4-b735d3d4de9c', 'delta_events', 'generic-table', NULL, '2026-10-08 09:57:45.632151+00', NULL, NULL, 's3', 'warehouse/hard/logs/delta_events', false, '01a11af2-88f2-7f21-bfcf-3c8f1265c632', '{logs}');


ALTER TABLE "public"."tabular" ENABLE TRIGGER ALL;

--
-- Data for Name: view; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."view" DISABLE TRIGGER ALL;

INSERT INTO "public"."view" ("view_id", "view_format_version", "created_at", "updated_at", "warehouse_id") VALUES ('01a11af2-8be3-7f01-9900-faaede7c910e', 'v1', '2026-10-08 09:57:45.571148+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."view" ("view_id", "view_format_version", "created_at", "updated_at", "warehouse_id") VALUES ('01a11af2-8c0c-79a1-954f-f96ebad34946', 'v1', '2026-10-08 09:57:45.612822+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');


ALTER TABLE "public"."view" ENABLE TRIGGER ALL;

--
-- Data for Name: view_schema; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."view_schema" DISABLE TRIGGER ALL;

INSERT INTO "public"."view_schema" ("schema_id", "view_id", "schema", "created_at", "updated_at", "warehouse_id") VALUES (0, '01a11af2-8be3-7f01-9900-faaede7c910e', NULL, '2026-10-08 09:57:45.571148+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."view_schema" ("schema_id", "view_id", "schema", "created_at", "updated_at", "warehouse_id") VALUES (1, '01a11af2-8be3-7f01-9900-faaede7c910e', NULL, '2026-10-08 09:57:45.59002+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."view_schema" ("schema_id", "view_id", "schema", "created_at", "updated_at", "warehouse_id") VALUES (0, '01a11af2-8c0c-79a1-954f-f96ebad34946', NULL, '2026-10-08 09:57:45.612822+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');


ALTER TABLE "public"."view_schema" ENABLE TRIGGER ALL;

--
-- Data for Name: view_version; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."view_version" DISABLE TRIGGER ALL;

INSERT INTO "public"."view_version" ("view_id", "version_id", "schema_id", "timestamp", "default_namespace_id", "default_catalog", "summary", "created_at", "updated_at", "warehouse_id") VALUES ('01a11af2-8be3-7f01-9900-faaede7c910e', 2, 1, '2026-10-08 09:57:45+00', '01a11af2-8994-7c13-9f7b-ef799dadb486', NULL, '{"engine-name": "fixture"}', '2026-10-08 09:57:45.59002+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."view_version" ("view_id", "version_id", "schema_id", "timestamp", "default_namespace_id", "default_catalog", "summary", "created_at", "updated_at", "warehouse_id") VALUES ('01a11af2-8be3-7f01-9900-faaede7c910e', 1, 0, '2026-10-08 09:57:45.571+00', '01a11af2-8994-7c13-9f7b-ef799dadb486', NULL, '{"engine-name": "fixture"}', '2026-10-08 09:57:45.59002+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."view_version" ("view_id", "version_id", "schema_id", "timestamp", "default_namespace_id", "default_catalog", "summary", "created_at", "updated_at", "warehouse_id") VALUES ('01a11af2-8c0c-79a1-954f-f96ebad34946', 1, 0, '2026-10-08 09:57:45.612+00', '01a11af2-8994-7c13-9f7b-ef799dadb486', 'prod', '{"engine-name": "fixture"}', '2026-10-08 09:57:45.612822+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');


ALTER TABLE "public"."view_version" ENABLE TRIGGER ALL;

--
-- Data for Name: current_view_metadata_version; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."current_view_metadata_version" DISABLE TRIGGER ALL;

INSERT INTO "public"."current_view_metadata_version" ("view_id", "version_id", "created_at", "updated_at", "warehouse_id") VALUES ('01a11af2-8be3-7f01-9900-faaede7c910e', 2, '2026-10-08 09:57:45.59002+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."current_view_metadata_version" ("view_id", "version_id", "created_at", "updated_at", "warehouse_id") VALUES ('01a11af2-8c0c-79a1-954f-f96ebad34946', 1, '2026-10-08 09:57:45.612822+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');


ALTER TABLE "public"."current_view_metadata_version" ENABLE TRIGGER ALL;

--
-- Data for Name: endpoint_statistics; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."endpoint_statistics" DISABLE TRIGGER ALL;



ALTER TABLE "public"."endpoint_statistics" ENABLE TRIGGER ALL;

--
-- Data for Name: generic_table; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."generic_table" DISABLE TRIGGER ALL;

INSERT INTO "public"."generic_table" ("warehouse_id", "generic_table_id", "format", "doc", "schema_info", "statistics", "version", "created_at", "updated_at") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8c1f-7421-bc00-365d7ffcaa3d', 'delta', 'Delta table registered alongside the Iceberg tables', '{"columns": [{"name": "event_id", "type": "string"}]}', NULL, 0, '2026-10-08 09:57:45.632151+00', NULL);


ALTER TABLE "public"."generic_table" ENABLE TRIGGER ALL;

--
-- Data for Name: generic_table_properties; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."generic_table_properties" DISABLE TRIGGER ALL;

INSERT INTO "public"."generic_table_properties" ("warehouse_id", "generic_table_id", "key", "value", "created_at", "updated_at") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8c1f-7421-bc00-365d7ffcaa3d', 'owner', 'platform', '2026-10-08 09:57:45.632151+00', NULL);


ALTER TABLE "public"."generic_table_properties" ENABLE TRIGGER ALL;

--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."role" DISABLE TRIGGER ALL;

INSERT INTO "public"."role" ("id", "name", "description", "created_at", "updated_at", "project_id", "source_id", "provider_id", "version") VALUES ('01a11af2-889a-7030-8714-d72bc298a5c8', 'analysts', 'Reads the sales warehouse', '2026-10-08 09:57:44.73088+00', NULL, '00000000-0000-0000-0000-000000000000', '01a11af2-889a-7030-8714-d72bc298a5c8', 'lakekeeper', 0);
INSERT INTO "public"."role" ("id", "name", "description", "created_at", "updated_at", "project_id", "source_id", "provider_id", "version") VALUES ('01a11af2-88a8-78e3-831e-baa1448b7f7d', 'juniors', NULL, '2026-10-08 09:57:44.744917+00', NULL, '00000000-0000-0000-0000-000000000000', '01a11af2-88a8-78e3-831e-baa1448b7f7d', 'lakekeeper', 0);
INSERT INTO "public"."role" ("id", "name", "description", "created_at", "updated_at", "project_id", "source_id", "provider_id", "version") VALUES ('01a11af2-88b6-73b2-be9a-fc25e1e87c1d', 'robots', NULL, '2026-10-08 09:57:44.758286+00', NULL, '00000000-0000-0000-0000-000000000000', 'group-robots', 'oidc', 0);


ALTER TABLE "public"."role" ENABLE TRIGGER ALL;

--
-- Data for Name: tag_definition; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."tag_definition" DISABLE TRIGGER ALL;

INSERT INTO "public"."tag_definition" ("tag_definition_id", "project_id", "name", "description", "scope", "value_kind", "created_at", "updated_at") VALUES ('01a11af2-8c2b-7de2-89d0-406bf191b9ce', '00000000-0000-0000-0000-000000000000', 'pii', 'Carries personally identifiable information', '{warehouse,namespace,table,view,generic-table,column}', 'marker', '2026-10-08 09:57:45.643191+00', NULL);
INSERT INTO "public"."tag_definition" ("tag_definition_id", "project_id", "name", "description", "scope", "value_kind", "created_at", "updated_at") VALUES ('01a11af2-8c35-7c80-a897-09ed9ccaeb83', '00000000-0000-0000-0000-000000000000', 'owner', NULL, '{warehouse,namespace,table,view,generic-table,column}', 'free_text', '2026-10-08 09:57:45.653608+00', NULL);
INSERT INTO "public"."tag_definition" ("tag_definition_id", "project_id", "name", "description", "scope", "value_kind", "created_at", "updated_at") VALUES ('01a11af2-8c3d-7923-b778-c927aae8ded0', '00000000-0000-0000-0000-000000000000', 'tier', NULL, '{warehouse,namespace,table,view,generic-table,column}', 'enumerated', '2026-10-08 09:57:45.662008+00', NULL);


ALTER TABLE "public"."tag_definition" ENABLE TRIGGER ALL;

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."users" DISABLE TRIGGER ALL;

INSERT INTO "public"."users" ("id", "name", "email", "user_type", "last_updated_with", "deleted_at", "created_at", "updated_at") VALUES ('oidc~alice', 'Alice Analyst', 'alice@example.invalid', 'human', 'create-endpoint', NULL, '2026-10-08 09:57:44.704711+00', NULL);
INSERT INTO "public"."users" ("id", "name", "email", "user_type", "last_updated_with", "deleted_at", "created_at", "updated_at") VALUES ('kubernetes~pipeline', 'Nightly Pipeline', NULL, 'application', 'create-endpoint', NULL, '2026-10-08 09:57:44.718982+00', NULL);


ALTER TABLE "public"."users" ENABLE TRIGGER ALL;

--
-- Data for Name: grant_assignment; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."grant_assignment" DISABLE TRIGGER ALL;

INSERT INTO "public"."grant_assignment" ("grant_id", "principal_type", "user_id", "role_id", "privilege", "resource_type", "project_id", "warehouse_id", "namespace_id", "tabular_id", "tag_definition_id", "created_at") VALUES ('b619761e-c2fe-11f1-b7df-afb1039bf938', 'user', 'oidc~alice', NULL, 'list_users', 'server', NULL, NULL, NULL, NULL, NULL, '2026-10-08 09:57:45.777176+00');
INSERT INTO "public"."grant_assignment" ("grant_id", "principal_type", "user_id", "role_id", "privilege", "resource_type", "project_id", "warehouse_id", "namespace_id", "tabular_id", "tag_definition_id", "created_at") VALUES ('b61b71c6-c2fe-11f1-90cb-87e8aa9b97e7', 'role', NULL, '01a11af2-889a-7030-8714-d72bc298a5c8', 'create_warehouse', 'project', '00000000-0000-0000-0000-000000000000', NULL, NULL, NULL, NULL, '2026-10-08 09:57:45.79058+00');
INSERT INTO "public"."grant_assignment" ("grant_id", "principal_type", "user_id", "role_id", "privilege", "resource_type", "project_id", "warehouse_id", "namespace_id", "tabular_id", "tag_definition_id", "created_at") VALUES ('b61d31b4-c2fe-11f1-a837-6bdcf137927c', 'role', NULL, '01a11af2-889a-7030-8714-d72bc298a5c8', 'use', 'warehouse', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632', NULL, NULL, NULL, '2026-10-08 09:57:45.803223+00');
INSERT INTO "public"."grant_assignment" ("grant_id", "principal_type", "user_id", "role_id", "privilege", "resource_type", "project_id", "warehouse_id", "namespace_id", "tabular_id", "tag_definition_id", "created_at") VALUES ('b61edc26-c2fe-11f1-b1be-47882726ecbc', 'user', 'oidc~alice', NULL, 'get_metadata', 'namespace', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8994-7c13-9f7b-ef799dadb486', NULL, NULL, '2026-10-08 09:57:45.813704+00');
INSERT INTO "public"."grant_assignment" ("grant_id", "principal_type", "user_id", "role_id", "privilege", "resource_type", "project_id", "warehouse_id", "namespace_id", "tabular_id", "tag_definition_id", "created_at") VALUES ('b620b2a8-c2fe-11f1-bf44-6bc0c2f7ab73', 'user', 'oidc~alice', NULL, 'read_data', 'tabular', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632', NULL, '01a11af2-89c9-7d01-9b5c-8b526777f564', NULL, '2026-10-08 09:57:45.825647+00');
INSERT INTO "public"."grant_assignment" ("grant_id", "principal_type", "user_id", "role_id", "privilege", "resource_type", "project_id", "warehouse_id", "namespace_id", "tabular_id", "tag_definition_id", "created_at") VALUES ('b6226c42-c2fe-11f1-b7df-8ff15c1cb54a', 'role', NULL, '01a11af2-889a-7030-8714-d72bc298a5c8', 'select', 'tabular', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632', NULL, '01a11af2-8be3-7f01-9900-faaede7c910e', NULL, '2026-10-08 09:57:45.838134+00');
INSERT INTO "public"."grant_assignment" ("grant_id", "principal_type", "user_id", "role_id", "privilege", "resource_type", "project_id", "warehouse_id", "namespace_id", "tabular_id", "tag_definition_id", "created_at") VALUES ('b623fa30-c2fe-11f1-90cb-a389e6e1af84', 'role', NULL, '01a11af2-889a-7030-8714-d72bc298a5c8', 'read_data', 'tabular', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632', NULL, '01a11af2-8c1f-7421-bc00-365d7ffcaa3d', NULL, '2026-10-08 09:57:45.848275+00');
INSERT INTO "public"."grant_assignment" ("grant_id", "principal_type", "user_id", "role_id", "privilege", "resource_type", "project_id", "warehouse_id", "namespace_id", "tabular_id", "tag_definition_id", "created_at") VALUES ('b6258030-c2fe-11f1-a837-4f474cedb4ee', 'role', NULL, '01a11af2-889a-7030-8714-d72bc298a5c8', 'apply', 'tag', NULL, NULL, NULL, NULL, '01a11af2-8c2b-7de2-89d0-406bf191b9ce', '2026-10-08 09:57:45.858531+00');


ALTER TABLE "public"."grant_assignment" ENABLE TRIGGER ALL;

--
-- Data for Name: idempotency_record; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."idempotency_record" DISABLE TRIGGER ALL;



ALTER TABLE "public"."idempotency_record" ENABLE TRIGGER ALL;

--
-- Data for Name: table; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."table" DISABLE TRIGGER ALL;

INSERT INTO "public"."table" ("table_id", "metadata", "created_at", "updated_at", "table_format_version", "last_column_id", "last_sequence_number", "last_updated_ms", "last_partition_id", "warehouse_id", "next_row_id") VALUES ('01a11af2-89c9-7d01-9b5c-8b526777f564', NULL, '2026-10-08 09:57:45.034072+00', '2026-10-08 09:57:45.121949+00', '2', 11, 2, 1791453466000, 1000, '01a11af2-88f2-7f21-bfcf-3c8f1265c632', 0);
INSERT INTO "public"."table" ("table_id", "metadata", "created_at", "updated_at", "table_format_version", "last_column_id", "last_sequence_number", "last_updated_ms", "last_partition_id", "warehouse_id", "next_row_id") VALUES ('01a11af2-8a2f-7ef0-b17e-7a052c1a829b', NULL, '2026-10-08 09:57:45.136161+00', NULL, '2', 2, 0, 1791453465136, 999, '01a11af2-88f2-7f21-bfcf-3c8f1265c632', 0);
INSERT INTO "public"."table" ("table_id", "metadata", "created_at", "updated_at", "table_format_version", "last_column_id", "last_sequence_number", "last_updated_ms", "last_partition_id", "warehouse_id", "next_row_id") VALUES ('01a11af2-8a41-7d10-aacb-23614773cc3b', NULL, '2026-10-08 09:57:45.154055+00', '2026-10-08 09:57:45.199367+00', '3', 2, 2, 1791453466000, 999, '01a11af2-88f2-7f21-bfcf-3c8f1265c632', 35);
INSERT INTO "public"."table" ("table_id", "metadata", "created_at", "updated_at", "table_format_version", "last_column_id", "last_sequence_number", "last_updated_ms", "last_partition_id", "warehouse_id", "next_row_id") VALUES ('01a11af2-8a7a-7f02-9c0b-6b1d94784dba', NULL, '2026-10-08 09:57:45.210855+00', '2026-10-08 09:57:45.256749+00', '3', 1, 0, 1791453465253, 999, '01a11af2-88f2-7f21-bfcf-3c8f1265c632', 0);
INSERT INTO "public"."table" ("table_id", "metadata", "created_at", "updated_at", "table_format_version", "last_column_id", "last_sequence_number", "last_updated_ms", "last_partition_id", "warehouse_id", "next_row_id") VALUES ('01a11af2-8ab3-7cc2-a2d1-93c7f183043f', NULL, '2026-10-08 09:57:45.268117+00', NULL, '1', 1, 0, 1791453465268, 999, '01a11af2-88f2-7f21-bfcf-3c8f1265c632', 0);
INSERT INTO "public"."table" ("table_id", "metadata", "created_at", "updated_at", "table_format_version", "last_column_id", "last_sequence_number", "last_updated_ms", "last_partition_id", "warehouse_id", "next_row_id") VALUES ('01a11af2-8ac6-7e82-9d7f-b08bf79a2dc6', NULL, '2026-10-08 09:57:45.286715+00', NULL, '2', 1, 0, 1791453465286, 999, '01a11af2-88f2-7f21-bfcf-3c8f1265c632', 0);
INSERT INTO "public"."table" ("table_id", "metadata", "created_at", "updated_at", "table_format_version", "last_column_id", "last_sequence_number", "last_updated_ms", "last_partition_id", "warehouse_id", "next_row_id") VALUES ('01a11af2-8b0c-7f33-aa87-ab8863800f8e', NULL, '2026-10-08 09:57:45.356823+00', NULL, '2', 1, 0, 1791453465356, 999, '01a11af2-8928-7093-9114-577cfc8b406c', 0);
INSERT INTO "public"."table" ("table_id", "metadata", "created_at", "updated_at", "table_format_version", "last_column_id", "last_sequence_number", "last_updated_ms", "last_partition_id", "warehouse_id", "next_row_id") VALUES ('01a11af2-8b26-7093-816a-1831c4bc4b7e', NULL, '2026-10-08 09:57:45.382486+00', '2026-10-08 09:57:45.559444+00', '3', 20, 3, 1791453465556, 1003, '01a11af2-88f2-7f21-bfcf-3c8f1265c632', 140);


ALTER TABLE "public"."table" ENABLE TRIGGER ALL;

--
-- Data for Name: table_schema; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."table_schema" DISABLE TRIGGER ALL;

INSERT INTO "public"."table_schema" ("schema_id", "table_id", "schema", "created_at", "updated_at", "warehouse_id") VALUES (0, '01a11af2-89c9-7d01-9b5c-8b526777f564', NULL, '2026-10-08 09:57:45.034072+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."table_schema" ("schema_id", "table_id", "schema", "created_at", "updated_at", "warehouse_id") VALUES (0, '01a11af2-8a2f-7ef0-b17e-7a052c1a829b', NULL, '2026-10-08 09:57:45.136161+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."table_schema" ("schema_id", "table_id", "schema", "created_at", "updated_at", "warehouse_id") VALUES (0, '01a11af2-8a41-7d10-aacb-23614773cc3b', NULL, '2026-10-08 09:57:45.154055+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."table_schema" ("schema_id", "table_id", "schema", "created_at", "updated_at", "warehouse_id") VALUES (0, '01a11af2-8a7a-7f02-9c0b-6b1d94784dba', NULL, '2026-10-08 09:57:45.210855+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."table_schema" ("schema_id", "table_id", "schema", "created_at", "updated_at", "warehouse_id") VALUES (0, '01a11af2-8ab3-7cc2-a2d1-93c7f183043f', NULL, '2026-10-08 09:57:45.268117+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."table_schema" ("schema_id", "table_id", "schema", "created_at", "updated_at", "warehouse_id") VALUES (0, '01a11af2-8ac6-7e82-9d7f-b08bf79a2dc6', NULL, '2026-10-08 09:57:45.286715+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."table_schema" ("schema_id", "table_id", "schema", "created_at", "updated_at", "warehouse_id") VALUES (0, '01a11af2-8b0c-7f33-aa87-ab8863800f8e', NULL, '2026-10-08 09:57:45.356823+00', NULL, '01a11af2-8928-7093-9114-577cfc8b406c');
INSERT INTO "public"."table_schema" ("schema_id", "table_id", "schema", "created_at", "updated_at", "warehouse_id") VALUES (0, '01a11af2-8b26-7093-816a-1831c4bc4b7e', NULL, '2026-10-08 09:57:45.382486+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."table_schema" ("schema_id", "table_id", "schema", "created_at", "updated_at", "warehouse_id") VALUES (1, '01a11af2-8b26-7093-816a-1831c4bc4b7e', NULL, '2026-10-08 09:57:45.440661+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');


ALTER TABLE "public"."table_schema" ENABLE TRIGGER ALL;

--
-- Data for Name: table_snapshot; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."table_snapshot" DISABLE TRIGGER ALL;

INSERT INTO "public"."table_snapshot" ("snapshot_id", "table_id", "parent_snapshot_id", "sequence_number", "manifest_list", "summary", "schema_id", "timestamp_ms", "created_at", "updated_at", "warehouse_id", "first_row_id", "assigned_rows", "key_id") VALUES (3001, '01a11af2-89c9-7d01-9b5c-8b526777f564', NULL, 1, 's3://warehouse/hard/sales/eu/orders/metadata/snap-3001.avro', '{"operation": "append", "added-records": "100", "total-records": "100", "added-data-files": "2", "total-data-files": "2", "total-files-size": "2048", "total-delete-files": "0"}', 0, 1791453465000, '2026-10-08 09:57:45.09239+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632', NULL, NULL, NULL);
INSERT INTO "public"."table_snapshot" ("snapshot_id", "table_id", "parent_snapshot_id", "sequence_number", "manifest_list", "summary", "schema_id", "timestamp_ms", "created_at", "updated_at", "warehouse_id", "first_row_id", "assigned_rows", "key_id") VALUES (3002, '01a11af2-89c9-7d01-9b5c-8b526777f564', 3001, 2, 's3://warehouse/hard/sales/eu/orders/metadata/snap-3002.avro', '{"operation": "append", "added-records": "50", "total-records": "150", "deleted-records": "0", "added-data-files": "1", "total-data-files": "3", "total-files-size": "3072", "deleted-data-files": "0", "removed-files-size": "0", "total-delete-files": "0"}', 0, 1791453466000, '2026-10-08 09:57:45.121949+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632', NULL, NULL, NULL);
INSERT INTO "public"."table_snapshot" ("snapshot_id", "table_id", "parent_snapshot_id", "sequence_number", "manifest_list", "summary", "schema_id", "timestamp_ms", "created_at", "updated_at", "warehouse_id", "first_row_id", "assigned_rows", "key_id") VALUES (4001, '01a11af2-8a41-7d10-aacb-23614773cc3b', NULL, 1, 's3://warehouse/hard/sales/eu/orders_v3/metadata/snap-4001.avro', '{"operation": "append", "added-records": "25", "total-records": "25", "added-data-files": "1", "total-data-files": "1", "total-files-size": "512", "total-delete-files": "0"}', 0, 1791453465000, '2026-10-08 09:57:45.199367+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632', 0, 25, NULL);
INSERT INTO "public"."table_snapshot" ("snapshot_id", "table_id", "parent_snapshot_id", "sequence_number", "manifest_list", "summary", "schema_id", "timestamp_ms", "created_at", "updated_at", "warehouse_id", "first_row_id", "assigned_rows", "key_id") VALUES (4002, '01a11af2-8a41-7d10-aacb-23614773cc3b', 4001, 2, 's3://warehouse/hard/sales/eu/orders_v3/metadata/snap-4002.avro', '{"operation": "append", "added-records": "10", "total-records": "35", "added-data-files": "1", "total-data-files": "2", "total-files-size": "1024", "total-delete-files": "0"}', 0, 1791453466000, '2026-10-08 09:57:45.199367+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632', 25, 10, 'fixture-key-1');
INSERT INTO "public"."table_snapshot" ("snapshot_id", "table_id", "parent_snapshot_id", "sequence_number", "manifest_list", "summary", "schema_id", "timestamp_ms", "created_at", "updated_at", "warehouse_id", "first_row_id", "assigned_rows", "key_id") VALUES (5002, '01a11af2-8b26-7093-816a-1831c4bc4b7e', 5001, 2, 's3://warehouse/hard/sales/eu/evolved/metadata/snap-5002.avro', '{"operation": "overwrite", "added-records": "40", "total-records": "115", "deleted-records": "25", "added-data-files": "2", "added-files-size": "2048", "total-data-files": "5", "total-files-size": "5120", "deleted-data-files": "1", "removed-files-size": "1024", "total-delete-files": "0"}', 1, 1791453466000, '2026-10-08 09:57:45.501067+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632', 100, 40, NULL);
INSERT INTO "public"."table_snapshot" ("snapshot_id", "table_id", "parent_snapshot_id", "sequence_number", "manifest_list", "summary", "schema_id", "timestamp_ms", "created_at", "updated_at", "warehouse_id", "first_row_id", "assigned_rows", "key_id") VALUES (5003, '01a11af2-8b26-7093-816a-1831c4bc4b7e', 5002, 3, 's3://warehouse/hard/sales/eu/evolved/metadata/snap-5003.avro', '{"operation": "delete", "total-records": "110", "deleted-records": "5", "total-data-files": "5", "total-files-size": "5376", "added-delete-files": "1", "total-delete-files": "1", "added-position-deletes": "5"}', 1, 1791453467000, '2026-10-08 09:57:45.522446+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632', 140, 0, NULL);


ALTER TABLE "public"."table_snapshot" ENABLE TRIGGER ALL;

--
-- Data for Name: partition_statistics; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."partition_statistics" DISABLE TRIGGER ALL;

INSERT INTO "public"."partition_statistics" ("snapshot_id", "table_id", "statistics_path", "file_size_in_bytes", "created_at", "updated_at", "warehouse_id") VALUES (3002, '01a11af2-89c9-7d01-9b5c-8b526777f564', 's3://warehouse/hard/sales/eu/orders/metadata/part-stats-3002.parquet', 512, '2026-10-08 09:57:45.121949+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');


ALTER TABLE "public"."partition_statistics" ENABLE TRIGGER ALL;

--
-- Data for Name: role_assignment; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."role_assignment" DISABLE TRIGGER ALL;

INSERT INTO "public"."role_assignment" ("role_id", "user_id", "created_at") VALUES ('01a11af2-889a-7030-8714-d72bc298a5c8', 'oidc~alice', '2026-10-08 09:57:44.774401+00');
INSERT INTO "public"."role_assignment" ("role_id", "user_id", "created_at") VALUES ('01a11af2-88a8-78e3-831e-baa1448b7f7d', 'kubernetes~pipeline', '2026-10-08 09:57:44.794564+00');


ALTER TABLE "public"."role_assignment" ENABLE TRIGGER ALL;

--
-- Data for Name: role_assignment_sync; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."role_assignment_sync" DISABLE TRIGGER ALL;



ALTER TABLE "public"."role_assignment_sync" ENABLE TRIGGER ALL;

--
-- Data for Name: role_members_sync; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."role_members_sync" DISABLE TRIGGER ALL;



ALTER TABLE "public"."role_members_sync" ENABLE TRIGGER ALL;

--
-- Data for Name: role_membership; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."role_membership" DISABLE TRIGGER ALL;

INSERT INTO "public"."role_membership" ("parent_role_id", "member_role_id", "created_at") VALUES ('01a11af2-889a-7030-8714-d72bc298a5c8', '01a11af2-88a8-78e3-831e-baa1448b7f7d', '2026-10-08 09:57:44.774401+00');


ALTER TABLE "public"."role_membership" ENABLE TRIGGER ALL;

--
-- Data for Name: tabular_field; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."tabular_field" DISABLE TRIGGER ALL;

INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-89c9-7d01-9b5c-8b526777f564', 1);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-89c9-7d01-9b5c-8b526777f564', 2);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-89c9-7d01-9b5c-8b526777f564', 3);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-89c9-7d01-9b5c-8b526777f564', 4);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-89c9-7d01-9b5c-8b526777f564', 7);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-89c9-7d01-9b5c-8b526777f564', 8);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-89c9-7d01-9b5c-8b526777f564', 5);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-89c9-7d01-9b5c-8b526777f564', 9);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-89c9-7d01-9b5c-8b526777f564', 6);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-89c9-7d01-9b5c-8b526777f564', 10);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-89c9-7d01-9b5c-8b526777f564', 11);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8a2f-7ef0-b17e-7a052c1a829b', 1);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8a2f-7ef0-b17e-7a052c1a829b', 2);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8a41-7d10-aacb-23614773cc3b', 1);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8a41-7d10-aacb-23614773cc3b', 2);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8a7a-7f02-9c0b-6b1d94784dba', 1);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8ab3-7cc2-a2d1-93c7f183043f', 1);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8ac6-7e82-9d7f-b08bf79a2dc6', 1);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a11af2-8928-7093-9114-577cfc8b406c', '01a11af2-8b0c-7f33-aa87-ab8863800f8e', 1);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8b26-7093-816a-1831c4bc4b7e', 1);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8b26-7093-816a-1831c4bc4b7e', 2);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8b26-7093-816a-1831c4bc4b7e', 3);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8b26-7093-816a-1831c4bc4b7e', 4);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8b26-7093-816a-1831c4bc4b7e', 5);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8b26-7093-816a-1831c4bc4b7e', 6);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8b26-7093-816a-1831c4bc4b7e', 7);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8b26-7093-816a-1831c4bc4b7e', 8);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8b26-7093-816a-1831c4bc4b7e', 9);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8b26-7093-816a-1831c4bc4b7e', 10);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8b26-7093-816a-1831c4bc4b7e', 11);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8b26-7093-816a-1831c4bc4b7e', 13);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8b26-7093-816a-1831c4bc4b7e', 14);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8b26-7093-816a-1831c4bc4b7e', 15);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8b26-7093-816a-1831c4bc4b7e', 12);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8b26-7093-816a-1831c4bc4b7e', 16);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8b26-7093-816a-1831c4bc4b7e', 17);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8b26-7093-816a-1831c4bc4b7e', 18);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8b26-7093-816a-1831c4bc4b7e', 19);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8b26-7093-816a-1831c4bc4b7e', 20);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8be3-7f01-9900-faaede7c910e', 1);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8be3-7f01-9900-faaede7c910e', 2);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8c0c-79a1-954f-f96ebad34946', 1);


ALTER TABLE "public"."tabular_field" ENABLE TRIGGER ALL;

--
-- Data for Name: schema_field; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."schema_field" DISABLE TRIGGER ALL;

INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-89c9-7d01-9b5c-8b526777f564', 0, 1, NULL, 0, 'order_id', true, 'Order number', 'long', NULL, NULL, NULL, true);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-89c9-7d01-9b5c-8b526777f564', 0, 2, NULL, 1, 'placed_at', true, NULL, 'timestamptz', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-89c9-7d01-9b5c-8b526777f564', 0, 3, NULL, 2, 'amount', false, NULL, 'decimal', '{"scale": 2, "precision": 12}', NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-89c9-7d01-9b5c-8b526777f564', 0, 4, NULL, 3, 'customer', false, NULL, 'struct', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-89c9-7d01-9b5c-8b526777f564', 0, 7, 4, 0, 'customer_id', true, NULL, 'uuid', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-89c9-7d01-9b5c-8b526777f564', 0, 8, 4, 1, 'display_name', false, NULL, 'string', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-89c9-7d01-9b5c-8b526777f564', 0, 5, NULL, 4, 'items', false, NULL, 'list', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-89c9-7d01-9b5c-8b526777f564', 0, 9, 5, 0, 'element', true, NULL, 'string', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-89c9-7d01-9b5c-8b526777f564', 0, 6, NULL, 5, 'scores', false, NULL, 'map', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-89c9-7d01-9b5c-8b526777f564', 0, 10, 6, 0, 'key', true, NULL, 'string', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-89c9-7d01-9b5c-8b526777f564', 0, 11, 6, 1, 'value', false, NULL, 'double', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8a2f-7ef0-b17e-7a052c1a829b', 0, 1, NULL, 0, 'event_id', true, NULL, 'string', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8a2f-7ef0-b17e-7a052c1a829b', 0, 2, NULL, 1, 'payload', false, NULL, 'binary', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8a41-7d10-aacb-23614773cc3b', 0, 1, NULL, 0, 'order_id', true, NULL, 'long', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8a41-7d10-aacb-23614773cc3b', 0, 2, NULL, 1, 'tag', false, NULL, 'string', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8a7a-7f02-9c0b-6b1d94784dba', 0, 1, NULL, 0, 'id', true, NULL, 'long', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8ab3-7cc2-a2d1-93c7f183043f', 0, 1, NULL, 0, 'id', true, NULL, 'long', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8ac6-7e82-9d7f-b08bf79a2dc6', 0, 1, NULL, 0, 'at', true, NULL, 'timestamptz', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a11af2-8928-7093-9114-577cfc8b406c', '01a11af2-8b0c-7f33-aa87-ab8863800f8e', 0, 1, NULL, 0, 'x', false, NULL, 'int', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8b26-7093-816a-1831c4bc4b7e', 0, 1, NULL, 0, 'id', true, NULL, 'long', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8b26-7093-816a-1831c4bc4b7e', 0, 2, NULL, 1, 'sku', true, NULL, 'string', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8b26-7093-816a-1831c4bc4b7e', 0, 3, NULL, 2, 'sold_at', true, NULL, 'timestamp', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8b26-7093-816a-1831c4bc4b7e', 0, 4, NULL, 3, 'sold_on', false, NULL, 'date', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8b26-7093-816a-1831c4bc4b7e', 0, 5, NULL, 4, 'opened_at', false, NULL, 'time', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8b26-7093-816a-1831c4bc4b7e', 0, 6, NULL, 5, 'ratio', false, NULL, 'float', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8b26-7093-816a-1831c4bc4b7e', 0, 7, NULL, 6, 'qty', false, NULL, 'int', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8b26-7093-816a-1831c4bc4b7e', 0, 8, NULL, 7, 'flag', false, NULL, 'boolean', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8b26-7093-816a-1831c4bc4b7e', 0, 9, NULL, 8, 'digest', false, NULL, 'fixed', '{"length": 16}', NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8b26-7093-816a-1831c4bc4b7e', 0, 10, NULL, 9, 'legacy_note', false, NULL, 'string', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8b26-7093-816a-1831c4bc4b7e', 0, 11, NULL, 10, 'lines', false, NULL, 'list', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8b26-7093-816a-1831c4bc4b7e', 0, 13, 11, 0, 'element', false, NULL, 'struct', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8b26-7093-816a-1831c4bc4b7e', 0, 14, 13, 0, 'line_no', true, NULL, 'int', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8b26-7093-816a-1831c4bc4b7e', 0, 15, 13, 1, 'note', false, 'Free text', 'string', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8b26-7093-816a-1831c4bc4b7e', 0, 12, NULL, 11, 'attrs', false, NULL, 'map', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8b26-7093-816a-1831c4bc4b7e', 0, 16, 12, 0, 'key', true, NULL, 'string', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8b26-7093-816a-1831c4bc4b7e', 0, 17, 12, 1, 'value', false, NULL, 'struct', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8b26-7093-816a-1831c4bc4b7e', 0, 18, 17, 0, 'v', false, NULL, 'double', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8b26-7093-816a-1831c4bc4b7e', 1, 1, NULL, 0, 'id', true, NULL, 'long', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8b26-7093-816a-1831c4bc4b7e', 1, 2, NULL, 1, 'sku', true, NULL, 'string', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8b26-7093-816a-1831c4bc4b7e', 1, 3, NULL, 2, 'sold_at', true, NULL, 'timestamp', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8b26-7093-816a-1831c4bc4b7e', 1, 4, NULL, 3, 'sold_on', false, NULL, 'date', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8b26-7093-816a-1831c4bc4b7e', 1, 5, NULL, 4, 'opened_at', false, NULL, 'time', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8b26-7093-816a-1831c4bc4b7e', 1, 6, NULL, 5, 'ratio', false, NULL, 'float', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8b26-7093-816a-1831c4bc4b7e', 1, 7, NULL, 6, 'quantity', false, NULL, 'int', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8b26-7093-816a-1831c4bc4b7e', 1, 8, NULL, 7, 'flag', false, NULL, 'boolean', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8b26-7093-816a-1831c4bc4b7e', 1, 9, NULL, 8, 'digest', false, NULL, 'fixed', '{"length": 16}', NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8b26-7093-816a-1831c4bc4b7e', 1, 11, NULL, 9, 'lines', false, NULL, 'list', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8b26-7093-816a-1831c4bc4b7e', 1, 12, 11, 0, 'element', false, NULL, 'struct', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8b26-7093-816a-1831c4bc4b7e', 1, 13, 12, 0, 'line_no', true, NULL, 'int', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8b26-7093-816a-1831c4bc4b7e', 1, 14, 12, 1, 'note', false, 'Free text', 'string', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8b26-7093-816a-1831c4bc4b7e', 1, 15, NULL, 10, 'attrs', false, NULL, 'map', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8b26-7093-816a-1831c4bc4b7e', 1, 16, 15, 0, 'key', true, NULL, 'string', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8b26-7093-816a-1831c4bc4b7e', 1, 17, 15, 1, 'value', false, NULL, 'struct', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8b26-7093-816a-1831c4bc4b7e', 1, 18, 17, 0, 'v', false, NULL, 'double', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8b26-7093-816a-1831c4bc4b7e', 1, 19, NULL, 11, 'region', true, NULL, 'string', NULL, '"eu"', '"eu"', false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8b26-7093-816a-1831c4bc4b7e', 1, 20, NULL, 12, 'priority', false, NULL, 'int', NULL, '0', '1', false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8be3-7f01-9900-faaede7c910e', 0, 1, NULL, 0, 'order_id', true, NULL, 'long', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8be3-7f01-9900-faaede7c910e', 0, 2, NULL, 1, 'amount', false, NULL, 'decimal', '{"scale": 2, "precision": 12}', NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8be3-7f01-9900-faaede7c910e', 1, 1, NULL, 0, 'order_id', true, NULL, 'long', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8c0c-79a1-954f-f96ebad34946', 0, 1, NULL, 0, 'order_id', true, NULL, 'long', NULL, NULL, NULL, false);


ALTER TABLE "public"."schema_field" ENABLE TRIGGER ALL;

--
-- Data for Name: secret; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."secret" DISABLE TRIGGER ALL;

INSERT INTO "public"."secret" ("secret_id", "secret", "created_at", "updated_at") VALUES ('b58c1e72-c2fe-11f1-a837-1fda95cecced', '\xc30d0409030284fccb9b904ad3a97fd2bc0123bf2afc6cb6a819f91922584d0cad12698d8335d4ccb638656d23519821bf7c679ac460edfd53d4eb4d0c14f443f126c71f25993470c95b1ae45e56590eb800c30fe1e6f4507f2dfea1c9579694a7426017dcd4ab9f7bd88c282821b012eb3da55be591008784c28fed3b5c67b0e97fcff1b322e0bc4313c023549aea9218a9d2b297ac261877091b2915653b8b4755005f679c22d45869c0b0dc9a52eff53ed32e308b919a1837491007c029c76c3479dbcd40ee1063ecc1bac0', '2026-10-08 09:57:44.852763+00', NULL);
INSERT INTO "public"."secret" ("secret_id", "secret", "created_at", "updated_at") VALUES ('b590e15a-c2fe-11f1-b7df-43f0b09b7b86', '\xc30d04090302280e0417fad3b8e879d2bc0173107b6ca81b465d7225d52fa2d0ff8a2f27820e7c28f958b4bbc44a4e300b04896f6d5d7f658141e3c75b2107c17d056f569feed9f87218fbc024e57649d5bdd8aa20d82ba2f03a67e44be4de755f0e7049afd6faa4debf56f64304ff469e756eab25553dc4049a03680747ee993ec9e5ee9866d0e337eda2a92fd9b9a6f52d47eb04f075121feb7d218e0abfb3d24223abd82ae8474906a261314de4939780b4f073886422338351651754494016f2543dce7074b6f717cc4e67', '2026-10-08 09:57:44.884307+00', NULL);
INSERT INTO "public"."secret" ("secret_id", "secret", "created_at", "updated_at") VALUES ('b595de08-c2fe-11f1-a837-d7d0dabe3aaa', '\xc30d04090302ff3248ee0899853c79d2bc0176e1ce0bbd9b0bb2b175bc2d91e6bf9131e0d68bf57792032fe93e53486dd199fbd556b7b3bd9e0ef6cc9d39f9be3059a2f25f01aca743683136dc48560f34382d3d4d25faf6181644f893f1736e2292e04d1fdda79f5077fa8bbecf7289265f81dcdd17a364f4039c2a5b7299557806b00a21a6af31f77bd6c60138ccdc15500974009a4fabe495be8f89725652da0c2f2a66da8e16871656e879697b297b6d9e4836d47b768b41dbfdc99cc96e992e9211f1fcd01dc4bb0afa47', '2026-10-08 09:57:44.917403+00', NULL);


ALTER TABLE "public"."secret" ENABLE TRIGGER ALL;

--
-- Data for Name: server; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."server" DISABLE TRIGGER ALL;

INSERT INTO "public"."server" ("single_row", "server_id", "terms_accepted", "open_for_bootstrap", "created_at", "updated_at") VALUES (true, '01a11af2-7d66-76a1-a79c-259f292e721f', true, false, '2026-10-08 09:57:41.559458+00', '2026-10-08 09:57:44.688933+00');


ALTER TABLE "public"."server" ENABLE TRIGGER ALL;

--
-- Data for Name: table_current_schema; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."table_current_schema" DISABLE TRIGGER ALL;

INSERT INTO "public"."table_current_schema" ("table_id", "schema_id", "created_at", "updated_at", "warehouse_id") VALUES ('01a11af2-89c9-7d01-9b5c-8b526777f564', 0, '2026-10-08 09:57:45.034072+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."table_current_schema" ("table_id", "schema_id", "created_at", "updated_at", "warehouse_id") VALUES ('01a11af2-8a2f-7ef0-b17e-7a052c1a829b', 0, '2026-10-08 09:57:45.136161+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."table_current_schema" ("table_id", "schema_id", "created_at", "updated_at", "warehouse_id") VALUES ('01a11af2-8a41-7d10-aacb-23614773cc3b', 0, '2026-10-08 09:57:45.154055+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."table_current_schema" ("table_id", "schema_id", "created_at", "updated_at", "warehouse_id") VALUES ('01a11af2-8a7a-7f02-9c0b-6b1d94784dba', 0, '2026-10-08 09:57:45.210855+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."table_current_schema" ("table_id", "schema_id", "created_at", "updated_at", "warehouse_id") VALUES ('01a11af2-8ab3-7cc2-a2d1-93c7f183043f', 0, '2026-10-08 09:57:45.268117+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."table_current_schema" ("table_id", "schema_id", "created_at", "updated_at", "warehouse_id") VALUES ('01a11af2-8ac6-7e82-9d7f-b08bf79a2dc6', 0, '2026-10-08 09:57:45.286715+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."table_current_schema" ("table_id", "schema_id", "created_at", "updated_at", "warehouse_id") VALUES ('01a11af2-8b0c-7f33-aa87-ab8863800f8e', 0, '2026-10-08 09:57:45.356823+00', NULL, '01a11af2-8928-7093-9114-577cfc8b406c');
INSERT INTO "public"."table_current_schema" ("table_id", "schema_id", "created_at", "updated_at", "warehouse_id") VALUES ('01a11af2-8b26-7093-816a-1831c4bc4b7e', 1, '2026-10-08 09:57:45.382486+00', '2026-10-08 09:57:45.440661+00', '01a11af2-88f2-7f21-bfcf-3c8f1265c632');


ALTER TABLE "public"."table_current_schema" ENABLE TRIGGER ALL;

--
-- Data for Name: table_partition_spec; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."table_partition_spec" DISABLE TRIGGER ALL;

INSERT INTO "public"."table_partition_spec" ("partition_spec_id", "table_id", "partition_spec", "created_at", "updated_at", "warehouse_id") VALUES (0, '01a11af2-89c9-7d01-9b5c-8b526777f564', '{"fields": [{"name": "placed_at_day", "field-id": 1000, "source-id": 2, "transform": "day"}], "spec-id": 0}', '2026-10-08 09:57:45.034072+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."table_partition_spec" ("partition_spec_id", "table_id", "partition_spec", "created_at", "updated_at", "warehouse_id") VALUES (0, '01a11af2-8a2f-7ef0-b17e-7a052c1a829b', '{"fields": [], "spec-id": 0}', '2026-10-08 09:57:45.136161+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."table_partition_spec" ("partition_spec_id", "table_id", "partition_spec", "created_at", "updated_at", "warehouse_id") VALUES (0, '01a11af2-8a41-7d10-aacb-23614773cc3b', '{"fields": [], "spec-id": 0}', '2026-10-08 09:57:45.154055+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."table_partition_spec" ("partition_spec_id", "table_id", "partition_spec", "created_at", "updated_at", "warehouse_id") VALUES (0, '01a11af2-8a7a-7f02-9c0b-6b1d94784dba', '{"fields": [], "spec-id": 0}', '2026-10-08 09:57:45.210855+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."table_partition_spec" ("partition_spec_id", "table_id", "partition_spec", "created_at", "updated_at", "warehouse_id") VALUES (0, '01a11af2-8ab3-7cc2-a2d1-93c7f183043f', '{"fields": [], "spec-id": 0}', '2026-10-08 09:57:45.268117+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."table_partition_spec" ("partition_spec_id", "table_id", "partition_spec", "created_at", "updated_at", "warehouse_id") VALUES (0, '01a11af2-8ac6-7e82-9d7f-b08bf79a2dc6', '{"fields": [], "spec-id": 0}', '2026-10-08 09:57:45.286715+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."table_partition_spec" ("partition_spec_id", "table_id", "partition_spec", "created_at", "updated_at", "warehouse_id") VALUES (0, '01a11af2-8b0c-7f33-aa87-ab8863800f8e', '{"fields": [], "spec-id": 0}', '2026-10-08 09:57:45.356823+00', NULL, '01a11af2-8928-7093-9114-577cfc8b406c');
INSERT INTO "public"."table_partition_spec" ("partition_spec_id", "table_id", "partition_spec", "created_at", "updated_at", "warehouse_id") VALUES (0, '01a11af2-8b26-7093-816a-1831c4bc4b7e', '{"fields": [{"name": "sold_day", "field-id": 1000, "source-id": 3, "transform": "day"}], "spec-id": 0}', '2026-10-08 09:57:45.382486+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."table_partition_spec" ("partition_spec_id", "table_id", "partition_spec", "created_at", "updated_at", "warehouse_id") VALUES (1, '01a11af2-8b26-7093-816a-1831c4bc4b7e', '{"fields": [{"name": "id_bucket", "field-id": 1001, "source-id": 1, "transform": "bucket[16]"}, {"name": "sku_prefix", "field-id": 1002, "source-id": 2, "transform": "truncate[4]"}, {"name": "sold_month", "field-id": 1003, "source-id": 3, "transform": "month"}], "spec-id": 1}', '2026-10-08 09:57:45.460587+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');


ALTER TABLE "public"."table_partition_spec" ENABLE TRIGGER ALL;

--
-- Data for Name: table_default_partition_spec; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."table_default_partition_spec" DISABLE TRIGGER ALL;

INSERT INTO "public"."table_default_partition_spec" ("table_id", "partition_spec_id", "created_at", "updated_at", "warehouse_id") VALUES ('01a11af2-89c9-7d01-9b5c-8b526777f564', 0, '2026-10-08 09:57:45.034072+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."table_default_partition_spec" ("table_id", "partition_spec_id", "created_at", "updated_at", "warehouse_id") VALUES ('01a11af2-8a2f-7ef0-b17e-7a052c1a829b', 0, '2026-10-08 09:57:45.136161+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."table_default_partition_spec" ("table_id", "partition_spec_id", "created_at", "updated_at", "warehouse_id") VALUES ('01a11af2-8a41-7d10-aacb-23614773cc3b', 0, '2026-10-08 09:57:45.154055+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."table_default_partition_spec" ("table_id", "partition_spec_id", "created_at", "updated_at", "warehouse_id") VALUES ('01a11af2-8a7a-7f02-9c0b-6b1d94784dba', 0, '2026-10-08 09:57:45.210855+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."table_default_partition_spec" ("table_id", "partition_spec_id", "created_at", "updated_at", "warehouse_id") VALUES ('01a11af2-8ab3-7cc2-a2d1-93c7f183043f', 0, '2026-10-08 09:57:45.268117+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."table_default_partition_spec" ("table_id", "partition_spec_id", "created_at", "updated_at", "warehouse_id") VALUES ('01a11af2-8ac6-7e82-9d7f-b08bf79a2dc6', 0, '2026-10-08 09:57:45.286715+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."table_default_partition_spec" ("table_id", "partition_spec_id", "created_at", "updated_at", "warehouse_id") VALUES ('01a11af2-8b0c-7f33-aa87-ab8863800f8e', 0, '2026-10-08 09:57:45.356823+00', NULL, '01a11af2-8928-7093-9114-577cfc8b406c');
INSERT INTO "public"."table_default_partition_spec" ("table_id", "partition_spec_id", "created_at", "updated_at", "warehouse_id") VALUES ('01a11af2-8b26-7093-816a-1831c4bc4b7e', 1, '2026-10-08 09:57:45.382486+00', '2026-10-08 09:57:45.460587+00', '01a11af2-88f2-7f21-bfcf-3c8f1265c632');


ALTER TABLE "public"."table_default_partition_spec" ENABLE TRIGGER ALL;

--
-- Data for Name: table_sort_order; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."table_sort_order" DISABLE TRIGGER ALL;

INSERT INTO "public"."table_sort_order" ("sort_order_id", "table_id", "sort_order", "created_at", "updated_at", "warehouse_id") VALUES (1, '01a11af2-89c9-7d01-9b5c-8b526777f564', '{"fields": [{"direction": "asc", "source-id": 1, "transform": "identity", "null-order": "nulls-first"}], "order-id": 1}', '2026-10-08 09:57:45.034072+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."table_sort_order" ("sort_order_id", "table_id", "sort_order", "created_at", "updated_at", "warehouse_id") VALUES (0, '01a11af2-8a2f-7ef0-b17e-7a052c1a829b', '{"fields": [], "order-id": 0}', '2026-10-08 09:57:45.136161+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."table_sort_order" ("sort_order_id", "table_id", "sort_order", "created_at", "updated_at", "warehouse_id") VALUES (0, '01a11af2-8a41-7d10-aacb-23614773cc3b', '{"fields": [], "order-id": 0}', '2026-10-08 09:57:45.154055+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."table_sort_order" ("sort_order_id", "table_id", "sort_order", "created_at", "updated_at", "warehouse_id") VALUES (0, '01a11af2-8a7a-7f02-9c0b-6b1d94784dba', '{"fields": [], "order-id": 0}', '2026-10-08 09:57:45.210855+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."table_sort_order" ("sort_order_id", "table_id", "sort_order", "created_at", "updated_at", "warehouse_id") VALUES (0, '01a11af2-8ab3-7cc2-a2d1-93c7f183043f', '{"fields": [], "order-id": 0}', '2026-10-08 09:57:45.268117+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."table_sort_order" ("sort_order_id", "table_id", "sort_order", "created_at", "updated_at", "warehouse_id") VALUES (0, '01a11af2-8ac6-7e82-9d7f-b08bf79a2dc6', '{"fields": [], "order-id": 0}', '2026-10-08 09:57:45.286715+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."table_sort_order" ("sort_order_id", "table_id", "sort_order", "created_at", "updated_at", "warehouse_id") VALUES (0, '01a11af2-8b0c-7f33-aa87-ab8863800f8e', '{"fields": [], "order-id": 0}', '2026-10-08 09:57:45.356823+00', NULL, '01a11af2-8928-7093-9114-577cfc8b406c');
INSERT INTO "public"."table_sort_order" ("sort_order_id", "table_id", "sort_order", "created_at", "updated_at", "warehouse_id") VALUES (1, '01a11af2-8b26-7093-816a-1831c4bc4b7e', '{"fields": [{"direction": "asc", "source-id": 1, "transform": "identity", "null-order": "nulls-first"}], "order-id": 1}', '2026-10-08 09:57:45.382486+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."table_sort_order" ("sort_order_id", "table_id", "sort_order", "created_at", "updated_at", "warehouse_id") VALUES (2, '01a11af2-8b26-7093-816a-1831c4bc4b7e', '{"fields": [{"direction": "desc", "source-id": 3, "transform": "identity", "null-order": "nulls-last"}, {"direction": "asc", "source-id": 2, "transform": "identity", "null-order": "nulls-first"}], "order-id": 2}', '2026-10-08 09:57:45.481542+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');


ALTER TABLE "public"."table_sort_order" ENABLE TRIGGER ALL;

--
-- Data for Name: table_default_sort_order; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."table_default_sort_order" DISABLE TRIGGER ALL;

INSERT INTO "public"."table_default_sort_order" ("table_id", "sort_order_id", "created_at", "updated_at", "warehouse_id") VALUES ('01a11af2-89c9-7d01-9b5c-8b526777f564', 1, '2026-10-08 09:57:45.034072+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."table_default_sort_order" ("table_id", "sort_order_id", "created_at", "updated_at", "warehouse_id") VALUES ('01a11af2-8a2f-7ef0-b17e-7a052c1a829b', 0, '2026-10-08 09:57:45.136161+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."table_default_sort_order" ("table_id", "sort_order_id", "created_at", "updated_at", "warehouse_id") VALUES ('01a11af2-8a41-7d10-aacb-23614773cc3b', 0, '2026-10-08 09:57:45.154055+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."table_default_sort_order" ("table_id", "sort_order_id", "created_at", "updated_at", "warehouse_id") VALUES ('01a11af2-8a7a-7f02-9c0b-6b1d94784dba', 0, '2026-10-08 09:57:45.210855+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."table_default_sort_order" ("table_id", "sort_order_id", "created_at", "updated_at", "warehouse_id") VALUES ('01a11af2-8ab3-7cc2-a2d1-93c7f183043f', 0, '2026-10-08 09:57:45.268117+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."table_default_sort_order" ("table_id", "sort_order_id", "created_at", "updated_at", "warehouse_id") VALUES ('01a11af2-8ac6-7e82-9d7f-b08bf79a2dc6', 0, '2026-10-08 09:57:45.286715+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."table_default_sort_order" ("table_id", "sort_order_id", "created_at", "updated_at", "warehouse_id") VALUES ('01a11af2-8b0c-7f33-aa87-ab8863800f8e', 0, '2026-10-08 09:57:45.356823+00', NULL, '01a11af2-8928-7093-9114-577cfc8b406c');
INSERT INTO "public"."table_default_sort_order" ("table_id", "sort_order_id", "created_at", "updated_at", "warehouse_id") VALUES ('01a11af2-8b26-7093-816a-1831c4bc4b7e', 2, '2026-10-08 09:57:45.382486+00', '2026-10-08 09:57:45.481542+00', '01a11af2-88f2-7f21-bfcf-3c8f1265c632');


ALTER TABLE "public"."table_default_sort_order" ENABLE TRIGGER ALL;

--
-- Data for Name: table_encryption_keys; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."table_encryption_keys" DISABLE TRIGGER ALL;

INSERT INTO "public"."table_encryption_keys" ("warehouse_id", "table_id", "key_id", "encrypted_key_metadata", "encrypted_by_id", "properties", "created_at", "updated_at") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8a7a-7f02-9c0b-6b1d94784dba', 'fixture-dek-1', '\x666978747572652d777261707065642d6b6579', 'fixture-kek-1', '{}', '2026-10-08 09:57:45.256749+00', NULL);


ALTER TABLE "public"."table_encryption_keys" ENABLE TRIGGER ALL;

--
-- Data for Name: table_metadata_log; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."table_metadata_log" DISABLE TRIGGER ALL;

INSERT INTO "public"."table_metadata_log" ("sequence_number", "table_id", "timestamp", "metadata_file", "created_at", "updated_at", "warehouse_id") VALUES (1, '01a11af2-89c9-7d01-9b5c-8b526777f564', 1791453465034, 's3://warehouse/hard/01a11af2-89c9-7d01-9b5c-8b526777f564/metadata/00000-01a11af2-89c9-7d01-9b5c-8b644df39fbb.gz.metadata.json', '2026-10-08 09:57:45.09239+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."table_metadata_log" ("sequence_number", "table_id", "timestamp", "metadata_file", "created_at", "updated_at", "warehouse_id") VALUES (2, '01a11af2-89c9-7d01-9b5c-8b526777f564', 1791453465000, 's3://warehouse/hard/01a11af2-89c9-7d01-9b5c-8b526777f564/metadata/00001-01a11af2-8a01-79c0-8736-ea4ee44054ed.gz.metadata.json', '2026-10-08 09:57:45.121949+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."table_metadata_log" ("sequence_number", "table_id", "timestamp", "metadata_file", "created_at", "updated_at", "warehouse_id") VALUES (3, '01a11af2-8a41-7d10-aacb-23614773cc3b', 1791453465154, 's3://warehouse/hard/01a11af2-8a41-7d10-aacb-23614773cc3b/metadata/00000-01a11af2-8a41-7d10-aacb-2374c5d08f41.gz.metadata.json', '2026-10-08 09:57:45.199367+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."table_metadata_log" ("sequence_number", "table_id", "timestamp", "metadata_file", "created_at", "updated_at", "warehouse_id") VALUES (4, '01a11af2-8a7a-7f02-9c0b-6b1d94784dba', 1791453465210, 's3://warehouse/hard/01a11af2-8a7a-7f02-9c0b-6b1d94784dba/metadata/00000-01a11af2-8a7a-7f02-9c0b-6b206de330d1.gz.metadata.json', '2026-10-08 09:57:45.256749+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."table_metadata_log" ("sequence_number", "table_id", "timestamp", "metadata_file", "created_at", "updated_at", "warehouse_id") VALUES (5, '01a11af2-8b26-7093-816a-1831c4bc4b7e', 1791453465382, 's3://warehouse/hard/01a11af2-8b26-7093-816a-1831c4bc4b7e/metadata/00000-01a11af2-8b26-7093-816a-18469ec6d984.gz.metadata.json', '2026-10-08 09:57:45.423222+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."table_metadata_log" ("sequence_number", "table_id", "timestamp", "metadata_file", "created_at", "updated_at", "warehouse_id") VALUES (6, '01a11af2-8b26-7093-816a-1831c4bc4b7e', 1791453465000, 's3://warehouse/hard/01a11af2-8b26-7093-816a-1831c4bc4b7e/metadata/00001-01a11af2-8b4c-74d3-be4f-2b0459265103.gz.metadata.json', '2026-10-08 09:57:45.440661+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."table_metadata_log" ("sequence_number", "table_id", "timestamp", "metadata_file", "created_at", "updated_at", "warehouse_id") VALUES (7, '01a11af2-8b26-7093-816a-1831c4bc4b7e', 1791453465437, 's3://warehouse/hard/01a11af2-8b26-7093-816a-1831c4bc4b7e/metadata/00002-01a11af2-8b5e-72f1-a1aa-fd8193d259f1.gz.metadata.json', '2026-10-08 09:57:45.460587+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."table_metadata_log" ("sequence_number", "table_id", "timestamp", "metadata_file", "created_at", "updated_at", "warehouse_id") VALUES (8, '01a11af2-8b26-7093-816a-1831c4bc4b7e', 1791453465458, 's3://warehouse/hard/01a11af2-8b26-7093-816a-1831c4bc4b7e/metadata/00003-01a11af2-8b72-7e32-ad6f-7755a0f26472.gz.metadata.json', '2026-10-08 09:57:45.481542+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."table_metadata_log" ("sequence_number", "table_id", "timestamp", "metadata_file", "created_at", "updated_at", "warehouse_id") VALUES (9, '01a11af2-8b26-7093-816a-1831c4bc4b7e', 1791453465478, 's3://warehouse/hard/01a11af2-8b26-7093-816a-1831c4bc4b7e/metadata/00004-01a11af2-8b86-73c1-8aca-0d09d3acf5e4.gz.metadata.json', '2026-10-08 09:57:45.501067+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."table_metadata_log" ("sequence_number", "table_id", "timestamp", "metadata_file", "created_at", "updated_at", "warehouse_id") VALUES (10, '01a11af2-8b26-7093-816a-1831c4bc4b7e', 1791453466000, 's3://warehouse/hard/01a11af2-8b26-7093-816a-1831c4bc4b7e/metadata/00005-01a11af2-8b9a-7593-8280-ebc886b6fce7.gz.metadata.json', '2026-10-08 09:57:45.522446+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."table_metadata_log" ("sequence_number", "table_id", "timestamp", "metadata_file", "created_at", "updated_at", "warehouse_id") VALUES (11, '01a11af2-8b26-7093-816a-1831c4bc4b7e', 1791453467000, 's3://warehouse/hard/01a11af2-8b26-7093-816a-1831c4bc4b7e/metadata/00006-01a11af2-8bb0-7373-9a22-f3d3da310faa.gz.metadata.json', '2026-10-08 09:57:45.53979+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."table_metadata_log" ("sequence_number", "table_id", "timestamp", "metadata_file", "created_at", "updated_at", "warehouse_id") VALUES (12, '01a11af2-8b26-7093-816a-1831c4bc4b7e', 1791453465537, 's3://warehouse/hard/01a11af2-8b26-7093-816a-1831c4bc4b7e/metadata/00007-01a11af2-8bc1-7d52-ad7d-07093c02ec46.gz.metadata.json', '2026-10-08 09:57:45.559444+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');


ALTER TABLE "public"."table_metadata_log" ENABLE TRIGGER ALL;

--
-- Data for Name: table_properties; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."table_properties" DISABLE TRIGGER ALL;

INSERT INTO "public"."table_properties" ("table_id", "key", "value", "created_at", "updated_at", "warehouse_id") VALUES ('01a11af2-89c9-7d01-9b5c-8b526777f564', 'write.format.default', 'parquet', '2026-10-08 09:57:45.034072+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."table_properties" ("table_id", "key", "value", "created_at", "updated_at", "warehouse_id") VALUES ('01a11af2-89c9-7d01-9b5c-8b526777f564', 'owner', 'analytics', '2026-10-08 09:57:45.034072+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."table_properties" ("table_id", "key", "value", "created_at", "updated_at", "warehouse_id") VALUES ('01a11af2-8b26-7093-816a-1831c4bc4b7e', 'owner', 'platform', '2026-10-08 09:57:45.382486+00', '2026-10-08 09:57:45.559444+00', '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."table_properties" ("table_id", "key", "value", "created_at", "updated_at", "warehouse_id") VALUES ('01a11af2-8b26-7093-816a-1831c4bc4b7e', 'comment', 'has a history', '2026-10-08 09:57:45.559444+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');


ALTER TABLE "public"."table_properties" ENABLE TRIGGER ALL;

--
-- Data for Name: table_refs; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."table_refs" DISABLE TRIGGER ALL;

INSERT INTO "public"."table_refs" ("table_id", "table_ref_name", "snapshot_id", "retention", "created_at", "updated_at", "warehouse_id") VALUES ('01a11af2-89c9-7d01-9b5c-8b526777f564', 'main', 3002, '{"type": "branch", "max-snapshot-age-ms": 604800000, "min-snapshots-to-keep": 2}', '2026-10-08 09:57:45.09239+00', '2026-10-08 09:57:45.121949+00', '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."table_refs" ("table_id", "table_ref_name", "snapshot_id", "retention", "created_at", "updated_at", "warehouse_id") VALUES ('01a11af2-89c9-7d01-9b5c-8b526777f564', 'release', 3001, '{"type": "tag", "max-ref-age-ms": 2592000000}', '2026-10-08 09:57:45.121949+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."table_refs" ("table_id", "table_ref_name", "snapshot_id", "retention", "created_at", "updated_at", "warehouse_id") VALUES ('01a11af2-8a41-7d10-aacb-23614773cc3b', 'main', 4002, '{"type": "branch"}', '2026-10-08 09:57:45.199367+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."table_refs" ("table_id", "table_ref_name", "snapshot_id", "retention", "created_at", "updated_at", "warehouse_id") VALUES ('01a11af2-8b26-7093-816a-1831c4bc4b7e', 'main', 5003, '{"type": "branch"}', '2026-10-08 09:57:45.423222+00', '2026-10-08 09:57:45.522446+00', '01a11af2-88f2-7f21-bfcf-3c8f1265c632');


ALTER TABLE "public"."table_refs" ENABLE TRIGGER ALL;

--
-- Data for Name: table_snapshot_log; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."table_snapshot_log" DISABLE TRIGGER ALL;

INSERT INTO "public"."table_snapshot_log" ("sequence_number", "table_id", "snapshot_id", "timestamp", "created_at", "updated_at", "warehouse_id") VALUES (1, '01a11af2-89c9-7d01-9b5c-8b526777f564', 3001, 1791453465000, '2026-10-08 09:57:45.09239+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."table_snapshot_log" ("sequence_number", "table_id", "snapshot_id", "timestamp", "created_at", "updated_at", "warehouse_id") VALUES (2, '01a11af2-89c9-7d01-9b5c-8b526777f564', 3002, 1791453466000, '2026-10-08 09:57:45.121949+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."table_snapshot_log" ("sequence_number", "table_id", "snapshot_id", "timestamp", "created_at", "updated_at", "warehouse_id") VALUES (3, '01a11af2-8a41-7d10-aacb-23614773cc3b', 4002, 1791453466000, '2026-10-08 09:57:45.199367+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."table_snapshot_log" ("sequence_number", "table_id", "snapshot_id", "timestamp", "created_at", "updated_at", "warehouse_id") VALUES (5, '01a11af2-8b26-7093-816a-1831c4bc4b7e', 5002, 1791453466000, '2026-10-08 09:57:45.501067+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."table_snapshot_log" ("sequence_number", "table_id", "snapshot_id", "timestamp", "created_at", "updated_at", "warehouse_id") VALUES (6, '01a11af2-8b26-7093-816a-1831c4bc4b7e', 5003, 1791453467000, '2026-10-08 09:57:45.522446+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');


ALTER TABLE "public"."table_snapshot_log" ENABLE TRIGGER ALL;

--
-- Data for Name: table_statistics; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."table_statistics" DISABLE TRIGGER ALL;

INSERT INTO "public"."table_statistics" ("snapshot_id", "table_id", "statistics_path", "file_size_in_bytes", "file_footer_size_in_bytes", "key_metadata", "blob_metadata", "created_at", "updated_at", "warehouse_id") VALUES (3002, '01a11af2-89c9-7d01-9b5c-8b526777f564', 's3://warehouse/hard/sales/eu/orders/metadata/stats-3002.puffin', 1024, 64, NULL, '[{"type": "apache-datasketches-theta-v1", "fields": [1], "snapshot-id": 3002, "sequence-number": 2}]', '2026-10-08 09:57:45.121949+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');


ALTER TABLE "public"."table_statistics" ENABLE TRIGGER ALL;

--
-- Data for Name: tag; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."tag" DISABLE TRIGGER ALL;

INSERT INTO "public"."tag" ("tag_id", "tag_definition_id", "warehouse_id", "namespace_id", "tabular_id", "field_id", "value", "source", "created_at", "updated_at") VALUES ('01a11af2-8c62-7981-9999-a38afffd5272', '01a11af2-8c35-7c80-a897-09ed9ccaeb83', '01a11af2-88f2-7f21-bfcf-3c8f1265c632', NULL, NULL, NULL, 'platform', 'manual', '2026-10-08 09:57:45.698827+00', NULL);
INSERT INTO "public"."tag" ("tag_id", "tag_definition_id", "warehouse_id", "namespace_id", "tabular_id", "field_id", "value", "source", "created_at", "updated_at") VALUES ('01a11af2-8c6e-73a1-9209-f9369aa5ebb7', '01a11af2-8c3d-7923-b778-c927aae8ded0', '01a11af2-88f2-7f21-bfcf-3c8f1265c632', '01a11af2-8994-7c13-9f7b-ef799dadb486', NULL, NULL, 'gold', 'manual', '2026-10-08 09:57:45.710602+00', NULL);
INSERT INTO "public"."tag" ("tag_id", "tag_definition_id", "warehouse_id", "namespace_id", "tabular_id", "field_id", "value", "source", "created_at", "updated_at") VALUES ('01a11af2-8c79-7b61-becb-0343f9fcc826', '01a11af2-8c2b-7de2-89d0-406bf191b9ce', '01a11af2-88f2-7f21-bfcf-3c8f1265c632', NULL, '01a11af2-89c9-7d01-9b5c-8b526777f564', NULL, NULL, 'manual', '2026-10-08 09:57:45.72154+00', NULL);
INSERT INTO "public"."tag" ("tag_id", "tag_definition_id", "warehouse_id", "namespace_id", "tabular_id", "field_id", "value", "source", "created_at", "updated_at") VALUES ('01a11af2-8c87-7780-abc5-2ee6c2ba5186', '01a11af2-8c3d-7923-b778-c927aae8ded0', '01a11af2-88f2-7f21-bfcf-3c8f1265c632', NULL, '01a11af2-8be3-7f01-9900-faaede7c910e', NULL, 'silver', 'manual', '2026-10-08 09:57:45.735637+00', NULL);
INSERT INTO "public"."tag" ("tag_id", "tag_definition_id", "warehouse_id", "namespace_id", "tabular_id", "field_id", "value", "source", "created_at", "updated_at") VALUES ('01a11af2-8c94-79a0-afdf-7ab452c7ff7f', '01a11af2-8c35-7c80-a897-09ed9ccaeb83', '01a11af2-88f2-7f21-bfcf-3c8f1265c632', NULL, '01a11af2-8c1f-7421-bc00-365d7ffcaa3d', NULL, 'platform', 'manual', '2026-10-08 09:57:45.748033+00', NULL);
INSERT INTO "public"."tag" ("tag_id", "tag_definition_id", "warehouse_id", "namespace_id", "tabular_id", "field_id", "value", "source", "created_at", "updated_at") VALUES ('01a11af2-8ca5-7ca3-b783-0dc4ae39a343', '01a11af2-8c2b-7de2-89d0-406bf191b9ce', '01a11af2-88f2-7f21-bfcf-3c8f1265c632', NULL, '01a11af2-89c9-7d01-9b5c-8b526777f564', 8, NULL, 'manual', '2026-10-08 09:57:45.765749+00', NULL);


ALTER TABLE "public"."tag" ENABLE TRIGGER ALL;

--
-- Data for Name: tag_allowed_value; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."tag_allowed_value" DISABLE TRIGGER ALL;

INSERT INTO "public"."tag_allowed_value" ("tag_definition_id", "value", "created_at") VALUES ('01a11af2-8c3d-7923-b778-c927aae8ded0', 'bronze', '2026-10-08 09:57:45.662008+00');
INSERT INTO "public"."tag_allowed_value" ("tag_definition_id", "value", "created_at") VALUES ('01a11af2-8c3d-7923-b778-c927aae8ded0', 'silver', '2026-10-08 09:57:45.662008+00');
INSERT INTO "public"."tag_allowed_value" ("tag_definition_id", "value", "created_at") VALUES ('01a11af2-8c3d-7923-b778-c927aae8ded0', 'gold', '2026-10-08 09:57:45.662008+00');


ALTER TABLE "public"."tag_allowed_value" ENABLE TRIGGER ALL;

--
-- Data for Name: task; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."task" DISABLE TRIGGER ALL;

INSERT INTO "public"."task" ("task_id", "warehouse_id", "queue_name", "status", "picked_up_at", "scheduled_for", "attempt", "parent_task_id", "created_at", "updated_at", "task_data", "entity_id", "last_heartbeat_at", "progress", "execution_details", "entity_name", "entity_type", "project_id") VALUES ('01a11af2-8874-7403-8a1b-e1c01f957def', NULL, 'task_log_cleanup', 'scheduled', NULL, '2026-10-08 09:57:44.691584+00', 0, NULL, '2026-10-08 09:57:44.691584+00', NULL, '{}', NULL, NULL, 0, NULL, NULL, 'project', '00000000-0000-0000-0000-000000000000');
INSERT INTO "public"."task" ("task_id", "warehouse_id", "queue_name", "status", "picked_up_at", "scheduled_for", "attempt", "parent_task_id", "created_at", "updated_at", "task_data", "entity_id", "last_heartbeat_at", "progress", "execution_details", "entity_name", "entity_type", "project_id") VALUES ('01a11af2-88e5-7b11-90c2-1c293995f88e', NULL, 'task_log_cleanup', 'scheduled', NULL, '2026-10-08 09:57:44.804961+00', 0, NULL, '2026-10-08 09:57:44.804961+00', NULL, '{}', NULL, NULL, 0, NULL, NULL, 'project', '01a11af2-88e5-7b11-90c2-1c1419cbf26a');
INSERT INTO "public"."task" ("task_id", "warehouse_id", "queue_name", "status", "picked_up_at", "scheduled_for", "attempt", "parent_task_id", "created_at", "updated_at", "task_data", "entity_id", "last_heartbeat_at", "progress", "execution_details", "entity_name", "entity_type", "project_id") VALUES ('01a11af2-8b02-75f0-8e03-3a6be906e6df', '01a11af2-88f2-7f21-bfcf-3c8f1265c632', 'tabular_purge', 'scheduled', NULL, '2026-10-08 09:57:45.342876+00', 0, NULL, '2026-10-08 09:57:45.342876+00', NULL, '{"tabular_location": "s3://warehouse/hard/01a11af2-8aee-70b2-9090-d796a46b65d6"}', '01a11af2-8aee-70b2-9090-d796a46b65d6', NULL, 0, NULL, '{logs,scratch}', 'table', '00000000-0000-0000-0000-000000000000');
INSERT INTO "public"."task" ("task_id", "warehouse_id", "queue_name", "status", "picked_up_at", "scheduled_for", "attempt", "parent_task_id", "created_at", "updated_at", "task_data", "entity_id", "last_heartbeat_at", "progress", "execution_details", "entity_name", "entity_type", "project_id") VALUES ('01a11af2-8b1d-70a1-ac07-b39517237c16', '01a11af2-8928-7093-9114-577cfc8b406c', 'soft_deletion', 'scheduled', NULL, '2026-10-09 09:57:45.373394+00', 0, NULL, '2026-10-08 09:57:45.373329+00', NULL, '{"deletion_kind": "purge"}', '01a11af2-8b0c-7f33-aa87-ab8863800f8e', NULL, 0, NULL, '{staging,retired}', 'table', '00000000-0000-0000-0000-000000000000');


ALTER TABLE "public"."task" ENABLE TRIGGER ALL;

--
-- Data for Name: task_config; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."task_config" DISABLE TRIGGER ALL;



ALTER TABLE "public"."task_config" ENABLE TRIGGER ALL;

--
-- Data for Name: task_log; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."task_log" DISABLE TRIGGER ALL;



ALTER TABLE "public"."task_log" ENABLE TRIGGER ALL;

--
-- Data for Name: view_properties; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."view_properties" DISABLE TRIGGER ALL;

INSERT INTO "public"."view_properties" ("view_id", "key", "value", "created_at", "updated_at", "warehouse_id") VALUES ('01a11af2-8be3-7f01-9900-faaede7c910e', 'owner', 'analytics', '2026-10-08 09:57:45.59002+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');


ALTER TABLE "public"."view_properties" ENABLE TRIGGER ALL;

--
-- Data for Name: view_representation; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."view_representation" DISABLE TRIGGER ALL;

INSERT INTO "public"."view_representation" ("view_representation_id", "view_version_id", "view_id", "typ", "sql", "dialect", "created_at", "updated_at", "warehouse_id") VALUES ('b5fd9b2e-c2fe-11f1-b1be-e79812338b40', 2, '01a11af2-8be3-7f01-9900-faaede7c910e', 'sql', 'SELECT order_id FROM orders', 'spark', '2026-10-08 09:57:45.59002+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."view_representation" ("view_representation_id", "view_version_id", "view_id", "typ", "sql", "dialect", "created_at", "updated_at", "warehouse_id") VALUES ('b5fd9c96-c2fe-11f1-b1be-5318a0e8a900', 2, '01a11af2-8be3-7f01-9900-faaede7c910e', 'sql', 'SELECT order_id FROM orders', 'trino', '2026-10-08 09:57:45.59002+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."view_representation" ("view_representation_id", "view_version_id", "view_id", "typ", "sql", "dialect", "created_at", "updated_at", "warehouse_id") VALUES ('b5fd9d0e-c2fe-11f1-b1be-db8321266676', 1, '01a11af2-8be3-7f01-9900-faaede7c910e', 'sql', 'SELECT order_id, amount FROM orders', 'spark', '2026-10-08 09:57:45.59002+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."view_representation" ("view_representation_id", "view_version_id", "view_id", "typ", "sql", "dialect", "created_at", "updated_at", "warehouse_id") VALUES ('b5fd9d7c-c2fe-11f1-b1be-cb379465ec11', 1, '01a11af2-8be3-7f01-9900-faaede7c910e', 'sql', 'SELECT order_id, amount FROM orders', 'trino', '2026-10-08 09:57:45.59002+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."view_representation" ("view_representation_id", "view_version_id", "view_id", "typ", "sql", "dialect", "created_at", "updated_at", "warehouse_id") VALUES ('b600a0b2-c2fe-11f1-bf44-f360870dc367', 1, '01a11af2-8c0c-79a1-954f-f96ebad34946', 'sql', 'SELECT order_id FROM prod.sales.eu.orders', 'spark', '2026-10-08 09:57:45.612822+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');


ALTER TABLE "public"."view_representation" ENABLE TRIGGER ALL;

--
-- Data for Name: view_version_log; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."view_version_log" DISABLE TRIGGER ALL;

INSERT INTO "public"."view_version_log" ("view_id", "version_id", "timestamp", "created_at", "updated_at", "warehouse_id") VALUES ('01a11af2-8be3-7f01-9900-faaede7c910e', 1, '2026-10-08 09:57:45.571+00', '2026-10-08 09:57:45.59002+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."view_version_log" ("view_id", "version_id", "timestamp", "created_at", "updated_at", "warehouse_id") VALUES ('01a11af2-8be3-7f01-9900-faaede7c910e', 2, '2026-10-08 09:57:45+00', '2026-10-08 09:57:45.59002+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');
INSERT INTO "public"."view_version_log" ("view_id", "version_id", "timestamp", "created_at", "updated_at", "warehouse_id") VALUES ('01a11af2-8c0c-79a1-954f-f96ebad34946', 1, '2026-10-08 09:57:45.612+00', '2026-10-08 09:57:45.612822+00', NULL, '01a11af2-88f2-7f21-bfcf-3c8f1265c632');


ALTER TABLE "public"."view_version_log" ENABLE TRIGGER ALL;

--
-- Data for Name: warehouse_statistics; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."warehouse_statistics" DISABLE TRIGGER ALL;

INSERT INTO "public"."warehouse_statistics" ("warehouse_id", "number_of_views", "number_of_tables", "timestamp", "created_at", "updated_at") VALUES ('01a11af2-8949-7551-b98c-b422f0fc2104', 0, 0, '2026-10-08 09:00:01+00', '2026-10-08 09:57:44.91729+00', NULL);
INSERT INTO "public"."warehouse_statistics" ("warehouse_id", "number_of_views", "number_of_tables", "timestamp", "created_at", "updated_at") VALUES ('01a11af2-8928-7093-9114-577cfc8b406c', 0, 1, '2026-10-08 09:00:01+00', '2026-10-08 09:57:44.883954+00', '2026-10-08 09:57:45.356823+00');
INSERT INTO "public"."warehouse_statistics" ("warehouse_id", "number_of_views", "number_of_tables", "timestamp", "created_at", "updated_at") VALUES ('01a11af2-88f2-7f21-bfcf-3c8f1265c632', 2, 7, '2026-10-08 09:00:01+00', '2026-10-08 09:57:44.852271+00', '2026-10-08 09:57:45.612822+00');


ALTER TABLE "public"."warehouse_statistics" ENABLE TRIGGER ALL;

--
-- Data for Name: warehouse_statistics_history; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."warehouse_statistics_history" DISABLE TRIGGER ALL;



ALTER TABLE "public"."warehouse_statistics_history" ENABLE TRIGGER ALL;

--
-- Name: table_metadata_log_sequence_number_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."table_metadata_log_sequence_number_seq"', 12, true);


--
-- Name: table_snapshot_log_sequence_number_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."table_snapshot_log_sequence_number_seq"', 6, true);


--
-- PostgreSQL database dump complete
--

\unrestrict xYCYavlnCvuSuONJEY0TUty3HDD5VysqvFDoyi1BgrtNmMYBBDcgxm0ni96DZGM

