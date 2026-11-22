-- SALES
-- customer_id is nullable because it may be empty.
CREATE TABLE sales (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    customer_id INTEGER,
    payment_method VARCHAR(30) NOT NULL,
    total INTEGER NOT NULL CHECK (total >= 0),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

-- SALE_ITEMS
CREATE TABLE sale_items (
    id INTEGER PRIMARY KEY,
    sale_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    unit_price INTEGER NOT NULL CHECK (unit_price >= 0),
    unit_cost INTEGER NOT NULL CHECK (unit_cost >= 0),
    FOREIGN KEY (sale_id) REFERENCES sales(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);
