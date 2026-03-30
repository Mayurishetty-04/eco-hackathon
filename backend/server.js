const express = require('express');
const dotenv = require('dotenv');

// Load environment variables from .env
dotenv.config();

const app = express();
const PORT = process.env.PORT || 5000;

// Parse incoming JSON requests
app.use(express.json());

// ── Test Route ────────────────────────────────────────────────
app.get('/', (req, res) => {
  res.send('Server running');
});

// ── Start Server ──────────────────────────────────────────────
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
