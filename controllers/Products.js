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

    if (!product_name || !barcode || !price || !type_id || !supplier_id) {
        return res.status(400).send({
            message: "Product name, barcode, price, type and supplier are required.",
            isError: true
        });
    }

    try {
        // Validate foreign keys
        const typeExists = await db.product_types.findOne({ where: { type_id } });
        const supplierExists = await db.suppliers.findOne({ where: { supplier_id } });

        if (!typeExists) {
            return res.status(400).send({
                message: "Invalid product type selected.",
                isError: true
            });
        }

        if (!supplierExists) {
            return res.status(400).send({
                message: "Invalid supplier selected.",
                isError: true
            });
        }

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
            include: [
                {
                    model: db.product_types,
                    as: "type",
                    attributes: ["type_name"]
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
            message: "Products fetched successfully"
        });

    } catch (error) {
        return res.status(500).send({
            message: error.message || "Error retrieving products",
            isError: true
        });
    }
};


// =============================
// GET PRODUCT BY ID WITH JOIN (type + supplier)
// =============================
exports.getById = async (req, res) => {
    const { id } = req.params;

    try {
        const data = await Product.findOne({
            where: { product_id: id },
            include: [
                {
                    model: db.product_types,
                    as: "type",
                    attributes: ["type_name"]
                },
                {
                    model: db.suppliers,
                    as: "supplier",
                    attributes: ["supplier_name", "phone"]
                }
            ]
        });

        if (!data) {
            return res.status(404).send({
                message: "Product not found",
                isError: true
            });
        }

        return res.status(200).send({
            data,
            isError: false,
            message: "Product fetched successfully"
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
        const product = await Product.findOne({
            where: { product_id: id }
        });

        if (!product) {
            return res.status(404).send({
                message: "Product not found",
                isError: true
            });
        }

        await product.update({
            product_name,
            type_id,
            supplier_id,
            barcode,
            uom_id,
            price,
            updated_at: new Date()
        });

        return res.status(200).send({
            message: "Product updated successfully!",
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
    const deleteRelated = req.query.delete_related === "true"; // optional flag

    try {
        const product = await Product.findOne({
            where: { product_id: id }
        });

        if (!product) {
            return res.status(404).send({
                message: "Product not found",
                isError: true
            });
        }

        // Delete product
        await Product.destroy({
            where: { product_id: id }
        });

        // OPTIONAL: Delete related type + supplier
        if (deleteRelated) {
            if (product.type_id) {
                await db.product_types.destroy({
                    where: { type_id: product.type_id }
                });
            }

            if (product.supplier_id) {
                await db.suppliers.destroy({
                    where: { supplier_id: product.supplier_id }
                });
            }
        }

        return res.status(200).send({
            message: deleteRelated
                ? "Product and related info deleted successfully!"
                : "Product deleted successfully",
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

