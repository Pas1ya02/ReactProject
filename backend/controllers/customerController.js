const db = require('../config/db');

exports.registerCustomer = (req, res) => {
  const { mobile, name, age } = req.body;
  if (!mobile || !name || !age) {
    return res.status(400).json({ message: 'All fields are required' });
  }

  const query = 'INSERT INTO `customer` (`mobile`, `name`, `age`) VALUES (?, ?, ?)';
  db.query(query, [mobile, name, age], (err, results) => {
    if (err) {
      return res.status(500).json({ message: 'Registration failed', error: err.message });
    }
    res.status(201).json({ message: 'Customer registered successfully', customerId: results.insertId });
  });
};
