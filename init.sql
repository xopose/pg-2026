CREATE SCHEMA IF NOT EXISTS catalog;
ALTER DATABASE inventorydb SET search_path to catalog, public;
CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE
);
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    sku VARCHAR(30) NOT NULL UNIQUE,
    name TEXT NOT NULL,
    price DECIMAL(12, 2) NOT NULL,
    category_id INTEGER NOT NULL REFERENCES categories(id) ON DELETE RESTRICT
);
CREATE TABLE warehouses (
    id SERIAL PRIMARY KEY,
    city TEXT NOT NULL,
    address TEXT NOT NULL,
    label TEXT,
    is_central BOOLEAN DEFAULT FALSE NOT NULL
);
CREATE UNIQUE INDEX idx_warehouses_central_unique
ON warehouses (is_central)
WHERE is_central = TRUE;