package com.javaweb.repository.custom.impl;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.repository.custom.BuildingRepositoryCustom;
import com.javaweb.utils.BuildingType;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

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
            Field[] fields = BuildingSearchRequest.class.getDeclaredFields();
            for (Field item : fields) {
                item.setAccessible(true);
                String name = item.getName();
                if(!name.equals("staffId") && !name.startsWith("area") && !name.startsWith("rentPrice") && !name.equals("typeCode")) {
                    Object value = item.get(buildingSearchRequest);
                    if(value != null && !value.equals("")) {
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

    public static void querySpecial(BuildingSearchRequest buildingSearchRequest, StringBuilder where) {
        Long staffId = buildingSearchRequest.getStaffId();
        if(staffId != null) {
            where.append(" AND ab.staffid = " + staffId);
        }

        Long areaFrom = buildingSearchRequest.getAreaFrom();
        Long areaTo = buildingSearchRequest.getAreaTo();
        if(areaFrom != null || areaTo != null) {
            if(areaFrom != null) {
                where.append(" AND ra.value >= " + areaFrom);
            }
            if(areaTo != null) {
                where.append(" AND ra.value <= " + areaTo);
            }
        }

        Long rentPriceFrom = buildingSearchRequest.getRentPriceFrom();
        Long rentPriceTo = buildingSearchRequest.getRentPriceTo();
        if(rentPriceFrom != null || rentPriceTo != null) {
            if(rentPriceFrom != null) {
                where.append(" AND b.rentprice >= " + rentPriceFrom);
            }
            if(rentPriceTo != null) {
                where.append(" AND b.rentprice <= " + rentPriceTo);
            }
        }

        List<String> typeCode = buildingSearchRequest.getTypeCode();
        if(typeCode != null && typeCode.size() != 0) {
            where.append(" AND(");
            String typeCodeResult = typeCode.stream()
                    .map(it -> "b.type LIKE '%" + it + "%'")
                    .collect(Collectors.joining("OR "));
            where.append(typeCodeResult);
            where.append(" ) ");
        }

    }

    @Override
    public  List<BuildingEntity> findByCriteria(BuildingSearchRequest buildingSearchRequest) {
        StringBuilder sql = new StringBuilder("SELECT b.* FROM building b");
        joinTable(buildingSearchRequest, sql);
        StringBuilder where = new StringBuilder(" WHERE 1 = 1");
        queryNormal(buildingSearchRequest, where);
        querySpecial(buildingSearchRequest, where);
        where.append(" GROUP BY b.id");
        sql.append(where);
        int skip = ( buildingSearchRequest.getPage() - 1 ) * buildingSearchRequest.getLimit();
        sql.append(" LIMIT " + buildingSearchRequest.getLimit() + " OFFSET " + skip);
        Query query = entityManager.createNativeQuery(sql.toString(), BuildingEntity.class);
        return query.getResultList();
    }

    @Override
    public int calcTotalItem(BuildingSearchRequest buildingSearchRequest) {
        StringBuilder sql = new StringBuilder("SELECT b.* FROM building b");
        joinTable(buildingSearchRequest, sql);
        StringBuilder where = new StringBuilder(" WHERE 1 = 1");
        queryNormal(buildingSearchRequest, where);
        querySpecial(buildingSearchRequest, where);
        where.append(" GROUP BY b.id");
        sql.append(where);
        Query query = entityManager.createNativeQuery(sql.toString(), BuildingEntity.class);
        return query.getResultList().size();
    }
}
