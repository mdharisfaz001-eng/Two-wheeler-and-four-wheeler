
import 'dotenv/config';
import app from './app.js';
import { pool } from './db.js';

const PORT = process.env.PORT || 5000;

try {
  await pool.query('SELECT 1');
  console.log('Connected to MySQL');

  app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
  });
} catch (error) {
  console.error('Database connection failed:', error.message);
  process.exit(1);
}
