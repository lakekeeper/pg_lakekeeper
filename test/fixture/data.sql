--
-- PostgreSQL database dump
--

\restrict NhkhpAk9ontoQ3uuNLtDhgBaP1uvi8I3nYDdr8UDqsoF4u7AQjoe2RJZBRnf8Uw

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

INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (1, 'setup', '2026-09-15 19:50:13.631412+00', true, '\x44748caaec8b09f6fa20eb95f83d8aea7f9d51afdc52bfcafa8c58d44bec7fb1a6fc711b6d7cc0548a9367dd2ac19a81', 18159529);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (2, 'warehouse', '2026-09-15 19:50:13.631412+00', true, '\x58f595584b3b88f1865995e4af0ef84d8908c80d2f77e8a19e02f130d4332292643a70664b9d297d16a7e8505fb3cfa3', 7148955);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (3, 'secret', '2026-09-15 19:50:13.631412+00', true, '\x225a1b4719428159722d577e561d28b65e05f0b25b194ffbf6b60c8a249622538387049a083769171281f6d0ea7b3dcb', 2708563);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (4, 'namespace', '2026-09-15 19:50:13.631412+00', true, '\xcecdbb17a4110070c57062bd62c8dd239bf71fa5610e2f9b471c794d580d7381bf6b7b2ca68e48e139828176efb690c9', 4686788);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (5, 'table', '2026-09-15 19:50:13.631412+00', true, '\x9aef13da32da13ffe98a021198fd0201d5ea7a25f82db1f9ddab765e307988de099005e4f6f26f0bf87ebd35e8b8ca89', 3669086);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20240620151429, 'timecolumns', '2026-09-15 19:50:13.631412+00', true, '\x255792dcad31ae41b33215ec2a724a6c758c8b56dd0cdb5916798745f55521c006c907085af498045869f48d42574547', 566499);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20240620151514, 'tabular identifiers', '2026-09-15 19:50:13.631412+00', true, '\xd229b1be11187cac021d6e546b4b6f4af59c4504ed8c3f1ddf6bcd96376e66ea8665f9d565a8e2e6c3b4ce7dfa6fb311', 12318954);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20240620151544, 'views', '2026-09-15 19:50:13.631412+00', true, '\x070336ffd87183e9e5bd4b1c72b025d71ed504d9d92ab12b33b8031fd5af2cf1a0dd9917e6bb4e625c749e1408dd1e1b', 18362673);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20240897111544, 'view versions are i32', '2026-09-15 19:50:13.631412+00', true, '\x84f46223a0c4a900a026d08922ea82c40e0961bc506310b38e3f247ee0b62c0f84daf48fc840ea93dd269b7f201ed128', 15514586);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20240898160621, 'tabular deleted at', '2026-09-15 19:50:13.631412+00', true, '\x19152bb9a9069d3e708d6559d816b284db33823f8b6fa52656a80cc0b46009e9830cf3b9b7c9b9087f4c68cffcf6e3d1', 237308);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20240898175225, 'tabular deletion extended', '2026-09-15 19:50:13.631412+00', true, '\x96f284a89006b4f8317c7c78e0969b5f81948124d71c17338cd9267954e4ff117a0eecbf99acbdae6d6b46a330db08ad', 1383762);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20240899175225, 'tabular expiration', '2026-09-15 19:50:13.631412+00', true, '\x19cac9768c9b611a14f459c434cbe02291a8fdbf6585db17f3349db51c6ab17f9771b6487141a2ea70b310cd12590458', 16641503);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20240909120857, 'configurable drops', '2026-09-15 19:50:13.631412+00', true, '\xc7b480b4d576d774c6da07b2011225be3e1392d6e80c102722e1f64bbf7d7317c64fc193dd9bdc33e81ae80dba0d1c06', 1791051);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20240911094637, 'unique tabular location', '2026-09-15 19:50:13.631412+00', true, '\x5d68135df940e2bf31b496b258df36e31218ce4feacb49ab37cc272603edfb2a5f6d67edfafc34ba6773d75bbfb7878e', 1549054);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20241006083546, 'projects-table', '2026-09-15 19:50:13.631412+00', true, '\x300a586e0947cf994fb1043af0acddd2eabed168b94b215038e3c9f7668a1328402914abd5e5983cd5b6b25698dfb153', 4360572);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20241009122911, 'users and roles', '2026-09-15 19:50:13.631412+00', true, '\x633c0a8822c896e89249d5ada24c39dc1197b132b57d462cc4e59566851fc5dbeb5d064e900f15345de5c221af59a579', 30470558);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20241011203612, 'server', '2026-09-15 19:50:13.631412+00', true, '\x4571f34b4f62ecc9f90e413c228d37f59c278b478d3ceefb7ec546b31321df2a8aa020db9b7e5be266481c1ffdb2b577', 2264424);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20241106163000, 'user email search', '2026-09-15 19:50:13.631412+00', true, '\x4e98d3e168ffc1c9901351bbc86d085025ede29b96270154cc843749d9c27a7bb1052a8703e0ec345c88523780610e82', 690343);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20241106201139, 'split table metadata', '2026-09-15 19:50:13.631412+00', true, '\xc4292b2f4c49baa6c42aabebbee93c9dc64c63b45ecbb791a875b78f48a84980db8b9fcb3b2baf20d26c8870e1ef4e4c', 27829422);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20241117144332, 'task queue indexes', '2026-09-15 19:50:13.631412+00', true, '\x93069e237dc85e2d6ec5bf717feb088b71beffa3c74c97003c859e9ded5c5f265e8121970952f907777d6b2744695cdf', 1121708);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20241216114355, 'table statistics', '2026-09-15 19:50:13.631412+00', true, '\x8ddc9dbca113fb69dfcf3c5311c3e5b24450b42300eeb2848cceb3f56de3e9e1b9a95953b5f8b5d224937f94477007eb', 4808878);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20241216150545, 'fix schemaless snapshots', '2026-09-15 19:50:13.631412+00', true, '\xc06ec31cf310ef63bbed99590b05ee1a4d1df51cf1378bc3291d82261f864c0ae4501896cca3ec35e44cf123e28976da', 139714);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20241224055514, 'unique user email', '2026-09-15 19:50:13.631412+00', true, '\xd5fc3bcb8af5706cea9434a948fc6426f083e6bf31f94389953440d4e7f054994562f6cdedec1ab7df5cc06f892918cf', 853131);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20250108131004, 'statistics', '2026-09-15 19:50:13.631412+00', true, '\x87c07858acedf8b9599d1eee6a9bbe23e2430aef4012f673b2d2ff719df3f99cb214252a0307993cb114339eb04a949d', 5729606);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20250216105917, 'variant protocols', '2026-09-15 19:50:13.631412+00', true, '\x76c58ded446245c86dd7cac5bddd34ccd9126db5eae307a5942c18875126f5999238569c02076742d63dc3c7a98fa222', 4913255);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20250304100842, 'string project ids', '2026-09-15 19:50:13.631412+00', true, '\x42d41bcc48fde8622073cd669b7eeba8396f3b463aec28e4370402ada7f9eefa424cca45f074ca540a7c4dfea46e5d65', 6144659);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20250310181331, 'endpoint stats', '2026-09-15 19:50:13.631412+00', true, '\x0e475131b17449d48330d9979e78c69e43d72854e691528a9a7a9a83acf8658142865c552424848089b45239848ee59f', 6741155);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20250326153233, 'table statistics fkey', '2026-09-15 19:50:13.631412+00', true, '\xda90a37bee3f857b21e8374f1adefc865b8bf05ce090d06626eb34a135f58159ae598a0afab8bb29aa6a2e16ca440c9b', 1543403);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20250328131139, 'fix sequence number', '2026-09-15 19:50:13.631412+00', true, '\xd8a6efb1006b7f9477c511c70591da1c73e6b2e6ada9fa9062524444213faed8cd8dc32ce5db8a7254a4ffc4459532fe', 815209);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20250401163352, 'project id constraints', '2026-09-15 19:50:13.631412+00', true, '\xa16230d4226b6a55a644c24239f5fbb40be816d96aa4ecc3b155a41042bd30892ec06996dcb64f3951110419b48e6a53', 1539456);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20250407144536, 'fix warehouse deletion fk', '2026-09-15 19:50:13.631412+00', true, '\xdc02cc58d053f9fad616db6705cfff33364fa822e22e29f0f9228feab8835164cd266b7466c72ced1b12eeee3d8fa590', 1076902);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20250409201248, 'cascade delete', '2026-09-15 19:50:13.631412+00', true, '\x725285449a654945fffa2a2941799acecce7e38d37fe13e32b8ad690b6365760a058ebc2fcdb9ba9d8e2b57892d9e8d9', 1720347);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20250410024101, 'fix warehouse stats', '2026-09-15 19:50:13.631412+00', true, '\x563ba555ceeade50819aee877fd130d1c5b7cf8286b571ba8fc28f01d3a97c73de60a2027c62dd6abfc00fec1d3b49bb', 6648600);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20250412220607, 'restructure endpoints', '2026-09-15 19:50:13.631412+00', true, '\xa82ad2ccbb7eaa4e3bcac1c246ce901ab97e12951345d3b55699e6428b3560f2103bde8899694a7ea0d80fbf2a43c7c8', 8867840);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20250428072447, 'add task warehouse id idx', '2026-09-15 19:50:13.631412+00', true, '\x456a06466a8f75dd5db3779c046ae55dfb3c4f9ce3d5b72bce99aa4a77ce4bf85545fcd0390b0e3f8c5106185b95ea28', 3636144);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20250505101407, 'fix index function', '2026-09-15 19:50:13.631412+00', true, '\x2b2885dbc012ecaac71fc2e3a2c67399c5d30139f8176e613c574dd834e07a7010f5cfdaf7206e3f0ac48fef7e795593', 214605);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20250506094141, 'fix index function2', '2026-09-15 19:50:13.631412+00', true, '\x41d5623f06bcd747458a96bef6d49edd8f21820d484f95e97298032bb143dc671cc5f8c6defc7305727525b25830b302', 90010);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20250513172324, 's3 sign table endpoint', '2026-09-15 19:50:13.631412+00', true, '\x14c7c0c6f8698b881fb1b7886c8e77c9aafb1e2a0b5c83f92b676cee98267f444448d0fcad4a6616cebfb55b2bb84891', 147018);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20250523101407, 'tasks store their state', '2026-09-15 19:50:13.631412+00', true, '\xd683513c18f6c69d5554f5b6668440a0f0f986cace59c1b5be5c81be9c72c65db2190f22554348b1b51a949a6f841309', 18630228);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20250623114333, 'fix soft deleted tabulars', '2026-09-15 19:50:13.631412+00', true, '\x69c17d9fa0097f5fdae0038bba6456928b019b013fa1fa2e59f94557f200b02d5c7e93c48c32f158a21212a8a2594bfd', 3506048);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20250826171037, 'task runtime information', '2026-09-15 19:50:13.631412+00', true, '\xe94445d3c02c310458359196019123c8ca5f1e060139730b3e914b26d1b51cbf0011a1feff343929af3ba1cff4c7b6c2', 9356792);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20250904142650, 'reusable table id', '2026-09-15 19:50:13.631412+00', true, '\xa514abf508d7e9183c5bc293656010c2cf1e42e05f0caba5fa3e2a2f2dd43d8f5aae151a13eea886459720faa4dd95fc', 44935563);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20250919101934, 'add task entity name', '2026-09-15 19:50:13.631412+00', true, '\x5f1014aa1080bb434de90cb511101d77cf471b210afe9bbaf9f197d50da51f439a5d60fec317c0546d6e4ade0bf7ebc9', 5381208);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20250923102542, 'v3 support', '2026-09-15 19:50:13.631412+00', true, '\x3a79587d573174c1286da46ad4644b97badcefe80556fe4c50cb2e84d57d7435783b62f671dcab7a8bd4a70c4884f64d', 4047540);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20250923164029, 'fuzzy tabular search', '2026-09-15 19:50:13.631412+00', true, '\x103bb5d0f13ea02d35b70ae495d8964412251c90dbea7ddd1ed3d1caea692dd22a7a539cedf076ca73d6cf59a2657452', 30287833);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20250930101627, 'active tabulars remove namespace join', '2026-09-15 19:50:13.631412+00', true, '\x593c731cd893b3fd8ef983a4f75009528808d810593f2727f52ca10a344a0d1e8174d7a9e88881f79417f5666dc28a59', 838553);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20251003103404, 'fix project endpoint stats', '2026-09-15 19:50:13.631412+00', true, '\x569ccc3f2c9d7bb50ec89fdc888769a65ca3236f89b01b896f13867b4bddfcdb262b9002cede9e93f2bf5cd4e54600bf', 460299);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20251027163724, 'introduce entity versions', '2026-09-15 19:50:13.631412+00', true, '\xfc4c004bb9ec2f641bd3d4dfab45cbf5baaeeeb2bb0175c14cd53ee4ea50aec503d9a228788530ff483533d8b0576323', 1513998);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20251109122721, 'role project filter', '2026-09-15 19:50:13.631412+00', true, '\x606b2b212b19609b678003d25557fe62ad58bf1d1aeecbcac18419a7982749c12f98603d917c2a459473dfb7ad4d80e2', 843773);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20251117114624, 'action endpoint statistics', '2026-09-15 19:50:13.631412+00', true, '\x9d543932d02cac35ce815e8cd6701e95843bd15b3d79ad94098a1dcb2ba02e0909ec48b76055c020ac7b0da7139ed45b', 1051144);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20251121072340, 'role external id', '2026-09-15 19:50:13.631412+00', true, '\x3a3ff71ca594036dfabb1afc0050dfa252c664b4407c59659812d238ae46f5156e0da5acb888f9e9fddbd9e5576e2ed0', 1083114);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20251228101923, 'enable tasks on project level', '2026-09-15 19:50:13.631412+00', true, '\x4b37aefd7ee8a615b002440ac5ab0c24ad02972d6e591f762281edee819618ef00aac0b419aa6f34fe2933ca22d81a37', 20203818);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20260219081950, 'improve list performance', '2026-09-15 19:50:13.631412+00', true, '\xe274713de4ad41421623946f543cd00aeea5e2e34fdee15755130ececf4bde79dd6661e5dcb888bc1435558d3bbf733c', 6236482);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20260220011106, 'string role id', '2026-09-15 19:50:13.631412+00', true, '\xec8049a0a96bae04831452df46f3d3998db0e786b2f50b8dcb28d2e9cdb52da42121a79f2c76e3ba03ebe53c015923bf', 2504347);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20260301083426, 'user role mappings', '2026-09-15 19:50:13.631412+00', true, '\xb4793d54e8352013c49bcc67f529dec265f0ca73e8480fa36ead31402de6de6658e186b6e558612f1ed184c29c195b90', 5728043);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20260318120000, 'idempotency record', '2026-09-15 19:50:13.631412+00', true, '\xfbd914a0cb067ade744d4f3461a668c8c22253df4958759aab7833440369c2a0faed7d7f80ce57a6cf1080d817261564', 2178763);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20260513091606, 'drop unique user email', '2026-09-15 19:50:13.631412+00', true, '\xda8f014576ee46e50bc33d914b4659fe02591b2d72084c33722ac0b0ae2ecb6b59acd1d3b4746c3637e197a02ca88b67', 183055);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20260525120000, 'fix namespace trigger wholerow when', '2026-09-15 19:50:13.631412+00', true, '\x29be3c0d646d1aff68f5c5efb8a1463e4a27d11b666e3c13affd430665e53b68aa7570ec7d2df354a0cd70d2b0b65a4c', 373625);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20260527120000, 'add schedule task endpoint', '2026-09-15 19:50:13.631412+00', true, '\xa046d7c4047684771dd416596e100d0f6eee2731fa0a4266957f98dbf9eea6c1ca595a75ca0c078bfa61bd7c84e95b0d', 196661);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20260529000000, 'add generic table', '2026-09-15 19:50:13.631412+00', true, '\x519eb57638de32a80737b143ea5cb22b6417ebd17abc2896fb9b13d7b68439096b0a48c18be6b5caced1dc55cb71a8fe', 26852218);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20260529120000, 'warehouse format version policy', '2026-09-15 19:50:13.631412+00', true, '\x46fb8da91a336e1f3d8560bfae3b9824cc0ed2db516a2eccbf916b20ffa555700082b9ff7d1b3bfe7ff294b6ec154d0f', 976493);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20260601000000, 'role membership', '2026-09-15 19:50:13.631412+00', true, '\x7c2f6323b7f8ef844a2b91b3f7bfd5caa89ddd54a1f72ace7f16a616134cf78731b3246a69058660ddf34ce9cf5d14f1', 2152664);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20260605000000, 'warehouse managed by', '2026-09-15 19:50:13.631412+00', true, '\x7d09b329832755e7e36a2f83f4c36a8f89e3be1f4ff404048eb3714d48b66dadfffeda6b31a63d16ec77cf1b421b46a6', 594562);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20260607000000, 'role membership endpoints and user name nullable', '2026-09-15 19:50:13.631412+00', true, '\x70f8ac73b2de457e8632f5a14d14072930abc01055c0033413862d3587f7f76978f6e6e0c077069e2e8c0c21f2bce1ed', 2179053);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20260625000000, 'normalized schema', '2026-09-15 19:50:13.631412+00', true, '\x9bc3e8e236d24341c7eedccb8bd9c1db43799ebbb0af38619352ef27ecf78e81861d08fe92c300c5d12b6c4fb82f1887', 4948200);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20260720000000, 'tags', '2026-09-15 19:50:13.631412+00', true, '\x42d3e2bbc08fb9d280ff33c189166aec552df008c03e394acc48b57af3ac2d76e9f11a9b6ea78e56db873016d8adc05d', 12902305);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20260806220000, 'add warehouse validate endpoints', '2026-09-15 19:50:13.631412+00', true, '\xb4e371ba6bd76966341081177d8339fb35955a2af30bc5ce9136c25296084ed8f714de0a474fd0fd488ebbfc19df62b4', 493922);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20260811000000, 'grants', '2026-09-15 19:50:13.631412+00', true, '\x8b1e897da492fd4691706ac3e60dabafaaa9989aeab480949872b574380ab6bc5c2da6c82e095d7c1c5dec045c7bf565', 13779331);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20260812090000, 'add move namespace endpoint', '2026-09-15 19:50:13.631412+00', true, '\x766efaa7abe4dc1ef7e6fb2ad999eae2825d4149157d0fcca6e2c242bb95db62e663ffdd9cb6d129e9b1ad7b45bc99ff', 256995);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20260813000000, 'fix list tabulars index', '2026-09-15 19:50:13.631412+00', true, '\x2fcb76367038f8bd09f8f18cb9ef41180235ae37c0048d43ad8ce81c94baea906a9a177e4816c3a40c3933a9e17eebff', 1116468);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20260814090000, 'sign by table name endpoint', '2026-09-15 19:50:13.631412+00', true, '\xb6c5d69e27d73bf2e6e6071ba71ee285e140c1b13424e41dc19a080f6f37007a056bea0ea7f30f778317a3d8086cbe9c', 272394);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20260829000000, 'subtree grants', '2026-09-15 19:50:13.631412+00', true, '\xf3e82af6deeb69d7a9d81bcedea6c5844d2978c12e36802faca770ea60f041014c280ae8ab40f1b62d85144b1320a7f7', 1402397);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20260830000000, 'normalize and index tabular location', '2026-09-15 19:50:13.631412+00', true, '\x4686281ba5646c5e42aded6337c592aa6cdc435fbe0d68419ee81901c2c6abdb493fa54dcc7fc724c03e09e14147f543', 938532);


