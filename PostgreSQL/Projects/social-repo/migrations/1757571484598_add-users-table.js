/**
 * @type {import('node-pg-migrate').ColumnDefinitions | undefined}
 */
export const shorthands = undefined;

/**
 * @param pgm {import('node-pg-migrate').MigrationBuilder}
 * @param run {() => void | undefined}
 * @returns {Promise<void> | void}
 */
export const up = (pgm) => {
    pgm.sql(`
        create table users(
        id serial primary key, 
        created_at Timestamp with time zone default current_timestamp,
        updated_at Timestamp with time zone default current_timestamp,
        bio varchar(400),
        username varchar(30) not null
        );
        `);
};

/**
 * @param pgm {import('node-pg-migrate').MigrationBuilder}
 * @param run {() => void | undefined}
 * @returns {Promise<void> | void}
 */
export const down = (pgm) => {
      pgm.sql(`
        Drop table users;
        `);
};
