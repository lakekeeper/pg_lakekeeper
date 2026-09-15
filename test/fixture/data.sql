--
-- PostgreSQL database dump
--

\restrict fhfWP5UYqsxPtZ7XRnzqWMSdOe2PZimh9hz3JSr4zc6RrCrOXheJ11rVVk7245T

-- Dumped from database version 18.4 (Debian 18.4-1.pgdg13+1)
-- Dumped by pg_dump version 18.4 (Debian 18.4-1.pgdg13+1)

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

--
-- Data for Name: _sqlx_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

SET SESSION AUTHORIZATION DEFAULT;

ALTER TABLE "public"."_sqlx_migrations" DISABLE TRIGGER ALL;

INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (1, 'setup', '2026-09-15 19:24:31.827449+00', true, '\x44748caaec8b09f6fa20eb95f83d8aea7f9d51afdc52bfcafa8c58d44bec7fb1a6fc711b6d7cc0548a9367dd2ac19a81', 14365975);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (2, 'warehouse', '2026-09-15 19:24:31.827449+00', true, '\x58f595584b3b88f1865995e4af0ef84d8908c80d2f77e8a19e02f130d4332292643a70664b9d297d16a7e8505fb3cfa3', 4219367);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (3, 'secret', '2026-09-15 19:24:31.827449+00', true, '\x225a1b4719428159722d577e561d28b65e05f0b25b194ffbf6b60c8a249622538387049a083769171281f6d0ea7b3dcb', 1530369);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (4, 'namespace', '2026-09-15 19:24:31.827449+00', true, '\xcecdbb17a4110070c57062bd62c8dd239bf71fa5610e2f9b471c794d580d7381bf6b7b2ca68e48e139828176efb690c9', 2576866);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (5, 'table', '2026-09-15 19:24:31.827449+00', true, '\x9aef13da32da13ffe98a021198fd0201d5ea7a25f82db1f9ddab765e307988de099005e4f6f26f0bf87ebd35e8b8ca89', 3857544);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20240620151429, 'timecolumns', '2026-09-15 19:24:31.827449+00', true, '\x255792dcad31ae41b33215ec2a724a6c758c8b56dd0cdb5916798745f55521c006c907085af498045869f48d42574547', 468484);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20240620151514, 'tabular identifiers', '2026-09-15 19:24:31.827449+00', true, '\xd229b1be11187cac021d6e546b4b6f4af59c4504ed8c3f1ddf6bcd96376e66ea8665f9d565a8e2e6c3b4ce7dfa6fb311', 9660440);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20240620151544, 'views', '2026-09-15 19:24:31.827449+00', true, '\x070336ffd87183e9e5bd4b1c72b025d71ed504d9d92ab12b33b8031fd5af2cf1a0dd9917e6bb4e625c749e1408dd1e1b', 15601618);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20240897111544, 'view versions are i32', '2026-09-15 19:24:31.827449+00', true, '\x84f46223a0c4a900a026d08922ea82c40e0961bc506310b38e3f247ee0b62c0f84daf48fc840ea93dd269b7f201ed128', 12737691);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20240898160621, 'tabular deleted at', '2026-09-15 19:24:31.827449+00', true, '\x19152bb9a9069d3e708d6559d816b284db33823f8b6fa52656a80cc0b46009e9830cf3b9b7c9b9087f4c68cffcf6e3d1', 641401);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20240898175225, 'tabular deletion extended', '2026-09-15 19:24:31.827449+00', true, '\x96f284a89006b4f8317c7c78e0969b5f81948124d71c17338cd9267954e4ff117a0eecbf99acbdae6d6b46a330db08ad', 1485145);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20240899175225, 'tabular expiration', '2026-09-15 19:24:31.827449+00', true, '\x19cac9768c9b611a14f459c434cbe02291a8fdbf6585db17f3349db51c6ab17f9771b6487141a2ea70b310cd12590458', 9493616);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20240909120857, 'configurable drops', '2026-09-15 19:24:31.827449+00', true, '\xc7b480b4d576d774c6da07b2011225be3e1392d6e80c102722e1f64bbf7d7317c64fc193dd9bdc33e81ae80dba0d1c06', 2359546);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20240911094637, 'unique tabular location', '2026-09-15 19:24:31.827449+00', true, '\x5d68135df940e2bf31b496b258df36e31218ce4feacb49ab37cc272603edfb2a5f6d67edfafc34ba6773d75bbfb7878e', 1904226);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20241006083546, 'projects-table', '2026-09-15 19:24:31.827449+00', true, '\x300a586e0947cf994fb1043af0acddd2eabed168b94b215038e3c9f7668a1328402914abd5e5983cd5b6b25698dfb153', 3482265);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20241009122911, 'users and roles', '2026-09-15 19:24:31.827449+00', true, '\x633c0a8822c896e89249d5ada24c39dc1197b132b57d462cc4e59566851fc5dbeb5d064e900f15345de5c221af59a579', 33500926);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20241011203612, 'server', '2026-09-15 19:24:31.827449+00', true, '\x4571f34b4f62ecc9f90e413c228d37f59c278b478d3ceefb7ec546b31321df2a8aa020db9b7e5be266481c1ffdb2b577', 1690512);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20241106163000, 'user email search', '2026-09-15 19:24:31.827449+00', true, '\x4e98d3e168ffc1c9901351bbc86d085025ede29b96270154cc843749d9c27a7bb1052a8703e0ec345c88523780610e82', 618778);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20241106201139, 'split table metadata', '2026-09-15 19:24:31.827449+00', true, '\xc4292b2f4c49baa6c42aabebbee93c9dc64c63b45ecbb791a875b78f48a84980db8b9fcb3b2baf20d26c8870e1ef4e4c', 23736599);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20241117144332, 'task queue indexes', '2026-09-15 19:24:31.827449+00', true, '\x93069e237dc85e2d6ec5bf717feb088b71beffa3c74c97003c859e9ded5c5f265e8121970952f907777d6b2744695cdf', 881655);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20241216114355, 'table statistics', '2026-09-15 19:24:31.827449+00', true, '\x8ddc9dbca113fb69dfcf3c5311c3e5b24450b42300eeb2848cceb3f56de3e9e1b9a95953b5f8b5d224937f94477007eb', 3859878);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20241216150545, 'fix schemaless snapshots', '2026-09-15 19:24:31.827449+00', true, '\xc06ec31cf310ef63bbed99590b05ee1a4d1df51cf1378bc3291d82261f864c0ae4501896cca3ec35e44cf123e28976da', 215967);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20241224055514, 'unique user email', '2026-09-15 19:24:31.827449+00', true, '\xd5fc3bcb8af5706cea9434a948fc6426f083e6bf31f94389953440d4e7f054994562f6cdedec1ab7df5cc06f892918cf', 535872);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20250108131004, 'statistics', '2026-09-15 19:24:31.827449+00', true, '\x87c07858acedf8b9599d1eee6a9bbe23e2430aef4012f673b2d2ff719df3f99cb214252a0307993cb114339eb04a949d', 3737497);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20250216105917, 'variant protocols', '2026-09-15 19:24:31.827449+00', true, '\x76c58ded446245c86dd7cac5bddd34ccd9126db5eae307a5942c18875126f5999238569c02076742d63dc3c7a98fa222', 3236992);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20250304100842, 'string project ids', '2026-09-15 19:24:31.827449+00', true, '\x42d41bcc48fde8622073cd669b7eeba8396f3b463aec28e4370402ada7f9eefa424cca45f074ca540a7c4dfea46e5d65', 4627237);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20250310181331, 'endpoint stats', '2026-09-15 19:24:31.827449+00', true, '\x0e475131b17449d48330d9979e78c69e43d72854e691528a9a7a9a83acf8658142865c552424848089b45239848ee59f', 5388254);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20250326153233, 'table statistics fkey', '2026-09-15 19:24:31.827449+00', true, '\xda90a37bee3f857b21e8374f1adefc865b8bf05ce090d06626eb34a135f58159ae598a0afab8bb29aa6a2e16ca440c9b', 1886793);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20250328131139, 'fix sequence number', '2026-09-15 19:24:31.827449+00', true, '\xd8a6efb1006b7f9477c511c70591da1c73e6b2e6ada9fa9062524444213faed8cd8dc32ce5db8a7254a4ffc4459532fe', 797015);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20250401163352, 'project id constraints', '2026-09-15 19:24:31.827449+00', true, '\xa16230d4226b6a55a644c24239f5fbb40be816d96aa4ecc3b155a41042bd30892ec06996dcb64f3951110419b48e6a53', 846428);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20250407144536, 'fix warehouse deletion fk', '2026-09-15 19:24:31.827449+00', true, '\xdc02cc58d053f9fad616db6705cfff33364fa822e22e29f0f9228feab8835164cd266b7466c72ced1b12eeee3d8fa590', 1117089);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20250409201248, 'cascade delete', '2026-09-15 19:24:31.827449+00', true, '\x725285449a654945fffa2a2941799acecce7e38d37fe13e32b8ad690b6365760a058ebc2fcdb9ba9d8e2b57892d9e8d9', 2077994);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20250410024101, 'fix warehouse stats', '2026-09-15 19:24:31.827449+00', true, '\x563ba555ceeade50819aee877fd130d1c5b7cf8286b571ba8fc28f01d3a97c73de60a2027c62dd6abfc00fec1d3b49bb', 6339591);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20250412220607, 'restructure endpoints', '2026-09-15 19:24:31.827449+00', true, '\xa82ad2ccbb7eaa4e3bcac1c246ce901ab97e12951345d3b55699e6428b3560f2103bde8899694a7ea0d80fbf2a43c7c8', 8778476);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20250428072447, 'add task warehouse id idx', '2026-09-15 19:24:31.827449+00', true, '\x456a06466a8f75dd5db3779c046ae55dfb3c4f9ce3d5b72bce99aa4a77ce4bf85545fcd0390b0e3f8c5106185b95ea28', 3594276);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20250505101407, 'fix index function', '2026-09-15 19:24:31.827449+00', true, '\x2b2885dbc012ecaac71fc2e3a2c67399c5d30139f8176e613c574dd834e07a7010f5cfdaf7206e3f0ac48fef7e795593', 303723);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20250506094141, 'fix index function2', '2026-09-15 19:24:31.827449+00', true, '\x41d5623f06bcd747458a96bef6d49edd8f21820d484f95e97298032bb143dc671cc5f8c6defc7305727525b25830b302', 143250);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20250513172324, 's3 sign table endpoint', '2026-09-15 19:24:31.827449+00', true, '\x14c7c0c6f8698b881fb1b7886c8e77c9aafb1e2a0b5c83f92b676cee98267f444448d0fcad4a6616cebfb55b2bb84891', 172045);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20250523101407, 'tasks store their state', '2026-09-15 19:24:31.827449+00', true, '\xd683513c18f6c69d5554f5b6668440a0f0f986cace59c1b5be5c81be9c72c65db2190f22554348b1b51a949a6f841309', 14324477);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20250623114333, 'fix soft deleted tabulars', '2026-09-15 19:24:31.827449+00', true, '\x69c17d9fa0097f5fdae0038bba6456928b019b013fa1fa2e59f94557f200b02d5c7e93c48c32f158a21212a8a2594bfd', 3415188);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20250826171037, 'task runtime information', '2026-09-15 19:24:31.827449+00', true, '\xe94445d3c02c310458359196019123c8ca5f1e060139730b3e914b26d1b51cbf0011a1feff343929af3ba1cff4c7b6c2', 7052115);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20250904142650, 'reusable table id', '2026-09-15 19:24:31.827449+00', true, '\xa514abf508d7e9183c5bc293656010c2cf1e42e05f0caba5fa3e2a2f2dd43d8f5aae151a13eea886459720faa4dd95fc', 41214039);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20250919101934, 'add task entity name', '2026-09-15 19:24:31.827449+00', true, '\x5f1014aa1080bb434de90cb511101d77cf471b210afe9bbaf9f197d50da51f439a5d60fec317c0546d6e4ade0bf7ebc9', 4931792);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20250923102542, 'v3 support', '2026-09-15 19:24:31.827449+00', true, '\x3a79587d573174c1286da46ad4644b97badcefe80556fe4c50cb2e84d57d7435783b62f671dcab7a8bd4a70c4884f64d', 4319135);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20250923164029, 'fuzzy tabular search', '2026-09-15 19:24:31.827449+00', true, '\x103bb5d0f13ea02d35b70ae495d8964412251c90dbea7ddd1ed3d1caea692dd22a7a539cedf076ca73d6cf59a2657452', 32592069);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20250930101627, 'active tabulars remove namespace join', '2026-09-15 19:24:31.827449+00', true, '\x593c731cd893b3fd8ef983a4f75009528808d810593f2727f52ca10a344a0d1e8174d7a9e88881f79417f5666dc28a59', 839966);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20251003103404, 'fix project endpoint stats', '2026-09-15 19:24:31.827449+00', true, '\x569ccc3f2c9d7bb50ec89fdc888769a65ca3236f89b01b896f13867b4bddfcdb262b9002cede9e93f2bf5cd4e54600bf', 461762);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20251027163724, 'introduce entity versions', '2026-09-15 19:24:31.827449+00', true, '\xfc4c004bb9ec2f641bd3d4dfab45cbf5baaeeeb2bb0175c14cd53ee4ea50aec503d9a228788530ff483533d8b0576323', 1717714);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20251109122721, 'role project filter', '2026-09-15 19:24:31.827449+00', true, '\x606b2b212b19609b678003d25557fe62ad58bf1d1aeecbcac18419a7982749c12f98603d917c2a459473dfb7ad4d80e2', 833163);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20251117114624, 'action endpoint statistics', '2026-09-15 19:24:31.827449+00', true, '\x9d543932d02cac35ce815e8cd6701e95843bd15b3d79ad94098a1dcb2ba02e0909ec48b76055c020ac7b0da7139ed45b', 1102451);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20251121072340, 'role external id', '2026-09-15 19:24:31.827449+00', true, '\x3a3ff71ca594036dfabb1afc0050dfa252c664b4407c59659812d238ae46f5156e0da5acb888f9e9fddbd9e5576e2ed0', 614229);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20251228101923, 'enable tasks on project level', '2026-09-15 19:24:31.827449+00', true, '\x4b37aefd7ee8a615b002440ac5ab0c24ad02972d6e591f762281edee819618ef00aac0b419aa6f34fe2933ca22d81a37', 13795208);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20260219081950, 'improve list performance', '2026-09-15 19:24:31.827449+00', true, '\xe274713de4ad41421623946f543cd00aeea5e2e34fdee15755130ececf4bde79dd6661e5dcb888bc1435558d3bbf733c', 3459793);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20260220011106, 'string role id', '2026-09-15 19:24:31.827449+00', true, '\xec8049a0a96bae04831452df46f3d3998db0e786b2f50b8dcb28d2e9cdb52da42121a79f2c76e3ba03ebe53c015923bf', 2445557);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20260301083426, 'user role mappings', '2026-09-15 19:24:31.827449+00', true, '\xb4793d54e8352013c49bcc67f529dec265f0ca73e8480fa36ead31402de6de6658e186b6e558612f1ed184c29c195b90', 4886596);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20260318120000, 'idempotency record', '2026-09-15 19:24:31.827449+00', true, '\xfbd914a0cb067ade744d4f3461a668c8c22253df4958759aab7833440369c2a0faed7d7f80ce57a6cf1080d817261564', 1843781);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20260513091606, 'drop unique user email', '2026-09-15 19:24:31.827449+00', true, '\xda8f014576ee46e50bc33d914b4659fe02591b2d72084c33722ac0b0ae2ecb6b59acd1d3b4746c3637e197a02ca88b67', 186262);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20260525120000, 'fix namespace trigger wholerow when', '2026-09-15 19:24:31.827449+00', true, '\x29be3c0d646d1aff68f5c5efb8a1463e4a27d11b666e3c13affd430665e53b68aa7570ec7d2df354a0cd70d2b0b65a4c', 555820);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20260527120000, 'add schedule task endpoint', '2026-09-15 19:24:31.827449+00', true, '\xa046d7c4047684771dd416596e100d0f6eee2731fa0a4266957f98dbf9eea6c1ca595a75ca0c078bfa61bd7c84e95b0d', 204476);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20260529000000, 'add generic table', '2026-09-15 19:24:31.827449+00', true, '\x519eb57638de32a80737b143ea5cb22b6417ebd17abc2896fb9b13d7b68439096b0a48c18be6b5caced1dc55cb71a8fe', 18667878);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20260529120000, 'warehouse format version policy', '2026-09-15 19:24:31.827449+00', true, '\x46fb8da91a336e1f3d8560bfae3b9824cc0ed2db516a2eccbf916b20ffa555700082b9ff7d1b3bfe7ff294b6ec154d0f', 1052878);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20260601000000, 'role membership', '2026-09-15 19:24:31.827449+00', true, '\x7c2f6323b7f8ef844a2b91b3f7bfd5caa89ddd54a1f72ace7f16a616134cf78731b3246a69058660ddf34ce9cf5d14f1', 1884629);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20260605000000, 'warehouse managed by', '2026-09-15 19:24:31.827449+00', true, '\x7d09b329832755e7e36a2f83f4c36a8f89e3be1f4ff404048eb3714d48b66dadfffeda6b31a63d16ec77cf1b421b46a6', 740629);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20260607000000, 'role membership endpoints and user name nullable', '2026-09-15 19:24:31.827449+00', true, '\x70f8ac73b2de457e8632f5a14d14072930abc01055c0033413862d3587f7f76978f6e6e0c077069e2e8c0c21f2bce1ed', 2156321);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20260625000000, 'normalized schema', '2026-09-15 19:24:31.827449+00', true, '\x9bc3e8e236d24341c7eedccb8bd9c1db43799ebbb0af38619352ef27ecf78e81861d08fe92c300c5d12b6c4fb82f1887', 4392884);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20260720000000, 'tags', '2026-09-15 19:24:31.827449+00', true, '\x42d3e2bbc08fb9d280ff33c189166aec552df008c03e394acc48b57af3ac2d76e9f11a9b6ea78e56db873016d8adc05d', 10766539);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20260806220000, 'add warehouse validate endpoints', '2026-09-15 19:24:31.827449+00', true, '\xb4e371ba6bd76966341081177d8339fb35955a2af30bc5ce9136c25296084ed8f714de0a474fd0fd488ebbfc19df62b4', 485908);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20260811000000, 'grants', '2026-09-15 19:24:31.827449+00', true, '\x8b1e897da492fd4691706ac3e60dabafaaa9989aeab480949872b574380ab6bc5c2da6c82e095d7c1c5dec045c7bf565', 10393324);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20260812090000, 'add move namespace endpoint', '2026-09-15 19:24:31.827449+00', true, '\x766efaa7abe4dc1ef7e6fb2ad999eae2825d4149157d0fcca6e2c242bb95db62e663ffdd9cb6d129e9b1ad7b45bc99ff', 241956);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20260813000000, 'fix list tabulars index', '2026-09-15 19:24:31.827449+00', true, '\x2fcb76367038f8bd09f8f18cb9ef41180235ae37c0048d43ad8ce81c94baea906a9a177e4816c3a40c3933a9e17eebff', 892846);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20260814090000, 'sign by table name endpoint', '2026-09-15 19:24:31.827449+00', true, '\xb6c5d69e27d73bf2e6e6071ba71ee285e140c1b13424e41dc19a080f6f37007a056bea0ea7f30f778317a3d8086cbe9c', 249501);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20260829000000, 'subtree grants', '2026-09-15 19:24:31.827449+00', true, '\xf3e82af6deeb69d7a9d81bcedea6c5844d2978c12e36802faca770ea60f041014c280ae8ab40f1b62d85144b1320a7f7', 1034684);
INSERT INTO "public"."_sqlx_migrations" ("version", "description", "installed_on", "success", "checksum", "execution_time") VALUES (20260830000000, 'normalize and index tabular location', '2026-09-15 19:24:31.827449+00', true, '\x4686281ba5646c5e42aded6337c592aa6cdc435fbe0d68419ee81901c2c6abdb493fa54dcc7fc724c03e09e14147f543', 680534);


