import React, { useState, useEffect } from "react";

export default function UserForm({ onSubmit, initial }) {
  const [form, setForm] = useState({
    first_name: "",
    last_name: "",
    date_of_birth: "",
    phone_no: "",
    email: "",
    address: ""
  });

  useEffect(() => {
    if (initial) setForm(initial);
  }, [initial]);

  const handle = (e) => {
    setForm({ ...form, [e.target.name]: e.target.value });
  };

  return (
    <form onSubmit={(e) => { e.preventDefault(); onSubmit(form); }}>
      <input name="first_name" placeholder="First name" value={form.first_name} onChange={handle} required />
      <input name="last_name" placeholder="Last name" value={form.last_name} onChange={handle} required />
      <input type="date" name="date_of_birth" value={form.date_of_birth} onChange={handle} />
      <input name="phone_no" placeholder="Phone" value={form.phone_no} onChange={handle} />
      <input name="email" placeholder="Email" value={form.email} onChange={handle} />
      <input name="address" placeholder="Address" value={form.address} onChange={handle} />
      <button>Save</button>
    </form>
  );
}