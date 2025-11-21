import React, { useEffect, useState } from "react";
import { fetchProducts, createPurchase } from "./api";
import ProductCard from "./components/ProductCard";

export default function App() {
  const [products, setProducts] = useState([]);
  const [qtys, setQtys] = useState({});
  const [phone, setPhone] = useState("");
  const [name, setName] = useState("");

  useEffect(() => {
    fetchProducts().then(data => {
      setProducts(data);
      const initial = {};
      data.forEach(p => initial[p.id] = 0);
      setQtys(initial);
    });
  }, []);

  const updateQty = (id, v) => setQtys(prev => ({...prev, [id]: v}));

  const purchase = async () => {
    const items = Object.entries(qtys)
      .filter(([id, q]) => q > 0)
      .map(([id, q]) => ({ id: parseInt(id), quantity: q }));

    if (!phone) return alert("Enter phone number");

    const payload = { phone, name, items };
    const res = await createPurchase(payload);

    if (res.receipt_path) {
      const file = res.receipt_path.split("/").pop();
      window.open(`http://localhost:8000/receipt/${file}`);
      alert("Purchase success! Total: " + res.total);
    }
  };

  return (
    <div style={{ padding: 20 }}>
      <h2>Basic Shop</h2>

      <input placeholder="Phone" value={phone} onChange={e => setPhone(e.target.value)} />
      <input placeholder="Name (optional)" value={name} onChange={e => setName(e.target.value)} />

      <div style={{ display: "flex", gap: 10, marginTop: 20 }}>
        {products.map(p => (
          <ProductCard
            key={p.id}
            product={p}
            qty={qtys[p.id] || 0}
            setQty={v => updateQty(p.id, v)}
          />
        ))}
      </div>

      <button style={{ marginTop: 20 }} onClick={purchase}>Purchase</button>
    </div>
  );
}
