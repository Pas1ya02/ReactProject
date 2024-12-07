
import React, { useState } from 'react';
import axios from 'axios';

function OrderManagement() {
  const [searchTerm, setSearchTerm] = useState('');
  const [amount, setAmount] = useState('');
  const [product, setProduct] = useState(null);
  const [orderDetails, setOrderDetails] = useState(null);

  const handleSearch = async () => {
    try {
      const response = await axios.get(`http://localhost:5000/api/products/search?term=${searchTerm}`);
      setProduct(response.data);
    } catch (error) {
      console.error('Error fetching product:', error);
      setProduct(null);
    }
  };

  const handleUpdate = async () => {
    if (!product || !amount) return;

    try {
      const response = await axios.post('http://localhost:5000/api/products/order', {
        product_code: product.product_code,
        amount: parseFloat(amount),
        quantity: 2,
      });
      setOrderDetails(response.data);
    } catch (error) {
      console.error('Error updating order:', error);
    }
  };

  return (
    <div className="max-w-lg mx-auto bg-white p-6 shadow-md rounded-md">
      <h2 className="text-2xl font-bold mb-4 text-center">Order Form</h2>

      <div className="flex flex-col sm:flex-row items-center gap-4 mb-4">
        <input
          type="text"
          placeholder="Search for product"
          className="border p-2 w-full rounded"
          value={searchTerm}
          onChange={(e) => setSearchTerm(e.target.value)}
        />
        <button className="bg-blue-500 text-white px-4 py-2 rounded w-full sm:w-auto" onClick={handleSearch}>
          Search
        </button>
      </div>

      {product && (
        <div className="mb-4 border p-4 rounded bg-gray-50">
          <p><strong>Product Name:</strong> {product.product_name}</p>
          <p><strong>Unit Price:</strong> {product.unit_price} LKR</p>
        </div>
      )}

      <div className="flex flex-col sm:flex-row items-center gap-4 mb-4">
        <input
          type="number"
          placeholder="Enter amount"
          className="border p-2 w-full rounded"
          value={amount}
          onChange={(e) => setAmount(e.target.value)}
        />
        <button className="bg-green-500 text-white px-4 py-2 rounded w-full sm:w-auto" onClick={handleUpdate}>
          Update Order
        </button>
      </div>

      {orderDetails && (
        <div className="mt-4 border p-4 rounded bg-green-50">
          <p className="text-green-700"><strong>Order Updated Successfully!</strong></p>
          <p><strong>Total Amount:</strong> {orderDetails.total_amount} LKR</p>
          <p><strong>Quantity:</strong> {orderDetails.quantity}</p>
        </div>
      )}
    </div>
  );
}




export default OrderManagement;
