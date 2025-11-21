const BASE = "http://localhost:8000";

export async function fetchProducts() {
  const res = await fetch(`${BASE}/products`);
  return res.json();
}

export async function createPurchase(body) {
  const res = await fetch(`${BASE}/purchase`, {
    method: "POST",
    headers: {"Content-Type": "application/json"},
    body: JSON.stringify(body)
  });
  return res.json();
}
