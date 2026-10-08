SELECT @extschema@._define($def$
CREATE FUNCTION @extschema@._users()
RETURNS TABLE (
    user_id           text,
    name              text,
    email             text,
    user_type         text,
    last_updated_with text,
    deleted_at        timestamptz,
    created_at        timestamptz,
    updated_at        timestamptz
)
LANGUAGE sql STABLE
AS $body$
    SELECT u.id, u.name, u.email, u.user_type::text, u.last_updated_with::text,
           u.deleted_at, u.created_at, u.updated_at
    FROM @lk@.users u
$body$;
$def$);

CREATE VIEW @extschema@.users WITH (security_invoker = true) AS
    SELECT * FROM @extschema@._users();

COMMENT ON VIEW @extschema@.users IS
    'Users known to the catalog. user_id carries the identity provider prefix.';

SELECT @extschema@._define($def$
CREATE FUNCTION @extschema@._role()
RETURNS TABLE (
    role_id     uuid,
    project_id  text,
    name        text,
    description text,
    provider_id text,
    source_id   text,
    ident       text,
    version     bigint,
    created_at  timestamptz,
    updated_at  timestamptz
)
LANGUAGE sql STABLE
AS $body$
    SELECT r.id, r.project_id, r.name, r.description, r.provider_id, r.source_id,
           r.provider_id || '~' || r.source_id, r.version, r.created_at, r.updated_at
    FROM @lk@.role r
$body$;
$def$);

CREATE VIEW @extschema@.role WITH (security_invoker = true) AS
    SELECT * FROM @extschema@._role();

COMMENT ON VIEW @extschema@.role IS
    'Roles. ident is the project-scoped identifier, provider and source id joined by a tilde.';

SELECT @extschema@._define($def$
CREATE FUNCTION @extschema@._role_assignment()
RETURNS TABLE (
    role_id    uuid,
    user_id    text,
    created_at timestamptz
)
LANGUAGE sql STABLE
AS $body$
    SELECT a.role_id, a.user_id, a.created_at
    FROM @lk@.role_assignment a
$body$;
$def$);

CREATE VIEW @extschema@.role_assignment WITH (security_invoker = true) AS
    SELECT * FROM @extschema@._role_assignment();

COMMENT ON VIEW @extschema@.role_assignment IS
    'Direct user memberships in roles.';

SELECT @extschema@._define($def$
CREATE FUNCTION @extschema@._role_membership()
RETURNS TABLE (
    parent_role_id uuid,
    member_role_id uuid,
    created_at     timestamptz
)
LANGUAGE sql STABLE
AS $body$
    SELECT m.parent_role_id, m.member_role_id, m.created_at
    FROM @lk@.role_membership m
$body$;
$def$);

CREATE VIEW @extschema@.role_membership WITH (security_invoker = true) AS
    SELECT * FROM @extschema@._role_membership();

COMMENT ON VIEW @extschema@.role_membership IS
    'Direct role-in-role memberships, one row per edge.';
