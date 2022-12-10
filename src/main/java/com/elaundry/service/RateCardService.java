package com.elaundry.service;

import com.elaundry.dao.RateCardDao;

import java.util.HashMap;
import java.util.Map;

public class RateCardService {
    private final RateCardDao rateCardDao;

    public RateCardService() {
        this.rateCardDao = new RateCardDao();
    }

    public Map<String, Integer> getAll(){
        Map<String, Integer> price = new HashMap<>();
        rateCardDao.findAll().forEach(rateCard -> {
            price.put(rateCard.getItemName(), rateCard.getPrice());
        });
        return price;
    }
}
