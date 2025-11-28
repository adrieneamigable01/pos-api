module.exports = (database, Sequelize) => {
    return database.define("suppliers", {
        supplier_id: {
            type: Sequelize.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        supplier_name: {
            type: Sequelize.STRING,
            allowNull: false
        },
        contact_person: {
            type: Sequelize.STRING,
            allowNull: false
        },
        phone: {
            type: Sequelize.STRING,
            allowNull: false
        },
        address: {
            type: Sequelize.STRING,
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