ALTER TABLE "public"."_sqlx_migrations" ENABLE TRIGGER ALL;

--
-- Data for Name: project; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."project" DISABLE TRIGGER ALL;

INSERT INTO "public"."project" ("project_name", "created_at", "updated_at", "project_id", "version") VALUES ('Default Project', '2026-09-15 19:50:16.315139+00', NULL, '00000000-0000-0000-0000-000000000000', 0);
INSERT INTO "public"."project" ("project_name", "created_at", "updated_at", "project_id", "version") VALUES ('finance', '2026-09-15 19:50:16.439649+00', NULL, '01a0a69e-be77-7c31-90d6-db48f29a588b', 0);


ALTER TABLE "public"."project" ENABLE TRIGGER ALL;

--
-- Data for Name: warehouse; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."warehouse" DISABLE TRIGGER ALL;

INSERT INTO "public"."warehouse" ("warehouse_id", "warehouse_name", "storage_profile", "storage_secret_id", "created_at", "updated_at", "status", "tabular_expiration_seconds", "tabular_delete_mode", "project_id", "protected", "version", "allowed_format_versions", "default_format_version", "managed_by") VALUES ('01a0a69e-be86-7492-8cf9-a37234d52a0b', 'wh_hard', '{"type": "s3", "bucket": "warehouse", "flavor": "s3-compat", "region": "local-01", "endpoint": "http://minio:9000/", "key-prefix": "hard", "sts-enabled": true, "sts-endpoint": null, "sts-role-arn": null, "storage-layout": null, "assume-role-arn": null, "aws-kms-key-arn": null, "sts-session-tags": {}, "path-style-access": true, "legacy-md5-behavior": null, "remote-signing-enabled": true, "push-s3-delete-disabled": true, "remote-signing-url-style": "auto", "sts-token-validity-seconds": 3600, "allow-alternative-protocols": null}', 'ac7928f6-b13e-11f1-abae-83761d378c5c', '2026-09-15 19:50:16.489216+00', NULL, 'active', NULL, 'hard', '00000000-0000-0000-0000-000000000000', false, 0, '{1,2,3}', NULL, 'self-managed');
INSERT INTO "public"."warehouse" ("warehouse_id", "warehouse_name", "storage_profile", "storage_secret_id", "created_at", "updated_at", "status", "tabular_expiration_seconds", "tabular_delete_mode", "project_id", "protected", "version", "allowed_format_versions", "default_format_version", "managed_by") VALUES ('01a0a69e-bef7-7183-bdf3-4c2ea03bf8bf', 'wh_off', '{"type": "s3", "bucket": "warehouse", "flavor": "s3-compat", "region": "local-01", "endpoint": "http://minio:9000/", "key-prefix": "off", "sts-enabled": true, "sts-endpoint": null, "sts-role-arn": null, "storage-layout": null, "assume-role-arn": null, "aws-kms-key-arn": null, "sts-session-tags": {}, "path-style-access": true, "legacy-md5-behavior": null, "remote-signing-enabled": true, "push-s3-delete-disabled": true, "remote-signing-url-style": "auto", "sts-token-validity-seconds": 3600, "allow-alternative-protocols": null}', 'ac875e8a-b13e-11f1-abae-c352ffadeb01', '2026-09-15 19:50:16.583432+00', '2026-09-15 19:50:16.614645+00', 'inactive', NULL, 'hard', '00000000-0000-0000-0000-000000000000', false, 1, '{1,2,3}', NULL, 'self-managed');
INSERT INTO "public"."warehouse" ("warehouse_id", "warehouse_name", "storage_profile", "storage_secret_id", "created_at", "updated_at", "status", "tabular_expiration_seconds", "tabular_delete_mode", "project_id", "protected", "version", "allowed_format_versions", "default_format_version", "managed_by") VALUES ('01a0a69e-bebe-7a42-98a3-623f1d567bd4', 'wh_soft', '{"type": "s3", "bucket": "warehouse", "flavor": "s3-compat", "region": "local-01", "endpoint": "http://minio:9000/", "key-prefix": "soft", "sts-enabled": true, "sts-endpoint": null, "sts-role-arn": null, "storage-layout": null, "assume-role-arn": null, "aws-kms-key-arn": null, "sts-session-tags": {}, "path-style-access": true, "legacy-md5-behavior": null, "remote-signing-enabled": true, "push-s3-delete-disabled": true, "remote-signing-url-style": "auto", "sts-token-validity-seconds": 3600, "allow-alternative-protocols": null}', 'ac7f604a-b13e-11f1-a9a7-a3ffefa2c7b9', '2026-09-15 19:50:16.529759+00', '2026-09-15 19:50:16.635364+00', 'active', 86400, 'soft', '00000000-0000-0000-0000-000000000000', true, 1, '{1,2,3}', NULL, 'self-managed');


ALTER TABLE "public"."warehouse" ENABLE TRIGGER ALL;

--
-- Data for Name: namespace; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."namespace" DISABLE TRIGGER ALL;