ALTER TABLE "public"."_sqlx_migrations" ENABLE TRIGGER ALL;

--
-- Data for Name: project; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."project" DISABLE TRIGGER ALL;

INSERT INTO "public"."project" ("project_name", "created_at", "updated_at", "project_id", "version") VALUES ('Default Project', '2026-09-15 19:24:34.029927+00', NULL, '00000000-0000-0000-0000-000000000000', 0);
INSERT INTO "public"."project" ("project_name", "created_at", "updated_at", "project_id", "version") VALUES ('finance', '2026-09-15 19:24:34.149758+00', NULL, '01a0a687-35e5-7102-9c5f-48460581e971', 0);


ALTER TABLE "public"."project" ENABLE TRIGGER ALL;

--
-- Data for Name: warehouse; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."warehouse" DISABLE TRIGGER ALL;

INSERT INTO "public"."warehouse" ("warehouse_id", "warehouse_name", "storage_profile", "storage_secret_id", "created_at", "updated_at", "status", "tabular_expiration_seconds", "tabular_delete_mode", "project_id", "protected", "version", "allowed_format_versions", "default_format_version", "managed_by") VALUES ('01a0a687-35f4-7dc3-9043-216b1fe4b387', 'wh_hard', '{"type": "s3", "bucket": "warehouse", "flavor": "s3-compat", "region": "local-01", "endpoint": "http://minio:9000/", "key-prefix": "hard", "sts-enabled": true, "sts-endpoint": null, "sts-role-arn": null, "storage-layout": null, "assume-role-arn": null, "aws-kms-key-arn": null, "sts-session-tags": {}, "path-style-access": true, "legacy-md5-behavior": null, "remote-signing-enabled": true, "push-s3-delete-disabled": true, "remote-signing-url-style": "auto", "sts-token-validity-seconds": 3600, "allow-alternative-protocols": null}', '1530ede2-b13b-11f1-ad57-6b485e416e40', '2026-09-15 19:24:34.189859+00', NULL, 'active', NULL, 'hard', '00000000-0000-0000-0000-000000000000', false, 0, '{1,2,3}', NULL, 'self-managed');
INSERT INTO "public"."warehouse" ("warehouse_id", "warehouse_name", "storage_profile", "storage_secret_id", "created_at", "updated_at", "status", "tabular_expiration_seconds", "tabular_delete_mode", "project_id", "protected", "version", "allowed_format_versions", "default_format_version", "managed_by") VALUES ('01a0a687-365e-7763-8d7b-3d04e220f881', 'wh_off', '{"type": "s3", "bucket": "warehouse", "flavor": "s3-compat", "region": "local-01", "endpoint": "http://minio:9000/", "key-prefix": "off", "sts-enabled": true, "sts-endpoint": null, "sts-role-arn": null, "storage-layout": null, "assume-role-arn": null, "aws-kms-key-arn": null, "sts-session-tags": {}, "path-style-access": true, "legacy-md5-behavior": null, "remote-signing-enabled": true, "push-s3-delete-disabled": true, "remote-signing-url-style": "auto", "sts-token-validity-seconds": 3600, "allow-alternative-protocols": null}', '153f9b58-b13b-11f1-ad57-1f3fdaf16be0', '2026-09-15 19:24:34.286947+00', '2026-09-15 19:24:34.31562+00', 'inactive', NULL, 'hard', '00000000-0000-0000-0000-000000000000', false, 1, '{1,2,3}', NULL, 'self-managed');
INSERT INTO "public"."warehouse" ("warehouse_id", "warehouse_name", "storage_profile", "storage_secret_id", "created_at", "updated_at", "status", "tabular_expiration_seconds", "tabular_delete_mode", "project_id", "protected", "version", "allowed_format_versions", "default_format_version", "managed_by") VALUES ('01a0a687-3625-7ae1-a8a7-0f13add8ea74', 'wh_soft', '{"type": "s3", "bucket": "warehouse", "flavor": "s3-compat", "region": "local-01", "endpoint": "http://minio:9000/", "key-prefix": "soft", "sts-enabled": true, "sts-endpoint": null, "sts-role-arn": null, "storage-layout": null, "assume-role-arn": null, "aws-kms-key-arn": null, "sts-session-tags": {}, "path-style-access": true, "legacy-md5-behavior": null, "remote-signing-enabled": true, "push-s3-delete-disabled": true, "remote-signing-url-style": "auto", "sts-token-validity-seconds": 3600, "allow-alternative-protocols": null}', '15386892-b13b-11f1-b4f4-c78d4497aefb', '2026-09-15 19:24:34.238805+00', '2026-09-15 19:24:34.337931+00', 'active', 86400, 'soft', '00000000-0000-0000-0000-000000000000', true, 1, '{1,2,3}', NULL, 'self-managed');


