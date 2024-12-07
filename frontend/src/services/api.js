import axios from 'axios';

const API_URL = 'http://localhost:5000/api';

export const registerCustomer = (customerData) => {
  return axios.post(`${API_URL}/customers/register`, customerData);
};

export const addOrder = (orderData) => {
  return axios.post(`${API_URL}/orders/add`, orderData);
};

export const deleteOrder = (id) => {
  return axios.delete(`${API_URL}/orders/delete/${id}`);
};

export const searchOrders = (product_code) => {
  return axios.get(`${API_URL}/orders/search`, { params: { product_code } });
};
