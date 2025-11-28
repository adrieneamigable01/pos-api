// Suppliers.js

const db = require("../models");
const Supplier = db.suppliers;

// =============================
// CREATE SUPPLIER
// =============================
exports.create = async (req, res) => {
    const {
        supplier_name,
        contact_person,
        phone,
        address
    } = req.body;

    // Validation
    if (!supplier_name || !contact_person || !phone || !address) {
        return res.status(400).send({
            message: "All fields are required.",
            isError: true
        });
    }

    try {
        const newSupplier = await Supplier.create({
            supplier_name,
            contact_person,
            phone,
            address,
            created_at: new Date()
        });

        return res.status(201).send({
            message: "Supplier created successfully!",
            data: newSupplier,
            isError: false
        });

    } catch (error) {
        return res.status(500).send({
            message: error.message || "Error creating supplier",
            isError: true
        });
    }
};

// =============================
// GET ALL SUPPLIERS
// =============================
exports.getAll = async (req, res) => {
    try {
        const data = await Supplier.findAll({
            order: [["supplier_id", "ASC"]]
        });

        return res.status(200).send({
            data,
            isError: false,
            message: "Success fetching suppliers"
        });

    } catch (error) {
        return res.status(500).send({
            message: error.message || "Error retrieving suppliers",
            isError: true
        });
    }
};

// =============================
// GET SUPPLIER BY ID
// =============================
exports.getById = async (req, res) => {
    const { id } = req.params;

    try {
        const data = await Supplier.findOne({
            where: { supplier_id: id }
        });

        if (!data) {
            return res.status(404).send({
                message: "Supplier not found",
                isError: true
            });
        }

        return res.status(200).send({
            data,
            isError: false
        });

    } catch (error) {
        return res.status(500).send({
            message: error.message || "Error retrieving supplier",
            isError: true
        });
    }
};

// =============================
// UPDATE SUPPLIER
// =============================
exports.update = async (req, res) => {
    const { id } = req.params;
    const {
        supplier_name,
        contact_person,
        phone,
        address
    } = req.body;

    try {
        const [updated] = await Supplier.update(
            {
                supplier_name,
                contact_person,
                phone,
                address
            },
            { where: { supplier_id: id } }
        );

        if (updated === 0) {
            return res.status(404).send({
                message: "Supplier not found",
                isError: true
            });
        }

        return res.status(200).send({
            message: "Supplier updated successfully",
            isError: false
        });

    } catch (error) {
        return res.status(500).send({
            message: error.message || "Error updating supplier",
            isError: true
        });
    }
};

// =============================
// DELETE SUPPLIER
// =============================
exports.delete = async (req, res) => {
    const { id } = req.params;

    try {
        const deleted = await Supplier.destroy({
            where: { supplier_id: id }
        });

        if (!deleted) {
            return res.status(404).send({
                message: "Supplier not found",
                isError: true
            });
        }

        return res.status(200).send({
            message: "Supplier deleted successfully",
            isError: false
        });

    } catch (error) {
        return res.status(500).send({
            message: error.message || "Error deleting supplier",
            isError: true
        });
    }
};

exports.deleteById = exports.delete;