ALTER TABLE "public"."warehouse" ENABLE TRIGGER ALL;

--
-- Data for Name: namespace; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."namespace" DISABLE TRIGGER ALL;

INSERT INTO "public"."namespace" ("namespace_id", "warehouse_id", "namespace_name", "namespace_properties", "created_at", "updated_at", "protected", "version") VALUES ('01a0a687-36bc-7260-ae97-206da768bcd4', '01a0a687-35f4-7dc3-9043-216b1fe4b387', '{sales}', '{"owner": "analytics", "location": "s3://warehouse/hard"}', '2026-09-15 19:24:34.364661+00', NULL, false, 0);
INSERT INTO "public"."namespace" ("namespace_id", "warehouse_id", "namespace_name", "namespace_properties", "created_at", "updated_at", "protected", "version") VALUES ('01a0a687-36c9-7ce3-9fd6-a72e174f3a27', '01a0a687-35f4-7dc3-9043-216b1fe4b387', '{sales,eu}', '{"location": "s3://warehouse/hard"}', '2026-09-15 19:24:34.378007+00', NULL, false, 0);
INSERT INTO "public"."namespace" ("namespace_id", "warehouse_id", "namespace_name", "namespace_properties", "created_at", "updated_at", "protected", "version") VALUES ('01a0a687-36df-71f1-89b5-0975752fef46', '01a0a687-35f4-7dc3-9043-216b1fe4b387', '{sales,eu,q1}', '{"location": "s3://warehouse/hard", "retention": "5y"}', '2026-09-15 19:24:34.399497+00', NULL, false, 0);
INSERT INTO "public"."namespace" ("namespace_id", "warehouse_id", "namespace_name", "namespace_properties", "created_at", "updated_at", "protected", "version") VALUES ('01a0a687-36eb-79c3-b5d4-c90079341b9f', '01a0a687-35f4-7dc3-9043-216b1fe4b387', '{logs}', '{"location": "s3://warehouse/hard"}', '2026-09-15 19:24:34.411881+00', NULL, false, 0);
INSERT INTO "public"."namespace" ("namespace_id", "warehouse_id", "namespace_name", "namespace_properties", "created_at", "updated_at", "protected", "version") VALUES ('01a0a687-36f8-7ed3-9dcb-a2d3b9d2851e', '01a0a687-3625-7ae1-a8a7-0f13add8ea74', '{staging}', '{"location": "s3://warehouse/soft"}', '2026-09-15 19:24:34.424267+00', NULL, false, 0);


ALTER TABLE "public"."namespace" ENABLE TRIGGER ALL;

--
-- Data for Name: tabular; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."tabular" DISABLE TRIGGER ALL;

INSERT INTO "public"."tabular" ("tabular_id", "namespace_id", "name", "typ", "metadata_location", "created_at", "updated_at", "deleted_at", "fs_protocol", "fs_location", "protected", "warehouse_id", "tabular_namespace_name") VALUES ('01a0a687-3709-7340-86da-ce781af16e68', '01a0a687-36c9-7ce3-9fd6-a72e174f3a27', 'orders', 'table', 's3://warehouse/hard/01a0a687-3709-7340-86da-ce781af16e68/metadata/00002-01a0a687-37a1-7561-83c3-a55448aa642a.gz.metadata.json', '2026-09-15 19:24:34.442074+00', '2026-09-15 19:24:34.598892+00', NULL, 's3', 'warehouse/hard/01a0a687-3709-7340-86da-ce781af16e68', false, '01a0a687-35f4-7dc3-9043-216b1fe4b387', '{sales,eu}');
INSERT INTO "public"."tabular" ("tabular_id", "namespace_id", "name", "typ", "metadata_location", "created_at", "updated_at", "deleted_at", "fs_protocol", "fs_location", "protected", "warehouse_id", "tabular_namespace_name") VALUES ('01a0a687-37c0-72c0-a34f-799669fd62c3', '01a0a687-36eb-79c3-b5d4-c90079341b9f', 'events', 'table', 's3://warehouse/hard/01a0a687-37c0-72c0-a34f-799669fd62c3/metadata/00000-01a0a687-37c0-72c0-a34f-79a42f287274.gz.metadata.json', '2026-09-15 19:24:34.624351+00', NULL, NULL, 's3', 'warehouse/hard/01a0a687-37c0-72c0-a34f-799669fd62c3', false, '01a0a687-35f4-7dc3-9043-216b1fe4b387', '{logs}');
INSERT INTO "public"."tabular" ("tabular_id", "namespace_id", "name", "typ", "metadata_location", "created_at", "updated_at", "deleted_at", "fs_protocol", "fs_location", "protected", "warehouse_id", "tabular_namespace_name") VALUES ('01a0a687-37d8-75d2-a191-d541aca4d446', '01a0a687-36eb-79c3-b5d4-c90079341b9f', 'audit', 'table', 's3://warehouse/hard/01a0a687-37d8-75d2-a191-d541aca4d446/metadata/00000-01a0a687-37d8-75d2-a191-d5514eb242e1.gz.metadata.json', '2026-09-15 19:24:34.648629+00', '2026-09-15 19:24:34.707595+00', NULL, 's3', 'warehouse/hard/01a0a687-37d8-75d2-a191-d541aca4d446', true, '01a0a687-35f4-7dc3-9043-216b1fe4b387', '{logs}');
INSERT INTO "public"."tabular" ("tabular_id", "namespace_id", "name", "typ", "metadata_location", "created_at", "updated_at", "deleted_at", "fs_protocol", "fs_location", "protected", "warehouse_id", "tabular_namespace_name") VALUES ('01a0a687-385a-73b2-a5a1-3a872c7e9ce6', '01a0a687-36f8-7ed3-9dcb-a2d3b9d2851e', 'retired', 'table', 's3://warehouse/soft/01a0a687-385a-73b2-a5a1-3a872c7e9ce6/metadata/00000-01a0a687-385b-7f91-bd0b-3f5ce833d7f6.gz.metadata.json', '2026-09-15 19:24:34.779187+00', '2026-09-15 19:24:34.804717+00', '2026-09-15 19:24:34.805573+00', 's3', 'warehouse/soft/01a0a687-385a-73b2-a5a1-3a872c7e9ce6', false, '01a0a687-3625-7ae1-a8a7-0f13add8ea74', '{staging}');
INSERT INTO "public"."tabular" ("tabular_id", "namespace_id", "name", "typ", "metadata_location", "created_at", "updated_at", "deleted_at", "fs_protocol", "fs_location", "protected", "warehouse_id", "tabular_namespace_name") VALUES ('01a0a687-3883-7a22-8d29-04bca56028f7', '01a0a687-36c9-7ce3-9fd6-a72e174f3a27', 'eu_orders', 'view', 's3://warehouse/hard/01a0a687-3883-7a22-8d29-04bca56028f7/metadata/00001-01a0a687-38ab-7951-ab9c-d21213da765d.gz.metadata.json', '2026-09-15 19:24:34.819861+00', '2026-09-15 19:24:34.85539+00', NULL, 's3', 'warehouse/hard/01a0a687-3883-7a22-8d29-04bca56028f7', false, '01a0a687-35f4-7dc3-9043-216b1fe4b387', '{sales,eu}');
INSERT INTO "public"."tabular" ("tabular_id", "namespace_id", "name", "typ", "metadata_location", "created_at", "updated_at", "deleted_at", "fs_protocol", "fs_location", "protected", "warehouse_id", "tabular_namespace_name") VALUES ('01a0a687-38c7-7452-b0ec-7296574ff1ae', '01a0a687-36eb-79c3-b5d4-c90079341b9f', 'delta_events', 'generic-table', NULL, '2026-09-15 19:24:34.88755+00', NULL, NULL, 's3', 'warehouse/hard/logs/delta_events', false, '01a0a687-35f4-7dc3-9043-216b1fe4b387', '{logs}');


ALTER TABLE "public"."tabular" ENABLE TRIGGER ALL;

--
-- Data for Name: view; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."view" DISABLE TRIGGER ALL;

INSERT INTO "public"."view" ("view_id", "view_format_version", "created_at", "updated_at", "warehouse_id") VALUES ('01a0a687-3883-7a22-8d29-04bca56028f7', 'v1', '2026-09-15 19:24:34.819861+00', NULL, '01a0a687-35f4-7dc3-9043-216b1fe4b387');


ALTER TABLE "public"."view" ENABLE TRIGGER ALL;

--
-- Data for Name: view_schema; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."view_schema" DISABLE TRIGGER ALL;

