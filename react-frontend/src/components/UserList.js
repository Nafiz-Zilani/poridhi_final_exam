import React from "react";

export default function UserList({ users, onEdit, onDelete }) {
  return (
    <div>
      {users.map((u) => (
        <div key={u.id} style={{ border: "1px solid #ccc", padding: 8, marginBottom: 8 }}>
          <strong>{u.first_name} {u.last_name}</strong>
          <div>Email: {u.email}</div>
          <div>Phone: {u.phone_no}</div>
          <div>DOB: {u.date_of_birth}</div>
          <div>Address: {u.address}</div>
          <button onClick={() => onEdit(u)}>Edit</button>
          <button onClick={() => onDelete(u.id)}>Delete</button>
        </div>
      ))}
    </div>
  );
}