INSERT INTO "public"."namespace" ("namespace_id", "warehouse_id", "namespace_name", "namespace_properties", "created_at", "updated_at", "protected", "version") VALUES ('01a0a69e-bf57-7c53-ab38-38a2c3cbc8e5', '01a0a69e-be86-7492-8cf9-a37234d52a0b', '{sales}', '{"owner": "analytics", "location": "s3://warehouse/hard"}', '2026-09-15 19:50:16.66313+00', NULL, false, 0);
INSERT INTO "public"."namespace" ("namespace_id", "warehouse_id", "namespace_name", "namespace_properties", "created_at", "updated_at", "protected", "version") VALUES ('01a0a69e-bf65-76d1-8716-38502f573861', '01a0a69e-be86-7492-8cf9-a37234d52a0b', '{sales,eu}', '{"location": "s3://warehouse/hard"}', '2026-09-15 19:50:16.677858+00', NULL, false, 0);
INSERT INTO "public"."namespace" ("namespace_id", "warehouse_id", "namespace_name", "namespace_properties", "created_at", "updated_at", "protected", "version") VALUES ('01a0a69e-bf7c-74a2-ba9a-dddc2e68ad1f', '01a0a69e-be86-7492-8cf9-a37234d52a0b', '{sales,eu,q1}', '{"location": "s3://warehouse/hard", "retention": "5y"}', '2026-09-15 19:50:16.701033+00', NULL, false, 0);
INSERT INTO "public"."namespace" ("namespace_id", "warehouse_id", "namespace_name", "namespace_properties", "created_at", "updated_at", "protected", "version") VALUES ('01a0a69e-bf89-7c31-a36e-6fdcc05540b4', '01a0a69e-be86-7492-8cf9-a37234d52a0b', '{logs}', '{"location": "s3://warehouse/hard"}', '2026-09-15 19:50:16.714006+00', NULL, false, 0);
INSERT INTO "public"."namespace" ("namespace_id", "warehouse_id", "namespace_name", "namespace_properties", "created_at", "updated_at", "protected", "version") VALUES ('01a0a69e-bf97-79e1-b37a-abcfb20a5f1b', '01a0a69e-bebe-7a42-98a3-623f1d567bd4', '{staging}', '{"location": "s3://warehouse/soft"}', '2026-09-15 19:50:16.727363+00', NULL, false, 0);


ALTER TABLE "public"."namespace" ENABLE TRIGGER ALL;

--
-- Data for Name: tabular; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."tabular" DISABLE TRIGGER ALL;

INSERT INTO "public"."tabular" ("tabular_id", "namespace_id", "name", "typ", "metadata_location", "created_at", "updated_at", "deleted_at", "fs_protocol", "fs_location", "protected", "warehouse_id", "tabular_namespace_name") VALUES ('01a0a69e-bfa9-7e62-8c81-d5f0ef4ac744', '01a0a69e-bf65-76d1-8716-38502f573861', 'orders', 'table', 's3://warehouse/hard/01a0a69e-bfa9-7e62-8c81-d5f0ef4ac744/metadata/00002-01a0a69e-c03e-7731-9322-fe6b674a9a5a.gz.metadata.json', '2026-09-15 19:50:16.746019+00', '2026-09-15 19:50:16.898188+00', NULL, 's3', 'warehouse/hard/01a0a69e-bfa9-7e62-8c81-d5f0ef4ac744', false, '01a0a69e-be86-7492-8cf9-a37234d52a0b', '{sales,eu}');
INSERT INTO "public"."tabular" ("tabular_id", "namespace_id", "name", "typ", "metadata_location", "created_at", "updated_at", "deleted_at", "fs_protocol", "fs_location", "protected", "warehouse_id", "tabular_namespace_name") VALUES ('01a0a69e-c056-79f0-b2e1-8e539d9cd821', '01a0a69e-bf89-7c31-a36e-6fdcc05540b4', 'events', 'table', 's3://warehouse/hard/01a0a69e-c056-79f0-b2e1-8e539d9cd821/metadata/00000-01a0a69e-c056-79f0-b2e1-8e608784ac6f.gz.metadata.json', '2026-09-15 19:50:16.918761+00', NULL, NULL, 's3', 'warehouse/hard/01a0a69e-c056-79f0-b2e1-8e539d9cd821', false, '01a0a69e-be86-7492-8cf9-a37234d52a0b', '{logs}');
INSERT INTO "public"."tabular" ("tabular_id", "namespace_id", "name", "typ", "metadata_location", "created_at", "updated_at", "deleted_at", "fs_protocol", "fs_location", "protected", "warehouse_id", "tabular_namespace_name") VALUES ('01a0a69e-c070-7a73-80b9-eaa65e338ce2', '01a0a69e-bf65-76d1-8716-38502f573861', 'orders_v3', 'table', 's3://warehouse/hard/01a0a69e-c070-7a73-80b9-eaa65e338ce2/metadata/00000-01a0a69e-c070-7a73-80b9-eab8045726c7.gz.metadata.json', '2026-09-15 19:50:16.944776+00', NULL, NULL, 's3', 'warehouse/hard/01a0a69e-c070-7a73-80b9-eaa65e338ce2', false, '01a0a69e-be86-7492-8cf9-a37234d52a0b', '{sales,eu}');
INSERT INTO "public"."tabular" ("tabular_id", "namespace_id", "name", "typ", "metadata_location", "created_at", "updated_at", "deleted_at", "fs_protocol", "fs_location", "protected", "warehouse_id", "tabular_namespace_name") VALUES ('01a0a69e-c08f-79d0-bb54-9e0accd931a1', '01a0a69e-bf89-7c31-a36e-6fdcc05540b4', 'legacy_v1', 'table', 's3://warehouse/hard/01a0a69e-c08f-79d0-bb54-9e0accd931a1/metadata/00000-01a0a69e-c08f-79d0-bb54-9e13f3d710d3.gz.metadata.json', '2026-09-15 19:50:16.975803+00', NULL, NULL, 's3', 'warehouse/hard/01a0a69e-c08f-79d0-bb54-9e0accd931a1', false, '01a0a69e-be86-7492-8cf9-a37234d52a0b', '{logs}');
INSERT INTO "public"."tabular" ("tabular_id", "namespace_id", "name", "typ", "metadata_location", "created_at", "updated_at", "deleted_at", "fs_protocol", "fs_location", "protected", "warehouse_id", "tabular_namespace_name") VALUES ('01a0a69e-c0ac-7531-9ae1-303a798b1eb4', '01a0a69e-bf89-7c31-a36e-6fdcc05540b4', 'audit', 'table', 's3://warehouse/hard/01a0a69e-c0ac-7531-9ae1-303a798b1eb4/metadata/00000-01a0a69e-c0ac-7531-9ae1-3042b629787c.gz.metadata.json', '2026-09-15 19:50:17.00481+00', '2026-09-15 19:50:17.06071+00', NULL, 's3', 'warehouse/hard/01a0a69e-c0ac-7531-9ae1-303a798b1eb4', true, '01a0a69e-be86-7492-8cf9-a37234d52a0b', '{logs}');
INSERT INTO "public"."tabular" ("tabular_id", "namespace_id", "name", "typ", "metadata_location", "created_at", "updated_at", "deleted_at", "fs_protocol", "fs_location", "protected", "warehouse_id", "tabular_namespace_name") VALUES ('01a0a69e-c124-75c2-b8cb-272342450ebd', '01a0a69e-bf97-79e1-b37a-abcfb20a5f1b', 'retired', 'table', 's3://warehouse/soft/01a0a69e-c124-75c2-b8cb-272342450ebd/metadata/00000-01a0a69e-c124-75c2-b8cb-2737d776b6e2.gz.metadata.json', '2026-09-15 19:50:17.124334+00', '2026-09-15 19:50:17.152743+00', '2026-09-15 19:50:17.155133+00', 's3', 'warehouse/soft/01a0a69e-c124-75c2-b8cb-272342450ebd', false, '01a0a69e-bebe-7a42-98a3-623f1d567bd4', '{staging}');
INSERT INTO "public"."tabular" ("tabular_id", "namespace_id", "name", "typ", "metadata_location", "created_at", "updated_at", "deleted_at", "fs_protocol", "fs_location", "protected", "warehouse_id", "tabular_namespace_name") VALUES ('01a0a69e-c150-7c70-aa5e-0c24b81190e7', '01a0a69e-bf65-76d1-8716-38502f573861', 'eu_orders', 'view', 's3://warehouse/hard/01a0a69e-c150-7c70-aa5e-0c24b81190e7/metadata/00001-01a0a69e-c178-7022-a49b-213c31d9f9a7.gz.metadata.json', '2026-09-15 19:50:17.168473+00', '2026-09-15 19:50:17.20391+00', NULL, 's3', 'warehouse/hard/01a0a69e-c150-7c70-aa5e-0c24b81190e7', false, '01a0a69e-be86-7492-8cf9-a37234d52a0b', '{sales,eu}');
INSERT INTO "public"."tabular" ("tabular_id", "namespace_id", "name", "typ", "metadata_location", "created_at", "updated_at", "deleted_at", "fs_protocol", "fs_location", "protected", "warehouse_id", "tabular_namespace_name") VALUES ('01a0a69e-c192-77e1-abc4-3cc7a3f8c770', '01a0a69e-bf89-7c31-a36e-6fdcc05540b4', 'delta_events', 'generic-table', NULL, '2026-09-15 19:50:17.234721+00', NULL, NULL, 's3', 'warehouse/hard/logs/delta_events', false, '01a0a69e-be86-7492-8cf9-a37234d52a0b', '{logs}');


ALTER TABLE "public"."tabular" ENABLE TRIGGER ALL;

--
-- Data for Name: view; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."view" DISABLE TRIGGER ALL;

INSERT INTO "public"."view" ("view_id", "view_format_version", "created_at", "updated_at", "warehouse_id") VALUES ('01a0a69e-c150-7c70-aa5e-0c24b81190e7', 'v1', '2026-09-15 19:50:17.168473+00', NULL, '01a0a69e-be86-7492-8cf9-a37234d52a0b');


ALTER TABLE "public"."view" ENABLE TRIGGER ALL;

--
-- Data for Name: view_schema; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."view_schema" DISABLE TRIGGER ALL;

INSERT INTO "public"."view_schema" ("schema_id", "view_id", "schema", "created_at", "updated_at", "warehouse_id") VALUES (0, '01a0a69e-c150-7c70-aa5e-0c24b81190e7', NULL, '2026-09-15 19:50:17.168473+00', NULL, '01a0a69e-be86-7492-8cf9-a37234d52a0b');
INSERT INTO "public"."view_schema" ("schema_id", "view_id", "schema", "created_at", "updated_at", "warehouse_id") VALUES (1, '01a0a69e-c150-7c70-aa5e-0c24b81190e7', NULL, '2026-09-15 19:50:17.20391+00', NULL, '01a0a69e-be86-7492-8cf9-a37234d52a0b');


ALTER TABLE "public"."view_schema" ENABLE TRIGGER ALL;

--
-- Data for Name: view_version; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."view_version" DISABLE TRIGGER ALL;

INSERT INTO "public"."view_version" ("view_id", "version_id", "schema_id", "timestamp", "default_namespace_id", "default_catalog", "summary", "created_at", "updated_at", "warehouse_id") VALUES ('01a0a69e-c150-7c70-aa5e-0c24b81190e7', 2, 1, '2026-09-15 19:50:16+00', '01a0a69e-bf65-76d1-8716-38502f573861', NULL, '{"engine-name": "fixture"}', '2026-09-15 19:50:17.20391+00', NULL, '01a0a69e-be86-7492-8cf9-a37234d52a0b');
INSERT INTO "public"."view_version" ("view_id", "version_id", "schema_id", "timestamp", "default_namespace_id", "default_catalog", "summary", "created_at", "updated_at", "warehouse_id") VALUES ('01a0a69e-c150-7c70-aa5e-0c24b81190e7', 1, 0, '2026-09-15 19:50:17.168+00', '01a0a69e-bf65-76d1-8716-38502f573861', NULL, '{"engine-name": "fixture"}', '2026-09-15 19:50:17.20391+00', NULL, '01a0a69e-be86-7492-8cf9-a37234d52a0b');


ALTER TABLE "public"."view_version" ENABLE TRIGGER ALL;

