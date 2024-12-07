import React from 'react';
import CustomerRegister from './components/CustomerRegister';
import OrderManagement from './components/OrderManagement';

function App() {
  return (
    <div className="min-h-screen p-6 bg-gray-200">
      <h1 className="text-4xl font-bold mb-6 text-center">Anura Opticians</h1>
      <CustomerRegister />
      <div className='mt-8'>
      <OrderManagement />
      </div>
   
    </div>
  );
}

export default App;
