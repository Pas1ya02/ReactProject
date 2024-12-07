import React, { useState } from 'react';
import { registerCustomer } from '../services/api';

const CustomerRegister = () => {
  const [customer, setCustomer] = useState({ mobile: '', name: '', age: '' });

  const handleChange = (e) => {
    setCustomer({ ...customer, [e.target.name]: e.target.value });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      await registerCustomer(customer);
      alert('Customer registered successfully!');
      setCustomer({ mobile: '', name: '', age: '' });
    } catch (error) {
      alert('Registration failed');
    }
  };

  return (
    <div className="max-w-md mx-auto p-6 bg-gray-100 rounded-lg shadow-md">
      <h2 className="text-2xl font-bold mb-4">Register Customer</h2>
      <form onSubmit={handleSubmit}>
        <input
          type="text"
          name="mobile"
          placeholder="Mobile Number"
          value={customer.mobile}
          onChange={handleChange}
          className="w-full p-2 mb-2 border rounded"
        />
        <input
          type="text"
          name="name"
          placeholder="Name"
          value={customer.name}
          onChange={handleChange}
          className="w-full p-2 mb-2 border rounded"
        />
        <input
          type="text"
          name="age"
          placeholder="Age"
          value={customer.age}
          onChange={handleChange}
          className="w-full p-2 mb-4 border rounded"
        />
        <button type="submit" className="w-full bg-blue-500 text-white p-2 rounded">
          Register
        </button>
      </form>
    </div>
  );
};

export default CustomerRegister;
