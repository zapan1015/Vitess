CREATE TABLE mcl_seq (id bigint, next_id bigint, cache bigint, primary key(id)) comment 'vitess_sequence';
INSERT INTO mcl_seq (id, next_id, cache) VALUES (0, 200000, 100);