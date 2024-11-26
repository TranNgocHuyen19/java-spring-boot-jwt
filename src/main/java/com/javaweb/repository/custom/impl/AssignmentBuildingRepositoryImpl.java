package com.javaweb.repository.custom.impl;

import com.javaweb.entity.AssignmentBuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.repository.custom.AssignmentBuildingRepositoryCustom;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

public class AssignmentBuildingRepositoryImpl implements AssignmentBuildingRepositoryCustom {
    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public void deleteByBuildingId(Long id) {
        StringBuilder sql = new StringBuilder("DELETE FROM assignmentbuilding ab WHERE ab.buildingid = " + id);
        Query query = entityManager.createNativeQuery(sql.toString(), AssignmentBuildingEntity.class);
        query.executeUpdate();
    }
}