--
-- Data for Name: current_view_metadata_version; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."current_view_metadata_version" DISABLE TRIGGER ALL;

INSERT INTO "public"."current_view_metadata_version" ("view_id", "version_id", "created_at", "updated_at", "warehouse_id") VALUES ('01a0a69e-c150-7c70-aa5e-0c24b81190e7', 2, '2026-09-15 19:50:17.20391+00', NULL, '01a0a69e-be86-7492-8cf9-a37234d52a0b');


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

INSERT INTO "public"."generic_table" ("warehouse_id", "generic_table_id", "format", "doc", "schema_info", "statistics", "version", "created_at", "updated_at") VALUES ('01a0a69e-be86-7492-8cf9-a37234d52a0b', '01a0a69e-c192-77e1-abc4-3cc7a3f8c770', 'delta', 'Delta table registered alongside the Iceberg tables', '{"columns": [{"name": "event_id", "type": "string"}]}', NULL, 0, '2026-09-15 19:50:17.234721+00', NULL);


ALTER TABLE "public"."generic_table" ENABLE TRIGGER ALL;

--
-- Data for Name: generic_table_properties; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."generic_table_properties" DISABLE TRIGGER ALL;

INSERT INTO "public"."generic_table_properties" ("warehouse_id", "generic_table_id", "key", "value", "created_at", "updated_at") VALUES ('01a0a69e-be86-7492-8cf9-a37234d52a0b', '01a0a69e-c192-77e1-abc4-3cc7a3f8c770', 'owner', 'platform', '2026-09-15 19:50:17.234721+00', NULL);


ALTER TABLE "public"."generic_table_properties" ENABLE TRIGGER ALL;

--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."role" DISABLE TRIGGER ALL;

INSERT INTO "public"."role" ("id", "name", "description", "created_at", "updated_at", "project_id", "source_id", "provider_id", "version") VALUES ('01a0a69e-be2a-71d3-b740-5c2445429992', 'analysts', 'Reads the sales warehouse', '2026-09-15 19:50:16.362412+00', NULL, '00000000-0000-0000-0000-000000000000', '01a0a69e-be2a-71d3-b740-5c2445429992', 'lakekeeper', 0);
INSERT INTO "public"."role" ("id", "name", "description", "created_at", "updated_at", "project_id", "source_id", "provider_id", "version") VALUES ('01a0a69e-be39-7113-bbbf-9352ab9db3a4', 'juniors', NULL, '2026-09-15 19:50:16.377559+00', NULL, '00000000-0000-0000-0000-000000000000', '01a0a69e-be39-7113-bbbf-9352ab9db3a4', 'lakekeeper', 0);
INSERT INTO "public"."role" ("id", "name", "description", "created_at", "updated_at", "project_id", "source_id", "provider_id", "version") VALUES ('01a0a69e-be46-7ec2-bdfe-4367ac39b333', 'robots', NULL, '2026-09-15 19:50:16.390807+00', NULL, '00000000-0000-0000-0000-000000000000', 'group-robots', 'oidc', 0);


ALTER TABLE "public"."role" ENABLE TRIGGER ALL;

--
-- Data for Name: tag_definition; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."tag_definition" DISABLE TRIGGER ALL;

INSERT INTO "public"."tag_definition" ("tag_definition_id", "project_id", "name", "description", "scope", "value_kind", "created_at", "updated_at") VALUES ('01a0a69e-c1a1-7bb0-afb1-a902b87a4a7a', '00000000-0000-0000-0000-000000000000', 'pii', 'Carries personally identifiable information', '{warehouse,namespace,table,view,generic-table,column}', 'marker', '2026-09-15 19:50:17.249422+00', NULL);
INSERT INTO "public"."tag_definition" ("tag_definition_id", "project_id", "name", "description", "scope", "value_kind", "created_at", "updated_at") VALUES ('01a0a69e-c1ae-7692-8056-d2d173bf1a05', '00000000-0000-0000-0000-000000000000', 'owner', NULL, '{warehouse,namespace,table,view,generic-table,column}', 'free_text', '2026-09-15 19:50:17.262997+00', NULL);
INSERT INTO "public"."tag_definition" ("tag_definition_id", "project_id", "name", "description", "scope", "value_kind", "created_at", "updated_at") VALUES ('01a0a69e-c1ba-7bd1-9437-544bd593a2bf', '00000000-0000-0000-0000-000000000000', 'tier', NULL, '{warehouse,namespace,table,view,generic-table,column}', 'enumerated', '2026-09-15 19:50:17.274438+00', NULL);


ALTER TABLE "public"."tag_definition" ENABLE TRIGGER ALL;

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."users" DISABLE TRIGGER ALL;

INSERT INTO "public"."users" ("id", "name", "email", "user_type", "last_updated_with", "deleted_at", "created_at", "updated_at") VALUES ('oidc~alice', 'Alice Analyst', 'alice@example.invalid', 'human', 'create-endpoint', NULL, '2026-09-15 19:50:16.330755+00', NULL);
INSERT INTO "public"."users" ("id", "name", "email", "user_type", "last_updated_with", "deleted_at", "created_at", "updated_at") VALUES ('kubernetes~pipeline', 'Nightly Pipeline', NULL, 'application', 'create-endpoint', NULL, '2026-09-15 19:50:16.346266+00', NULL);


ALTER TABLE "public"."users" ENABLE TRIGGER ALL;

--
-- Data for Name: grant_assignment; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."grant_assignment" DISABLE TRIGGER ALL;

INSERT INTO "public"."grant_assignment" ("grant_id", "principal_type", "user_id", "role_id", "privilege", "resource_type", "project_id", "warehouse_id", "namespace_id", "tabular_id", "tag_definition_id", "created_at") VALUES ('ad0a29f0-b13e-11f1-abae-cbd27acd72af', 'user', 'oidc~alice', NULL, 'list_users', 'server', NULL, NULL, NULL, NULL, NULL, '2026-09-15 19:50:17.436969+00');
INSERT INTO "public"."grant_assignment" ("grant_id", "principal_type", "user_id", "role_id", "privilege", "resource_type", "project_id", "warehouse_id", "namespace_id", "tabular_id", "tag_definition_id", "created_at") VALUES ('ad0cafd6-b13e-11f1-813f-6f415f00add8', 'role', NULL, '01a0a69e-be2a-71d3-b740-5c2445429992', 'create_warehouse', 'project', '00000000-0000-0000-0000-000000000000', NULL, NULL, NULL, NULL, '2026-09-15 19:50:17.453724+00');
INSERT INTO "public"."grant_assignment" ("grant_id", "principal_type", "user_id", "role_id", "privilege", "resource_type", "project_id", "warehouse_id", "namespace_id", "tabular_id", "tag_definition_id", "created_at") VALUES ('ad0f647e-b13e-11f1-b436-475694abe03a', 'role', NULL, '01a0a69e-be2a-71d3-b740-5c2445429992', 'use', 'warehouse', NULL, '01a0a69e-be86-7492-8cf9-a37234d52a0b', NULL, NULL, NULL, '2026-09-15 19:50:17.472048+00');
INSERT INTO "public"."grant_assignment" ("grant_id", "principal_type", "user_id", "role_id", "privilege", "resource_type", "project_id", "warehouse_id", "namespace_id", "tabular_id", "tag_definition_id", "created_at") VALUES ('ad12337a-b13e-11f1-a9a7-a7f596562932', 'user', 'oidc~alice', NULL, 'get_metadata', 'namespace', NULL, '01a0a69e-be86-7492-8cf9-a37234d52a0b', '01a0a69e-bf65-76d1-8716-38502f573861', NULL, NULL, '2026-09-15 19:50:17.489816+00');
INSERT INTO "public"."grant_assignment" ("grant_id", "principal_type", "user_id", "role_id", "privilege", "resource_type", "project_id", "warehouse_id", "namespace_id", "tabular_id", "tag_definition_id", "created_at") VALUES ('ad151090-b13e-11f1-a594-5394518a7350', 'user', 'oidc~alice', NULL, 'read_data', 'tabular', NULL, '01a0a69e-be86-7492-8cf9-a37234d52a0b', NULL, '01a0a69e-bfa9-7e62-8c81-d5f0ef4ac744', NULL, '2026-09-15 19:50:17.508416+00');
INSERT INTO "public"."grant_assignment" ("grant_id", "principal_type", "user_id", "role_id", "privilege", "resource_type", "project_id", "warehouse_id", "namespace_id", "tabular_id", "tag_definition_id", "created_at") VALUES ('ad1785be-b13e-11f1-abae-af720b9d8e6b', 'role', NULL, '01a0a69e-be2a-71d3-b740-5c2445429992', 'select', 'tabular', NULL, '01a0a69e-be86-7492-8cf9-a37234d52a0b', NULL, '01a0a69e-c150-7c70-aa5e-0c24b81190e7', NULL, '2026-09-15 19:50:17.527475+00');
INSERT INTO "public"."grant_assignment" ("grant_id", "principal_type", "user_id", "role_id", "privilege", "resource_type", "project_id", "warehouse_id", "namespace_id", "tabular_id", "tag_definition_id", "created_at") VALUES ('ad19b956-b13e-11f1-813f-f765e2a7e686', 'role', NULL, '01a0a69e-be2a-71d3-b740-5c2445429992', 'read_data', 'tabular', NULL, '01a0a69e-be86-7492-8cf9-a37234d52a0b', NULL, '01a0a69e-c192-77e1-abc4-3cc7a3f8c770', NULL, '2026-09-15 19:50:17.542074+00');
INSERT INTO "public"."grant_assignment" ("grant_id", "principal_type", "user_id", "role_id", "privilege", "resource_type", "project_id", "warehouse_id", "namespace_id", "tabular_id", "tag_definition_id", "created_at") VALUES ('ad1bc2f0-b13e-11f1-b436-4fa69cbed5ff', 'role', NULL, '01a0a69e-be2a-71d3-b740-5c2445429992', 'apply', 'tag', NULL, NULL, NULL, NULL, '01a0a69e-c1a1-7bb0-afb1-a902b87a4a7a', '2026-09-15 19:50:17.555443+00');


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

INSERT INTO "public"."table" ("table_id", "metadata", "created_at", "updated_at", "table_format_version", "last_column_id", "last_sequence_number", "last_updated_ms", "last_partition_id", "warehouse_id", "next_row_id") VALUES ('01a0a69e-bfa9-7e62-8c81-d5f0ef4ac744', NULL, '2026-09-15 19:50:16.746019+00', '2026-09-15 19:50:16.898188+00', '2', 11, 2, 1789501817000, 1000, '01a0a69e-be86-7492-8cf9-a37234d52a0b', 0);
INSERT INTO "public"."table" ("table_id", "metadata", "created_at", "updated_at", "table_format_version", "last_column_id", "last_sequence_number", "last_updated_ms", "last_partition_id", "warehouse_id", "next_row_id") VALUES ('01a0a69e-c056-79f0-b2e1-8e539d9cd821', NULL, '2026-09-15 19:50:16.918761+00', NULL, '2', 2, 0, 1789501816918, 999, '01a0a69e-be86-7492-8cf9-a37234d52a0b', 0);
INSERT INTO "public"."table" ("table_id", "metadata", "created_at", "updated_at", "table_format_version", "last_column_id", "last_sequence_number", "last_updated_ms", "last_partition_id", "warehouse_id", "next_row_id") VALUES ('01a0a69e-c070-7a73-80b9-eaa65e338ce2', NULL, '2026-09-15 19:50:16.944776+00', NULL, '3', 2, 0, 1789501816944, 999, '01a0a69e-be86-7492-8cf9-a37234d52a0b', 0);
INSERT INTO "public"."table" ("table_id", "metadata", "created_at", "updated_at", "table_format_version", "last_column_id", "last_sequence_number", "last_updated_ms", "last_partition_id", "warehouse_id", "next_row_id") VALUES ('01a0a69e-c08f-79d0-bb54-9e0accd931a1', NULL, '2026-09-15 19:50:16.975803+00', NULL, '1', 1, 0, 1789501816975, 999, '01a0a69e-be86-7492-8cf9-a37234d52a0b', 0);
INSERT INTO "public"."table" ("table_id", "metadata", "created_at", "updated_at", "table_format_version", "last_column_id", "last_sequence_number", "last_updated_ms", "last_partition_id", "warehouse_id", "next_row_id") VALUES ('01a0a69e-c0ac-7531-9ae1-303a798b1eb4', NULL, '2026-09-15 19:50:17.00481+00', NULL, '2', 1, 0, 1789501817004, 999, '01a0a69e-be86-7492-8cf9-a37234d52a0b', 0);
INSERT INTO "public"."table" ("table_id", "metadata", "created_at", "updated_at", "table_format_version", "last_column_id", "last_sequence_number", "last_updated_ms", "last_partition_id", "warehouse_id", "next_row_id") VALUES ('01a0a69e-c124-75c2-b8cb-272342450ebd', NULL, '2026-09-15 19:50:17.124334+00', NULL, '2', 1, 0, 1789501817124, 999, '01a0a69e-bebe-7a42-98a3-623f1d567bd4', 0);


