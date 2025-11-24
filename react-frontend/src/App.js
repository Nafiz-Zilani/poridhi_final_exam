import React, { useEffect, useState } from "react";
import { fetchUsers, createUser, updateUser, deleteUser } from "./api";
import UserForm from "./components/UserForm";
import UserList from "./components/UserList";

export default function App() {
  const [users, setUsers] = useState([]);
  const [editing, setEditing] = useState(null);

  async function load() {
    setUsers(await fetchUsers());
  }

  useEffect(() => { load(); }, []);

  const submit = async (data) => {
    if (editing) {
      await updateUser(editing.id, data);
      setEditing(null);
    } else {
      await createUser(data);
    }
    load();
  };

  return (
    <div style={{ padding: 20 }}>
      <h1>User Management</h1>
      <UserForm onSubmit={submit} initial={editing} />
      <UserList users={users} onEdit={setEditing} onDelete={async (id) => { await deleteUser(id); load(); }} />
    </div>
  );
}