INSERT INTO "public"."view_schema" ("schema_id", "view_id", "schema", "created_at", "updated_at", "warehouse_id") VALUES (0, '01a0a687-3883-7a22-8d29-04bca56028f7', NULL, '2026-09-15 19:24:34.819861+00', NULL, '01a0a687-35f4-7dc3-9043-216b1fe4b387');
INSERT INTO "public"."view_schema" ("schema_id", "view_id", "schema", "created_at", "updated_at", "warehouse_id") VALUES (1, '01a0a687-3883-7a22-8d29-04bca56028f7', NULL, '2026-09-15 19:24:34.85539+00', NULL, '01a0a687-35f4-7dc3-9043-216b1fe4b387');


ALTER TABLE "public"."view_schema" ENABLE TRIGGER ALL;

--
-- Data for Name: view_version; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."view_version" DISABLE TRIGGER ALL;

INSERT INTO "public"."view_version" ("view_id", "version_id", "schema_id", "timestamp", "default_namespace_id", "default_catalog", "summary", "created_at", "updated_at", "warehouse_id") VALUES ('01a0a687-3883-7a22-8d29-04bca56028f7', 2, 1, '2026-09-15 19:24:34+00', '01a0a687-36c9-7ce3-9fd6-a72e174f3a27', NULL, '{"engine-name": "fixture"}', '2026-09-15 19:24:34.85539+00', NULL, '01a0a687-35f4-7dc3-9043-216b1fe4b387');
INSERT INTO "public"."view_version" ("view_id", "version_id", "schema_id", "timestamp", "default_namespace_id", "default_catalog", "summary", "created_at", "updated_at", "warehouse_id") VALUES ('01a0a687-3883-7a22-8d29-04bca56028f7', 1, 0, '2026-09-15 19:24:34.82+00', '01a0a687-36c9-7ce3-9fd6-a72e174f3a27', NULL, '{"engine-name": "fixture"}', '2026-09-15 19:24:34.85539+00', NULL, '01a0a687-35f4-7dc3-9043-216b1fe4b387');


ALTER TABLE "public"."view_version" ENABLE TRIGGER ALL;

--
-- Data for Name: current_view_metadata_version; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."current_view_metadata_version" DISABLE TRIGGER ALL;

INSERT INTO "public"."current_view_metadata_version" ("view_id", "version_id", "created_at", "updated_at", "warehouse_id") VALUES ('01a0a687-3883-7a22-8d29-04bca56028f7', 2, '2026-09-15 19:24:34.85539+00', NULL, '01a0a687-35f4-7dc3-9043-216b1fe4b387');


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

INSERT INTO "public"."generic_table" ("warehouse_id", "generic_table_id", "format", "doc", "schema_info", "statistics", "version", "created_at", "updated_at") VALUES ('01a0a687-35f4-7dc3-9043-216b1fe4b387', '01a0a687-38c7-7452-b0ec-7296574ff1ae', 'delta', 'Delta table registered alongside the Iceberg tables', '{"columns": [{"name": "event_id", "type": "string"}]}', NULL, 0, '2026-09-15 19:24:34.88755+00', NULL);


ALTER TABLE "public"."generic_table" ENABLE TRIGGER ALL;

--
-- Data for Name: generic_table_properties; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."generic_table_properties" DISABLE TRIGGER ALL;

INSERT INTO "public"."generic_table_properties" ("warehouse_id", "generic_table_id", "key", "value", "created_at", "updated_at") VALUES ('01a0a687-35f4-7dc3-9043-216b1fe4b387', '01a0a687-38c7-7452-b0ec-7296574ff1ae', 'owner', 'platform', '2026-09-15 19:24:34.88755+00', NULL);


ALTER TABLE "public"."generic_table_properties" ENABLE TRIGGER ALL;

--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."role" DISABLE TRIGGER ALL;

INSERT INTO "public"."role" ("id", "name", "description", "created_at", "updated_at", "project_id", "source_id", "provider_id", "version") VALUES ('01a0a687-359c-7c50-a6cb-3c0535628def', 'analysts', 'Reads the sales warehouse', '2026-09-15 19:24:34.076268+00', NULL, '00000000-0000-0000-0000-000000000000', '01a0a687-359c-7c50-a6cb-3c0535628def', 'lakekeeper', 0);
INSERT INTO "public"."role" ("id", "name", "description", "created_at", "updated_at", "project_id", "source_id", "provider_id", "version") VALUES ('01a0a687-35ab-7a62-a16b-8aedc712166f', 'juniors', NULL, '2026-09-15 19:24:34.091111+00', NULL, '00000000-0000-0000-0000-000000000000', '01a0a687-35ab-7a62-a16b-8aedc712166f', 'lakekeeper', 0);
INSERT INTO "public"."role" ("id", "name", "description", "created_at", "updated_at", "project_id", "source_id", "provider_id", "version") VALUES ('01a0a687-35b9-7292-8279-ed21d74d4c52', 'robots', NULL, '2026-09-15 19:24:34.105123+00', NULL, '00000000-0000-0000-0000-000000000000', 'group-robots', 'oidc', 0);


ALTER TABLE "public"."role" ENABLE TRIGGER ALL;

--
-- Data for Name: tag_definition; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."tag_definition" DISABLE TRIGGER ALL;

INSERT INTO "public"."tag_definition" ("tag_definition_id", "project_id", "name", "description", "scope", "value_kind", "created_at", "updated_at") VALUES ('01a0a687-38d6-7a52-8789-9a40f6bb5cdd', '00000000-0000-0000-0000-000000000000', 'pii', 'Carries personally identifiable information', '{warehouse,namespace,table,view,generic-table,column}', 'marker', '2026-09-15 19:24:34.903056+00', NULL);
INSERT INTO "public"."tag_definition" ("tag_definition_id", "project_id", "name", "description", "scope", "value_kind", "created_at", "updated_at") VALUES ('01a0a687-38e5-7fd3-93e5-c324001a596b', '00000000-0000-0000-0000-000000000000', 'owner', NULL, '{warehouse,namespace,table,view,generic-table,column}', 'free_text', '2026-09-15 19:24:34.918006+00', NULL);
INSERT INTO "public"."tag_definition" ("tag_definition_id", "project_id", "name", "description", "scope", "value_kind", "created_at", "updated_at") VALUES ('01a0a687-38f3-72b2-af2b-3a88375e482f', '00000000-0000-0000-0000-000000000000', 'tier', NULL, '{warehouse,namespace,table,view,generic-table,column}', 'enumerated', '2026-09-15 19:24:34.931936+00', NULL);


ALTER TABLE "public"."tag_definition" ENABLE TRIGGER ALL;

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."users" DISABLE TRIGGER ALL;

INSERT INTO "public"."users" ("id", "name", "email", "user_type", "last_updated_with", "deleted_at", "created_at", "updated_at") VALUES ('oidc~alice', 'Alice Analyst', 'alice@example.invalid', 'human', 'create-endpoint', NULL, '2026-09-15 19:24:34.045901+00', NULL);
INSERT INTO "public"."users" ("id", "name", "email", "user_type", "last_updated_with", "deleted_at", "created_at", "updated_at") VALUES ('kubernetes~pipeline', 'Nightly Pipeline', NULL, 'application', 'create-endpoint', NULL, '2026-09-15 19:24:34.061022+00', NULL);


ALTER TABLE "public"."users" ENABLE TRIGGER ALL;

--
-- Data for Name: grant_assignment; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."grant_assignment" DISABLE TRIGGER ALL;

INSERT INTO "public"."grant_assignment" ("grant_id", "principal_type", "user_id", "role_id", "privilege", "resource_type", "project_id", "warehouse_id", "namespace_id", "tabular_id", "tag_definition_id", "created_at") VALUES ('15bc02c4-b13b-11f1-b4f4-7f9f6a4b4611', 'user', 'oidc~alice', NULL, 'list_users', 'server', NULL, NULL, NULL, NULL, NULL, '2026-09-15 19:24:35.098985+00');
INSERT INTO "public"."grant_assignment" ("grant_id", "principal_type", "user_id", "role_id", "privilege", "resource_type", "project_id", "warehouse_id", "namespace_id", "tabular_id", "tag_definition_id", "created_at") VALUES ('15be60d2-b13b-11f1-967e-6f3d786a6daf', 'role', NULL, '01a0a687-359c-7c50-a6cb-3c0535628def', 'create_warehouse', 'project', '00000000-0000-0000-0000-000000000000', NULL, NULL, NULL, NULL, '2026-09-15 19:24:35.114473+00');
INSERT INTO "public"."grant_assignment" ("grant_id", "principal_type", "user_id", "role_id", "privilege", "resource_type", "project_id", "warehouse_id", "namespace_id", "tabular_id", "tag_definition_id", "created_at") VALUES ('15c1030a-b13b-11f1-ad57-576a18f0a2a6', 'role', NULL, '01a0a687-359c-7c50-a6cb-3c0535628def', 'use', 'warehouse', NULL, '01a0a687-35f4-7dc3-9043-216b1fe4b387', NULL, NULL, NULL, '2026-09-15 19:24:35.132294+00');
INSERT INTO "public"."grant_assignment" ("grant_id", "principal_type", "user_id", "role_id", "privilege", "resource_type", "project_id", "warehouse_id", "namespace_id", "tabular_id", "tag_definition_id", "created_at") VALUES ('15c39750-b13b-11f1-97f2-3bd282e8195b', 'user', 'oidc~alice', NULL, 'get_metadata', 'namespace', NULL, '01a0a687-35f4-7dc3-9043-216b1fe4b387', '01a0a687-36c9-7ce3-9fd6-a72e174f3a27', NULL, NULL, '2026-09-15 19:24:35.14888+00');
INSERT INTO "public"."grant_assignment" ("grant_id", "principal_type", "user_id", "role_id", "privilege", "resource_type", "project_id", "warehouse_id", "namespace_id", "tabular_id", "tag_definition_id", "created_at") VALUES ('15c674ca-b13b-11f1-943b-4326cec69bfd', 'user', 'oidc~alice', NULL, 'read_data', 'tabular', NULL, '01a0a687-35f4-7dc3-9043-216b1fe4b387', NULL, '01a0a687-3709-7340-86da-ce781af16e68', NULL, '2026-09-15 19:24:35.167124+00');
INSERT INTO "public"."grant_assignment" ("grant_id", "principal_type", "user_id", "role_id", "privilege", "resource_type", "project_id", "warehouse_id", "namespace_id", "tabular_id", "tag_definition_id", "created_at") VALUES ('15c8c6da-b13b-11f1-b4f4-c31ae65bb45b', 'role', NULL, '01a0a687-359c-7c50-a6cb-3c0535628def', 'select', 'tabular', NULL, '01a0a687-35f4-7dc3-9043-216b1fe4b387', NULL, '01a0a687-3883-7a22-8d29-04bca56028f7', NULL, '2026-09-15 19:24:35.185122+00');
INSERT INTO "public"."grant_assignment" ("grant_id", "principal_type", "user_id", "role_id", "privilege", "resource_type", "project_id", "warehouse_id", "namespace_id", "tabular_id", "tag_definition_id", "created_at") VALUES ('15cb169c-b13b-11f1-967e-c7ffe49963f3', 'role', NULL, '01a0a687-359c-7c50-a6cb-3c0535628def', 'read_data', 'tabular', NULL, '01a0a687-35f4-7dc3-9043-216b1fe4b387', NULL, '01a0a687-38c7-7452-b0ec-7296574ff1ae', NULL, '2026-09-15 19:24:35.200369+00');
INSERT INTO "public"."grant_assignment" ("grant_id", "principal_type", "user_id", "role_id", "privilege", "resource_type", "project_id", "warehouse_id", "namespace_id", "tabular_id", "tag_definition_id", "created_at") VALUES ('15cd00f6-b13b-11f1-ad57-8fde99dc9c72', 'role', NULL, '01a0a687-359c-7c50-a6cb-3c0535628def', 'apply', 'tag', NULL, NULL, NULL, NULL, '01a0a687-38d6-7a52-8789-9a40f6bb5cdd', '2026-09-15 19:24:35.213239+00');


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

