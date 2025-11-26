const db = require("../models");
const categoriesObj = db.categories;
const Op = db.Sequelize.Op;

// =============================
// CREATE CATEGORY
// =============================
exports.create = async (req, res) => {
    const { type_name, description } = req.body;

    if (!type_name) {
        return res.status(400).send({
            message: "Category name is required.",
            isError: true
        });
    }

    try {
        const newCategory = await categoriesObj.create({
            type_name,
            description,
            created_at: new Date()
        });

        return res.status(201).send({
            message: "Category created successfully!",
            data: newCategory,
            isError: false
        });

    } catch (error) {
        return res.status(500).send({
            message: error.message || "Error creating category",
            isError: true
        });
    }
};

// =============================
// GET ALL CATEGORIES
// =============================
exports.getAll = async (req, res) => {
    try {
        const data = await categoriesObj.findAll({
            order: [["type_id", "ASC"]]
        });

        return res.status(200).send({
            data,
            isError: false,
            message: "Success fetching categories"
        });
    } catch (error) {
        return res.status(500).send({
            message: error.message || "Error retrieving categories",
            isError: true
        });
    }
};

// =============================
// GET CATEGORY BY ID
// =============================
exports.getById = async (req, res) => {
    const { id } = req.params;

    try {
        const data = await categoriesObj.findOne({
            where: { type_id: id }
        });

        if (!data) {
            return res.status(404).send({
                message: "Category not found",
                isError: true
            });
        }

        return res.status(200).send({
            data,
            isError: false
        });

    } catch (error) {
        return res.status(500).send({
            message: error.message || "Error retrieving category",
            isError: true
        });
    }
};

// =============================
// UPDATE CATEGORY
// =============================
exports.update = async (req, res) => {
    const { id } = req.params;
    const { type_name, description } = req.body;

    try {
        const [updated] = await categoriesObj.update(
            { type_name, description },
            { where: { type_id: id } }
        );

        if (updated === 0) {
            return res.status(404).send({
                message: "Category not found",
                isError: true
            });
        }

        return res.status(200).send({
            message: "Category updated successfully",
            isError: false
        });

    } catch (error) {
        return res.status(500).send({
            message: error.message || "Error updating category",
            isError: true
        });
    }
};

// =============================
// DELETE CATEGORY
// =============================
exports.delete = async (req, res) => {
    const { id } = req.params;

    try {
        const deleted = await categoriesObj.destroy({
            where: { type_id: id }
        });

        if (!deleted) {
            return res.status(404).send({
                message: "Category not found",
                isError: true
            });
        }

        return res.status(200).send({
            message: "Category deleted successfully",
            isError: false
        });

    } catch (error) {
        return res.status(500).send({
            message: error.message || "Error deleting category",
            isError: true
        });
    }
};


exports.deleteById = async (req, res) => {
    const { id } = req.params;

    try {
        const deleted = await categoriesObj.destroy({
            where: { type_id: id }
        });

        if (!deleted) {
            return res.status(404).send({
                message: "Category not found",
                isError: true
            });
        }

        return res.status(200).send({
            message: "Category deleted successfully",
            isError: false
        });

    } catch (error) {
        return res.status(500).send({
            message: error.message || "Error deleting category",
            isError: true
        });
    }
};