ALTER TABLE "public"."table" ENABLE TRIGGER ALL;

--
-- Data for Name: table_schema; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."table_schema" DISABLE TRIGGER ALL;

INSERT INTO "public"."table_schema" ("schema_id", "table_id", "schema", "created_at", "updated_at", "warehouse_id") VALUES (0, '01a0a69e-bfa9-7e62-8c81-d5f0ef4ac744', NULL, '2026-09-15 19:50:16.746019+00', NULL, '01a0a69e-be86-7492-8cf9-a37234d52a0b');
INSERT INTO "public"."table_schema" ("schema_id", "table_id", "schema", "created_at", "updated_at", "warehouse_id") VALUES (0, '01a0a69e-c056-79f0-b2e1-8e539d9cd821', NULL, '2026-09-15 19:50:16.918761+00', NULL, '01a0a69e-be86-7492-8cf9-a37234d52a0b');
INSERT INTO "public"."table_schema" ("schema_id", "table_id", "schema", "created_at", "updated_at", "warehouse_id") VALUES (0, '01a0a69e-c070-7a73-80b9-eaa65e338ce2', NULL, '2026-09-15 19:50:16.944776+00', NULL, '01a0a69e-be86-7492-8cf9-a37234d52a0b');
INSERT INTO "public"."table_schema" ("schema_id", "table_id", "schema", "created_at", "updated_at", "warehouse_id") VALUES (0, '01a0a69e-c08f-79d0-bb54-9e0accd931a1', NULL, '2026-09-15 19:50:16.975803+00', NULL, '01a0a69e-be86-7492-8cf9-a37234d52a0b');
INSERT INTO "public"."table_schema" ("schema_id", "table_id", "schema", "created_at", "updated_at", "warehouse_id") VALUES (0, '01a0a69e-c0ac-7531-9ae1-303a798b1eb4', NULL, '2026-09-15 19:50:17.00481+00', NULL, '01a0a69e-be86-7492-8cf9-a37234d52a0b');
INSERT INTO "public"."table_schema" ("schema_id", "table_id", "schema", "created_at", "updated_at", "warehouse_id") VALUES (0, '01a0a69e-c124-75c2-b8cb-272342450ebd', NULL, '2026-09-15 19:50:17.124334+00', NULL, '01a0a69e-bebe-7a42-98a3-623f1d567bd4');


ALTER TABLE "public"."table_schema" ENABLE TRIGGER ALL;

--
-- Data for Name: table_snapshot; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."table_snapshot" DISABLE TRIGGER ALL;

INSERT INTO "public"."table_snapshot" ("snapshot_id", "table_id", "parent_snapshot_id", "sequence_number", "manifest_list", "summary", "schema_id", "timestamp_ms", "created_at", "updated_at", "warehouse_id", "first_row_id", "assigned_rows", "key_id") VALUES (3001, '01a0a69e-bfa9-7e62-8c81-d5f0ef4ac744', NULL, 1, 's3://warehouse/hard/sales/eu/orders/metadata/snap-3001.avro', '{"operation": "append", "added-records": "100", "total-records": "100", "added-data-files": "2", "total-data-files": "2", "total-files-size": "2048", "total-delete-files": "0"}', 0, 1789501816000, '2026-09-15 19:50:16.847619+00', NULL, '01a0a69e-be86-7492-8cf9-a37234d52a0b', NULL, NULL, NULL);
INSERT INTO "public"."table_snapshot" ("snapshot_id", "table_id", "parent_snapshot_id", "sequence_number", "manifest_list", "summary", "schema_id", "timestamp_ms", "created_at", "updated_at", "warehouse_id", "first_row_id", "assigned_rows", "key_id") VALUES (3002, '01a0a69e-bfa9-7e62-8c81-d5f0ef4ac744', 3001, 2, 's3://warehouse/hard/sales/eu/orders/metadata/snap-3002.avro', '{"operation": "append", "added-records": "50", "total-records": "150", "deleted-records": "0", "added-data-files": "1", "total-data-files": "3", "total-files-size": "3072", "deleted-data-files": "0", "removed-files-size": "0", "total-delete-files": "0"}', 0, 1789501817000, '2026-09-15 19:50:16.898188+00', NULL, '01a0a69e-be86-7492-8cf9-a37234d52a0b', NULL, NULL, NULL);


ALTER TABLE "public"."table_snapshot" ENABLE TRIGGER ALL;

--
-- Data for Name: partition_statistics; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."partition_statistics" DISABLE TRIGGER ALL;

INSERT INTO "public"."partition_statistics" ("snapshot_id", "table_id", "statistics_path", "file_size_in_bytes", "created_at", "updated_at", "warehouse_id") VALUES (3002, '01a0a69e-bfa9-7e62-8c81-d5f0ef4ac744', 's3://warehouse/hard/sales/eu/orders/metadata/part-stats-3002.parquet', 512, '2026-09-15 19:50:16.898188+00', NULL, '01a0a69e-be86-7492-8cf9-a37234d52a0b');


ALTER TABLE "public"."partition_statistics" ENABLE TRIGGER ALL;

--
-- Data for Name: role_assignment; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."role_assignment" DISABLE TRIGGER ALL;

INSERT INTO "public"."role_assignment" ("role_id", "user_id", "created_at") VALUES ('01a0a69e-be2a-71d3-b740-5c2445429992', 'oidc~alice', '2026-09-15 19:50:16.40552+00');
INSERT INTO "public"."role_assignment" ("role_id", "user_id", "created_at") VALUES ('01a0a69e-be39-7113-bbbf-9352ab9db3a4', 'kubernetes~pipeline', '2026-09-15 19:50:16.427309+00');


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

INSERT INTO "public"."role_membership" ("parent_role_id", "member_role_id", "created_at") VALUES ('01a0a69e-be2a-71d3-b740-5c2445429992', '01a0a69e-be39-7113-bbbf-9352ab9db3a4', '2026-09-15 19:50:16.40552+00');


ALTER TABLE "public"."role_membership" ENABLE TRIGGER ALL;

--
-- Data for Name: tabular_field; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."tabular_field" DISABLE TRIGGER ALL;

INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a0a69e-be86-7492-8cf9-a37234d52a0b', '01a0a69e-bfa9-7e62-8c81-d5f0ef4ac744', 1);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a0a69e-be86-7492-8cf9-a37234d52a0b', '01a0a69e-bfa9-7e62-8c81-d5f0ef4ac744', 2);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a0a69e-be86-7492-8cf9-a37234d52a0b', '01a0a69e-bfa9-7e62-8c81-d5f0ef4ac744', 3);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a0a69e-be86-7492-8cf9-a37234d52a0b', '01a0a69e-bfa9-7e62-8c81-d5f0ef4ac744', 4);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a0a69e-be86-7492-8cf9-a37234d52a0b', '01a0a69e-bfa9-7e62-8c81-d5f0ef4ac744', 7);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a0a69e-be86-7492-8cf9-a37234d52a0b', '01a0a69e-bfa9-7e62-8c81-d5f0ef4ac744', 8);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a0a69e-be86-7492-8cf9-a37234d52a0b', '01a0a69e-bfa9-7e62-8c81-d5f0ef4ac744', 5);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a0a69e-be86-7492-8cf9-a37234d52a0b', '01a0a69e-bfa9-7e62-8c81-d5f0ef4ac744', 9);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a0a69e-be86-7492-8cf9-a37234d52a0b', '01a0a69e-bfa9-7e62-8c81-d5f0ef4ac744', 6);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a0a69e-be86-7492-8cf9-a37234d52a0b', '01a0a69e-bfa9-7e62-8c81-d5f0ef4ac744', 10);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a0a69e-be86-7492-8cf9-a37234d52a0b', '01a0a69e-bfa9-7e62-8c81-d5f0ef4ac744', 11);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a0a69e-be86-7492-8cf9-a37234d52a0b', '01a0a69e-c056-79f0-b2e1-8e539d9cd821', 1);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a0a69e-be86-7492-8cf9-a37234d52a0b', '01a0a69e-c056-79f0-b2e1-8e539d9cd821', 2);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a0a69e-be86-7492-8cf9-a37234d52a0b', '01a0a69e-c070-7a73-80b9-eaa65e338ce2', 1);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a0a69e-be86-7492-8cf9-a37234d52a0b', '01a0a69e-c070-7a73-80b9-eaa65e338ce2', 2);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a0a69e-be86-7492-8cf9-a37234d52a0b', '01a0a69e-c08f-79d0-bb54-9e0accd931a1', 1);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a0a69e-be86-7492-8cf9-a37234d52a0b', '01a0a69e-c0ac-7531-9ae1-303a798b1eb4', 1);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a0a69e-bebe-7a42-98a3-623f1d567bd4', '01a0a69e-c124-75c2-b8cb-272342450ebd', 1);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a0a69e-be86-7492-8cf9-a37234d52a0b', '01a0a69e-c150-7c70-aa5e-0c24b81190e7', 1);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a0a69e-be86-7492-8cf9-a37234d52a0b', '01a0a69e-c150-7c70-aa5e-0c24b81190e7', 2);


ALTER TABLE "public"."tabular_field" ENABLE TRIGGER ALL;

--
-- Data for Name: schema_field; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."schema_field" DISABLE TRIGGER ALL;

INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a0a69e-be86-7492-8cf9-a37234d52a0b', '01a0a69e-bfa9-7e62-8c81-d5f0ef4ac744', 0, 1, NULL, 0, 'order_id', true, 'Order number', 'long', NULL, NULL, NULL, true);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a0a69e-be86-7492-8cf9-a37234d52a0b', '01a0a69e-bfa9-7e62-8c81-d5f0ef4ac744', 0, 2, NULL, 1, 'placed_at', true, NULL, 'timestamptz', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a0a69e-be86-7492-8cf9-a37234d52a0b', '01a0a69e-bfa9-7e62-8c81-d5f0ef4ac744', 0, 3, NULL, 2, 'amount', false, NULL, 'decimal', '{"scale": 2, "precision": 12}', NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a0a69e-be86-7492-8cf9-a37234d52a0b', '01a0a69e-bfa9-7e62-8c81-d5f0ef4ac744', 0, 4, NULL, 3, 'customer', false, NULL, 'struct', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a0a69e-be86-7492-8cf9-a37234d52a0b', '01a0a69e-bfa9-7e62-8c81-d5f0ef4ac744', 0, 7, 4, 0, 'customer_id', true, NULL, 'uuid', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a0a69e-be86-7492-8cf9-a37234d52a0b', '01a0a69e-bfa9-7e62-8c81-d5f0ef4ac744', 0, 8, 4, 1, 'display_name', false, NULL, 'string', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a0a69e-be86-7492-8cf9-a37234d52a0b', '01a0a69e-bfa9-7e62-8c81-d5f0ef4ac744', 0, 5, NULL, 4, 'items', false, NULL, 'list', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a0a69e-be86-7492-8cf9-a37234d52a0b', '01a0a69e-bfa9-7e62-8c81-d5f0ef4ac744', 0, 9, 5, 0, 'element', true, NULL, 'string', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a0a69e-be86-7492-8cf9-a37234d52a0b', '01a0a69e-bfa9-7e62-8c81-d5f0ef4ac744', 0, 6, NULL, 5, 'scores', false, NULL, 'map', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a0a69e-be86-7492-8cf9-a37234d52a0b', '01a0a69e-bfa9-7e62-8c81-d5f0ef4ac744', 0, 10, 6, 0, 'key', true, NULL, 'string', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a0a69e-be86-7492-8cf9-a37234d52a0b', '01a0a69e-bfa9-7e62-8c81-d5f0ef4ac744', 0, 11, 6, 1, 'value', false, NULL, 'double', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a0a69e-be86-7492-8cf9-a37234d52a0b', '01a0a69e-c056-79f0-b2e1-8e539d9cd821', 0, 1, NULL, 0, 'event_id', true, NULL, 'string', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a0a69e-be86-7492-8cf9-a37234d52a0b', '01a0a69e-c056-79f0-b2e1-8e539d9cd821', 0, 2, NULL, 1, 'payload', false, NULL, 'binary', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a0a69e-be86-7492-8cf9-a37234d52a0b', '01a0a69e-c070-7a73-80b9-eaa65e338ce2', 0, 1, NULL, 0, 'order_id', true, NULL, 'long', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a0a69e-be86-7492-8cf9-a37234d52a0b', '01a0a69e-c070-7a73-80b9-eaa65e338ce2', 0, 2, NULL, 1, 'tag', false, NULL, 'string', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a0a69e-be86-7492-8cf9-a37234d52a0b', '01a0a69e-c08f-79d0-bb54-9e0accd931a1', 0, 1, NULL, 0, 'id', true, NULL, 'long', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a0a69e-be86-7492-8cf9-a37234d52a0b', '01a0a69e-c0ac-7531-9ae1-303a798b1eb4', 0, 1, NULL, 0, 'at', true, NULL, 'timestamptz', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a0a69e-bebe-7a42-98a3-623f1d567bd4', '01a0a69e-c124-75c2-b8cb-272342450ebd', 0, 1, NULL, 0, 'x', false, NULL, 'int', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a0a69e-be86-7492-8cf9-a37234d52a0b', '01a0a69e-c150-7c70-aa5e-0c24b81190e7', 0, 1, NULL, 0, 'order_id', true, NULL, 'long', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a0a69e-be86-7492-8cf9-a37234d52a0b', '01a0a69e-c150-7c70-aa5e-0c24b81190e7', 0, 2, NULL, 1, 'amount', false, NULL, 'decimal', '{"scale": 2, "precision": 12}', NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a0a69e-be86-7492-8cf9-a37234d52a0b', '01a0a69e-c150-7c70-aa5e-0c24b81190e7', 1, 1, NULL, 0, 'order_id', true, NULL, 'long', NULL, NULL, NULL, false);


