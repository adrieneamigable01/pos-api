module.exports = (database, Sequelize) => {
    return database.define("product_types", {
        type_id: {
            type: Sequelize.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        type_name: {
            type: Sequelize.STRING,
            allowNull: false
        },
        description: {
            type: Sequelize.STRING,
            allowNull: true
        },
    }, 
    {
        timestamps: false
    });
}
