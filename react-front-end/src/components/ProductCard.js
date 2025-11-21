import React from "react";

export default function ProductCard({ product, qty, setQty }) {
  return (
    <div style={{border: "1px solid #ccc", padding: 12, width: 200}}>
      <h4>{product.name}</h4>
      <p>Price: {product.price}</p>
      <p>Stock: {product.stock}</p>

      <button onClick={() => setQty(Math.max(0, qty - 1))}>-</button>
      <span style={{margin: "0 10px"}}>{qty}</span>
      <button onClick={() => setQty(qty + 1)}>+</button>
    </div>
  );
}
