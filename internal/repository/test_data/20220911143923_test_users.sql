-- +goose Up
-- +goose StatementBegin
INSERT INTO users (name)
VALUES ('Alkesey');
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DELETE FROM users where name='Aleksey";
-- +goose StatementEnd