ALTER TABLE "public"."schema_field" ENABLE TRIGGER ALL;

--
-- Data for Name: secret; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."secret" DISABLE TRIGGER ALL;

INSERT INTO "public"."secret" ("secret_id", "secret", "created_at", "updated_at") VALUES ('ac7928f6-b13e-11f1-abae-83761d378c5c', '\xc30d040903026b011d341939f09979d2bc017d13bf41fa6ffa9c490f3691c1fde5af5b2ac0966da38dda24348d2ccee034477ce09f04ac157026cdecad4f83babfb359c5e3c6f8f9088692acc95c42408761ca617960e4c9458357250742c5f70063769355afd29084a0c87617b8dbff05f9f255a899a9df745d87c779035d253ef44974e16ad2b3c830bc51396199d70a5d2a7d9dde6507667ec814fbefadf65c129b91dca2c0f9888f03604661d4b9cfc45dc7946b8b2838840f434d33d0a2b8cfd42ec395082fc8ea680d30', '2026-09-15 19:50:16.48974+00', NULL);
INSERT INTO "public"."secret" ("secret_id", "secret", "created_at", "updated_at") VALUES ('ac7f604a-b13e-11f1-a9a7-a3ffefa2c7b9', '\xc30d04090302393b5120219d805f75d2bc019ef922523d232cda7874fe5134dd328886bea8b987fb81f35dc48db473ddb9f8dfaed1ad674a048c2382969c6e5333d7ccb622dc6cae38a25be9f63671bbfd7b091965b4b68caa9159e25b3468cae0850db4fdd6f176770409d1eb69e1e84d611c486c5177f75ea1f0a4142ae2028a384a03d4b81506cee310c671f9e974177e5e5c5386fd030485516e8abb9440fac27cbac25bec7ff9fe1a42ccda30fdd4dcd9b66eea6e0e58b84a8ce3be3c42d426556ba67acdb8a00054bc7d', '2026-09-15 19:50:16.530379+00', NULL);
INSERT INTO "public"."secret" ("secret_id", "secret", "created_at", "updated_at") VALUES ('ac875e8a-b13e-11f1-abae-c352ffadeb01', '\xc30d04090302b8736abb6889167b67d2bc01fb87fcddf967cab60acb40f8a6ddf58d841efbd73d496c0ef3a9d11ff8083fc73ce56e0b3f0bcab405a32138deb5cf42ac29509e9d42d535d19c551e35d82c1618126448955cbf766daf69431585c2136f9610086fecbe03d04ee6e25ffce8cd255b115a1c756882b4f5f95860e4a54dae70de31d844fdf910b8eea8e1518ea82a67cc5413da6e37cc45ca7dcbe4c2313253d9891cad846ad32345268a513f8e9e87453dbbaf063f2618bdb7b94b690552c47ea106c7fcdf789d83', '2026-09-15 19:50:16.583577+00', NULL);


ALTER TABLE "public"."secret" ENABLE TRIGGER ALL;

--
-- Data for Name: server; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."server" DISABLE TRIGGER ALL;

INSERT INTO "public"."server" ("single_row", "server_id", "terms_accepted", "open_for_bootstrap", "created_at", "updated_at") VALUES (true, '01a0a69e-b558-7bd2-a0fd-3411a0346c57', true, false, '2026-09-15 19:50:13.631412+00', '2026-09-15 19:50:16.310832+00');


ALTER TABLE "public"."server" ENABLE TRIGGER ALL;

--
-- Data for Name: table_current_schema; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."table_current_schema" DISABLE TRIGGER ALL;

INSERT INTO "public"."table_current_schema" ("table_id", "schema_id", "created_at", "updated_at", "warehouse_id") VALUES ('01a0a69e-bfa9-7e62-8c81-d5f0ef4ac744', 0, '2026-09-15 19:50:16.746019+00', NULL, '01a0a69e-be86-7492-8cf9-a37234d52a0b');
INSERT INTO "public"."table_current_schema" ("table_id", "schema_id", "created_at", "updated_at", "warehouse_id") VALUES ('01a0a69e-c056-79f0-b2e1-8e539d9cd821', 0, '2026-09-15 19:50:16.918761+00', NULL, '01a0a69e-be86-7492-8cf9-a37234d52a0b');
INSERT INTO "public"."table_current_schema" ("table_id", "schema_id", "created_at", "updated_at", "warehouse_id") VALUES ('01a0a69e-c070-7a73-80b9-eaa65e338ce2', 0, '2026-09-15 19:50:16.944776+00', NULL, '01a0a69e-be86-7492-8cf9-a37234d52a0b');
INSERT INTO "public"."table_current_schema" ("table_id", "schema_id", "created_at", "updated_at", "warehouse_id") VALUES ('01a0a69e-c08f-79d0-bb54-9e0accd931a1', 0, '2026-09-15 19:50:16.975803+00', NULL, '01a0a69e-be86-7492-8cf9-a37234d52a0b');
INSERT INTO "public"."table_current_schema" ("table_id", "schema_id", "created_at", "updated_at", "warehouse_id") VALUES ('01a0a69e-c0ac-7531-9ae1-303a798b1eb4', 0, '2026-09-15 19:50:17.00481+00', NULL, '01a0a69e-be86-7492-8cf9-a37234d52a0b');
INSERT INTO "public"."table_current_schema" ("table_id", "schema_id", "created_at", "updated_at", "warehouse_id") VALUES ('01a0a69e-c124-75c2-b8cb-272342450ebd', 0, '2026-09-15 19:50:17.124334+00', NULL, '01a0a69e-bebe-7a42-98a3-623f1d567bd4');


ALTER TABLE "public"."table_current_schema" ENABLE TRIGGER ALL;

--
-- Data for Name: table_partition_spec; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."table_partition_spec" DISABLE TRIGGER ALL;

INSERT INTO "public"."table_partition_spec" ("partition_spec_id", "table_id", "partition_spec", "created_at", "updated_at", "warehouse_id") VALUES (0, '01a0a69e-bfa9-7e62-8c81-d5f0ef4ac744', '{"fields": [{"name": "placed_at_day", "field-id": 1000, "source-id": 2, "transform": "day"}], "spec-id": 0}', '2026-09-15 19:50:16.746019+00', NULL, '01a0a69e-be86-7492-8cf9-a37234d52a0b');
INSERT INTO "public"."table_partition_spec" ("partition_spec_id", "table_id", "partition_spec", "created_at", "updated_at", "warehouse_id") VALUES (0, '01a0a69e-c056-79f0-b2e1-8e539d9cd821', '{"fields": [], "spec-id": 0}', '2026-09-15 19:50:16.918761+00', NULL, '01a0a69e-be86-7492-8cf9-a37234d52a0b');
INSERT INTO "public"."table_partition_spec" ("partition_spec_id", "table_id", "partition_spec", "created_at", "updated_at", "warehouse_id") VALUES (0, '01a0a69e-c070-7a73-80b9-eaa65e338ce2', '{"fields": [], "spec-id": 0}', '2026-09-15 19:50:16.944776+00', NULL, '01a0a69e-be86-7492-8cf9-a37234d52a0b');
INSERT INTO "public"."table_partition_spec" ("partition_spec_id", "table_id", "partition_spec", "created_at", "updated_at", "warehouse_id") VALUES (0, '01a0a69e-c08f-79d0-bb54-9e0accd931a1', '{"fields": [], "spec-id": 0}', '2026-09-15 19:50:16.975803+00', NULL, '01a0a69e-be86-7492-8cf9-a37234d52a0b');
INSERT INTO "public"."table_partition_spec" ("partition_spec_id", "table_id", "partition_spec", "created_at", "updated_at", "warehouse_id") VALUES (0, '01a0a69e-c0ac-7531-9ae1-303a798b1eb4', '{"fields": [], "spec-id": 0}', '2026-09-15 19:50:17.00481+00', NULL, '01a0a69e-be86-7492-8cf9-a37234d52a0b');
INSERT INTO "public"."table_partition_spec" ("partition_spec_id", "table_id", "partition_spec", "created_at", "updated_at", "warehouse_id") VALUES (0, '01a0a69e-c124-75c2-b8cb-272342450ebd', '{"fields": [], "spec-id": 0}', '2026-09-15 19:50:17.124334+00', NULL, '01a0a69e-bebe-7a42-98a3-623f1d567bd4');


ALTER TABLE "public"."table_partition_spec" ENABLE TRIGGER ALL;

--
-- Data for Name: table_default_partition_spec; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."table_default_partition_spec" DISABLE TRIGGER ALL;

INSERT INTO "public"."table_default_partition_spec" ("table_id", "partition_spec_id", "created_at", "updated_at", "warehouse_id") VALUES ('01a0a69e-bfa9-7e62-8c81-d5f0ef4ac744', 0, '2026-09-15 19:50:16.746019+00', NULL, '01a0a69e-be86-7492-8cf9-a37234d52a0b');
INSERT INTO "public"."table_default_partition_spec" ("table_id", "partition_spec_id", "created_at", "updated_at", "warehouse_id") VALUES ('01a0a69e-c056-79f0-b2e1-8e539d9cd821', 0, '2026-09-15 19:50:16.918761+00', NULL, '01a0a69e-be86-7492-8cf9-a37234d52a0b');
INSERT INTO "public"."table_default_partition_spec" ("table_id", "partition_spec_id", "created_at", "updated_at", "warehouse_id") VALUES ('01a0a69e-c070-7a73-80b9-eaa65e338ce2', 0, '2026-09-15 19:50:16.944776+00', NULL, '01a0a69e-be86-7492-8cf9-a37234d52a0b');
INSERT INTO "public"."table_default_partition_spec" ("table_id", "partition_spec_id", "created_at", "updated_at", "warehouse_id") VALUES ('01a0a69e-c08f-79d0-bb54-9e0accd931a1', 0, '2026-09-15 19:50:16.975803+00', NULL, '01a0a69e-be86-7492-8cf9-a37234d52a0b');
INSERT INTO "public"."table_default_partition_spec" ("table_id", "partition_spec_id", "created_at", "updated_at", "warehouse_id") VALUES ('01a0a69e-c0ac-7531-9ae1-303a798b1eb4', 0, '2026-09-15 19:50:17.00481+00', NULL, '01a0a69e-be86-7492-8cf9-a37234d52a0b');
INSERT INTO "public"."table_default_partition_spec" ("table_id", "partition_spec_id", "created_at", "updated_at", "warehouse_id") VALUES ('01a0a69e-c124-75c2-b8cb-272342450ebd', 0, '2026-09-15 19:50:17.124334+00', NULL, '01a0a69e-bebe-7a42-98a3-623f1d567bd4');


