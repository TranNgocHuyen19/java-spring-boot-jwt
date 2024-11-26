package com.javaweb.repository.custom;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.request.BuildingSearchRequest;

import java.util.List;

public interface BuildingRepositoryCustom {
    List<BuildingEntity> findByCriteria(BuildingSearchRequest buildingSearchRequest);

    int calcTotalItem(BuildingSearchRequest buildingSearchRequest);
}
