-- +goose Up
-- +goose StatementBegin
INSERT INTO tasks_groups (user_id, group_name)
VALUES (1, 'first group'),(1, 'second group');
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DELETE FROM tasks_groups where user_id = 1;
-- +goose StatementEnd
