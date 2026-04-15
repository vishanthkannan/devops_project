const express = require("express");
const path = require("path");

const app = express();
const PORT = 3000;

app.use(express.json());
app.use(express.static(__dirname));

// In-memory room data
let rooms = [
    { id: 101, status: "Available" },
    { id: 102, status: "Occupied" },
    { id: 103, status: "Available" },
    { id: 104, status: "Reserved" },
    { id: 105, status: "Available" }
];

// Routes
app.get("/api/rooms", (req, res) => {
    res.json(rooms);
});

app.post("/api/book/:id", (req, res) => {
    const room = rooms.find(r => r.id == req.params.id);
    if (room && room.status === "Available") {
        room.status = "Occupied";
    }
    res.json(room);
});

app.post("/api/release/:id", (req, res) => {
    const room = rooms.find(r => r.id == req.params.id);
    if (room) {
        room.status = "Available";
    }
    res.json(room);
});

// Metrics endpoint for Prometheus/Grafana
app.get("/metrics", (req, res) => {
    const total = rooms.length;
    const occupied = rooms.filter(r => r.status === "Occupied").length;
    const available = rooms.filter(r => r.status === "Available").length;

    res.set("Content-Type", "text/plain");

    res.send(
`# HELP total_rooms Total number of rooms
# TYPE total_rooms gauge
total_rooms ${total}

# HELP occupied_rooms Number of occupied rooms
# TYPE occupied_rooms gauge
occupied_rooms ${occupied}

# HELP available_rooms Number of available rooms
# TYPE available_rooms gauge
available_rooms ${available}
`
    );
});

app.listen(PORT, "0.0.0.0", () => {
    console.log(`Server running on port ${PORT}`);
});