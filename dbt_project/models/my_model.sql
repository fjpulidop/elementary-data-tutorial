SELECT
    username
FROM
    {{ source('public', 'users_info') }}

