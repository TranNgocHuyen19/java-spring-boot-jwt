package com.javaweb.repository.custom.impl;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.repository.custom.BuildingRepositoryCustom;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

@Repository
public class BuildingRepositoryImpl implements BuildingRepositoryCustom {

    @PersistenceContext
    private EntityManager entityManager;

    public static void joinTable(BuildingSearchRequest buildingSearchRequest, StringBuilder join) {
        Long staffId = buildingSearchRequest.getStaffId();
        if(staffId != null) {
            join.append(" INNER JOIN assignmentbuilding ab ON b.id = ab.buildingid ");
        }

        Long areaFrom = buildingSearchRequest.getAreaFrom();
        Long areaTo = buildingSearchRequest.getAreaTo();
        if(areaFrom != null || areaTo != null) {
            join.append(" INNER JOIN rentarea ra ON b.id = ra.buildingid ");
        }
    }

    public static void queryNormal(BuildingSearchRequest buildingSearchRequest, StringBuilder where) {
        try {
            Field[] fields = BuildingEntity.class.getDeclaredFields();
            for (Field item : fields) {
                item.setAccessible(true);
                String name = item.getName();
                if(!name.equals("staffId") && !name.startsWith("area") && !name.startsWith("rentPrice") && !name.equals("typeCode")) {
                    Object value = item.get(buildingSearchRequest);
                    if(value != null) {
                        if(item.getType().getName().equals("java.lang.Long") || item.getType().getName().equals("java.lang.Integer")) {
                            where.append(" AND b." + name + "=" + value);
                        } else if (item.getType().getName().equals("java.lang.String")) {
                            where.append(" AND b." + name + " LIKE '%" + value + "%'");

                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public  List<BuildingEntity> findByCriteria(BuildingSearchRequest buildingSearchRequest) {
        StringBuilder sql = new StringBuilder("SELECT b.* FROM building b");
        joinTable(buildingSearchRequest, sql);
        Query query = entityManager.createNativeQuery(sql.toString(), BuildingEntity.class);
        return query.getResultList();
    }
}
