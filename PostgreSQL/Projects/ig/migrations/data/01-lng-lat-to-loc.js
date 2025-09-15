const pg = require('pg');

const pool = new pg.Pool({
  host: 'localhost',
  port: 5432,
  database: 'socialnetwork',
  user: 'postgres',
  password: 'password',
});

pool.query(`
  update posts
  set loc = point(lng , lat)
  where loc is null;
`)
.then(() => {
    console.log('Update Complete');
    pool.end();
})
.catch ((err) => console.error(err.messge));
