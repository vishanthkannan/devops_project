// Import the express and path modules
const express = require('express');
const path = require('path');

// Create an Express application
const app = express();

// Define the port to run the server on, defaulting to 3000
const PORT = process.env.PORT || 3000;

// 1. Basic Homepage Route
// Sends an HTML file that contains a loading animation before displaying the greeting
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'index.html'));
});

// 2. API Info Route
// Returns a JSON payload with project details and current timestamp
app.get('/api/info', (req, res) => {
  res.json({
    project: 'DevOps Web Application',
    status: 'Running',
    timestamp: new Date().toISOString()
  });
});

// 3. Health Check Route
// Used by DevOps tools (like Docker or Kubernetes) to verify the app is working
app.get('/health', (req, res) => {
  res.send('OK');
});

// Start the app and listen on the specified port
app.listen(PORT, () => {
  console.log(`Server is running and listening on http://localhost:${PORT}`);
});
