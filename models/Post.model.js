// models/Post.model.js

/**
 * Created by Christos Ploutarchou
 * Project : node_rest_api_with_mysql
 * Filename : Post.model.js 
 * Date: 04/04/2020
 * Time: 00:01
 **/
module.exports = (database, Sequelize) => {
    return database.define("post", {
        title: {
            type: Sequelize.STRING,
            allowNull: false 
        },
        description: {
            type: Sequelize.TEXT
        },
        published: {
            type: Sequelize.BOOLEAN,
            defaultValue: false 
        },
        publisher: {
            type: Sequelize.STRING
        }
    });
};