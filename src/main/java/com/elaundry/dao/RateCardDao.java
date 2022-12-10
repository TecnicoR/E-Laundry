package com.elaundry.dao;

import com.elaundry.entity.RateCard;
import com.elaundry.entity.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static com.elaundry.enums.SqlQuery.GET_ALL_RATE_CARDS;
import static com.elaundry.enums.SqlQuery.GET_ALL_USERS;

public class RateCardDao {
    private final Connection db;
    private PreparedStatement ps;

    public RateCardDao() {
        this.db = GetConnection.initialize();
    }

    public List<RateCard> findAll(){
        List<RateCard> rateCards = new ArrayList<>();
        try {
            ps = db.prepareStatement(GET_ALL_RATE_CARDS.getValue());
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                rateCards.add(getRateCardFromResultSet(rs));
            }
        } catch (SQLException e) {
            System.out.println("Error - " + e.getMessage());
        }
        return rateCards;
    }

    private RateCard getRateCardFromResultSet(ResultSet resultSet) throws SQLException {
        RateCard rateCard = new RateCard();
        rateCard.setId(resultSet.getInt("id"));
        rateCard.setItemName(resultSet.getString("item_name"));
        rateCard.setPrice(resultSet.getInt("price"));
        return rateCard;
    }
}