INSERT INTO "public"."table" ("table_id", "metadata", "created_at", "updated_at", "table_format_version", "last_column_id", "last_sequence_number", "last_updated_ms", "last_partition_id", "warehouse_id", "next_row_id") VALUES ('01a0a687-3709-7340-86da-ce781af16e68', NULL, '2026-09-15 19:24:34.442074+00', '2026-09-15 19:24:34.598892+00', '2', 11, 2, 1789500275000, 1000, '01a0a687-35f4-7dc3-9043-216b1fe4b387', 0);
INSERT INTO "public"."table" ("table_id", "metadata", "created_at", "updated_at", "table_format_version", "last_column_id", "last_sequence_number", "last_updated_ms", "last_partition_id", "warehouse_id", "next_row_id") VALUES ('01a0a687-37c0-72c0-a34f-799669fd62c3', NULL, '2026-09-15 19:24:34.624351+00', NULL, '2', 2, 0, 1789500274624, 999, '01a0a687-35f4-7dc3-9043-216b1fe4b387', 0);
INSERT INTO "public"."table" ("table_id", "metadata", "created_at", "updated_at", "table_format_version", "last_column_id", "last_sequence_number", "last_updated_ms", "last_partition_id", "warehouse_id", "next_row_id") VALUES ('01a0a687-37d8-75d2-a191-d541aca4d446', NULL, '2026-09-15 19:24:34.648629+00', NULL, '2', 1, 0, 1789500274648, 999, '01a0a687-35f4-7dc3-9043-216b1fe4b387', 0);
INSERT INTO "public"."table" ("table_id", "metadata", "created_at", "updated_at", "table_format_version", "last_column_id", "last_sequence_number", "last_updated_ms", "last_partition_id", "warehouse_id", "next_row_id") VALUES ('01a0a687-385a-73b2-a5a1-3a872c7e9ce6', NULL, '2026-09-15 19:24:34.779187+00', NULL, '2', 1, 0, 1789500274779, 999, '01a0a687-3625-7ae1-a8a7-0f13add8ea74', 0);


ALTER TABLE "public"."table" ENABLE TRIGGER ALL;

--
-- Data for Name: table_schema; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."table_schema" DISABLE TRIGGER ALL;

INSERT INTO "public"."table_schema" ("schema_id", "table_id", "schema", "created_at", "updated_at", "warehouse_id") VALUES (0, '01a0a687-3709-7340-86da-ce781af16e68', NULL, '2026-09-15 19:24:34.442074+00', NULL, '01a0a687-35f4-7dc3-9043-216b1fe4b387');
INSERT INTO "public"."table_schema" ("schema_id", "table_id", "schema", "created_at", "updated_at", "warehouse_id") VALUES (0, '01a0a687-37c0-72c0-a34f-799669fd62c3', NULL, '2026-09-15 19:24:34.624351+00', NULL, '01a0a687-35f4-7dc3-9043-216b1fe4b387');
INSERT INTO "public"."table_schema" ("schema_id", "table_id", "schema", "created_at", "updated_at", "warehouse_id") VALUES (0, '01a0a687-37d8-75d2-a191-d541aca4d446', NULL, '2026-09-15 19:24:34.648629+00', NULL, '01a0a687-35f4-7dc3-9043-216b1fe4b387');
INSERT INTO "public"."table_schema" ("schema_id", "table_id", "schema", "created_at", "updated_at", "warehouse_id") VALUES (0, '01a0a687-385a-73b2-a5a1-3a872c7e9ce6', NULL, '2026-09-15 19:24:34.779187+00', NULL, '01a0a687-3625-7ae1-a8a7-0f13add8ea74');


ALTER TABLE "public"."table_schema" ENABLE TRIGGER ALL;

--
-- Data for Name: table_snapshot; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."table_snapshot" DISABLE TRIGGER ALL;

INSERT INTO "public"."table_snapshot" ("snapshot_id", "table_id", "parent_snapshot_id", "sequence_number", "manifest_list", "summary", "schema_id", "timestamp_ms", "created_at", "updated_at", "warehouse_id", "first_row_id", "assigned_rows", "key_id") VALUES (3001, '01a0a687-3709-7340-86da-ce781af16e68', NULL, 1, 's3://warehouse/hard/sales/eu/orders/metadata/snap-3001.avro', '{"operation": "append", "added-records": "100", "total-records": "100", "added-data-files": "2", "total-data-files": "2", "total-files-size": "2048", "total-delete-files": "0"}', 0, 1789500274000, '2026-09-15 19:24:34.546953+00', NULL, '01a0a687-35f4-7dc3-9043-216b1fe4b387', NULL, NULL, NULL);
INSERT INTO "public"."table_snapshot" ("snapshot_id", "table_id", "parent_snapshot_id", "sequence_number", "manifest_list", "summary", "schema_id", "timestamp_ms", "created_at", "updated_at", "warehouse_id", "first_row_id", "assigned_rows", "key_id") VALUES (3002, '01a0a687-3709-7340-86da-ce781af16e68', 3001, 2, 's3://warehouse/hard/sales/eu/orders/metadata/snap-3002.avro', '{"operation": "append", "added-records": "50", "total-records": "150", "deleted-records": "0", "added-data-files": "1", "total-data-files": "3", "total-files-size": "3072", "deleted-data-files": "0", "removed-files-size": "0", "total-delete-files": "0"}', 0, 1789500275000, '2026-09-15 19:24:34.598892+00', NULL, '01a0a687-35f4-7dc3-9043-216b1fe4b387', NULL, NULL, NULL);


ALTER TABLE "public"."table_snapshot" ENABLE TRIGGER ALL;

--
-- Data for Name: partition_statistics; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."partition_statistics" DISABLE TRIGGER ALL;

INSERT INTO "public"."partition_statistics" ("snapshot_id", "table_id", "statistics_path", "file_size_in_bytes", "created_at", "updated_at", "warehouse_id") VALUES (3002, '01a0a687-3709-7340-86da-ce781af16e68', 's3://warehouse/hard/sales/eu/orders/metadata/part-stats-3002.parquet', 512, '2026-09-15 19:24:34.598892+00', NULL, '01a0a687-35f4-7dc3-9043-216b1fe4b387');


ALTER TABLE "public"."partition_statistics" ENABLE TRIGGER ALL;

--
-- Data for Name: role_assignment; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."role_assignment" DISABLE TRIGGER ALL;

INSERT INTO "public"."role_assignment" ("role_id", "user_id", "created_at") VALUES ('01a0a687-359c-7c50-a6cb-3c0535628def', 'oidc~alice', '2026-09-15 19:24:34.120743+00');
INSERT INTO "public"."role_assignment" ("role_id", "user_id", "created_at") VALUES ('01a0a687-35ab-7a62-a16b-8aedc712166f', 'kubernetes~pipeline', '2026-09-15 19:24:34.137726+00');


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

INSERT INTO "public"."role_membership" ("parent_role_id", "member_role_id", "created_at") VALUES ('01a0a687-359c-7c50-a6cb-3c0535628def', '01a0a687-35ab-7a62-a16b-8aedc712166f', '2026-09-15 19:24:34.120743+00');


ALTER TABLE "public"."role_membership" ENABLE TRIGGER ALL;

--
-- Data for Name: tabular_field; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."tabular_field" DISABLE TRIGGER ALL;

INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a0a687-35f4-7dc3-9043-216b1fe4b387', '01a0a687-3709-7340-86da-ce781af16e68', 1);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a0a687-35f4-7dc3-9043-216b1fe4b387', '01a0a687-3709-7340-86da-ce781af16e68', 2);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a0a687-35f4-7dc3-9043-216b1fe4b387', '01a0a687-3709-7340-86da-ce781af16e68', 3);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a0a687-35f4-7dc3-9043-216b1fe4b387', '01a0a687-3709-7340-86da-ce781af16e68', 4);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a0a687-35f4-7dc3-9043-216b1fe4b387', '01a0a687-3709-7340-86da-ce781af16e68', 7);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a0a687-35f4-7dc3-9043-216b1fe4b387', '01a0a687-3709-7340-86da-ce781af16e68', 8);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a0a687-35f4-7dc3-9043-216b1fe4b387', '01a0a687-3709-7340-86da-ce781af16e68', 5);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a0a687-35f4-7dc3-9043-216b1fe4b387', '01a0a687-3709-7340-86da-ce781af16e68', 9);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a0a687-35f4-7dc3-9043-216b1fe4b387', '01a0a687-3709-7340-86da-ce781af16e68', 6);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a0a687-35f4-7dc3-9043-216b1fe4b387', '01a0a687-3709-7340-86da-ce781af16e68', 10);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a0a687-35f4-7dc3-9043-216b1fe4b387', '01a0a687-3709-7340-86da-ce781af16e68', 11);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a0a687-35f4-7dc3-9043-216b1fe4b387', '01a0a687-37c0-72c0-a34f-799669fd62c3', 1);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a0a687-35f4-7dc3-9043-216b1fe4b387', '01a0a687-37c0-72c0-a34f-799669fd62c3', 2);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a0a687-35f4-7dc3-9043-216b1fe4b387', '01a0a687-37d8-75d2-a191-d541aca4d446', 1);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a0a687-3625-7ae1-a8a7-0f13add8ea74', '01a0a687-385a-73b2-a5a1-3a872c7e9ce6', 1);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a0a687-35f4-7dc3-9043-216b1fe4b387', '01a0a687-3883-7a22-8d29-04bca56028f7', 1);
INSERT INTO "public"."tabular_field" ("warehouse_id", "tabular_id", "field_id") VALUES ('01a0a687-35f4-7dc3-9043-216b1fe4b387', '01a0a687-3883-7a22-8d29-04bca56028f7', 2);


ALTER TABLE "public"."tabular_field" ENABLE TRIGGER ALL;

--
-- Data for Name: schema_field; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."schema_field" DISABLE TRIGGER ALL;

INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a0a687-35f4-7dc3-9043-216b1fe4b387', '01a0a687-3709-7340-86da-ce781af16e68', 0, 1, NULL, 0, 'order_id', true, 'Order number', 'long', NULL, NULL, NULL, true);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a0a687-35f4-7dc3-9043-216b1fe4b387', '01a0a687-3709-7340-86da-ce781af16e68', 0, 2, NULL, 1, 'placed_at', true, NULL, 'timestamptz', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a0a687-35f4-7dc3-9043-216b1fe4b387', '01a0a687-3709-7340-86da-ce781af16e68', 0, 3, NULL, 2, 'amount', false, NULL, 'decimal', '{"scale": 2, "precision": 12}', NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a0a687-35f4-7dc3-9043-216b1fe4b387', '01a0a687-3709-7340-86da-ce781af16e68', 0, 4, NULL, 3, 'customer', false, NULL, 'struct', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a0a687-35f4-7dc3-9043-216b1fe4b387', '01a0a687-3709-7340-86da-ce781af16e68', 0, 7, 4, 0, 'customer_id', true, NULL, 'uuid', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a0a687-35f4-7dc3-9043-216b1fe4b387', '01a0a687-3709-7340-86da-ce781af16e68', 0, 8, 4, 1, 'display_name', false, NULL, 'string', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a0a687-35f4-7dc3-9043-216b1fe4b387', '01a0a687-3709-7340-86da-ce781af16e68', 0, 5, NULL, 4, 'items', false, NULL, 'list', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a0a687-35f4-7dc3-9043-216b1fe4b387', '01a0a687-3709-7340-86da-ce781af16e68', 0, 9, 5, 0, 'element', true, NULL, 'string', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a0a687-35f4-7dc3-9043-216b1fe4b387', '01a0a687-3709-7340-86da-ce781af16e68', 0, 6, NULL, 5, 'scores', false, NULL, 'map', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a0a687-35f4-7dc3-9043-216b1fe4b387', '01a0a687-3709-7340-86da-ce781af16e68', 0, 10, 6, 0, 'key', true, NULL, 'string', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a0a687-35f4-7dc3-9043-216b1fe4b387', '01a0a687-3709-7340-86da-ce781af16e68', 0, 11, 6, 1, 'value', false, NULL, 'double', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a0a687-35f4-7dc3-9043-216b1fe4b387', '01a0a687-37c0-72c0-a34f-799669fd62c3', 0, 1, NULL, 0, 'event_id', true, NULL, 'string', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a0a687-35f4-7dc3-9043-216b1fe4b387', '01a0a687-37c0-72c0-a34f-799669fd62c3', 0, 2, NULL, 1, 'payload', false, NULL, 'binary', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a0a687-35f4-7dc3-9043-216b1fe4b387', '01a0a687-37d8-75d2-a191-d541aca4d446', 0, 1, NULL, 0, 'at', true, NULL, 'timestamptz', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a0a687-3625-7ae1-a8a7-0f13add8ea74', '01a0a687-385a-73b2-a5a1-3a872c7e9ce6', 0, 1, NULL, 0, 'x', false, NULL, 'int', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a0a687-35f4-7dc3-9043-216b1fe4b387', '01a0a687-3883-7a22-8d29-04bca56028f7', 0, 1, NULL, 0, 'order_id', true, NULL, 'long', NULL, NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a0a687-35f4-7dc3-9043-216b1fe4b387', '01a0a687-3883-7a22-8d29-04bca56028f7', 0, 2, NULL, 1, 'amount', false, NULL, 'decimal', '{"scale": 2, "precision": 12}', NULL, NULL, false);
INSERT INTO "public"."schema_field" ("warehouse_id", "tabular_id", "schema_id", "field_id", "parent_field_id", "ordinal", "name", "required", "doc", "type_kind", "type_params", "initial_default", "write_default", "is_identifier") VALUES ('01a0a687-35f4-7dc3-9043-216b1fe4b387', '01a0a687-3883-7a22-8d29-04bca56028f7', 1, 1, NULL, 0, 'order_id', true, NULL, 'long', NULL, NULL, NULL, false);


ALTER TABLE "public"."schema_field" ENABLE TRIGGER ALL;

--
-- Data for Name: secret; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."secret" DISABLE TRIGGER ALL;

INSERT INTO "public"."secret" ("secret_id", "secret", "created_at", "updated_at") VALUES ('1530ede2-b13b-11f1-ad57-6b485e416e40', '\xc30d04090302839409d85bc2037566d2bc01263fa84849c66a5c494f7509cc4508b464e763459f19a9539e21b359fd470b3bc86ae6d39cb64b52d2581a1856ce8ff695758720c4cb4e13d19e159ed91bea57b8587106b8e354b2bd92f2f932090def9fe41deb7eebc574da11032d08aaa29bf2ef551562911f62787c5adf055f0ddb19e6818b3ada01be628d30e3f0d444a0c1cc7fb9a987a5d9c8045d51103f2296a830c0d09e320fb5e4f67026211c9d5f526924d4f5cd77f443d33e5e981a3527267e9b75f8d5bea658498d', '2026-09-15 19:24:34.190318+00', NULL);
INSERT INTO "public"."secret" ("secret_id", "secret", "created_at", "updated_at") VALUES ('15386892-b13b-11f1-b4f4-c78d4497aefb', '\xc30d04090302f2f991d529526aaa64d2bc01f3a42f27bf2dd0934b74b94424ccda0aa70665931ba886e06a29b1b1b1275aa5c5bd36b8651f9b8a9dfdbe4b98823db26aff1d4537272ad84eb4b1b4f5f80a8073cb2f80767f1dba13e1c9ee08955be2ad86463a33f5096a9ffd23392794cb2ce16b3fdfa22ab2b2dc33ecf748488ea67219e09ab87dca5e224859a768a1a0897c7dd3d8de6535260fdd319571f9a61f1c11004f806a89a5f07fc978e6966bd060e0027ecaae2ab7d563c53cdfe9fdc62e4148180cf1b7046748af', '2026-09-15 19:24:34.239339+00', NULL);
INSERT INTO "public"."secret" ("secret_id", "secret", "created_at", "updated_at") VALUES ('153f9b58-b13b-11f1-ad57-1f3fdaf16be0', '\xc30d040903024cf5222b0fa993a869d2bc01acd7d531b37267aeb27688fb4eb221a1bf22f68af8346ab9249c2af4ce4e6f550e8dcb10e03c0f0088893ffc7584eae17b1ce7ee52efb5f6cf18521a135cae91a3328fc09e31e5817e925d471db4cdb19ccaf741c35119aa02c2f29c4b991349c85295041c1f876612aec837923c86ebf42f76f59b541afbfff9dbae2e9b3d201cb4153107dec67c431654e2871b9eaac300b43baa880ac8f84ea2d91ec68ee36a3c8679d199d29a0617a4104012f9f1286ce44219feed044b2e4e', '2026-09-15 19:24:34.287118+00', NULL);


ALTER TABLE "public"."secret" ENABLE TRIGGER ALL;

--
-- Data for Name: server; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."server" DISABLE TRIGGER ALL;

INSERT INTO "public"."server" ("single_row", "server_id", "terms_accepted", "open_for_bootstrap", "created_at", "updated_at") VALUES (true, '01a0a687-2e6a-7862-b0c9-560c73dcdeda', true, false, '2026-09-15 19:24:31.827449+00', '2026-09-15 19:24:34.025808+00');


ALTER TABLE "public"."server" ENABLE TRIGGER ALL;

--
-- Data for Name: table_current_schema; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."table_current_schema" DISABLE TRIGGER ALL;

INSERT INTO "public"."table_current_schema" ("table_id", "schema_id", "created_at", "updated_at", "warehouse_id") VALUES ('01a0a687-3709-7340-86da-ce781af16e68', 0, '2026-09-15 19:24:34.442074+00', NULL, '01a0a687-35f4-7dc3-9043-216b1fe4b387');
INSERT INTO "public"."table_current_schema" ("table_id", "schema_id", "created_at", "updated_at", "warehouse_id") VALUES ('01a0a687-37c0-72c0-a34f-799669fd62c3', 0, '2026-09-15 19:24:34.624351+00', NULL, '01a0a687-35f4-7dc3-9043-216b1fe4b387');
INSERT INTO "public"."table_current_schema" ("table_id", "schema_id", "created_at", "updated_at", "warehouse_id") VALUES ('01a0a687-37d8-75d2-a191-d541aca4d446', 0, '2026-09-15 19:24:34.648629+00', NULL, '01a0a687-35f4-7dc3-9043-216b1fe4b387');
INSERT INTO "public"."table_current_schema" ("table_id", "schema_id", "created_at", "updated_at", "warehouse_id") VALUES ('01a0a687-385a-73b2-a5a1-3a872c7e9ce6', 0, '2026-09-15 19:24:34.779187+00', NULL, '01a0a687-3625-7ae1-a8a7-0f13add8ea74');


ALTER TABLE "public"."table_current_schema" ENABLE TRIGGER ALL;

--
-- Data for Name: table_partition_spec; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."table_partition_spec" DISABLE TRIGGER ALL;

INSERT INTO "public"."table_partition_spec" ("partition_spec_id", "table_id", "partition_spec", "created_at", "updated_at", "warehouse_id") VALUES (0, '01a0a687-3709-7340-86da-ce781af16e68', '{"fields": [{"name": "placed_at_day", "field-id": 1000, "source-id": 2, "transform": "day"}], "spec-id": 0}', '2026-09-15 19:24:34.442074+00', NULL, '01a0a687-35f4-7dc3-9043-216b1fe4b387');
INSERT INTO "public"."table_partition_spec" ("partition_spec_id", "table_id", "partition_spec", "created_at", "updated_at", "warehouse_id") VALUES (0, '01a0a687-37c0-72c0-a34f-799669fd62c3', '{"fields": [], "spec-id": 0}', '2026-09-15 19:24:34.624351+00', NULL, '01a0a687-35f4-7dc3-9043-216b1fe4b387');
INSERT INTO "public"."table_partition_spec" ("partition_spec_id", "table_id", "partition_spec", "created_at", "updated_at", "warehouse_id") VALUES (0, '01a0a687-37d8-75d2-a191-d541aca4d446', '{"fields": [], "spec-id": 0}', '2026-09-15 19:24:34.648629+00', NULL, '01a0a687-35f4-7dc3-9043-216b1fe4b387');
INSERT INTO "public"."table_partition_spec" ("partition_spec_id", "table_id", "partition_spec", "created_at", "updated_at", "warehouse_id") VALUES (0, '01a0a687-385a-73b2-a5a1-3a872c7e9ce6', '{"fields": [], "spec-id": 0}', '2026-09-15 19:24:34.779187+00', NULL, '01a0a687-3625-7ae1-a8a7-0f13add8ea74');


ALTER TABLE "public"."table_partition_spec" ENABLE TRIGGER ALL;

--
-- Data for Name: table_default_partition_spec; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."table_default_partition_spec" DISABLE TRIGGER ALL;

