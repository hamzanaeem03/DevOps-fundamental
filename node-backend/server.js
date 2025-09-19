// server.js
import express from "express";

const app = express();
const PORT = process.env.PORT || 3000;

app.use(express.json());

// Simple in-memory data store
let items = [];
let idCounter = 1;

// ✅ Get all items
app.get("/items", (req, res) => {
  res.json(items);
});

// ✅ Add an item
app.post("/items", (req, res) => {
  const { name } = req.body;
  if (!name) {
    return res.status(400).json({ error: "Name is required" });
  }
  const newItem = { id: idCounter++, name };
  items.push(newItem);
  res.status(201).json(newItem);
});

// ✅ Delete an item by ID
app.delete("/items/:id", (req, res) => {
  const id = parseInt(req.params.id, 10);
  const index = items.findIndex(item => item.id === id);

  if (index === -1) {
    return res.status(404).json({ error: "Item not found" });
  }

  const deleted = items.splice(index, 1);
  res.json({ message: "Item deleted", deleted });
});

// Start server
app.listen(PORT, () => {
  console.log(`🚀 Server running at http://localhost:${PORT}`);
});
