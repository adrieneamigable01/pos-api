/**
 * Created by Christos Ploutarchou
 * Project : node_rest_api_with_mysql
 * Filename : routes.js
 * Date: 05/04/2020
 * Time: 01:45
 **/

const post = require("../controllers/Post");
const employee = require("../controllers/Employee"); // Import the Employee controller
const product_types = require("../controllers/Product_Types");
const auth = require("../controllers/Auth");
const express = require("express");
const router = express.Router();

const verifyToken = require("../middleware/authJwt");

// --- AUTHENTICATION ROUTES ---
router.post("/api/auth/login", auth.login);
router.post("/api/auth/signup", auth.signup);

// --- POST ROUTES ---
router.post("/api/posts/create", post.create);


// FOR EMPLOYEES
router.get(
    "/api/employees/all",
    verifyToken,
    employee.getAllEmployees
);

router.post(
    "/api/employees/create",
    verifyToken,
    employee.create
);

router.put(
    "/api/employees/update",
    verifyToken,
    employee.updateEmployee
);


// FOR CATEGORIES
router.get(
    "/api/categories/all",
    product_types.getAll
)

router.get(
    "/api/categories/category-by-id/:id",
    product_types.getById
)

router.post(
    "/api/categories/add-category",
    product_types.create
)

router.put(
    "/api/categories/update-category/:id",
    product_types.update
)



module.exports = router;