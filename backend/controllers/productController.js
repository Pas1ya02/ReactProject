

// Search for a product by name
exports.searchProduct = (req, res) => {
  const { term } = req.query;

  const query = 'SELECT * FROM product WHERE product_name LIKE ? LIMIT 1';
  db.query(query, [`%${term}%`], (err, results) => {
    if (err) return res.status(500).json({ error: 'Database error' });
    if (results.length === 0) return res.status(404).json({ message: 'Product not found' });
    res.json(results[0]);
  });
};

// Update order details
exports.updateOrder = (req, res) => {
  const { product_code, amount, quantity } = req.body;
  const totalAmount = parseFloat(amount);

  const query = 'INSERT INTO order_details (product_code, qty, unit_price, total) VALUES (?, ?, ?, ?)';
  db.query(query, [product_code, quantity, totalAmount / quantity, totalAmount], (err) => {
    if (err) return res.status(500).json({ error: 'Database error' });
    res.json({ message: 'Order updated successfully', total_amount: totalAmount, quantity });
  });
};
