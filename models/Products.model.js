module.exports = (database, Sequelize) => {
    return database.define("products", {
        product_id: {
            type: Sequelize.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        product_name: {
            type: Sequelize.STRING(100), 
            allowNull: false
        },
        type_id: {
            type: Sequelize.INTEGER,
            allowNull: true
        },
        supplier_id: {
            type: Sequelize.INTEGER,
            allowNull: true
        },
        barcode: {
            type: Sequelize.STRING(100),
            allowNull: false
        },
        uom_id: {
            type: Sequelize.INTEGER,
            allowNull: true
        },
        price: {
            type: Sequelize.DOUBLE,  
            allowNull: false
        },
        created_at: {
            type: Sequelize.DATE,     
            allowNull: false,
            defaultValue: Sequelize.NOW
        },
    }, 
    {
        timestamps: false
    });
}