ALTER TABLE "public"."table_default_partition_spec" ENABLE TRIGGER ALL;

--
-- Data for Name: table_sort_order; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."table_sort_order" DISABLE TRIGGER ALL;

INSERT INTO "public"."table_sort_order" ("sort_order_id", "table_id", "sort_order", "created_at", "updated_at", "warehouse_id") VALUES (1, '01a0a69e-bfa9-7e62-8c81-d5f0ef4ac744', '{"fields": [{"direction": "asc", "source-id": 1, "transform": "identity", "null-order": "nulls-first"}], "order-id": 1}', '2026-09-15 19:50:16.746019+00', NULL, '01a0a69e-be86-7492-8cf9-a37234d52a0b');
INSERT INTO "public"."table_sort_order" ("sort_order_id", "table_id", "sort_order", "created_at", "updated_at", "warehouse_id") VALUES (0, '01a0a69e-c056-79f0-b2e1-8e539d9cd821', '{"fields": [], "order-id": 0}', '2026-09-15 19:50:16.918761+00', NULL, '01a0a69e-be86-7492-8cf9-a37234d52a0b');
INSERT INTO "public"."table_sort_order" ("sort_order_id", "table_id", "sort_order", "created_at", "updated_at", "warehouse_id") VALUES (0, '01a0a69e-c070-7a73-80b9-eaa65e338ce2', '{"fields": [], "order-id": 0}', '2026-09-15 19:50:16.944776+00', NULL, '01a0a69e-be86-7492-8cf9-a37234d52a0b');
INSERT INTO "public"."table_sort_order" ("sort_order_id", "table_id", "sort_order", "created_at", "updated_at", "warehouse_id") VALUES (0, '01a0a69e-c08f-79d0-bb54-9e0accd931a1', '{"fields": [], "order-id": 0}', '2026-09-15 19:50:16.975803+00', NULL, '01a0a69e-be86-7492-8cf9-a37234d52a0b');
INSERT INTO "public"."table_sort_order" ("sort_order_id", "table_id", "sort_order", "created_at", "updated_at", "warehouse_id") VALUES (0, '01a0a69e-c0ac-7531-9ae1-303a798b1eb4', '{"fields": [], "order-id": 0}', '2026-09-15 19:50:17.00481+00', NULL, '01a0a69e-be86-7492-8cf9-a37234d52a0b');
INSERT INTO "public"."table_sort_order" ("sort_order_id", "table_id", "sort_order", "created_at", "updated_at", "warehouse_id") VALUES (0, '01a0a69e-c124-75c2-b8cb-272342450ebd', '{"fields": [], "order-id": 0}', '2026-09-15 19:50:17.124334+00', NULL, '01a0a69e-bebe-7a42-98a3-623f1d567bd4');


ALTER TABLE "public"."table_sort_order" ENABLE TRIGGER ALL;

--
-- Data for Name: table_default_sort_order; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."table_default_sort_order" DISABLE TRIGGER ALL;

INSERT INTO "public"."table_default_sort_order" ("table_id", "sort_order_id", "created_at", "updated_at", "warehouse_id") VALUES ('01a0a69e-bfa9-7e62-8c81-d5f0ef4ac744', 1, '2026-09-15 19:50:16.746019+00', NULL, '01a0a69e-be86-7492-8cf9-a37234d52a0b');
INSERT INTO "public"."table_default_sort_order" ("table_id", "sort_order_id", "created_at", "updated_at", "warehouse_id") VALUES ('01a0a69e-c056-79f0-b2e1-8e539d9cd821', 0, '2026-09-15 19:50:16.918761+00', NULL, '01a0a69e-be86-7492-8cf9-a37234d52a0b');
INSERT INTO "public"."table_default_sort_order" ("table_id", "sort_order_id", "created_at", "updated_at", "warehouse_id") VALUES ('01a0a69e-c070-7a73-80b9-eaa65e338ce2', 0, '2026-09-15 19:50:16.944776+00', NULL, '01a0a69e-be86-7492-8cf9-a37234d52a0b');
INSERT INTO "public"."table_default_sort_order" ("table_id", "sort_order_id", "created_at", "updated_at", "warehouse_id") VALUES ('01a0a69e-c08f-79d0-bb54-9e0accd931a1', 0, '2026-09-15 19:50:16.975803+00', NULL, '01a0a69e-be86-7492-8cf9-a37234d52a0b');
INSERT INTO "public"."table_default_sort_order" ("table_id", "sort_order_id", "created_at", "updated_at", "warehouse_id") VALUES ('01a0a69e-c0ac-7531-9ae1-303a798b1eb4', 0, '2026-09-15 19:50:17.00481+00', NULL, '01a0a69e-be86-7492-8cf9-a37234d52a0b');
INSERT INTO "public"."table_default_sort_order" ("table_id", "sort_order_id", "created_at", "updated_at", "warehouse_id") VALUES ('01a0a69e-c124-75c2-b8cb-272342450ebd', 0, '2026-09-15 19:50:17.124334+00', NULL, '01a0a69e-bebe-7a42-98a3-623f1d567bd4');


ALTER TABLE "public"."table_default_sort_order" ENABLE TRIGGER ALL;

--
-- Data for Name: table_encryption_keys; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."table_encryption_keys" DISABLE TRIGGER ALL;



ALTER TABLE "public"."table_encryption_keys" ENABLE TRIGGER ALL;

--
-- Data for Name: table_metadata_log; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."table_metadata_log" DISABLE TRIGGER ALL;

INSERT INTO "public"."table_metadata_log" ("sequence_number", "table_id", "timestamp", "metadata_file", "created_at", "updated_at", "warehouse_id") VALUES (1, '01a0a69e-bfa9-7e62-8c81-d5f0ef4ac744', 1789501816745, 's3://warehouse/hard/01a0a69e-bfa9-7e62-8c81-d5f0ef4ac744/metadata/00000-01a0a69e-bfa9-7e62-8c81-d60f3ef8a945.gz.metadata.json', '2026-09-15 19:50:16.847619+00', NULL, '01a0a69e-be86-7492-8cf9-a37234d52a0b');
INSERT INTO "public"."table_metadata_log" ("sequence_number", "table_id", "timestamp", "metadata_file", "created_at", "updated_at", "warehouse_id") VALUES (2, '01a0a69e-bfa9-7e62-8c81-d5f0ef4ac744', 1789501816000, 's3://warehouse/hard/01a0a69e-bfa9-7e62-8c81-d5f0ef4ac744/metadata/00001-01a0a69e-c00b-7401-8dfa-5cfc17d9f4c5.gz.metadata.json', '2026-09-15 19:50:16.898188+00', NULL, '01a0a69e-be86-7492-8cf9-a37234d52a0b');


ALTER TABLE "public"."table_metadata_log" ENABLE TRIGGER ALL;

--
-- Data for Name: table_properties; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."table_properties" DISABLE TRIGGER ALL;

INSERT INTO "public"."table_properties" ("table_id", "key", "value", "created_at", "updated_at", "warehouse_id") VALUES ('01a0a69e-bfa9-7e62-8c81-d5f0ef4ac744', 'write.format.default', 'parquet', '2026-09-15 19:50:16.746019+00', NULL, '01a0a69e-be86-7492-8cf9-a37234d52a0b');
INSERT INTO "public"."table_properties" ("table_id", "key", "value", "created_at", "updated_at", "warehouse_id") VALUES ('01a0a69e-bfa9-7e62-8c81-d5f0ef4ac744', 'owner', 'analytics', '2026-09-15 19:50:16.746019+00', NULL, '01a0a69e-be86-7492-8cf9-a37234d52a0b');


ALTER TABLE "public"."table_properties" ENABLE TRIGGER ALL;

--
-- Data for Name: table_refs; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."table_refs" DISABLE TRIGGER ALL;

INSERT INTO "public"."table_refs" ("table_id", "table_ref_name", "snapshot_id", "retention", "created_at", "updated_at", "warehouse_id") VALUES ('01a0a69e-bfa9-7e62-8c81-d5f0ef4ac744', 'main', 3002, '{"type": "branch", "max-snapshot-age-ms": 604800000, "min-snapshots-to-keep": 2}', '2026-09-15 19:50:16.847619+00', '2026-09-15 19:50:16.898188+00', '01a0a69e-be86-7492-8cf9-a37234d52a0b');
INSERT INTO "public"."table_refs" ("table_id", "table_ref_name", "snapshot_id", "retention", "created_at", "updated_at", "warehouse_id") VALUES ('01a0a69e-bfa9-7e62-8c81-d5f0ef4ac744', 'release', 3001, '{"type": "tag", "max-ref-age-ms": 2592000000}', '2026-09-15 19:50:16.898188+00', NULL, '01a0a69e-be86-7492-8cf9-a37234d52a0b');


ALTER TABLE "public"."table_refs" ENABLE TRIGGER ALL;

--
-- Data for Name: table_snapshot_log; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."table_snapshot_log" DISABLE TRIGGER ALL;

INSERT INTO "public"."table_snapshot_log" ("sequence_number", "table_id", "snapshot_id", "timestamp", "created_at", "updated_at", "warehouse_id") VALUES (1, '01a0a69e-bfa9-7e62-8c81-d5f0ef4ac744', 3001, 1789501816000, '2026-09-15 19:50:16.847619+00', NULL, '01a0a69e-be86-7492-8cf9-a37234d52a0b');
INSERT INTO "public"."table_snapshot_log" ("sequence_number", "table_id", "snapshot_id", "timestamp", "created_at", "updated_at", "warehouse_id") VALUES (2, '01a0a69e-bfa9-7e62-8c81-d5f0ef4ac744', 3002, 1789501817000, '2026-09-15 19:50:16.898188+00', NULL, '01a0a69e-be86-7492-8cf9-a37234d52a0b');


ALTER TABLE "public"."table_snapshot_log" ENABLE TRIGGER ALL;

--
-- Data for Name: table_statistics; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."table_statistics" DISABLE TRIGGER ALL;

INSERT INTO "public"."table_statistics" ("snapshot_id", "table_id", "statistics_path", "file_size_in_bytes", "file_footer_size_in_bytes", "key_metadata", "blob_metadata", "created_at", "updated_at", "warehouse_id") VALUES (3002, '01a0a69e-bfa9-7e62-8c81-d5f0ef4ac744', 's3://warehouse/hard/sales/eu/orders/metadata/stats-3002.puffin', 1024, 64, NULL, '[{"type": "apache-datasketches-theta-v1", "fields": [1], "snapshot-id": 3002, "sequence-number": 2}]', '2026-09-15 19:50:16.898188+00', NULL, '01a0a69e-be86-7492-8cf9-a37234d52a0b');


ALTER TABLE "public"."table_statistics" ENABLE TRIGGER ALL;

--
-- Data for Name: tag; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."tag" DISABLE TRIGGER ALL;

