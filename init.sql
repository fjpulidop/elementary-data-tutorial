CREATE TABLE public.users_info (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO public.users_info (username, password, email) VALUES ('user_one', 'password1', 'user1@example.com');
INSERT INTO public.users_info (username, password, email) VALUES ('user2', 'password2', 'user2@example.com');
