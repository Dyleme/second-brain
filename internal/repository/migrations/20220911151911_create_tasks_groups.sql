-- +goose Up
-- +goose StatementBegin
CREATE TABLE IF NOT EXISTS tasks_groups (
    id INT GENERATED ALWAYS AS IDENTITY,
    user_id INTEGER,
    group_name varchar(50) NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT fk_user
        FOREIGN KEY(user_id)
            REFERENCES users(id)
            ON DELETE CASCADE
);
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP TABLE tasks_groups;
-- +goose StatementEnd
