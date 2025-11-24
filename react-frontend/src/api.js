const BASE = "http://localhost:8000";

export async function fetchUsers() {
  const res = await fetch(`${BASE}/users/`);
  return res.json();
}

export async function createUser(data) {
  const res = await fetch(`${BASE}/users/`, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(data),
  });
  return res.json();
}

export async function updateUser(id, data) {
  const res = await fetch(`${BASE}/users/${id}`, {
    method: "PUT",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(data),
  });
  return res.json();
}

export async function deleteUser(id) {
  await fetch(`${BASE}/users/${id}`, { method: "DELETE" });
}