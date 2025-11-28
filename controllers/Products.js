const db = require("../models");
const Product = db.products;

// =============================
// CREATE PRODUCT
// =============================
exports.create = async (req, res) => {
    const {
        product_name,
        type_id,
        supplier_id,
        barcode,
        uom_id,
        price
    } = req.body;

    if (!product_name || !barcode || !price) {
        return res.status(400).send({
            message: "Product name, barcode and price are required.",
            isError: true
        });
    }

    try {
        const newProduct = await Product.create({
            product_name,
            type_id,
            supplier_id,
            barcode,
            uom_id,
            price,
            created_at: new Date()
        });

        return res.status(201).send({
            message: "Product created successfully!",
            data: newProduct,
            isError: false
        });

    } catch (error) {
        return res.status(500).send({
            message: error.message || "Error creating product",
            isError: true
        });
    }
};

// =============================
// GET ALL PRODUCTS
// =============================
exports.getAll = async (req, res) => {
    try {
        const data = await Product.findAll({
            order: [["product_id", "ASC"]]
        });

        return res.status(200).send({
            data,
            isError: false,
            message: "Success fetching products"
        });

    } catch (error) {
        return res.status(500).send({
            message: error.message || "Error retrieving products",
            isError: true
        });
    }
};

// =============================
// GET PRODUCT BY ID
// =============================
exports.getById = async (req, res) => {
    const { id } = req.params;

    try {
        const data = await Product.findOne({
            where: { product_id: id }
        });

        if (!data) {
            return res.status(404).send({
                message: "Product not found",
                isError: true
            });
        }

        return res.status(200).send({
            data,
            isError: false
        });

    } catch (error) {
        return res.status(500).send({
            message: error.message || "Error retrieving product",
            isError: true
        });
    }
};

// =============================
// UPDATE PRODUCT
// =============================
exports.update = async (req, res) => {
    const { id } = req.params;
    const {
        product_name,
        type_id,
        supplier_id,
        barcode,
        uom_id,
        price
    } = req.body;

    try {
        const [updated] = await Product.update(
            {
                product_name,
                type_id,
                supplier_id,
                barcode,
                uom_id,
                price
            },
            { where: { product_id: id } }
        );

        if (updated === 0) {
            return res.status(404).send({
                message: "Product not found",
                isError: true
            });
        }

        return res.status(200).send({
            message: "Product updated successfully",
            isError: false
        });

    } catch (error) {
        return res.status(500).send({
            message: error.message || "Error updating product",
            isError: true
        });
    }
};

// =============================
// DELETE PRODUCT
// =============================
exports.delete = async (req, res) => {
    const { id } = req.params;

    try {
        const deleted = await Product.destroy({
            where: { product_id: id }
        });

        if (!deleted) {
            return res.status(404).send({
                message: "Product not found",
                isError: true
            });
        }

        return res.status(200).send({
            message: "Product deleted successfully",
            isError: false
        });

    } catch (error) {
        return res.status(500).send({
            message: error.message || "Error deleting product",
            isError: true
        });
    }
};

exports.deleteById = exports.delete;


// =============================
// GET PRODUCTS with JOIN (type + supplier)
// =============================
exports.getAllWithDetails = async (req, res) => {
    try {
        const data = await Product.findAll({
            include: [
                {
                    model: db.product_types,
                    as: "type",
                    attributes: ["type_name"] // select what fields you want
                },
                {
                    model: db.suppliers,
                    as: "supplier",
                    attributes: ["supplier_name", "phone"]
                }
            ],
            order: [["product_id", "ASC"]]
        });

        return res.status(200).send({
            data,
            isError: false,
            message: "Products with details fetched successfully"
        });

    } catch (error) {
        return res.status(500).send({
            message: error.message || "Error retrieving products",
            isError: true
        });
    }
};

