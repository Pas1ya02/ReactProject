// backend/routes/productRoutes.js
const express = require('express');
const { searchProduct, updateOrder } = require('../controllers/productController');

const router = express.Router();

router.get('/search', searchProduct);
router.post('/order', updateOrder);

module.exports = router;
