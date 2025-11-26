/**
 * Created by Christos Ploutarchou
 * Project : node_rest_api_with_mysql
 * Filename : server.js
 * Date: 03/04/2020
 * Time: 12:22
 **/

const express = require("express");
const http = require("http");
const { Server } = require("socket.io");
const bodyParser = require("body-parser");
const cors = require("cors");
const db = require("./models");

const server = express();

// CORS settings
const corsSettings = {
  origin: "*", // fixed key name: "origin" (not "originL")
  methods: ["GET", "POST", "PUT", "DELETE"],
  allowedHeaders: ['Content-Type', 'Authorization'],
  credentials: true
};

// Apply middleware
server.use(cors(corsSettings));
server.use(bodyParser.json());
server.use(bodyParser.urlencoded({ extended: true }));

// Create HTTP server & attach Socket.IO
const httpServer = http.createServer(server);
const io = new Server(httpServer, {
  cors: {
    origin: "http://localhost:8081",
    methods: ["GET", "POST", "PUT", "DELETE"]
  }
});

// Make Socket.IO available to controllers
server.set("io", io);

// Socket event listeners
io.on("connection", (socket) => {
  console.log(`Socket connected: ${socket.id}`);

  socket.on("disconnect", () => {
    console.log(`Socket disconnected: ${socket.id}`);
  });
});

// Import routes
const api = require("./routes/index");
server.use("/", api);

// Sequelize sync
db.databaseConf.sync();

// Start server
const PORT = process.env.PORT || 8080;
httpServer.listen(PORT, () => {
  console.log(`Server running on port: ${PORT}`);
});
