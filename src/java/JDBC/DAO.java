/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package JDBC;

import Model.Product_Category;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author LENOVO
 */
public class DAO extends DBContext{
    public List<Product_Category> getAllCategoryNoParents() {
        List<Product_Category> list = new ArrayList<>();
        String sql = "SELECT * FROM product_category where product_category_parent_id is null";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product_Category(rs.getInt("product_category_id"), rs.getInt("product_category_parent_id"), rs.getString("product_category_name")));
            } 
        } catch(SQLException e) {
            System.out.println(e.getCause());
        } 
        return list;
    }
    public List<Product_Category> getAllCategoryHaveParentsByName(int id) {
        List<Product_Category> list = new ArrayList<>();
        String sql = "SELECT * FROM product_category where product_category_parent_id=?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product_Category(rs.getInt("product_category_id"), rs.getInt("product_category_parent_id"), rs.getString("product_category_name")));
            }
        } catch(SQLException e) {
            System.out.println(e.getCause());
        } 
        return list;
    }
}
