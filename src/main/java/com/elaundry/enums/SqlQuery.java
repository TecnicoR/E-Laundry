package com.elaundry.enums;

public enum SqlQuery {

    INSERT_NEW_USER("insert into laundry_user (name, email , password, address, role) VALUES (?,?,?,?,?)"),
    GET_USER_BY_ID("select * from laundry_user where id = ?"),
    GET_ALL_USERS("select * from laundry_user"),
    GET_USER_BY_EMAIL("select * from laundry_user where email = ?"),

    DELETE_USER_BY_ID("delete from laundry_user where id = ?"),

    CREATE_NEW_ORDER("insert into user_order (user_id, user_name, items, price, order_date, complete_date, status) values(?,?,?,?,?,?,?)"),
    GET_ALL_ORDERS("select * from user_order"),
    GET_ALL_ORDERS_BY_USER_ID("select * from user_order where user_id = ?"),
    GET_ALL_RATE_CARDS("select * from rate_card");


    private final String value;
    public String getValue() {
        return value;
    }
    SqlQuery(String value){
        this.value = value;
    }
}