INSERT INTO "public"."table_default_partition_spec" ("table_id", "partition_spec_id", "created_at", "updated_at", "warehouse_id") VALUES ('01a0a687-3709-7340-86da-ce781af16e68', 0, '2026-09-15 19:24:34.442074+00', NULL, '01a0a687-35f4-7dc3-9043-216b1fe4b387');
INSERT INTO "public"."table_default_partition_spec" ("table_id", "partition_spec_id", "created_at", "updated_at", "warehouse_id") VALUES ('01a0a687-37c0-72c0-a34f-799669fd62c3', 0, '2026-09-15 19:24:34.624351+00', NULL, '01a0a687-35f4-7dc3-9043-216b1fe4b387');
INSERT INTO "public"."table_default_partition_spec" ("table_id", "partition_spec_id", "created_at", "updated_at", "warehouse_id") VALUES ('01a0a687-37d8-75d2-a191-d541aca4d446', 0, '2026-09-15 19:24:34.648629+00', NULL, '01a0a687-35f4-7dc3-9043-216b1fe4b387');
INSERT INTO "public"."table_default_partition_spec" ("table_id", "partition_spec_id", "created_at", "updated_at", "warehouse_id") VALUES ('01a0a687-385a-73b2-a5a1-3a872c7e9ce6', 0, '2026-09-15 19:24:34.779187+00', NULL, '01a0a687-3625-7ae1-a8a7-0f13add8ea74');


ALTER TABLE "public"."table_default_partition_spec" ENABLE TRIGGER ALL;

--
-- Data for Name: table_sort_order; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."table_sort_order" DISABLE TRIGGER ALL;

INSERT INTO "public"."table_sort_order" ("sort_order_id", "table_id", "sort_order", "created_at", "updated_at", "warehouse_id") VALUES (1, '01a0a687-3709-7340-86da-ce781af16e68', '{"fields": [{"direction": "asc", "source-id": 1, "transform": "identity", "null-order": "nulls-first"}], "order-id": 1}', '2026-09-15 19:24:34.442074+00', NULL, '01a0a687-35f4-7dc3-9043-216b1fe4b387');
INSERT INTO "public"."table_sort_order" ("sort_order_id", "table_id", "sort_order", "created_at", "updated_at", "warehouse_id") VALUES (0, '01a0a687-37c0-72c0-a34f-799669fd62c3', '{"fields": [], "order-id": 0}', '2026-09-15 19:24:34.624351+00', NULL, '01a0a687-35f4-7dc3-9043-216b1fe4b387');
INSERT INTO "public"."table_sort_order" ("sort_order_id", "table_id", "sort_order", "created_at", "updated_at", "warehouse_id") VALUES (0, '01a0a687-37d8-75d2-a191-d541aca4d446', '{"fields": [], "order-id": 0}', '2026-09-15 19:24:34.648629+00', NULL, '01a0a687-35f4-7dc3-9043-216b1fe4b387');
INSERT INTO "public"."table_sort_order" ("sort_order_id", "table_id", "sort_order", "created_at", "updated_at", "warehouse_id") VALUES (0, '01a0a687-385a-73b2-a5a1-3a872c7e9ce6', '{"fields": [], "order-id": 0}', '2026-09-15 19:24:34.779187+00', NULL, '01a0a687-3625-7ae1-a8a7-0f13add8ea74');


ALTER TABLE "public"."table_sort_order" ENABLE TRIGGER ALL;

--
-- Data for Name: table_default_sort_order; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."table_default_sort_order" DISABLE TRIGGER ALL;

INSERT INTO "public"."table_default_sort_order" ("table_id", "sort_order_id", "created_at", "updated_at", "warehouse_id") VALUES ('01a0a687-3709-7340-86da-ce781af16e68', 1, '2026-09-15 19:24:34.442074+00', NULL, '01a0a687-35f4-7dc3-9043-216b1fe4b387');
INSERT INTO "public"."table_default_sort_order" ("table_id", "sort_order_id", "created_at", "updated_at", "warehouse_id") VALUES ('01a0a687-37c0-72c0-a34f-799669fd62c3', 0, '2026-09-15 19:24:34.624351+00', NULL, '01a0a687-35f4-7dc3-9043-216b1fe4b387');
INSERT INTO "public"."table_default_sort_order" ("table_id", "sort_order_id", "created_at", "updated_at", "warehouse_id") VALUES ('01a0a687-37d8-75d2-a191-d541aca4d446', 0, '2026-09-15 19:24:34.648629+00', NULL, '01a0a687-35f4-7dc3-9043-216b1fe4b387');
INSERT INTO "public"."table_default_sort_order" ("table_id", "sort_order_id", "created_at", "updated_at", "warehouse_id") VALUES ('01a0a687-385a-73b2-a5a1-3a872c7e9ce6', 0, '2026-09-15 19:24:34.779187+00', NULL, '01a0a687-3625-7ae1-a8a7-0f13add8ea74');


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

INSERT INTO "public"."table_metadata_log" ("sequence_number", "table_id", "timestamp", "metadata_file", "created_at", "updated_at", "warehouse_id") VALUES (1, '01a0a687-3709-7340-86da-ce781af16e68', 1789500274441, 's3://warehouse/hard/01a0a687-3709-7340-86da-ce781af16e68/metadata/00000-01a0a687-3709-7340-86da-ce8258c93d05.gz.metadata.json', '2026-09-15 19:24:34.546953+00', NULL, '01a0a687-35f4-7dc3-9043-216b1fe4b387');
INSERT INTO "public"."table_metadata_log" ("sequence_number", "table_id", "timestamp", "metadata_file", "created_at", "updated_at", "warehouse_id") VALUES (2, '01a0a687-3709-7340-86da-ce781af16e68', 1789500274000, 's3://warehouse/hard/01a0a687-3709-7340-86da-ce781af16e68/metadata/00001-01a0a687-376e-71c0-a3c4-f406c4e36971.gz.metadata.json', '2026-09-15 19:24:34.598892+00', NULL, '01a0a687-35f4-7dc3-9043-216b1fe4b387');


ALTER TABLE "public"."table_metadata_log" ENABLE TRIGGER ALL;

--
-- Data for Name: table_properties; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."table_properties" DISABLE TRIGGER ALL;

INSERT INTO "public"."table_properties" ("table_id", "key", "value", "created_at", "updated_at", "warehouse_id") VALUES ('01a0a687-3709-7340-86da-ce781af16e68', 'owner', 'analytics', '2026-09-15 19:24:34.442074+00', NULL, '01a0a687-35f4-7dc3-9043-216b1fe4b387');
INSERT INTO "public"."table_properties" ("table_id", "key", "value", "created_at", "updated_at", "warehouse_id") VALUES ('01a0a687-3709-7340-86da-ce781af16e68', 'write.format.default', 'parquet', '2026-09-15 19:24:34.442074+00', NULL, '01a0a687-35f4-7dc3-9043-216b1fe4b387');


ALTER TABLE "public"."table_properties" ENABLE TRIGGER ALL;

--
-- Data for Name: table_refs; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."table_refs" DISABLE TRIGGER ALL;

INSERT INTO "public"."table_refs" ("table_id", "table_ref_name", "snapshot_id", "retention", "created_at", "updated_at", "warehouse_id") VALUES ('01a0a687-3709-7340-86da-ce781af16e68', 'release', 3001, '{"type": "tag", "max-ref-age-ms": 2592000000}', '2026-09-15 19:24:34.598892+00', NULL, '01a0a687-35f4-7dc3-9043-216b1fe4b387');
INSERT INTO "public"."table_refs" ("table_id", "table_ref_name", "snapshot_id", "retention", "created_at", "updated_at", "warehouse_id") VALUES ('01a0a687-3709-7340-86da-ce781af16e68', 'main', 3002, '{"type": "branch", "max-snapshot-age-ms": 604800000, "min-snapshots-to-keep": 2}', '2026-09-15 19:24:34.546953+00', '2026-09-15 19:24:34.598892+00', '01a0a687-35f4-7dc3-9043-216b1fe4b387');


ALTER TABLE "public"."table_refs" ENABLE TRIGGER ALL;

--
-- Data for Name: table_snapshot_log; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."table_snapshot_log" DISABLE TRIGGER ALL;

INSERT INTO "public"."table_snapshot_log" ("sequence_number", "table_id", "snapshot_id", "timestamp", "created_at", "updated_at", "warehouse_id") VALUES (1, '01a0a687-3709-7340-86da-ce781af16e68', 3001, 1789500274000, '2026-09-15 19:24:34.546953+00', NULL, '01a0a687-35f4-7dc3-9043-216b1fe4b387');
INSERT INTO "public"."table_snapshot_log" ("sequence_number", "table_id", "snapshot_id", "timestamp", "created_at", "updated_at", "warehouse_id") VALUES (2, '01a0a687-3709-7340-86da-ce781af16e68', 3002, 1789500275000, '2026-09-15 19:24:34.598892+00', NULL, '01a0a687-35f4-7dc3-9043-216b1fe4b387');


ALTER TABLE "public"."table_snapshot_log" ENABLE TRIGGER ALL;

--
-- Data for Name: table_statistics; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."table_statistics" DISABLE TRIGGER ALL;

INSERT INTO "public"."table_statistics" ("snapshot_id", "table_id", "statistics_path", "file_size_in_bytes", "file_footer_size_in_bytes", "key_metadata", "blob_metadata", "created_at", "updated_at", "warehouse_id") VALUES (3002, '01a0a687-3709-7340-86da-ce781af16e68', 's3://warehouse/hard/sales/eu/orders/metadata/stats-3002.puffin', 1024, 64, NULL, '[{"type": "apache-datasketches-theta-v1", "fields": [1], "snapshot-id": 3002, "sequence-number": 2}]', '2026-09-15 19:24:34.598892+00', NULL, '01a0a687-35f4-7dc3-9043-216b1fe4b387');


ALTER TABLE "public"."table_statistics" ENABLE TRIGGER ALL;

--
-- Data for Name: tag; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."tag" DISABLE TRIGGER ALL;