INSERT INTO "public"."tag" ("tag_id", "tag_definition_id", "warehouse_id", "namespace_id", "tabular_id", "field_id", "value", "source", "created_at", "updated_at") VALUES ('01a0a69e-c1f5-77d1-8a1f-36aa956f0ef3', '01a0a69e-c1ae-7692-8056-d2d173bf1a05', '01a0a69e-be86-7492-8cf9-a37234d52a0b', NULL, NULL, NULL, 'platform', 'manual', '2026-09-15 19:50:17.3338+00', NULL);
INSERT INTO "public"."tag" ("tag_id", "tag_definition_id", "warehouse_id", "namespace_id", "tabular_id", "field_id", "value", "source", "created_at", "updated_at") VALUES ('01a0a69e-c205-7b10-aedf-e50d43c77a42', '01a0a69e-c1ba-7bd1-9437-544bd593a2bf', '01a0a69e-be86-7492-8cf9-a37234d52a0b', '01a0a69e-bf65-76d1-8716-38502f573861', NULL, NULL, 'gold', 'manual', '2026-09-15 19:50:17.349448+00', NULL);
INSERT INTO "public"."tag" ("tag_id", "tag_definition_id", "warehouse_id", "namespace_id", "tabular_id", "field_id", "value", "source", "created_at", "updated_at") VALUES ('01a0a69e-c215-7653-b5dd-c6fda383d238', '01a0a69e-c1a1-7bb0-afb1-a902b87a4a7a', '01a0a69e-be86-7492-8cf9-a37234d52a0b', NULL, '01a0a69e-bfa9-7e62-8c81-d5f0ef4ac744', NULL, NULL, 'manual', '2026-09-15 19:50:17.364966+00', NULL);
INSERT INTO "public"."tag" ("tag_id", "tag_definition_id", "warehouse_id", "namespace_id", "tabular_id", "field_id", "value", "source", "created_at", "updated_at") VALUES ('01a0a69e-c225-7141-8a16-bc6c023753c2', '01a0a69e-c1ba-7bd1-9437-544bd593a2bf', '01a0a69e-be86-7492-8cf9-a37234d52a0b', NULL, '01a0a69e-c150-7c70-aa5e-0c24b81190e7', NULL, 'silver', 'manual', '2026-09-15 19:50:17.381085+00', NULL);
INSERT INTO "public"."tag" ("tag_id", "tag_definition_id", "warehouse_id", "namespace_id", "tabular_id", "field_id", "value", "source", "created_at", "updated_at") VALUES ('01a0a69e-c234-7710-adcc-d8200e2ed7a0', '01a0a69e-c1ae-7692-8056-d2d173bf1a05', '01a0a69e-be86-7492-8cf9-a37234d52a0b', NULL, '01a0a69e-c192-77e1-abc4-3cc7a3f8c770', NULL, 'platform', 'manual', '2026-09-15 19:50:17.396398+00', NULL);
INSERT INTO "public"."tag" ("tag_id", "tag_definition_id", "warehouse_id", "namespace_id", "tabular_id", "field_id", "value", "source", "created_at", "updated_at") VALUES ('01a0a69e-c24e-7450-9afd-04ed4d03d268', '01a0a69e-c1a1-7bb0-afb1-a902b87a4a7a', '01a0a69e-be86-7492-8cf9-a37234d52a0b', NULL, '01a0a69e-bfa9-7e62-8c81-d5f0ef4ac744', 8, NULL, 'manual', '2026-09-15 19:50:17.422652+00', NULL);


ALTER TABLE "public"."tag" ENABLE TRIGGER ALL;

--
-- Data for Name: tag_allowed_value; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."tag_allowed_value" DISABLE TRIGGER ALL;

INSERT INTO "public"."tag_allowed_value" ("tag_definition_id", "value", "created_at") VALUES ('01a0a69e-c1ba-7bd1-9437-544bd593a2bf', 'bronze', '2026-09-15 19:50:17.274438+00');
INSERT INTO "public"."tag_allowed_value" ("tag_definition_id", "value", "created_at") VALUES ('01a0a69e-c1ba-7bd1-9437-544bd593a2bf', 'silver', '2026-09-15 19:50:17.274438+00');
INSERT INTO "public"."tag_allowed_value" ("tag_definition_id", "value", "created_at") VALUES ('01a0a69e-c1ba-7bd1-9437-544bd593a2bf', 'gold', '2026-09-15 19:50:17.274438+00');


ALTER TABLE "public"."tag_allowed_value" ENABLE TRIGGER ALL;

--
-- Data for Name: task; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."task" DISABLE TRIGGER ALL;

INSERT INTO "public"."task" ("task_id", "warehouse_id", "queue_name", "status", "picked_up_at", "scheduled_for", "attempt", "parent_task_id", "created_at", "updated_at", "task_data", "entity_id", "last_heartbeat_at", "progress", "execution_details", "entity_name", "entity_type", "project_id") VALUES ('01a0a69e-bdfc-7571-8bd2-f5c1d085b3ee', NULL, 'task_log_cleanup', 'scheduled', NULL, '2026-09-15 19:50:16.315139+00', 0, NULL, '2026-09-15 19:50:16.315139+00', NULL, '{}', NULL, NULL, 0, NULL, NULL, 'project', '00000000-0000-0000-0000-000000000000');
INSERT INTO "public"."task" ("task_id", "warehouse_id", "queue_name", "status", "picked_up_at", "scheduled_for", "attempt", "parent_task_id", "created_at", "updated_at", "task_data", "entity_id", "last_heartbeat_at", "progress", "execution_details", "entity_name", "entity_type", "project_id") VALUES ('01a0a69e-be78-7f10-aaf9-5a90733a836f', NULL, 'task_log_cleanup', 'scheduled', NULL, '2026-09-15 19:50:16.439649+00', 0, NULL, '2026-09-15 19:50:16.439649+00', NULL, '{}', NULL, NULL, 0, NULL, NULL, 'project', '01a0a69e-be77-7c31-90d6-db48f29a588b');
INSERT INTO "public"."task" ("task_id", "warehouse_id", "queue_name", "status", "picked_up_at", "scheduled_for", "attempt", "parent_task_id", "created_at", "updated_at", "task_data", "entity_id", "last_heartbeat_at", "progress", "execution_details", "entity_name", "entity_type", "project_id") VALUES ('01a0a69e-c115-7141-8348-2d0d3d52e30b', '01a0a69e-be86-7492-8cf9-a37234d52a0b', 'tabular_purge', 'scheduled', NULL, '2026-09-15 19:50:17.104849+00', 0, NULL, '2026-09-15 19:50:17.104849+00', NULL, '{"tabular_location": "s3://warehouse/hard/01a0a69e-c0f4-7d42-beca-1afe0a48b5db"}', '01a0a69e-c0f4-7d42-beca-1afe0a48b5db', NULL, 0, NULL, '{logs,scratch}', 'table', '00000000-0000-0000-0000-000000000000');
INSERT INTO "public"."task" ("task_id", "warehouse_id", "queue_name", "status", "picked_up_at", "scheduled_for", "attempt", "parent_task_id", "created_at", "updated_at", "task_data", "entity_id", "last_heartbeat_at", "progress", "execution_details", "entity_name", "entity_type", "project_id") VALUES ('01a0a69e-c140-7ee2-b694-992e71695e0c', '01a0a69e-bebe-7a42-98a3-623f1d567bd4', 'soft_deletion', 'scheduled', NULL, '2026-09-16 19:50:17.152828+00', 0, NULL, '2026-09-15 19:50:17.152743+00', NULL, '{"deletion_kind": "purge"}', '01a0a69e-c124-75c2-b8cb-272342450ebd', NULL, 0, NULL, '{staging,retired}', 'table', '00000000-0000-0000-0000-000000000000');


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

INSERT INTO "public"."view_properties" ("view_id", "key", "value", "created_at", "updated_at", "warehouse_id") VALUES ('01a0a69e-c150-7c70-aa5e-0c24b81190e7', 'owner', 'analytics', '2026-09-15 19:50:17.20391+00', NULL, '01a0a69e-be86-7492-8cf9-a37234d52a0b');


ALTER TABLE "public"."view_properties" ENABLE TRIGGER ALL;

--
-- Data for Name: view_representation; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."view_representation" DISABLE TRIGGER ALL;

INSERT INTO "public"."view_representation" ("view_representation_id", "view_version_id", "view_id", "typ", "sql", "dialect", "created_at", "updated_at", "warehouse_id") VALUES ('ace75cf4-b13e-11f1-a594-c76eaa307156', 2, '01a0a69e-c150-7c70-aa5e-0c24b81190e7', 'sql', 'SELECT order_id FROM orders', 'spark', '2026-09-15 19:50:17.20391+00', NULL, '01a0a69e-be86-7492-8cf9-a37234d52a0b');
INSERT INTO "public"."view_representation" ("view_representation_id", "view_version_id", "view_id", "typ", "sql", "dialect", "created_at", "updated_at", "warehouse_id") VALUES ('ace75e66-b13e-11f1-a594-5f2a8cf65a25', 2, '01a0a69e-c150-7c70-aa5e-0c24b81190e7', 'sql', 'SELECT order_id FROM orders', 'trino', '2026-09-15 19:50:17.20391+00', NULL, '01a0a69e-be86-7492-8cf9-a37234d52a0b');
INSERT INTO "public"."view_representation" ("view_representation_id", "view_version_id", "view_id", "typ", "sql", "dialect", "created_at", "updated_at", "warehouse_id") VALUES ('ace75ee8-b13e-11f1-a594-479fb2d1c019', 1, '01a0a69e-c150-7c70-aa5e-0c24b81190e7', 'sql', 'SELECT order_id, amount FROM orders', 'spark', '2026-09-15 19:50:17.20391+00', NULL, '01a0a69e-be86-7492-8cf9-a37234d52a0b');
INSERT INTO "public"."view_representation" ("view_representation_id", "view_version_id", "view_id", "typ", "sql", "dialect", "created_at", "updated_at", "warehouse_id") VALUES ('ace75f6a-b13e-11f1-a594-cfdbfc6a5a3b', 1, '01a0a69e-c150-7c70-aa5e-0c24b81190e7', 'sql', 'SELECT order_id, amount FROM orders', 'trino', '2026-09-15 19:50:17.20391+00', NULL, '01a0a69e-be86-7492-8cf9-a37234d52a0b');


ALTER TABLE "public"."view_representation" ENABLE TRIGGER ALL;

--
-- Data for Name: view_version_log; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."view_version_log" DISABLE TRIGGER ALL;

INSERT INTO "public"."view_version_log" ("view_id", "version_id", "timestamp", "created_at", "updated_at", "warehouse_id") VALUES ('01a0a69e-c150-7c70-aa5e-0c24b81190e7', 1, '2026-09-15 19:50:17.168+00', '2026-09-15 19:50:17.20391+00', NULL, '01a0a69e-be86-7492-8cf9-a37234d52a0b');
INSERT INTO "public"."view_version_log" ("view_id", "version_id", "timestamp", "created_at", "updated_at", "warehouse_id") VALUES ('01a0a69e-c150-7c70-aa5e-0c24b81190e7', 2, '2026-09-15 19:50:16+00', '2026-09-15 19:50:17.20391+00', NULL, '01a0a69e-be86-7492-8cf9-a37234d52a0b');


ALTER TABLE "public"."view_version_log" ENABLE TRIGGER ALL;

--
-- Data for Name: warehouse_statistics; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."warehouse_statistics" DISABLE TRIGGER ALL;

INSERT INTO "public"."warehouse_statistics" ("warehouse_id", "number_of_views", "number_of_tables", "timestamp", "created_at", "updated_at") VALUES ('01a0a69e-bef7-7183-bdf3-4c2ea03bf8bf', 0, 0, '2026-09-15 19:00:01+00', '2026-09-15 19:50:16.583432+00', NULL);
INSERT INTO "public"."warehouse_statistics" ("warehouse_id", "number_of_views", "number_of_tables", "timestamp", "created_at", "updated_at") VALUES ('01a0a69e-bebe-7a42-98a3-623f1d567bd4', 0, 1, '2026-09-15 19:00:01+00', '2026-09-15 19:50:16.529759+00', '2026-09-15 19:50:17.124334+00');
INSERT INTO "public"."warehouse_statistics" ("warehouse_id", "number_of_views", "number_of_tables", "timestamp", "created_at", "updated_at") VALUES ('01a0a69e-be86-7492-8cf9-a37234d52a0b', 1, 5, '2026-09-15 19:00:01+00', '2026-09-15 19:50:16.489216+00', '2026-09-15 19:50:17.168473+00');


ALTER TABLE "public"."warehouse_statistics" ENABLE TRIGGER ALL;

--
-- Data for Name: warehouse_statistics_history; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."warehouse_statistics_history" DISABLE TRIGGER ALL;



ALTER TABLE "public"."warehouse_statistics_history" ENABLE TRIGGER ALL;

--
-- Name: table_metadata_log_sequence_number_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."table_metadata_log_sequence_number_seq"', 2, true);


--
-- Name: table_snapshot_log_sequence_number_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."table_snapshot_log_sequence_number_seq"', 2, true);


--
-- PostgreSQL database dump complete
--

\unrestrict NhkhpAk9ontoQ3uuNLtDhgBaP1uvi8I3nYDdr8UDqsoF4u7AQjoe2RJZBRnf8Uw

