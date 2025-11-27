module.exports = (database, Sequelize) => {
    return database.define("items", {
        item_id: {
            type: Sequelize.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        category_id: {
            type: Sequelize.INTEGER,
            primaryKey: false,
        },
        item_name: {
            type: Sequelize.STRING,
            allowNull: false
        },
        created_at: {
            type: Sequelize.DATE,  // ✔ MATCHES MySQL TIMESTAMP
            defaultValue: Sequelize.NOW
        }
    }, 
    {
        timestamps: false
    });
}