INSERT INTO "public"."tag" ("tag_id", "tag_definition_id", "warehouse_id", "namespace_id", "tabular_id", "field_id", "value", "source", "created_at", "updated_at") VALUES ('01a0a687-3931-7ef2-8284-93aab788471e', '01a0a687-38e5-7fd3-93e5-c324001a596b', '01a0a687-35f4-7dc3-9043-216b1fe4b387', NULL, NULL, NULL, 'platform', 'manual', '2026-09-15 19:24:34.993316+00', NULL);
INSERT INTO "public"."tag" ("tag_id", "tag_definition_id", "warehouse_id", "namespace_id", "tabular_id", "field_id", "value", "source", "created_at", "updated_at") VALUES ('01a0a687-3941-78a1-92cf-e82760979cea', '01a0a687-38f3-72b2-af2b-3a88375e482f', '01a0a687-35f4-7dc3-9043-216b1fe4b387', '01a0a687-36c9-7ce3-9fd6-a72e174f3a27', NULL, NULL, 'gold', 'manual', '2026-09-15 19:24:35.009485+00', NULL);
INSERT INTO "public"."tag" ("tag_id", "tag_definition_id", "warehouse_id", "namespace_id", "tabular_id", "field_id", "value", "source", "created_at", "updated_at") VALUES ('01a0a687-3952-7240-8c5f-8e5676b89ef0', '01a0a687-38d6-7a52-8789-9a40f6bb5cdd', '01a0a687-35f4-7dc3-9043-216b1fe4b387', NULL, '01a0a687-3709-7340-86da-ce781af16e68', NULL, NULL, 'manual', '2026-09-15 19:24:35.02625+00', NULL);
INSERT INTO "public"."tag" ("tag_id", "tag_definition_id", "warehouse_id", "namespace_id", "tabular_id", "field_id", "value", "source", "created_at", "updated_at") VALUES ('01a0a687-3962-7d22-a4d5-0ff673ff9dae', '01a0a687-38f3-72b2-af2b-3a88375e482f', '01a0a687-35f4-7dc3-9043-216b1fe4b387', NULL, '01a0a687-3883-7a22-8d29-04bca56028f7', NULL, 'silver', 'manual', '2026-09-15 19:24:35.042825+00', NULL);
INSERT INTO "public"."tag" ("tag_id", "tag_definition_id", "warehouse_id", "namespace_id", "tabular_id", "field_id", "value", "source", "created_at", "updated_at") VALUES ('01a0a687-3973-74a3-9960-f951965ee0b9', '01a0a687-38e5-7fd3-93e5-c324001a596b', '01a0a687-35f4-7dc3-9043-216b1fe4b387', NULL, '01a0a687-38c7-7452-b0ec-7296574ff1ae', NULL, 'platform', 'manual', '2026-09-15 19:24:35.059543+00', NULL);
INSERT INTO "public"."tag" ("tag_id", "tag_definition_id", "warehouse_id", "namespace_id", "tabular_id", "field_id", "value", "source", "created_at", "updated_at") VALUES ('01a0a687-398e-7f91-a0c4-8290835fc335', '01a0a687-38d6-7a52-8789-9a40f6bb5cdd', '01a0a687-35f4-7dc3-9043-216b1fe4b387', NULL, '01a0a687-3709-7340-86da-ce781af16e68', 8, NULL, 'manual', '2026-09-15 19:24:35.086048+00', NULL);


ALTER TABLE "public"."tag" ENABLE TRIGGER ALL;

--
-- Data for Name: tag_allowed_value; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."tag_allowed_value" DISABLE TRIGGER ALL;

INSERT INTO "public"."tag_allowed_value" ("tag_definition_id", "value", "created_at") VALUES ('01a0a687-38f3-72b2-af2b-3a88375e482f', 'bronze', '2026-09-15 19:24:34.931936+00');
INSERT INTO "public"."tag_allowed_value" ("tag_definition_id", "value", "created_at") VALUES ('01a0a687-38f3-72b2-af2b-3a88375e482f', 'silver', '2026-09-15 19:24:34.931936+00');
INSERT INTO "public"."tag_allowed_value" ("tag_definition_id", "value", "created_at") VALUES ('01a0a687-38f3-72b2-af2b-3a88375e482f', 'gold', '2026-09-15 19:24:34.931936+00');


ALTER TABLE "public"."tag_allowed_value" ENABLE TRIGGER ALL;

--
-- Data for Name: task; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."task" DISABLE TRIGGER ALL;

INSERT INTO "public"."task" ("task_id", "warehouse_id", "queue_name", "status", "picked_up_at", "scheduled_for", "attempt", "parent_task_id", "created_at", "updated_at", "task_data", "entity_id", "last_heartbeat_at", "progress", "execution_details", "entity_name", "entity_type", "project_id") VALUES ('01a0a687-356e-7fa0-9998-c1d1d91ca172', NULL, 'task_log_cleanup', 'scheduled', NULL, '2026-09-15 19:24:34.029927+00', 0, NULL, '2026-09-15 19:24:34.029927+00', NULL, '{}', NULL, NULL, 0, NULL, NULL, 'project', '00000000-0000-0000-0000-000000000000');
INSERT INTO "public"."task" ("task_id", "warehouse_id", "queue_name", "status", "picked_up_at", "scheduled_for", "attempt", "parent_task_id", "created_at", "updated_at", "task_data", "entity_id", "last_heartbeat_at", "progress", "execution_details", "entity_name", "entity_type", "project_id") VALUES ('01a0a687-35e6-7bd1-a396-2a4b0a5b34f7', NULL, 'task_log_cleanup', 'scheduled', NULL, '2026-09-15 19:24:34.149758+00', 0, NULL, '2026-09-15 19:24:34.149758+00', NULL, '{}', NULL, NULL, 0, NULL, NULL, 'project', '01a0a687-35e5-7102-9c5f-48460581e971');
INSERT INTO "public"."task" ("task_id", "warehouse_id", "queue_name", "status", "picked_up_at", "scheduled_for", "attempt", "parent_task_id", "created_at", "updated_at", "task_data", "entity_id", "last_heartbeat_at", "progress", "execution_details", "entity_name", "entity_type", "project_id") VALUES ('01a0a687-384a-7823-9466-c9e0d4092b0c', '01a0a687-35f4-7dc3-9043-216b1fe4b387', 'tabular_purge', 'scheduled', NULL, '2026-09-15 19:24:34.754171+00', 0, NULL, '2026-09-15 19:24:34.754171+00', NULL, '{"tabular_location": "s3://warehouse/hard/01a0a687-3823-7910-8306-3930c1690573"}', '01a0a687-3823-7910-8306-3930c1690573', NULL, 0, NULL, '{logs,scratch}', 'table', '00000000-0000-0000-0000-000000000000');
INSERT INTO "public"."task" ("task_id", "warehouse_id", "queue_name", "status", "picked_up_at", "scheduled_for", "attempt", "parent_task_id", "created_at", "updated_at", "task_data", "entity_id", "last_heartbeat_at", "progress", "execution_details", "entity_name", "entity_type", "project_id") VALUES ('01a0a687-3874-7963-a81e-f53e427f7220', '01a0a687-3625-7ae1-a8a7-0f13add8ea74', 'soft_deletion', 'scheduled', NULL, '2026-09-16 19:24:34.804793+00', 0, NULL, '2026-09-15 19:24:34.804717+00', NULL, '{"deletion_kind": "purge"}', '01a0a687-385a-73b2-a5a1-3a872c7e9ce6', NULL, 0, NULL, '{staging,retired}', 'table', '00000000-0000-0000-0000-000000000000');


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

INSERT INTO "public"."view_properties" ("view_id", "key", "value", "created_at", "updated_at", "warehouse_id") VALUES ('01a0a687-3883-7a22-8d29-04bca56028f7', 'owner', 'analytics', '2026-09-15 19:24:34.85539+00', NULL, '01a0a687-35f4-7dc3-9043-216b1fe4b387');


ALTER TABLE "public"."view_properties" ENABLE TRIGGER ALL;

--
-- Data for Name: view_representation; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."view_representation" DISABLE TRIGGER ALL;

INSERT INTO "public"."view_representation" ("view_representation_id", "view_version_id", "view_id", "typ", "sql", "dialect", "created_at", "updated_at", "warehouse_id") VALUES ('15979eac-b13b-11f1-943b-fb28edb553eb', 2, '01a0a687-3883-7a22-8d29-04bca56028f7', 'sql', 'SELECT order_id FROM orders', 'spark', '2026-09-15 19:24:34.85539+00', NULL, '01a0a687-35f4-7dc3-9043-216b1fe4b387');
INSERT INTO "public"."view_representation" ("view_representation_id", "view_version_id", "view_id", "typ", "sql", "dialect", "created_at", "updated_at", "warehouse_id") VALUES ('1597a01e-b13b-11f1-943b-bf7c0e475784', 2, '01a0a687-3883-7a22-8d29-04bca56028f7', 'sql', 'SELECT order_id FROM orders', 'trino', '2026-09-15 19:24:34.85539+00', NULL, '01a0a687-35f4-7dc3-9043-216b1fe4b387');
INSERT INTO "public"."view_representation" ("view_representation_id", "view_version_id", "view_id", "typ", "sql", "dialect", "created_at", "updated_at", "warehouse_id") VALUES ('1597a0b4-b13b-11f1-943b-57d885197e3c', 1, '01a0a687-3883-7a22-8d29-04bca56028f7', 'sql', 'SELECT order_id, amount FROM orders', 'spark', '2026-09-15 19:24:34.85539+00', NULL, '01a0a687-35f4-7dc3-9043-216b1fe4b387');
INSERT INTO "public"."view_representation" ("view_representation_id", "view_version_id", "view_id", "typ", "sql", "dialect", "created_at", "updated_at", "warehouse_id") VALUES ('1597a122-b13b-11f1-943b-afe85436d73e', 1, '01a0a687-3883-7a22-8d29-04bca56028f7', 'sql', 'SELECT order_id, amount FROM orders', 'trino', '2026-09-15 19:24:34.85539+00', NULL, '01a0a687-35f4-7dc3-9043-216b1fe4b387');


ALTER TABLE "public"."view_representation" ENABLE TRIGGER ALL;

--
-- Data for Name: view_version_log; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."view_version_log" DISABLE TRIGGER ALL;

INSERT INTO "public"."view_version_log" ("view_id", "version_id", "timestamp", "created_at", "updated_at", "warehouse_id") VALUES ('01a0a687-3883-7a22-8d29-04bca56028f7', 1, '2026-09-15 19:24:34.82+00', '2026-09-15 19:24:34.85539+00', NULL, '01a0a687-35f4-7dc3-9043-216b1fe4b387');
INSERT INTO "public"."view_version_log" ("view_id", "version_id", "timestamp", "created_at", "updated_at", "warehouse_id") VALUES ('01a0a687-3883-7a22-8d29-04bca56028f7', 2, '2026-09-15 19:24:34+00', '2026-09-15 19:24:34.85539+00', NULL, '01a0a687-35f4-7dc3-9043-216b1fe4b387');


ALTER TABLE "public"."view_version_log" ENABLE TRIGGER ALL;

--
-- Data for Name: warehouse_statistics; Type: TABLE DATA; Schema: public; Owner: -
--

ALTER TABLE "public"."warehouse_statistics" DISABLE TRIGGER ALL;

INSERT INTO "public"."warehouse_statistics" ("warehouse_id", "number_of_views", "number_of_tables", "timestamp", "created_at", "updated_at") VALUES ('01a0a687-365e-7763-8d7b-3d04e220f881', 0, 0, '2026-09-15 19:00:01+00', '2026-09-15 19:24:34.286947+00', NULL);
INSERT INTO "public"."warehouse_statistics" ("warehouse_id", "number_of_views", "number_of_tables", "timestamp", "created_at", "updated_at") VALUES ('01a0a687-3625-7ae1-a8a7-0f13add8ea74', 0, 1, '2026-09-15 19:00:01+00', '2026-09-15 19:24:34.238805+00', '2026-09-15 19:24:34.779187+00');
INSERT INTO "public"."warehouse_statistics" ("warehouse_id", "number_of_views", "number_of_tables", "timestamp", "created_at", "updated_at") VALUES ('01a0a687-35f4-7dc3-9043-216b1fe4b387', 1, 3, '2026-09-15 19:00:01+00', '2026-09-15 19:24:34.189859+00', '2026-09-15 19:24:34.819861+00');


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

\unrestrict fhfWP5UYqsxPtZ7XRnzqWMSdOe2PZimh9hz3JSr4zc6RrCrOXheJ11rVVk7245T

