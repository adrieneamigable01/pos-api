module.exports = (database, Sequelize) => {
    return database.define("users", {
        user_id: {
            type: Sequelize.STRING,
            allowNull: false,
            primaryKey: true,
            unique: true
        },
        username: {
            type: Sequelize.STRING,
            allowNull: false,
            unique: true 
        },
        password: {
            type: Sequelize.STRING,
            allowNull: false
        },
        user_type: {
            type: Sequelize.STRING, 
            allowNull: false
        },
        created_at: {
            type: Sequelize.DATE,
            defaultValue: Sequelize.NOW
        }
    }, {
        timestamps: false,
        tableName: 'users'
    });
};