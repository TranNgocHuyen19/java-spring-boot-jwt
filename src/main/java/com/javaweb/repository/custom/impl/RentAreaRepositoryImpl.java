package com.javaweb.repository.custom.impl;

import com.javaweb.entity.RentAreaEntity;
import com.javaweb.repository.custom.RentAreaRepositoryCustom;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

@Repository
public class RentAreaRepositoryImpl implements RentAreaRepositoryCustom {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public void deleteByBuildingId(Long id) {
        StringBuilder sql = new StringBuilder("DELETE FROM rentarea ra WHERE ra.buildingid = " + id);
        Query query = entityManager.createNativeQuery(sql.toString(), RentAreaEntity.class);
        query.executeUpdate();
    }
}
